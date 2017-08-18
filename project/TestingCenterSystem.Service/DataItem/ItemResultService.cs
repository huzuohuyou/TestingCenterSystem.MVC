using Elight.Infrastructure;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using TestingCenter.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Models.Unit;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.DataItem.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.InGroup.Interface;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.DataItem;
using TestingCenterSystem.ViewModels.InGroup;

namespace TestingCenterSystem.Service.DataItem
{
    public class ItemResultService : BaseService<PDP_SD_ITEM_VALUE>, IItemResultService
    {
        private readonly IProjectService _projectService = new ProjectService();
        private readonly IInGroupService _inGroupService = new InGroupService();

        #region 分页获取数据项结果
        /// <summary>
        /// 分页获取数据项结果
        /// </summary>
        /// <param name="valueList"></param>
        /// <param name="primaryKey"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord"></param>
        /// <returns></returns>
        public Page<ItemValueViewModel> GetPage(List<ItemValueViewModel> valueList, int primaryKey, int pageIndex, int pageSize, string keyWord)
        {
            //var totalCount = 0;
            //var valueList = GetList(primaryKey);//获取结果列表
            var totalCount = valueList.Count;
            valueList = valueList.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            var page = new Page<ItemValueViewModel>()
            {
                CurrentPage = pageIndex,
                ItemsPerPage = pageSize,
                TotalItems = totalCount,
                Items = valueList
            };
            return page;
        }
        #endregion
        #region 获取执行结果列表
        /// <summary>
        /// 获取执行结果列表
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        public List<ItemValueViewModel> GetList(int primaryKey)
        {
            var valueList = new List<ItemValueViewModel>();
            using (var db = _projectService.GetCurrentUnitDbContext())
            {
                var sdId = _projectService.GetCurrentSD().SD_ID;
                db.SD_ITEM_VALUE.Where(item => item.SD_ID == sdId && item.SD_ITEM_ID == primaryKey).OrderByDescending(item => item.UPD_DATE).ToList().ForEach(
                    itemInfo => valueList.Add(
                        new ItemValueViewModel()
                        {
                            //SD_ID = itemInfo.SD_ID.ToString(),
                            //SD_ITEM_ID = itemInfo.SD_ITEM_ID.ToString(),
                            SD_CODE = itemInfo.SD_CODE,
                            SD_CPAT_NO = itemInfo.SD_CPAT_NO,
                            //SD_FILTER_ID = itemInfo.SD_FILTER_ID == null ? "" : itemInfo.SD_FILTER_ID.ToString(),
                            PATIENT_ID = db.SD_CPATS.Where(cpat => cpat.SD_CPAT_NO == itemInfo.SD_CPAT_NO && cpat.SD_ID == itemInfo.SD_ID).Select(cpat => cpat.PATIENT_ID).ToList().FirstOrDefault(),
                            SD_CPAT_DATE = db.SD_CPATS.Where(cpat => cpat.SD_CPAT_NO == itemInfo.SD_CPAT_NO && cpat.SD_ID == itemInfo.SD_ID).Select(cpat => cpat.SD_CPAT_DATE).ToList().FirstOrDefault().ToString(),
                            SD_ITEM_VALUE = itemInfo.SD_ITEM_VALUE
                        })
                );
            }
            //using (var db = new PDPContext())
            //{
            //    foreach (var value in valueList)
            //    {
            //        var id = int.Parse(value.SD_ITEM_ID);
            //        value.SD_ITEM_CODE = db.SD_ITEM_INFO.Where(item => item.SD_ITEM_ID == id).Select(item => item.SD_ITEM_CODE).FirstOrDefault();
            //        value.SD_ITEM_NAME = db.SD_ITEM_INFO.Where(item => item.SD_ITEM_ID == id).Select(item => item.SD_ITEM_NAME).FirstOrDefault();
            //    }
            //}
            return valueList;
        }
        #endregion
        #region 创建测试结果Model
        /// <summary>
        /// 创建测试结果Model
        /// </summary>
        /// <param name="id"></param>
        /// <param name="sdCpatNo"></param>
        /// <param name="sdFilterId"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public ItemValueViewModel CreatModel(int id, string sdCpatNo, int sdFilterId, string value, string patientId)
        {
            var sdId = _projectService.GetCurrentSD().SD_ID;
            using (var db = new PDPContext())
            {
                var itemInfo = db.SD_ITEM_INFO.FirstOrDefault(item => item.SD_ID == sdId && item.SD_ITEM_ID == id);
                if (itemInfo == null) return null;
                var valueModel = new ItemValueViewModel()
                {
                    //SD_ID = sdId.ToString(),
                    //SD_ITEM_ID = id.ToString(),
                    SD_CODE = itemInfo.SD_CODE,
                    SD_CPAT_NO = sdCpatNo,
                    //SD_FILTER_ID = sdFilterId.ToString(),
                    PATIENT_ID = patientId,//db.SD_CPATS.Where(cpat => cpat.SD_CPAT_NO == sdCpatNo && cpat.SD_ID == sdId).Select(cpat => cpat.PATIENT_ID).ToList().FirstOrDefault(),
                    SD_CPAT_DATE = db.SD_CPATS.Where(cpat => cpat.SD_CPAT_NO == sdCpatNo && cpat.SD_ID == sdId).Select(cpat => cpat.SD_CPAT_DATE).FirstOrDefault().ToString(),
                    SD_ITEM_VALUE = value
                };
                return valueModel;
            }
        }
        #endregion
        #region 获取满足条件的入组结果PatientInfo
        /// <summary>
        /// 获取满足条件的入组结果PatientInfo
        /// </summary>
        /// <param name="startTime"></param>
        /// <param name="endTime"></param>
        /// <param name="patiendID"></param>
        /// <returns></returns>
        public Dictionary<UN_SD_CPATS, PatientInfoViewModel> GetPatientInfoList(DateTime startTime, DateTime endTime, string patiendID)
        {
            var patientInfoDic = new Dictionary<UN_SD_CPATS, PatientInfoViewModel>();
            using (var db = _projectService.GetCurrentUnitDbContext())
            {
                var cpatList = GetCpatList(startTime, endTime, patiendID);
                if (cpatList.Count != 0)
                {
                    foreach (var cpat in cpatList)
                    {
                        PatientInfoViewModel patientInfo = null;
                        var patientNo = cpat.SD_CPAT_NO.Split('_').LastOrDefault();
                        db.CPAT_IN_PATIENT.Where(patient => patient.PATIENT_NO == patientNo).AsNoTracking().ToList().ForEach(
                            patient_info => patientInfo =
                        new PatientInfoViewModel()
                        {
                            PATIENT_ID = cpat.PATIENT_ID,
                            PATIENT_NO = patientNo,
                            ANESTHESIA_RECORD = db.CPAT_ANESTHESIA_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            ASSESSMENT_RECORD = db.CPAT_ASSESSMENT_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            CHECK_RECORD = db.CPAT_CHECK_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            CONSULT_RECORD = db.CPAT_CONSULT_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            DIAGNOSIS = db.CPAT_DIAGNOSIS.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            EMR_RECORD = db.CPAT_EMR_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            INFECTION_RECORD = db.CPAT_INFECTION_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            IN_ORDERS = db.CPAT_IN_ORDERS.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            IN_PATIENT = db.CPAT_IN_PATIENT.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            MEDICAL_RECORD = db.CPAT_MEDICAL_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            NURSE_RECORD = db.CPAT_NURSE_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            OPERATION_RECORD = db.CPAT_OPERATION_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            OUT_EMR = db.CPAT_OUT_EMR.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            OUT_PATIENT = db.CPAT_OUT_PATIENT.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            OUT_RECIPE = db.CPAT_OUT_RECIPE.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            PATHOLOGY_RECORD = db.CPAT_PATHOLOGY_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            TEST_RECORD = db.CPAT_TEST_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            TEST_RESULT = db.CPAT_TEST_RESULT.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            TEST_RESULT_GERM = db.CPAT_TEST_RESULT_GERM.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList(),
                            TRANS_RECORD = db.CPAT_TRANS_RECORD.Where(record => record.PATIENT_NO == patientNo).AsNoTracking().ToList()
                        });
                        patientInfoDic.Add(cpat, patientInfo);
                    }
                }
            }
            return patientInfoDic;
        }
        #endregion
        #region 获取入组结果列表
        /// <summary>
        /// 获取入组结果列表
        /// </summary>
        /// <param name="startTime"></param>
        /// <param name="endTime"></param>
        /// <param name="patiendID"></param>
        /// <returns></returns>
        private List<UN_SD_CPATS> GetCpatList(DateTime startTime, DateTime endTime, string patiendID)
        {
            using (var db = _projectService.GetCurrentUnitDbContext())
            {
                var sdId = _projectService.GetCurrentSD().SD_ID;

                var filterIdList =
                    _inGroupService.GetSearchList(group => group.SD_ID == sdId)
                        .Select(group => group.SD_FILTER_ID)
                        .ToList();
                var cpatList =
                    db.SD_CPATS.Where(cpat => cpat.SD_ID == sdId && filterIdList.Contains(cpat.SD_FILTER_ID)).ToList();
                if (startTime != DateTime.MinValue)
                    cpatList = cpatList.Where(cpat => cpat.SD_CPAT_DATE >= startTime).ToList();
                if (endTime != DateTime.MinValue)
                    cpatList = cpatList.Where(cpat => cpat.SD_CPAT_DATE <= endTime).ToList();
                if (!string.IsNullOrWhiteSpace(patiendID))
                    cpatList = cpatList.Where(cpat => cpat.PATIENT_ID == patiendID).ToList();
                return cpatList;
            }
        }
        #endregion
        #region 判断在UNIT库中是否存在
        /// <summary>
        /// 判断在UNIT库中是否存在
        /// </summary>
        /// <param name="itemId"></param>
        /// <param name="cpatNo"></param>
        /// <returns></returns>
        public bool UnitIsExist(int itemId, string cpatNo)
        {
            var executeItemVaule = new UnitItemValue();
            return executeItemVaule.Exists(r => r.SD_ITEM_ID == itemId && r.SD_CPAT_NO == cpatNo);
        }
        #endregion
        #region 单元测试库新增数据
        /// <summary>
        /// 单元测试库新增数据
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public PDP_SD_ITEM_VALUE UnitInsert(PDP_SD_ITEM_VALUE model)
        {
            var unModel = new UN_SD_ITEM_VALUE()
            {
                SD_CPAT_NO = model.SD_CPAT_NO,
                SD_FILTER_ID = model.SD_FILTER_ID,
                SD_ITEM_ID = model.SD_ITEM_ID,
                SD_ITEM_VALUE = model.SD_ITEM_VALUE,
                SD_ID = _projectService.GetCurrentSD().SD_ID,
                SD_CODE = _projectService.GetCurrentSD().SD_CODE,
                UPD_USER_ID = OperatorProvider.Instance.Current.RealName,
                UPD_DATE = DateTime.Now
            };
            var executeItemVaule = new UnitItemValue();
            executeItemVaule.Insert(unModel);
            return model;
        }
        #endregion
        #region 修改数据
        /// <summary>
        /// 修改数据
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public new int Update(PDP_SD_ITEM_VALUE model)
        {
            var result = 0;
            using (var db = _projectService.GetCurrentUnitDbContext())
            {
                var addmodel = new UN_SD_ITEM_VALUE()
                {
                    SD_CPAT_NO = model.SD_CPAT_NO,
                    SD_FILTER_ID = model.SD_FILTER_ID,
                    SD_ITEM_ID = model.SD_ITEM_ID,
                    SD_ITEM_VALUE = model.SD_ITEM_VALUE,
                    SD_ID = _projectService.GetCurrentSD().SD_ID,
                    SD_CODE = _projectService.GetCurrentSD().SD_CODE,
                    UPD_USER_ID = OperatorProvider.Instance.Current.RealName,
                    UPD_DATE = DateTime.Now
                };
                var lastValue = db.SD_ITEM_VALUE.Where(item => item.SD_ITEM_ID == model.SD_ITEM_ID && item.SD_CPAT_NO == model.SD_CPAT_NO).Select(v => v.SD_ITEM_VALUE).FirstOrDefault();
                addmodel.LAST_VALUE = lastValue;

                db.Entry<UN_SD_ITEM_VALUE>(addmodel).State = EntityState.Modified;
                result = db.SaveChanges();
            }
            return result;
        }
        #endregion
        #region 清除数据
        /// <summary>
        /// 清除数据
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        public int UnitClearData(int primaryKey)
        {
            var executeItemVaule = new UnitItemValue();
            return !executeItemVaule.Exists(i => i.SD_ITEM_ID == primaryKey) ? 0 : executeItemVaule.Delete(i => i.SD_ITEM_ID == primaryKey);
        }

        #endregion
        #region 根据数据项ID列表获取数据项值字典

        /// <summary>
        /// 根据数据项ID列表获取数据项值字典
        /// </summary>
        /// <param name="itemIdList"></param>
        /// <param name="cpatNo"></param>
        /// <returns></returns>
        public Dictionary<int, List<UN_SD_ITEM_VALUE>> GetItemValueList(List<int> itemIdList, string cpatNo)
        {
            var sdId = _projectService.GetCurrentSD().SD_ID;
            var itemValueDic = new Dictionary<int, List<UN_SD_ITEM_VALUE>>();
            using (var db = _projectService.GetCurrentUnitDbContext())
            {
                foreach (var id in itemIdList)
                {
                    var valueList = db.SD_ITEM_VALUE.Where(item => item.SD_ITEM_ID == id && item.SD_ID == sdId).ToList();
                    if (!string.IsNullOrWhiteSpace(cpatNo))
                        valueList = valueList.Where(value => value.SD_CPAT_NO == cpatNo).ToList();
                    if (valueList.Count > 0)
                    {
                        itemValueDic.Add(id, valueList);
                    }
                }
            }
            return itemValueDic;
        }
        #endregion
        #region 获取患者ID、数据项代码、数据项结果值组成的字典
        /// <summary>
        /// 获取患者ID、数据项代码、数据项结果值组成的字典
        /// </summary>
        /// <param name="itemValueDic"></param>
        /// <returns></returns>
        public Dictionary<string, Dictionary<int, string>> GetPatientIdByItemValue(Dictionary<int, List<UN_SD_ITEM_VALUE>> itemValueDic)
        {
            var patientValueDic = new Dictionary<string, Dictionary<int, string>>();
            using (var db = new PDPContext())
            {
                foreach (var items in itemValueDic)
                {
                    foreach (var itemValue in items.Value)
                    {
                        var itemCode = db.SD_ITEM_INFO.Where(item => item.SD_ITEM_ID == items.Key).Select(item => item.SD_ITEM_CODE).FirstOrDefault();
                        var param = $"&{itemCode}={itemValue.SD_ITEM_VALUE}";
                        using (var udb = _projectService.GetCurrentUnitDbContext())
                        {
                            var patientId =
                                udb.SD_CPATS.Where(
                                    cpat => cpat.SD_ID == itemValue.SD_ID && cpat.SD_CPAT_NO == itemValue.SD_CPAT_NO)
                                    .Select(cpat => cpat.PATIENT_ID)
                                    .FirstOrDefault();
                            if (!patientValueDic.ContainsKey(patientId))
                            {
                                var valueDic = new Dictionary<int, string>();
                                valueDic.Add(items.Key, param);
                                patientValueDic.Add(patientId, valueDic);
                            }
                            else
                                patientValueDic[patientId].Add(items.Key, param);
                        }
                    }
                }
            }
            return patientValueDic;
        }
        #endregion
        #region 锁定
        /// <summary>
        /// 锁定
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        public Tuple<bool, string> LockData(int primaryKey)
        {
            using (var db = _projectService.GetCurrentUnitDbContext())
            {
                var list = db.SD_ITEM_VALUE.Where(n => n.SD_ITEM_ID == primaryKey).ToList();
                if (list.Count == 0)
                {
                    return new Tuple<bool, string>(false, "未找到需要锁定的数据，请先执行！！！");
                }
                list.ForEach(r =>
                {
                    Delete(m => m.SD_ITEM_ID == r.SD_ITEM_ID && m.SD_CPAT_NO == r.SD_CPAT_NO);
                    Insert(new PDP_SD_ITEM_VALUE()
                    {
                        SD_ITEM_ID = r.SD_ITEM_ID,
                        SD_ID = r.SD_ID,
                        SD_CODE = r.SD_CODE,
                        SD_CPAT_NO = r.SD_CPAT_NO,
                        SD_FILTER_ID = r.SD_FILTER_ID,
                        SD_ITEM_VALUE = r.SD_ITEM_VALUE,
                        LAST_VALUE = r.LAST_VALUE,
                        UPD_USER_ID = r.UPD_USER_ID,
                        UPD_DATE = r.UPD_DATE
                    });
                });
                return new Tuple<bool, string>(true, "锁定成功");
            }
        }
        #endregion
    }
}
