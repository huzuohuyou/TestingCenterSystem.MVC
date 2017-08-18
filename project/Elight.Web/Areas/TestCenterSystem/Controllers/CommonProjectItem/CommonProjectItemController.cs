using Elight.Entity;
using Elight.Infrastructure;
using Elight.Web.Controllers;
using Elight.Web.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.DataItem;
using TestingCenterSystem.Service.DataItem.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels.DataItem;

namespace Elight.Web.Areas.TestCenterSystem.Controllers
{
    public class CommonProjectItemController : BaseController
    {
        public IDataItemService<SD_ITEM_INFO> _itemService = new TestingCenterSystem.Service.DataItem.DataItemService();
        //public ISDService _sdService = new SDService();
        public ICatConfService _catconfService = new CatConfService();
        public IProcStateService _procStateService = new ProcStateService();
      //  public IProjectService _projectService = new ProjectService();   项目相关暂时注释
        public IItemDepService<SD_ITEM_DEP> _itemDepService = new ItemDepService();
        public IItemOptionService _itemOptionService = new ItemOptionService();
        // GET: TestCenterSystem/DataItem
        //[HttpGet, AuthorizeChecked]
        public ActionResult Index()
        {
            //ViewBag.SD_NAME = _projectService.GetCurrentSD().SD_NAME;
            //ViewBag.TC_PROJECT_NAME = _projectService.GetCurrentSD().TC_PROJECT_NAME;
            return View();
        }

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

        [HttpPost]
        public ActionResult Delete(string primaryKey)
        {
            var id = int.Parse(primaryKey);
            if (_itemService.Exists(r => r.SD_ITEM_ID == id))
            {
                var catCode = _procStateService.DataItemProcCatCode();
                //应先删除关联表  
                _procStateService.Delete(item => item.PROC_CAT_CODE == catCode && item.PROC_CONTENT_ID == primaryKey.Trim());
                _itemDepService.Delete(item => item.SD_ITEM_ID == id);
                _itemOptionService.Delete(item => item.SD_ITEM_ID == id);
                //删除主表
                var row = _itemService.Delete(r => r.SD_ITEM_ID == id);
                return row > 0 ? Success() : Error();
            }
            return Success();
        }
        

        [HttpPost]
        public ActionResult GetForm(string primaryKey)
        {
            var id = int.Parse(primaryKey);
            var entity = _itemService.Get(item => item.SD_ITEM_ID == id);
            return Content(entity.ToJson());
        }


        [HttpPost]
        public ActionResult GetEnumList(string primaryKey)
        {
            var id = int.Parse(primaryKey);
            var entity = _itemOptionService.GetSearchList(item => item.SD_ITEM_ID == id);
            return Content(entity.ToJson());
        }


        //添加、修改、查看数据
        [HttpGet, AuthorizeChecked]
        public ActionResult Form(int ItemCount = 1)
        {
            ViewBag.ItemCount = ItemCount;
            //var sd_info = _sdService.Get(s => s.SD_ID = SD_ID);
            ViewBag.ItemType = _catconfService.GetSearchList(s => s.CAT_ID != null);
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
                    var optionEntity = _itemOptionService.Insert(enumModel);
                }
            }
            //保存或修改并更新到数据库
            if (_itemService.Exists(r => r.SD_ITEM_ID == model.SD_ITEM_ID))
            {
                var row = _itemService.Update(model);
                return row > 0 ? Success() : Error();
            }
            else
            {
                model.SD_ITEM_SRC = 2;
                var entity = _itemService.Insert(model);
                return entity != null ? Success() : Error();
            }
        }
    }
}