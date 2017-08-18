using Elight.Entity;
using Elight.Infrastructure;
using Elight.Web.Controllers;
using Elight.Web.Filters;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Web.Mvc;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.DataItem;
using TestingCenterSystem.Service.DataItem.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.KPI;
using TestingCenterSystem.Service.KPI.Interface;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels.DataItem;

namespace Elight.Web.Areas.TestCenterSystem.Controllers
{
    public class DataItemController : BaseController
    {
        private readonly IDataItemService _itemService = new DataItemService();
        private readonly ICatConfService _catconfService = new CatConfService();
        private readonly IProcStateService _procStateService = new ProcStateService();
        private readonly IProjectService _projectService = new ProjectService();
        private readonly IItemDepService _itemDepService = new ItemDepService();
        private readonly IItemOptionService _itemOptionService = new ItemOptionService();
        private readonly IKPIParamService _kpiParamService = new KPIParamService();
        // GET: TestCenterSystem/DataItem
        [HttpGet, AuthorizeChecked]
        public ActionResult Index()
        {
            ViewBag.SD_NAME = _projectService.GetCurrentSD().SD_NAME;
            ViewBag.TC_PROJECT_NAME = _projectService.GetCurrentSD().TC_PROJECT_NAME;
            var catCode = _projectService.GetCurrentSD().ITEM_CAT_PA_CODE;
            ViewBag.ItemType = _catconfService.GetSearchList(s => s.CAT_PA_CODE == catCode);
            return View();
        }

        #region 分页获取数据项
        /// <summary>
        /// 分页获取数据项列表
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord"></param>
        /// <returns></returns>
        [HttpPost, AuthorizeChecked]
        public ActionResult Index(int pageIndex, int pageSize, string keyWord)
        {
            var pageData = _itemService.GetPage(pageIndex, pageSize, keyWord);
            var result = new LayPadding<DataItemViewModel>()
            {
                result = true,
                msg = "success",
                list = pageData.Items,
                count = pageData.TotalItems
            };
            return Content(result.ToJson());
        }
        #endregion
        #region 删除数据项
        /// <summary>
        /// 删除数据项
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Delete(string primaryKey)
        {
            var id = int.Parse(primaryKey);
            if (_itemService.Exists(r => r.SD_ITEM_ID == id))
            {
                var catCode = _procStateService.DataItemProcCatCode();
                var executeState =
                    _procStateService.Get(
                        item => item.PROC_CAT_CODE == catCode && item.PROC_CONTENT_ID == primaryKey.Trim())
                        .PROC_STAT_CODE;
                if (executeState == _procStateService.HadExedProcStatCode())
                    return Error("删除失败！该数据项已被执行过，尚未清库，请先清库后再删除！");
                var kpiCount = _kpiParamService.GetManay(param => param.SD_ITEM_ID == id).Count;
                if (kpiCount > 0)
                    return Error("删除失败！该数据项已被KPI做为参数使用，无法删除！");
                var depCount = _itemDepService.GetManay(dep => dep.DEP_SD_ITEM_ID == id).Count;
                if (depCount > 0)
                    return Error("删除失败！该数据项已被其它数据项依赖，无法删除！");
                //应先删除关联表  
                _procStateService.Delete(item => item.PROC_CAT_CODE == catCode && item.PROC_CONTENT_ID == primaryKey.Trim());
                _itemDepService.Delete(item => item.SD_ITEM_ID == id);
                _itemOptionService.Delete(item => item.SD_ITEM_ID == id);
                //删除主表
                var row = _itemService.Delete(r => r.SD_ITEM_ID == id);
                return row > 0 ? Success("删除成功！") : Error("删除失败！");
            }
            return Success();
        }
        #endregion

        [HttpPost]
        public ActionResult GetForm(string primaryKey)
        {
            var id = int.Parse(primaryKey);
            var entity = _itemService.Get(item => item.SD_ITEM_ID == id);
            return Content(entity.ToJson());
        }

        #region 获取枚举列表
        /// <summary>
        /// 获取枚举列表
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetEnumList(string primaryKey)
        {
            var id = int.Parse(primaryKey);
            var entity = _itemOptionService.GetSearchList(item => item.SD_ITEM_ID == id);
            return Content(entity.ToJson());
        }
        #endregion

        [HttpGet, AuthorizeChecked]
        public ActionResult Form(int ItemCount = 1)
        {
            ViewBag.ItemCount = ItemCount;
            //var sd_info = _sdService.Get(s => s.SD_ID = SD_ID);
            ViewBag.ItemType = _catconfService.GetSearchList(s => true);
            return View();
        }

        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Form(string strEnum, SD_ITEM_INFO model)
        {
            if (!string.IsNullOrWhiteSpace(strEnum))
            {
                var enumList = strEnum.Split(',');
                if (_itemOptionService.Exists(r => r.SD_ITEM_ID == model.SD_ITEM_ID))
                    _itemOptionService.Delete(r => r.SD_ITEM_ID == model.SD_ITEM_ID);
                for (var i = 0; i < enumList.Length; i++)
                {
                    var enumModel = new SD_ITEM_OPTION()
                    {
                        SD_ITEM_ID = model.SD_ITEM_ID,
                        ITEM_OPTION_NAME = enumList[i],
                        ORDER_NO = i + 1
                    };
                    _itemOptionService.Insert(enumModel);
                }
            }
            //保存或修改并更新到数据库
            if (_itemService.Exists(r => r.SD_ITEM_ID == model.SD_ITEM_ID))
            {
                var row = _itemService.Update(model);
                return row > 0 ? Success() : Error();
            }
            model.SD_ITEM_SRC = 2;
            var entity = _itemService.Insert(model);
            return entity != null ? Success() : Error();
        }
        #region 开关（有效标志修改）
        /// <summary>
        /// 开关（有效标志修改）
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <param name="valueFlag"></param>
        /// <returns></returns>
        public ActionResult Switch(string primaryKey, string valueFlag)
        {
            var id = int.Parse(primaryKey);
            Expression<Func<SD_ITEM_INFO, bool>> ex = x => x.SD_ITEM_ID == id;
            var entity = _itemService.Get(ex);
            entity.VALID_FLAG = entity.VALID_FLAG == 1 ? 0 : 1;
            var count = _itemService.Update(entity);
            return count > 0 ? Success() : Error();
        }
        #endregion
        #region 导出数据项脚本
        ///// <summary>
        ///// 导出数据项脚本
        ///// </summary>
        ///// <returns></returns>
        //public ActionResult ExportSql()
        //{
        //    var sqlStr = _itemService.ExportSqlFile();
        //    var data = new Dictionary<string, string> { { "data", sqlStr } };
        //    return Content(data.ToJson());
        //}
        #endregion
    }
}