using Elight.Entity;
using Elight.Infrastructure;
using Elight.Web.Controllers;
using Elight.Web.Filters;
using System.Web.Mvc;
using TestingCenterSystem.Service.KPI;
using TestingCenterSystem.ViewModels.KPI;
using TestingCenterSystem.Service.KPI.Interface;
using TestingCenterSystem.Models;
using System.Collections.Generic;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Models.PDP;
using System;
using TestingCenterSystem.Utils;
using System.Web;
using TestingCenterSystem.ViewModels.Project;
using System.Text;

namespace Elight.Web.Areas.TestCenterSystem.Controllers
{
    public class KPIController : BaseController
    {
        private readonly IKPIService _kpiService = new KPIService();
        private readonly IKPIParamService _kpiparamService = new KPIParamService();
        private readonly IKPISetService _kpisetService = new KPISetService();
        private readonly IProcStateService _procService = new ProcStateService();
        private readonly IProjectService _projectService = new ProjectService();
        private readonly IUnitKpiValueService _unitKpiValueService = new UnitKPIValueService();

        [HttpGet, AuthorizeChecked]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost, AuthorizeChecked]
        public ActionResult Index(int pageIndex, int pageSize, string keyWord)
        {
            var pageData = _kpiService.GetPage(pageIndex, pageSize, keyWord);
            var result = new LayPadding<KPIViewModel>()
            {
                result = true,
                msg = "success",
                list = pageData.Items,
                count = pageData.TotalItems
            };
            return Content(result.ToJson());
        }

        [HttpGet, AuthorizeChecked]
        public ActionResult Form()
        {
            return View();
        }


        public ActionResult Form(SD_EKPI_INFOViewModel model)
        {
            SD_EKPI_INFO value = new SD_EKPI_INFO()
            {
                SD_EKPI_ID = model.SD_EKPI_ID,
                SD_ID = model.SD_ID,
                SD_CODE = model.SD_CODE,
                SD_EKPI_CODE = model.SD_EKPI_CODE,
                SD_EKPI_NAME = model.SD_EKPI_NAME,
                SD_EKPI_ALIAS = model.SD_EKPI_ALIAS,
                ORDER_NO = model.ORDER_NO,
                SD_EKPI_CAT = model.SD_EKPI_CAT,
                IS_POSITIVE = model.IS_POSITIVE,
                SD_EKPI_ALGO = model.SD_EKPI_ALGO,
                VALID_FLAG = model.VALID_FLAG,
                IS_RSN = (model.IS_RSN == true) ? 1 : 0,
                IS_DISTRIBUTION = (model.IS_DISTRIBUTION == true) ? 1 : 0,
                IS_TREND = (model.IS_TREND == true) ? 1 : 0,
            };
            if (_kpiService.Exists(r => r.SD_EKPI_ID == model.SD_EKPI_ID))
            {
                var row = _kpiService.Update(value);
                return row > 0 ? Success() : Error();
            }
            else
            {
                var entity = _kpiService.Insert(value);
                return entity != null ? Success() : Error();
            }
        }

        public ActionResult Configure()
        { return View(); }

        [HttpGet]
        public ActionResult Detail()
        {
            return View();
        }
        [HttpPost]
        public ActionResult GetForm(string primaryKey)
        {
            int id = int.Parse(primaryKey);
            var entity = _kpiService.Get(r => r.SD_EKPI_ID == id);
            return Content(new VmKPI{
                SD_EKPI_ID =entity.SD_EKPI_ID,
                SD_ID = entity.SD_ID,
                SD_CODE = entity.SD_CODE,
                SD_EKPI_CODE = entity.SD_EKPI_CODE,
                SD_EKPI_NAME = entity.SD_EKPI_NAME,
                SD_EKPI_ALIAS = entity.SD_EKPI_ALIAS,
                ORDER_NO = entity.ORDER_NO,
                SD_EKPI_CAT = entity.SD_EKPI_CAT,
                IS_POSITIVE = entity.IS_POSITIVE,
                SD_EKPI_ALGO = entity.SD_EKPI_ALGO,
                VALID_FLAG = entity.VALID_FLAG,
                IS_RSN = (entity.IS_RSN == 1) ? true : false,
                IS_DISTRIBUTION = (entity.IS_DISTRIBUTION == 1) ? true : false,
                IS_TREND = (entity.IS_TREND == 1) ? true : false,
                UPD_USER_ID = entity.UPD_USER_ID,
                UPD_DATE = entity.UPD_DATE,
            }.ToJson());
        }

        public ActionResult Delete(string primaryKey)
        {

            var id = int.Parse(primaryKey.Trim());
            if (_unitKpiValueService.GetManay(r => r.SD_EKPI_ID == id)?.Count > 0)
            {
                return Error("已被执行，请清库后再进行删除");
            }

            int paramRow = _kpiparamService.Delete(r => r.SD_EKPI_ID == id);
            int setrow = _kpisetService.Delete(r => r.SD_EKPI_ID == id);
            int row = _kpiService.Delete(r=>r.SD_EKPI_ID== id);
            return row > 0 ? Success() : Error();
        }

        public ActionResult Test(TestViewModel vm)
        {
            try
            {
                _procLogService.Insert(
                        new PDP_PROC_LOG()
                        {
                            SD_ID = ProjectProvider.Instance.Current?.SD_ID,
                            PROC_CAT_CODE = _procLogService.KPICatCode(),
                            PROC_CONTENT_ID = vm.primaryKey,
                        });
                var pageData = _kpiService.Test(vm);

                var result = new LayPadding<TC_SD_EPKI_VALUEViewModel>()
                {
                    result = true,
                    msg = "success",
                    list = pageData.Items,
                    count = pageData.TotalItems
                };
                return Content(result.ToJson());
            }
            catch (Exception e)
            {
                _errorLogService.Insert(
                       new PDP_ERROR_LOG()
                       {
                           SD_ID = ProjectProvider.Instance.Current?.SD_ID,
                           ERR_CONTENT = e.ToString(),
                           PROC_TYPE = ConvertExeFlag(vm.flag)
                       });
                var result = new LayPadding<TC_SD_EPKI_VALUEViewModel>()
                {
                    result = false,
                    msg = e.Message,
                    list = null,
                    count = 0
                };
                return Content(result.ToJson());
            }
        }

        private int ConvertExeFlag(string flag) {
            switch (flag)
            {
                case "execute":
                    return 1;
                case "test":
                    return 2;
                case "export":
                    return 3;
                default:
                    return 0;
            }
        }

        public ActionResult Clear(string primaryKey)
        {
            var pageData = _kpiService.Clear(primaryKey);
            var result = new LayPadding<TC_SD_EPKI_VALUEViewModel>()
            {
                result = true,
                msg = "success",
                list = pageData.Items,
                count = pageData.TotalItems
            };
            return Content(result.ToJson());
        }

        public ActionResult ExportResult(TestViewModel vm)
        {
            try
            {

                var pageData = _kpiService.GetKpiResult(vm);
                var id = int.Parse(vm.primaryKey);
                var kpiname = _kpiService.Get(r => r.SD_EKPI_ID == id).SD_EKPI_NAME;
                var filename = string.Format("{0}_{1}_{2}.xlsx",ProjectProvider.Instance.Current.SD_NAME,kpiname,DateTime.Now.ToString("yyyy年MM月dd日 hh时mm分ss秒"));
                var ok = ExportExcelHelper.DataSetToExcel<KPIResultViewModel>(pageData, false, filename);
                if (ok.Item1)
                {
                    return Success(ok.Item2);
                }
                return Success(ok.Item2);
            }
            catch (Exception e)
            {
                return Error(e.ToString());
            }
        }

        public ActionResult ExportSQL()
        {
            throw new Exception("由项目统一导出SQL");
        }

    }
}