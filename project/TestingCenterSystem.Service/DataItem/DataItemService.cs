using Elight.Infrastructure;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using Microsoft.Scripting.Interpreter;
using TestingCenter.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.DataItem.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.DataItem;

namespace TestingCenterSystem.Service.DataItem
{
    public class DataItemService : BaseService<SD_ITEM_INFO>, IDataItemService
    {
        private readonly IProcStateService _procStateService = new ProcStateService();
        private readonly IProjectService _projectService = new ProjectService();
        private readonly ItemDepService _itemDepService = new ItemDepService();
        private readonly ItemOptionService _itemOptionService = new ItemOptionService();
        private readonly CatConfService _itemCatConfService = new CatConfService();
        #region 分页获取数据
        /// <summary>
        /// 分页获取数据
        /// </summary>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageSize">总页数</param>
        /// <param name="keyWord">查询字符</param>
        /// <returns></returns>
        public Page<DataItemViewModel> GetPage(int pageIndex, int pageSize, string keyWord)
        {
            var itemList = new List<DataItemViewModel>();
            using (var db = new PDPContext())
            {
                var sdId = _projectService.GetCurrentSD().SD_ID;
                var searchList = keyWord.Split(';');
                var itemStaCode = _procStateService.DataItemProcCatCode();
                var itemInfoList = db.SD_ITEM_INFO.Where(item => item.SD_ID == sdId);
                SearchInfo(itemInfoList, searchList).OrderByDescending(item => item.UPD_DATE).ToList().ForEach(
                    itemInfo => itemList.Add(
                        new DataItemViewModel()
                        {
                            SD_ITEM_ID = itemInfo.SD_ITEM_ID,
                            SD_ID = itemInfo.SD_ID ?? 0,
                            SD_CODE = itemInfo.SD_CODE,
                            SD_ITEM_CODE = itemInfo.SD_ITEM_CODE,
                            SD_ITEM_NAME = itemInfo.SD_ITEM_NAME,
                            SD_ITEM_ALIAS = itemInfo.SD_ITEM_ALIAS,
                            SD_ITEM_CAT_ID = itemInfo.SD_ITEM_CAT_ID,
                            SD_ITEM_DATA_TYPE = itemInfo.SD_ITEM_DATA_TYPE,
                            SD_ITEM_UNIT = itemInfo.SD_ITEM_UNIT,
                            NUM_PRECISION = itemInfo.NUM_PRECISION ?? 0,
                            SD_ITEM_SRC = itemInfo.SD_ITEM_SRC,
                            IS_RESULT = itemInfo.IS_RESULT ?? 0,
                            ORDER_NO = itemInfo.ORDER_NO ?? 0,
                            SD_ITEM_ALGO = itemInfo.SD_ITEM_ALGO,
                            VALID_FLAG = itemInfo.VALID_FLAG,
                            UPD_USER_ID = itemInfo.UPD_USER_ID,
                            UPD_DATE = itemInfo.UPD_DATE,
                            PROC_STAT_CODE = db.PDP_PROC_STAT.Where(proc => proc.SD_ID == itemInfo.SD_ID && proc.PROC_CONTENT_ID == itemInfo.SD_ITEM_ID.ToString() && proc.PROC_CAT_CODE == itemStaCode).Select(proc => proc.PROC_STAT_CODE).FirstOrDefault(),
                            SD_ITEM_CAT_NAME = db.SD_CAT_CONF.Where(cat => cat.CAT_ID == itemInfo.SD_ITEM_CAT_ID).Select(cat => cat.CAT_NAME).FirstOrDefault(),
                            DEP_SD_ITEM_ID = db.SD_ITEM_DEP.Where(dep => dep.SD_ITEM_ID == itemInfo.SD_ITEM_ID).Select(d => d.DEP_SD_ITEM_ID).ToList(),
                            DEP_SD_ITEM_NAME = string.Join(",", db.SD_ITEM_INFO.Where(dep =>
                             (db.SD_ITEM_DEP.Where(de =>
                             de.SD_ITEM_ID == itemInfo.SD_ITEM_ID).Select(d =>
                             d.DEP_SD_ITEM_ID).ToList()).Contains(dep.SD_ITEM_ID)).Select(d =>
                             d.SD_ITEM_NAME).ToList())
                        }
                        ));
                var totalCount = itemList.Count;
                itemList = itemList.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
                var page = new Page<DataItemViewModel>()
                {
                    CurrentPage = pageIndex,
                    ItemsPerPage = pageSize,
                    TotalItems = totalCount,
                    Items = itemList
                };
                return page;
            }
        }
        private IQueryable<SD_ITEM_INFO> SearchInfo(IQueryable<SD_ITEM_INFO> itemInfoList, string[] searchList)
        {
            if (!string.IsNullOrWhiteSpace(searchList[0]) && searchList[0] != "all")
            {
                var catId = int.Parse(searchList[0]);
                itemInfoList = itemInfoList.Where(item => item.SD_ITEM_CAT_ID == catId);
            }
            if (!string.IsNullOrWhiteSpace(searchList[1]))
            {
                var codeOrName = searchList[1];
                itemInfoList =
                    itemInfoList.Where(
                        item => item.SD_ITEM_CODE.Contains(codeOrName) || item.SD_ITEM_NAME.Contains(codeOrName));
            }
            return itemInfoList;
        }
        #endregion
        #region 修改数据
        /// <summary>
        /// 修改数据
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public new int Update(SD_ITEM_INFO model)
        {
            model.UPD_USER_ID = OperatorProvider.Instance.Current.RealName;
            model.UPD_DATE = DateTime.Now;
            using (var db = new PDPContext())
            {
                //顺序号互换
                var orderno = db.SD_ITEM_INFO.Where(item => item.SD_ITEM_ID == model.SD_ITEM_ID).Select(item => item.ORDER_NO).FirstOrDefault();
                if (orderno != model.ORDER_NO)
                {
                    var item = db.SD_ITEM_INFO.Where(info => info.ORDER_NO == model.ORDER_NO).ToList().FirstOrDefault();
                    if (item != null)
                    {
                        item.ORDER_NO = orderno;
                        item.UPD_USER_ID = OperatorProvider.Instance.Current.RealName;
                        item.UPD_DATE = DateTime.Now;
                        Db.Entry<SD_ITEM_INFO>(item).State = EntityState.Modified;
                    }
                }
            }
            Db.Entry<SD_ITEM_INFO>(model).State = EntityState.Modified;
            return Db.SaveChanges();
        }
        #endregion
        #region 新增数据
        /// <summary>
        /// 新增数据
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public new SD_ITEM_INFO Insert(SD_ITEM_INFO model)
        {
            UpdateOrderNo(model);
            model.SD_ID = _projectService.GetCurrentSD().SD_ID;
            model.SD_CODE = _projectService.GetCurrentSD().SD_CODE;
            model.UPD_USER_ID = OperatorProvider.Instance.Current.RealName;
            model.UPD_DATE = DateTime.Now;
            model.VALID_FLAG = 0;
            base.Insert(model);
            _procStateService.Insert(new PDP_PROC_STAT()
            {
                SD_ID = _projectService.GetCurrentSD().SD_ID,
                PROC_CAT_CODE = _procStateService.DataItemProcCatCode(),
                PROC_CONTENT_ID = model.SD_ITEM_ID.ToString(),
                PROC_STAT_CODE = _procStateService.HasNotExeProcStatCode()
            });
            return model;
        }
        #endregion
        #region 更新序号
        /// <summary>
        /// 更新序号
        /// </summary>
        /// <param name="model"></param>
        public void UpdateOrderNo(SD_ITEM_INFO model)
        {
            using (var db = new PDPContext())
            {
                var count = db.SD_ITEM_INFO.Where(info => info.ORDER_NO >= model.ORDER_NO).OrderBy(item => item.ORDER_NO).ToList().Count;
                if (count > 0)
                {
                    db.SD_ITEM_INFO.Where(info => info.ORDER_NO >= model.ORDER_NO).OrderBy(item => item.ORDER_NO).ToList().ForEach(
                       info =>
                       {
                           info.ORDER_NO = info.ORDER_NO + 1;
                           info.UPD_USER_ID = OperatorProvider.Instance.Current.RealName;
                           info.UPD_DATE = DateTime.Now;
                           Db.Entry<SD_ITEM_INFO>(info).State = EntityState.Modified;
                       });
                    Db.SaveChanges();
                }
            }
        }
        #endregion
        #region 获取依赖数据项列表
        /// <summary>
        /// 获取依赖数据项列表
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        public List<SD_ITEM_INFO> GetItemDepList(int primaryKey)
        {
            var depItemList = _itemDepService.GetDepItemIdList(primaryKey);
            List<SD_ITEM_INFO> itemList = null;
            using (var db = new PDPContext())
            {
                itemList = db.SD_ITEM_INFO.Where(item => depItemList.Contains(item.SD_ITEM_ID)).ToList();
            }
            return itemList;
        }
        #endregion
        #region 导出数据项脚本文件
        /// <summary>
        /// 导出数据项脚本文件
        /// </summary>
        /// <returns></returns>
        public string ExportSqlFile(int sdId)
        {
            var sqlStr = new StringBuilder();
            //var sdId = _projectService.GetCurrentSD().SD_ID;
            //SD_ITEM_INFO的sql语句
            var itemInfo = GetManay(item => item.SD_ID == sdId);
            var itemId = itemInfo.Select(item => item.SD_ITEM_ID);
            sqlStr.Append(ToIdentitySql(item => item.SD_ID == sdId));
            //SD_ITEM_DEP表的sql语句
            sqlStr.Append(_itemDepService.ToIdentitySql(dep => itemId.Contains(dep.SD_ITEM_ID)));
            //SD_ITEM_OPTION表的sql语句
            sqlStr.Append(_itemOptionService.ToIdentitySql(option => itemId.Contains(option.SD_ITEM_ID)));
            //SD_CAT_CONF表的sql语句
            sqlStr.Append(_itemCatConfService.ToIdentitySql(cat => true));
            //var itemState = _procStateService.DataItemProcCatCode();
            //var itemIdStr = itemId.ToList().ConvertAll<string>(x => x.ToString());
            //sqlStr.Append(
            //    _procStateService.ToIdentitySql(
            //        proc =>
            //            proc.SD_ID == sdId && itemIdStr.Contains(proc.PROC_CONTENT_ID) &&
            //            proc.PROC_CAT_CODE == itemState));
            return sqlStr.ToString();
        }
        #endregion
    }
}
