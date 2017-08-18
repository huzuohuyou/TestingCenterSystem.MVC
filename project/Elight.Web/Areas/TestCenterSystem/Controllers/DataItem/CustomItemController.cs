using Elight.Entity;
using Elight.Infrastructure;
using Elight.Web.Controllers;
using Elight.Web.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Models.Unit;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.Comm;
using TestingCenterSystem.Service.Comm.Interface;
using TestingCenterSystem.Service.DataItem;
using TestingCenterSystem.Service.DataItem.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.InGroup.Interface;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels.DataItem;
using TestingCenterSystem.ViewModels.InGroup;

namespace Elight.Web.Areas.TestCenterSystem.Controllers
{
    public partial class CustomItemController : BaseController
    {
        private readonly IDataItemService _itemService = new DataItemService();
        private readonly ICatConfService _catconfService = new CatConfService();
        private readonly IProcStateService _procStateService = new ProcStateService();
        private readonly IProjectService _projectService = new ProjectService();
        private readonly IItemDepService _itemDepService = new ItemDepService();
        private readonly IItemResultService _itemResultService = new ItemResultService();
        private readonly IResultMasterService _groupResultService = new ResultMasterService();
        private readonly IProcLogService _procLogService = new ProcLogService();
        private readonly IErrorLogService _errorLogService = new ErrorLogService();
        public static List<ItemValueViewModel> TestResult = new List<ItemValueViewModel>();

        [HttpGet, AuthorizeChecked]
        public ActionResult Index(string primaryKey)
        {
            ViewBag.SD_NAME = _projectService.GetCurrentSD().SD_NAME;
            ViewBag.TC_PROJECT_NAME = _projectService.GetCurrentSD().TC_PROJECT_NAME;
            var id = int.Parse(primaryKey);
            var entity = _itemService.Get(item => item.SD_ITEM_ID == id);
            ViewBag.SD_ITEM_CODE = entity.SD_ITEM_CODE;
            ViewBag.SD_ITEM_NAME = entity.SD_ITEM_NAME;
            ViewBag.SD_ITEM_ALIAS = entity.SD_ITEM_ALIAS;
            ViewBag.SD_ITEM_ALGO = entity.SD_ITEM_ALGO;
            ViewBag.LastExeUser = entity.UPD_USER_ID;
            ViewBag.LastExeTime = entity.UPD_DATE;
            var catEntity = _catconfService.Get(cat => cat.CAT_ID == entity.SD_ITEM_CAT_ID);
            if (catEntity != null)
                ViewBag.SD_ITEM_CAT_NAME = catEntity.CAT_NAME;
            return View();
        }

        [HttpPost, AuthorizeChecked]
        public ActionResult Index(string primaryKey, int pageIndex, int pageSize, string keyWord)
        {
            var id = int.Parse(primaryKey);
            var pageData = _itemDepService.GetPage(id, pageIndex, pageSize, keyWord);
            var result = new LayPadding<ItemDepViewModel>()
            {
                result = true,
                msg = "success",
                list = pageData.Items,
                count = pageData.TotalItems
            };
            return Content(result.ToJson());
        }

        #region 获取数据项集合
        /// <summary>
        /// 获取数据项集合
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord"></param>
        /// <returns></returns>
        public ActionResult GetItemList(string primaryKey, int pageIndex, int pageSize, string keyWord)
        {
            var id = int.Parse(primaryKey);
            var pageData = _itemDepService.GetItemColPage(id, pageIndex, pageSize, keyWord);
            var result = new LayPadding<ItemColletionViewModel>()
            {
                result = true,
                msg = "success",
                list = pageData.Items,
                count = pageData.TotalItems
            };
            return Content(result.ToJson());
        }
        #endregion
        #region 获取数据项结果列表
        /// <summary>
        /// 获取数据项结果列表
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord"></param>
        /// <returns></returns>
        public ActionResult GetItemValueList(string primaryKey, int pageIndex, int pageSize, string keyWord)
        {
            var id = int.Parse(primaryKey);
            var pageData = _itemResultService.GetPage(TestResult, id, pageIndex, pageSize, keyWord);
            var result = new LayPadding<ItemValueViewModel>()
            {
                result = true,
                msg = "success",
                list = pageData.Items,
                count = pageData.TotalItems
            };
            return Content(result.ToJson());
        }
        #endregion
        #region 测试
        /// <summary>
        /// 测试
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult TestDllEvent(string primaryKey, TestParamViewModel param)
        {
            var id = int.Parse(primaryKey);
            var model = _itemService.Get(item => item.SD_ITEM_ID == id);
            try
            {
                var patientInfoDic = _itemResultService.GetPatientInfoList(param.startTime, param.endTime, param.patientId);
                if (patientInfoDic.Count == 0)
                    return Info("入组信息查询失败，无法执行数据项！");
                var row = ExecuteUrl(param.url, param.patientId, id, patientInfoDic, model, true);
                if (row == -1)
                    return Error("依赖数据项结果值获取不完整，请先执行依赖的数据项！！！");
                if (row == -2)
                    return Error("api接口调用失败，url或参数信息不正确！");
                return row == patientInfoDic.Count ? Success("测试成功！") : Error("测试失败！请检查入组结果或者数据项信息是否完整！");
            }
            catch (Exception ex)
            {
                InsertErrorLog(model.SD_ID.Value, 2, param.url, "数据项测试失败！异常信息：" + ex.Message);
                return Error("测试失败！");
            }
        }
        #endregion
        #region 执行
        /// <summary>
        /// 执行
        /// </summary>
        /// <param name="primaryKey">数据项ID</param>
        /// <param name="url"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ExecuteDllEvent(string primaryKey, string url)
        {
            var id = int.Parse(primaryKey);
            var model = _itemService.Get(item => item.SD_ITEM_ID == id);
            try
            {
                var patientInfoDic = _itemResultService.GetPatientInfoList(DateTime.MinValue, DateTime.MinValue, "");
                if (patientInfoDic.Count == 0)
                    return Info("入组信息查询失败，无法执行数据项！");
                //执行前先清库
                _itemResultService.UnitClearData(id);
                var row = ExecuteUrl(url, "", id, patientInfoDic, model, false);
                if (row == -1)
                    return Error("依赖数据项结果值获取不完整，请先执行依赖的数据项！！！");
                if (row == -2)
                    return Error("api接口调用失败，url或参数信息不正确！");
                if (row == patientInfoDic.Count)
                {
                    //更新执行状态表
                    _procStateService.DataItemDoExecute(model.SD_ID.Value, primaryKey);
                    //更新执行日志表
                    var proLog = new PDP_PROC_LOG()
                    {
                        SD_ID = model.SD_ID,
                        PROC_CAT_CODE = _procLogService.DataItemCatCode(),
                        PROC_CONTENT_ID = model.SD_ITEM_ID.ToString()
                    };
                    _procLogService.Insert(proLog);
                    //更新数据项
                    _itemService.Update(model);
                }
                model = _itemService.Get(item => item.SD_ITEM_ID == id);
                var data = new Dictionary<string, string>
                {
                    {"exeUser", model.UPD_USER_ID},
                    {"exeTime", model.UPD_DATE.ToString()}
                };
                return row == patientInfoDic.Count ? Success("执行成功！", data) : Error("执行失败！请检查信息是否完整！");
            }
            catch (Exception ex)
            {
                InsertErrorLog(model.SD_ID.Value, 1, url, "数据项执行失败！异常信息：" + ex.Message);
                return Error("执行失败！");
            }
        }
        #endregion
        #region 内部方法
        private int ExecuteUrl(string url, string patientId, int id, Dictionary<UN_SD_CPATS, PatientInfoViewModel> patientInfoDic, SD_ITEM_INFO model, bool isTest)
        {
            var row = 0;
            if (isTest) TestResult.Clear();
            Dictionary<string, Dictionary<int, string>> patientValueDic = null;
            try
            {
                var depItemList = _itemDepService.GetDepItemIdList(id);
                if (depItemList.Count > 0)
                {
                    var cpat = _groupResultService.Get(group => group.PATIENT_ID == patientId);
                    var cpatNo = cpat == null ? "" : cpat.SD_CPAT_NO; // param.patientId
                    var itemValueDic = _itemResultService.GetItemValueList(depItemList, cpatNo);
                    if (itemValueDic.Count < depItemList.Count)
                        return -1;
                    patientValueDic = _itemResultService.GetPatientIdByItemValue(itemValueDic);
                }
                foreach (var patient in patientInfoDic)
                {
                    var cpat = patient.Key;
                    var exeUrl = url;
                    if (patientValueDic != null)
                    {
                        if (patient.Value == null) continue;
                        if (depItemList.Count > 0 && !patientValueDic.ContainsKey(cpat.PATIENT_ID))
                            return -1;
                        var item = patientValueDic[cpat.PATIENT_ID];
                        if (item != null && item.Count > 0)
                        {
                            var index = 0;
                            foreach (var i in item)
                            {
                                if (index == 0)
                                    exeUrl += i.Value.Replace('&', '?');
                                else
                                    exeUrl += i.Value;
                                index++;
                            }
                        }
                    }
                    var result = PostWebApi.WebApiTest(exeUrl, patient.Value.ToJson(), model.SD_ID.Value, isTest);
                    if (!bool.Parse(result["success"].ToString()))
                        return -2;
                    if (isTest)
                    {
                        //测试数据不入库
                        var resultModel = _itemResultService.CreatModel(id, cpat.SD_CPAT_NO, cpat.SD_FILTER_ID,
                            result["data"].ToString(), cpat.PATIENT_ID);
                        TestResult.Add(resultModel);
                        row = TestResult.Count;
                    }
                    else
                    {
                        var resultModel = new PDP_SD_ITEM_VALUE()
                        {
                            SD_ITEM_ID = id,
                            SD_CPAT_NO = cpat.SD_CPAT_NO,
                            SD_FILTER_ID = cpat.SD_FILTER_ID,
                            SD_ITEM_VALUE = result["data"].ToString()
                        };
                        var entity = _itemResultService.UnitInsert(resultModel);
                        row = entity != null ? row + 1 : row;
                    }
                }
                return row;
            }
            catch (Exception ex)
            {
                var msg = isTest ? "数据项测试失败！异常信息：" : "数据项执行失败！异常信息：";
                InsertErrorLog(model.SD_ID.Value, isTest ? 2 : 1, url, msg + ex.Message);
                return row;
            }
        }
        private PDP_SD_ITEM_VALUE SetValue(string datatype, PDP_SD_ITEM_VALUE model, string result)
        {
            switch (datatype)
            {
                case "string":
                case "dateTime":
                case "data":
                case "date":
                case "bool":
                case "enum":
                    model.SD_ITEM_VALUE = result;
                    break;
                case "object":
                    var postData = Encoding.UTF8.GetBytes(result);
                    model.SD_ITEM_VALUE = postData.ToString();
                    break;
            }
            return model;
        }
        #endregion
        #region 删除依赖项
        /// <summary>
        /// 删除依赖项
        /// </summary>
        /// <param name="itemId"></param>
        /// <param name="depId"></param>
        /// <returns></returns>
        public ActionResult Delete(string itemId, string depId)
        {
            var itemIds = int.Parse(itemId);
            var depIds = int.Parse(depId);
            var row = _itemDepService.Delete(item => item.SD_ITEM_ID == itemIds && item.DEP_SD_ITEM_ID == depIds);
            return row > 0 ? Success() : Error();
        }
        #endregion
        public ActionResult AddCustomDepend(string primaryKey)
        {
            ViewBag.ItemType = _catconfService.GetSearchList(s => true);
            return View();
        }
        #region 导出
        /// <summary>
        /// 导出
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        public ActionResult ExportData(string primaryKey)
        {
            var id = int.Parse(primaryKey);
            var item = _itemService.Get(i => i.SD_ITEM_ID == id);
            var data = new Dictionary<string, List<ItemValueViewModel>>();
            try
            {
                var itemState = _procStateService.DataItemProcCatCode();
                var state =
                    _procStateService.Get(
                        proc =>
                            proc.PROC_CONTENT_ID == primaryKey && proc.SD_ID == item.SD_ID &&
                            proc.PROC_CAT_CODE == itemState);
                if (item.IS_RESULT == 0)
                    data.Add("data", new List<ItemValueViewModel>());
                else if (state.PROC_STAT_CODE == _procStateService.HasNotExeProcStatCode() || state.PROC_STAT_CODE == _procStateService.ClearDBProcStatCode())
                    data.Add("data", null);
                else
                {
                    var valueList = _itemResultService.GetList(id);
                    var title = new ItemValueViewModel()
                    {
                        SD_CODE = "病种代码",
                        SD_CPAT_NO = "入组样本ID",
                        SD_CPAT_DATE = "入组样本时间",
                        PATIENT_ID = "患者ID",
                        SD_ITEM_VALUE = "数据项结果值",
                    };
                    data.Add("title", new List<ItemValueViewModel>() { title });
                    data.Add("data", valueList);
                }
            }
            catch (Exception ex)
            {
                InsertErrorLog(item.SD_ID.Value, 3, "", ex.Message);
                data.Add("data", null);
            }
            return Content(data.ToJson());
        }
        #endregion

        private void InsertErrorLog(int sdId, int type, string url, string message)
        {
            var error = new PDP_ERROR_LOG()
            {
                SD_ID = sdId,
                PROC_TYPE = type,
                PROC_URL = url,
                ERR_CONTENT = message
            };
            _errorLogService.Insert(error);
        }
        #region 锁定
        /// <summary>
        /// 锁定
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        public ActionResult LockData(string primaryKey)
        {
            var id = int.Parse(primaryKey);
            var itemState = _procStateService.DataItemProcCatCode();
            var sdId = _projectService.GetCurrentSD().SD_ID;
            try
            {
                var procState =
                    _procStateService.Get(
                        proc =>
                            proc.PROC_CONTENT_ID == primaryKey && proc.PROC_CAT_CODE == itemState && proc.SD_ID == sdId);
                if (procState.PROC_STAT_CODE != _procStateService.HadExedProcStatCode())
                    return Error("数据项未执行，无法进行锁定！");
                var result = _itemResultService.LockData(id);
                if (result.Item1)
                    //更新执行状态
                    _procStateService.DataItemLockExecute(sdId, primaryKey);
                return result.Item1 ? Success(result.Item2) : Error(result.Item2);
            }
            catch (Exception ex)
            {
                InsertErrorLog(sdId, 0, "", "锁定失败！" + ex.Message);
                return Error("锁定失败！");
            }
        }
        #endregion
        #region 清库
        /// <summary>
        /// 清库
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        public ActionResult ClearData(string primaryKey)
        {
            var id = int.Parse(primaryKey);
            var model = _itemService.Get(item => item.SD_ITEM_ID == id);
            try
            {
                var count = _itemResultService.GetManay(item => item.SD_ITEM_ID == id).Count;
                var result = _itemResultService.UnitClearData(id);
                if (result == count)
                {
                    //更新执行状态表
                    _procStateService.DataItemDoClear(model.SD_ID.Value, primaryKey);
                    //更新数据项
                    _itemService.Update(model);
                }
                model = _itemService.Get(item => item.SD_ITEM_ID == id);
                var data = new Dictionary<string, string>
                {
                    {"exeUser", model.UPD_USER_ID},
                    {"exeTime", model.UPD_DATE.ToString()}
                };
                return result == count ? Success("清库成功！", data) : Error("清库失败！");
            }
            catch (Exception ex)
            {
                InsertErrorLog(model.SD_ID.Value, 0, "", "清库失败！" + ex.Message);
                return Error("清库失败！");
            }
        }
        #endregion
        #region 添加依赖
        /// <summary>
        /// 添加依赖
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <param name="itemIdList"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult AddDepend(string primaryKey, string itemIdList)
        {
            var idList = itemIdList.Split(',');
            var id = int.Parse(primaryKey);
            var count = 0;
            for (var index = 0; index < idList.Length; index++)
            {
                var depId = int.Parse(idList[index]);
                if (_itemDepService.Exists(r => r.SD_ITEM_ID == id && r.DEP_SD_ITEM_ID == depId))
                    continue;
                var model = new SD_ITEM_DEP()
                {
                    SD_ITEM_ID = id,
                    DEP_SD_ITEM_ID = depId,
                };
                var entity = _itemDepService.Insert(model);
                if (entity != null)
                    count++;
            }
            return count == idList.Length ? Success() : Error();
        }
        #endregion
    }
}