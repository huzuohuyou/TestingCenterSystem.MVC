using System;
using System.Collections.Generic;
using System.Linq;
using TestingCenter.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.DataItem.Interface;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.DataItem;

namespace TestingCenterSystem.Service.DataItem
{
    public class ItemDepService : BaseService<SD_ITEM_DEP>, IItemDepService
    {
        private readonly IProjectService _projectService = new ProjectService();
        #region 获取依赖项
        /// <summary>
        /// 获取依赖项
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord"></param>
        /// <returns></returns>
        public Page<ItemDepViewModel> GetPage(int primaryKey, int pageIndex, int pageSize, string keyWord)
        {
            var totalCount = 0;
            var depList = new List<ItemDepViewModel>();
            using (var db = new PDPContext())
            {
                totalCount = db.SD_ITEM_DEP.Where(item => item.SD_ITEM_ID == primaryKey).ToList().Count;
                db.SD_ITEM_DEP.Where(item => item.SD_ITEM_ID == primaryKey).OrderByDescending(dep => dep.UPD_DATE).ToList().ForEach(
                    dep => depList.Add(
                        new ItemDepViewModel()
                        {
                            SD_ITEM_ID = dep.SD_ITEM_ID,
                            DEP_SD_ITEM_ID = dep.DEP_SD_ITEM_ID,
                            DEP_SD_ITEM_CODE = db.SD_ITEM_INFO.FirstOrDefault(item => item.SD_ITEM_ID == dep.DEP_SD_ITEM_ID).SD_ITEM_CODE,
                            DEP_SD_ITEM_NAME = db.SD_ITEM_INFO.FirstOrDefault(item => item.SD_ITEM_ID == dep.DEP_SD_ITEM_ID).SD_ITEM_NAME,
                            UPD_USER_ID = dep.UPD_USER_ID,
                            UPD_DATE = dep.UPD_DATE
                        }));
            }
            depList = depList.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            var page = new Page<ItemDepViewModel>()
            {
                CurrentPage = pageIndex,
                ItemsPerPage = pageSize,
                TotalItems = totalCount,
                Items = depList
            };
            return page;
        }
        #endregion     
        #region 获取数据项集合
        /// <summary>
        /// 获取数据项集合
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord"></param>
        /// <returns></returns>
        public Page<ItemColletionViewModel> GetItemColPage(int primaryKey, int pageIndex, int pageSize, string keyWord)
        {
            var totalCount = 0;
            var itemList = new List<ItemColletionViewModel>();
            using (var db = new PDPContext())
            {
                var sdId = _projectService.GetCurrentSD().SD_ID;
                var searchList = keyWord.Split(';');
                var depList = db.SD_ITEM_DEP.Where(dep => dep.SD_ITEM_ID == primaryKey).Select(dep => dep.DEP_SD_ITEM_ID).ToList();
                var itemInfoList = db.SD_ITEM_INFO.Where(item => (item.SD_ID == sdId && item.SD_ITEM_ID != primaryKey && !depList.Contains(item.SD_ITEM_ID)));
                SearchInfo(itemInfoList, searchList).OrderByDescending(dep => dep.UPD_DATE).ToList().ForEach(
                    itemInfo => itemList.Add(
                        new ItemColletionViewModel()
                        {
                            SD_ITEM_ID = itemInfo.SD_ITEM_ID,
                            SD_ID = itemInfo.SD_ID ?? 0,
                            SD_CODE = itemInfo.SD_CODE,
                            SD_ITEM_CODE = itemInfo.SD_ITEM_CODE,
                            SD_ITEM_NAME = itemInfo.SD_ITEM_NAME,
                            SD_ITEM_CAT_ID = itemInfo.SD_ITEM_CAT_ID,
                            SD_ITEM_CAT_NAME = db.SD_CAT_CONF.Where(cat => cat.CAT_ID == itemInfo.SD_ITEM_CAT_ID).Select(cat => cat.CAT_NAME).FirstOrDefault(),
                            SD_ITEM_SRC = itemInfo.SD_ITEM_SRC
                        }));
                var projectList = db.PDP_PROJECT.Where(proj => proj.TC_PROJ_NAME.Contains("公共项目")).Select(proj => proj.TC_PROJ_ID);
                var sdList = db.SD_INFO.Where(sd => projectList.Contains(sd.TC_PROJ_ID)).Select(sd => sd.SD_ID);
                itemInfoList = db.SD_ITEM_INFO.Where(item => sdList.Contains(item.SD_ID.Value));
                SearchInfo(itemInfoList, searchList).ToList().ForEach(
                    itemInfo => itemList.Add(
                        new ItemColletionViewModel()
                        {
                            SD_ITEM_ID = itemInfo.SD_ITEM_ID,
                            SD_ID = itemInfo.SD_ID ?? 0,
                            SD_CODE = itemInfo.SD_CODE,
                            SD_ITEM_CODE = itemInfo.SD_ITEM_CODE,
                            SD_ITEM_NAME = itemInfo.SD_ITEM_NAME,
                            SD_ITEM_CAT_ID = itemInfo.SD_ITEM_CAT_ID,
                            SD_ITEM_CAT_NAME = db.SD_CAT_CONF.Where(cat => cat.CAT_ID == itemInfo.SD_ITEM_CAT_ID).Select(cat => cat.CAT_NAME).FirstOrDefault(),
                            SD_ITEM_SRC = itemInfo.SD_ITEM_SRC
                        }));
                totalCount = itemList.Count;
            }
            itemList = itemList.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            var page = new Page<ItemColletionViewModel>()
            {
                CurrentPage = pageIndex,
                ItemsPerPage = pageSize,
                TotalItems = totalCount,
                Items = itemList
            };
            return page;
        }
        #endregion

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
        #region 根据数据项ID获取依赖数据项ID列表
        /// <summary>
        /// 根据数据项ID获取依赖数据项ID列表
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        public List<int> GetDepItemIdList(int primaryKey)
        {
            List<int> depItemList = null;
            using (var db = new PDPContext())
            {
                depItemList = db.SD_ITEM_DEP.Where(item => item.SD_ITEM_ID == primaryKey).Select(item => item.DEP_SD_ITEM_ID).ToList();
            }
            return depItemList;
        }
        #endregion
    }
}
