using Elight.Entity;
using Elight.Infrastructure;
using Elight.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.comm;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.Utils;
using TestingCenterSystem.ViewModels.Project;
using TestingCenterSystem.ViewModels.SD;

namespace Elight.Web.Areas.TestCenterSystem.Controllers
{
    public class SDController : BaseController
    {
        private static readonly ISdCatConfService _sdCatConfService = new SdCatConfService();
        private static readonly ISDService _sdService = new SDService();
        private static readonly IProjectService _projectService = new ProjectService();
        // GET: TestCenterSystem/SD
        public ActionResult Index(string TC_PROJ_ID)
        {
            ViewBag.TC_PROJ_ID = TC_PROJ_ID;
            return View();
        }

        [HttpPost]
        public ActionResult Index(int pageIndex, int pageSize, SDViewModels vm)
        {
            var pageData = _sdService.GetPage( pageIndex, pageSize, vm);
            var result = new Entity.LayPadding<SD_INFOViewModel>()
            {
                result = true,
                msg = "success",
                list = pageData.Items,
                count = pageData.TotalItems
            };
            return Content(result.ToJson());
        }

        [HttpGet]
        public ActionResult Form(string TC_PROJ_ID)
        {
            ViewBag.TC_PROJ_ID = TC_PROJ_ID;
            return View();
        }

        [HttpGet]
        public ActionResult Switch()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Switch(int primaryKey)
        {
            var model = _sdService.Switch(primaryKey);
            return Success(model.ToString());
        }

        public ActionResult Form(SD_INFOViewModel model)
        {
            SD_INFO value = new SD_INFO()
            {
                SD_ID = model.SD_ID,
                TC_PROJ_ID = model.TC_PROJ_ID,
                //TC_PROJ_TYPE = model.TC_PROJ_TYPE,
                SD_CODE = model.SD_CODE,
                SD_NAME = model.SD_NAME,
                SD_ALIAS = model.SD_ALIAS,
                ITEM_CAT_PA_CODE = model.ITEM_CAT_PA_CODE,
                CITEM_CAT_PA_CODE = model.CITEM_CAT_PA_CODE,
                EKPI_CAT_PA_CODE = model.EKPI_CAT_PA_CODE,
                ORDER_NO = model.ORDER_NO,
                //VALID_FLAG = model.VALID_FLAG
            };
            if (_sdService.Exists(r => r.SD_ID == model.SD_ID))
            {
                var row = _sdService.Update(value);
                return row > 0 ? Success() : Error();
            }
            else
            {
                var entity = _sdService.Insert(value);
                return entity != null ? Success() : Error();
            }
        }

        [HttpPost]
        public ActionResult GetForm(string primaryKey)
        {
            int id = int.Parse(primaryKey);
            var model = _sdService.Get(r => r.SD_ID == id);
            return Content(new SD_INFOViewModel
            {
                SD_ID = model.SD_ID,
                TC_PROJ_ID = model.TC_PROJ_ID,
                TC_PROJ_TYPE = model.TC_PROJ_TYPE,
                SD_CODE = model.SD_CODE,
                SD_NAME = model.SD_NAME,
                SD_ALIAS = model.SD_ALIAS,
                ITEM_CAT_PA_CODE = model.ITEM_CAT_PA_CODE,
                CITEM_CAT_PA_CODE = model.CITEM_CAT_PA_CODE,
                EKPI_CAT_PA_CODE = model.EKPI_CAT_PA_CODE,
                ORDER_NO = model.ORDER_NO,
                VALID_FLAG = model.VALID_FLAG
            }.ToJson());
        }

        public ActionResult Delete(string primaryKey)
        {
            var id = int.Parse(primaryKey.Trim());
            int row = _sdService.Delete(r => r.SD_ID == id);
            return row > 0 ? Success() : Error();
        }

        public ActionResult ExportSQL(int primaryKey)
        {
            try
            {
                var path = _sdService.ExportSQL(primaryKey);
                return Success(path);
            }
            catch (Exception e)
            {
                return Error(e.ToString());
            }
        }

        [HttpPost]
        public ActionResult GetITEM_CAT_PA_CODE()
        {
            List<SD_CAT_CONF> listRole = _sdCatConfService.GetManay(r => r.CAT_TYPE_CODE == "1");
            List<SD_CAT_CONF> listGroup = listRole.Distinct(new Compare<SD_CAT_CONF>((x, y) => (null != x && null != y) && (x.CAT_PA_CODE == y.CAT_PA_CODE))).ToList();
            var listTree = new List<TreeSelect>();
            foreach (var item in listGroup)
            {
                TreeSelect model = new TreeSelect();
                model.id = item.CAT_PA_CODE;
                model.text = item.CAT_PA_NAME;
                listTree.Add(model);
            }
            return Content(listTree.ToJson());
        }

        [HttpPost]
        public ActionResult GetCITEM_CAT_PA_CODE()
        {
            List<SD_CAT_CONF> listRole = _sdCatConfService.GetManay(r=>r.CAT_TYPE_CODE=="2");
            List<SD_CAT_CONF> listGroup= listRole.Distinct(new Compare<SD_CAT_CONF>((x, y) => (null != x && null != y) && (x.CAT_PA_CODE == y.CAT_PA_CODE))).ToList();
            var listTree = new List<TreeSelect>();
            foreach (var item in listGroup)
            {
                TreeSelect model = new TreeSelect();
                model.id = item.CAT_PA_CODE;
                model.text = item.CAT_PA_NAME;
                listTree.Add(model);
            }
            return Content(listTree.ToJson());
        }

        [HttpPost]
        public ActionResult GetEKPI_CAT_PA_CODE()
        {
            List<SD_CAT_CONF> listRole = _sdCatConfService.GetManay(r => r.CAT_TYPE_CODE == "3");
            List<SD_CAT_CONF> listGroup = listRole.Distinct(new Compare<SD_CAT_CONF>((x, y) => (null != x && null != y) && (x.CAT_PA_CODE == y.CAT_PA_CODE))).ToList();
            var listTree = new List<TreeSelect>();
            foreach (var item in listGroup)
            {
                TreeSelect model = new TreeSelect();
                model.id = item.CAT_PA_CODE;
                model.text = item.CAT_PA_NAME;
                listTree.Add(model);
            }
            return Content(listTree.ToJson());
        }

        [HttpPost]
        public ActionResult CurrentSD()
        {
            return Success(_sdService.CurrentSD());
        }

        [HttpPost]
        public ActionResult GetSD_PROJECT()
        {
            List<PDP_PROJECT> listRole = _projectService.GetManay(r => r.TC_PROJ_ID != -1);
            var listTree = new List<TreeSelect>();
            foreach (var item in listRole)
            {
                TreeSelect model = new TreeSelect();
                model.id = item.TC_PROJ_ID.ToString();
                model.text = item.TC_PROJ_NAME;
                listTree.Add(model);
            }
            return Content(listTree.ToJson());
        }
    }
}