using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenter.Models;
using TestingCenterSystem.Models;
using TestingCenterSystem.Service.ComDataItem;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.ComDataItem;

namespace TestingCenterSystem.Service.ComDataItem
{
   public class AddCommonItemService:BaseService<TC_SD_ITEM_INFO>,IBaseService<TC_SD_ITEM_INFO>
    {
        public IProcStateService _procStateService = new ProcStateService();
        public IProjectService _projectService = new ProjectService();

        public Page<AddCommonItemViewModel> GetPage(int pageIndex,int pageSize, string keyWord)
        {
            int totalCount = 0;
            List<AddCommonItemViewModel> itemList = new List<AddCommonItemViewModel>();
            using (var db = new TestCenterSystemContext())
            {
                //totalCount = db.TC_SD_ITEM_INFO.ToList().Count;
                db.TC_SD_ITEM_INFO.OrderByDescending(item => item.UPD_DATE).Where(x => x.SD_ITEM_SRC == 1).ToList().ForEach(
                    item_info => itemList.Add(
                        new AddCommonItemViewModel()
                        {
                            SD_ITEM_ID=item_info.SD_ITEM_ID,
                            SD_ITEM_CODE = item_info.SD_ITEM_CODE,
                            SD_ITEM_NAME = item_info.SD_ITEM_NAME,
                            SD_ITEM_DATA_TYPE = item_info.SD_ITEM_DATA_TYPE,
                            SD_ITEM_SRC = item_info.SD_ITEM_SRC,
                            SD_IETM_CAT_TYPE =item_info.SD_ITEM_CAT_ID.ToString()
                        }
                        ));
                itemList = itemList.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
                var page = new Page<AddCommonItemViewModel>()
                {
                    CurrentPage = pageIndex,
                    ItemsPerPage = pageSize,
                    TotalItems = totalCount,
                    Items = itemList
                };
                return page;
            }
        }
    }
}
