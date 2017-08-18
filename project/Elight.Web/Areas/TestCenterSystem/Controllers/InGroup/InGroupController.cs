using Elight.Entity;
using Elight.Infrastructure;
using Elight.Web.Controllers;
using Elight.Web.Filters;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Web.Mvc;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.InGroup.Interface;
using TestingCenterSystem.ViewModels.Comm;
using TestingCenterSystem.ViewModels.InGroup;
using TestingCenterSystem.ViewModels.Project;
using System.IO;
using System.Net.Security;
using System.Net;
using System.Text;
using TestingCenterSystem.Models.Unit;
using TestingCenterSystem.Utils;
using System.Threading.Tasks;
using System.Threading;
using TestingCenterSystem.Service.Comm.Interface;
using TestingCenterSystem.Service.Comm;
using System.Linq;

namespace Elight.Web.Areas.TestCenterSystem.Controllers
{
    public class InGroupController : BaseController
    {
        // GET: TestCenterSystem/InGroup
        private readonly IInGroupService _ingroupService = new InGroupService();
        private readonly IProcStateService _inGroupStateService = new ProcStateService();
        private readonly IPatientInfoService _patientInfoService = new PatientInfoService();
        private readonly IInGroupResultService _inGroupResultService = new InGroupResultService();
        private readonly IErrorLogService _iErrorLogService = new ErrorLogService();
        //private readonly IProcLogService _procLogService = new ProcLogService();
        private static int count = 0;
        public static List<InGroupResultViewModel> list = new List<InGroupResultViewModel>();

        public int sd_id = ProjectProvider.Instance.Current.SD_ID;
        public string sd_code = ProjectProvider.Instance.Current.SD_CODE;
        public int proj_id = ProjectProvider.Instance.Current.TC_PROJ_ID;
        public string username = OperatorProvider.Instance.Current.RealName;

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]//, AuthorizeChecked
        public ActionResult Index(int pageIndex, int pageSize, string keyWord)
        {
            var pageData = _ingroupService.GetList(pageIndex, pageSize, keyWord);
            count = (int)pageData.TotalItems;
            var result = new LayPadding<InGroupEntity>()
            {
                result = true,
                msg = "success",
                list = pageData.Items,
                count = pageData.TotalItems
            };
            return Content(result.ToJson());
        }
        [HttpGet, AuthorizeChecked]
        public ActionResult Form(string primaryKey)
        {
            if (string.IsNullOrEmpty(primaryKey))
            {
                ViewBag.count = count + 1;
            }
            else
            {
                ViewBag.count = count;
            }
            return View();
        }
        [HttpPost, AuthorizeChecked, ValidateAntiForgeryToken]
        public ActionResult Form(SD_FILTER_INFO model)
        {
            if (model.SD_FILTER_ID == 0)
            {
                var primaryKey = _ingroupService.Insert(model);
                return primaryKey != null ? Success() : Error();
            }
            else
            {
                var primaryKey = _ingroupService.EditOrUpdate(model);
                return primaryKey > 0 ? Success() : Error();
            }
        }

        [HttpPost]
        public ActionResult GetForm(string primaryKey)
        {
            int id = int.Parse(primaryKey);
            Expression<Func<SD_FILTER_INFO, bool>> ex = x => x.SD_FILTER_ID == id;
            var entity = _ingroupService.Get(ex);
            return Content(entity.ToJson());
        }
        [HttpPost, AuthorizeChecked]
        public ActionResult Delete(string primaryKey)
        {
            var stat = _inGroupResultService.getStat(primaryKey).PROC_STAT_CODE;
            if (stat == "1" || stat == "3")
            {
                int count = _ingroupService.Delete(primaryKey);
                return count > 0 ? Success() : Error();
            }
            else
            {
                return Error("尚未清库，请清库后再进行删除");
            }
        }

        public ActionResult Switch(string primaryKey)
        {
            int id = int.Parse(primaryKey);
            Expression<Func<SD_FILTER_INFO, bool>> ex = x => x.SD_FILTER_ID == id;
            var entity = _ingroupService.Get(ex);
            entity.VALID_FLAG = entity.VALID_FLAG == 1 ? 0 : 1;
            int count = _ingroupService.Update(entity);
            return count > 0 ? Success() : Error();
        }
        //public ActionResult ExportSQL()
        //{
        //    //return Success("由项目统一导出SQL");
        //    throw new Exception("由项目统一导出SQL");
        //}

        public ActionResult Config(int primaryKey)
        {
            var entity = _ingroupService.Get(filter => filter.SD_FILTER_ID == primaryKey);
            ViewBag.SD_FILTER_NAME = entity.SD_FILTER_NAME;
            ViewBag.SD_FILTER_CODE = entity.SD_FILTER_CODE;
            ViewBag.SD_FILTER_ALGO = entity.SD_FILTER_ALGO;
            var state = _inGroupResultService.getStat(primaryKey.ToString());
            if (state.PROC_STAT_CODE != "1")
            {
                ViewBag.UserName = state.UPD_USER_ID;
                ViewBag.UpdateDate = state.UPD_DATE;
            }
            return View();
        }
        /// <summary>
        /// 入组测试
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Test(string primaryKey, TestParamViewModel model)
        {
            //var myurl = "http://localhost:1588/api/zlt";
            try
            {
                var tuple = ExecuteUrl(model.url, model.startTime, model.endTime, model.patientId);
                if (tuple == null || tuple.Item2.Count == 0 || tuple.Item3.Count == 0)
                {
                    list = new List<InGroupResultViewModel>();
                    return Success();
                }
                if (tuple.Item2.Select(r => r.SD_CODE).FirstOrDefault() == sd_code)
                {
                    list = _inGroupResultService.GetList(tuple.Item3, primaryKey);
                    return Success();
                }
                else
                {
                    list = new List<InGroupResultViewModel>();
                    return Error("调用的webapi与该病种不匹配");
                }
            }
            catch (Exception ex)
            {
                _iErrorLogService.Insert(new PDP_ERROR_LOG
                {
                    SD_ID = sd_id,
                    PROC_TYPE = ConvertExeFlag("test"),
                    //PROC_URL =
                    //DLL_NAME =
                    //CLASS_NAME =
                    //FUNC_NAME =
                    ERR_CONTENT = ex.ToString(),
                });
                list = new List<InGroupResultViewModel>();
                return Error(ex.Message);
            }
        }

        /// <summary>
        /// 入组执行
        /// </summary>
        /// <param name="url"></param>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        [HttpPost]//, AsyncTimeout(60000)
        public ActionResult Execute(string url, string primaryKey)
        {
            var result = Do(url, primaryKey);
            if (result.Item1)
            {
                _inGroupStateService.InGroupDoExecute(sd_id, primaryKey);
                _procLogService.Insert(new PDP_PROC_LOG
                {
                    SD_ID = sd_id,
                    PROC_CAT_CODE = _procLogService.InGroupCatCode(),
                    PROC_CONTENT_ID = primaryKey
                });
                return Success("入组执行成功", new { UserName = username, UpdateDate = DateTime.Now });
            }
            else
            {
                _iErrorLogService.Insert(new PDP_ERROR_LOG
                {
                    SD_ID = sd_id,
                    PROC_TYPE = ConvertExeFlag("execute"),
                    //PROC_URL =
                    //DLL_NAME =
                    //CLASS_NAME =
                    //FUNC_NAME =
                    ERR_CONTENT = result.Item2,
                });
                return Error(result.Item2);
            }
        }
        private Tuple<bool, string> Do(string url, string primaryKey)
        {
            try
            {
                int id = int.Parse(primaryKey);
                Tuple<bool, string> result = null;
                DateTime minTime = _ingroupService.GetMinAndMaxTime().Item1;
                DateTime maxTime = _ingroupService.GetMinAndMaxTime().Item2.AddDays(1);
                //DateTime minTime = Convert.ToDateTime("2017-04-05");
                for (DateTime dt = minTime; dt <= maxTime; dt = dt.AddDays(30))
                {
                    var starTime = dt;
                    var endTime = dt.AddDays(30) < maxTime ? dt.AddDays(30) : maxTime;
                    var tuple = ExecuteUrl(url, starTime, endTime, "");
                    if (tuple == null || tuple.Item1.Count == 0 || tuple.Item2.Count == 0 || tuple.Item3.Count == 0)
                    {
                        continue;
                    }
                    result = _patientInfoService.Insert(tuple.Item1, tuple.Item2, tuple.Item3, id);
                    if (!result.Item1)
                        return new Tuple<bool, string>(result.Item1, result.Item2);
                }
                return new Tuple<bool, string>(result.Item1, result.Item2);
            }
            catch (Exception ex)
            {
                return new Tuple<bool, string>(false, ex.ToString());
            }
        }
        /// <summary>
        /// 导出
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Export(string primaryKey)//, TestParamViewModel model
        {
            try
            {
                var pageData = _inGroupResultService.GetResultList(primaryKey);//model.patientId,model.startTime,model.endTime,
                int filterId = int.Parse(primaryKey);
                var filtername = _ingroupService.Get(e => e.SD_FILTER_ID == filterId).SD_FILTER_NAME;
                var filename = string.Format("{0}_{1}_{2}.xlsx", ProjectProvider.Instance.Current.SD_NAME, filtername, DateTime.Now.ToString("yyyy年MM月dd日 hh时mm分ss秒"));
                var ok = ExportExcelHelper.DataSetToExcel<InGroupResultViewModel>(pageData, false, filename);
                if (ok.Item1)
                {
                    return Success(ok.Item2);
                }
                return Error(ok.Item2);
            }
            catch (Exception ex)
            {
                _iErrorLogService.Insert(new PDP_ERROR_LOG
                {
                    SD_ID = sd_id,
                    PROC_TYPE = ConvertExeFlag("export"),
                    //PROC_URL =
                    //DLL_NAME =
                    //CLASS_NAME =
                    //FUNC_NAME =
                    ERR_CONTENT = ex.ToString(),
                });
                return Error(ex.ToString());
            }
        }
        /// <summary>
        /// 锁定
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Locking(string primaryKey)
        {
            var id = int.Parse(primaryKey);
            var result = _inGroupResultService.Locking(id);
            if (result.Item1)
            {
                _inGroupStateService.InGroupLockExecute(sd_id, primaryKey);
                return Success(result.Item2);
            }
            else
            {
                return Error(result.Item2);
            }
            //return result.Item1 ? Success(result.Item2) : Error(result.Item2);
        }
        /// <summary>
        /// 清库
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Clear(string primaryKey)
        {
            var id = int.Parse(primaryKey);
            var result = _inGroupResultService.ClearUniteData(id);
            return result.Item1 ? Success(result.Item2, new { UserName = username, UpdateDate = DateTime.Now }) : Error(result.Item2);
        }
        private Tuple<List<PatientInfoViewModel>, List<UN_SD_CPATS>, List<UN_SD_CPAT_DETAIL>> ExecuteUrl(string url, DateTime startTime, DateTime endTime, string patientNo)
        {
            try
            {
                var result = HttpGet(url, string.Format("dateBegin={0}&dateEnd={1}&patientNo={2}", startTime, endTime, patientNo));
                if (result == "null")
                {
                    return null;
                }
                result = result.Replace("m_Item1", "Item1");
                result = result.Replace("m_Item2", "Item2");
                result = result.Replace("m_Item3", "Item3");
                var tuple = JsonConvert.DeserializeObject<Tuple<List<PatientInfoViewModel>, List<UN_SD_CPATS>, List<UN_SD_CPAT_DETAIL>>>(result);
                return tuple;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private string HttpGet(string Url, string postDataStr)
        {
            HttpWebResponse response = null;
            Stream myResponseStream = null;
            StreamReader myStreamReader = null;
            try
            {
                GC.Collect();//垃圾回收站
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url + (postDataStr == "" ? "" : "?") + postDataStr);
                request.Method = "GET";
                request.ServicePoint.ConnectionLimit = 1024;//默认为2个
                request.KeepAlive = false;
                request.Timeout = 1000000;//100秒
                request.ContentType = "text/html;charset=UTF-8";
                response = (HttpWebResponse)request.GetResponse();
                myResponseStream = response.GetResponseStream();
                myStreamReader = new StreamReader(myResponseStream, Encoding.GetEncoding("utf-8"));
                string retString = myStreamReader.ReadToEnd();
                //myStreamReader.Close();
                //myResponseStream.Close();
                return retString;
            }
            catch (Exception ex)
            {
                //LogHelper.Error("post信息时出错！信息：" + ex.Message);
                //return null;
                throw ex;
            }
            finally
            {
                if (myStreamReader != null)
                {
                    myStreamReader.Close();
                    myStreamReader.Dispose();
                }
                if (myResponseStream != null)
                {
                    myResponseStream.Close();
                    myResponseStream.Dispose();
                }
                if (response != null)
                {
                    response.Close();
                    response.Dispose();
                }
            }
        }


        public ActionResult GetInGroupResultList(int pageIndex, int pageSize)// GetInGroupResultList,List<InGroupResultViewModel> data
        {
            var pageData = _inGroupResultService.GetList(pageIndex, pageSize, list);
            var result = new LayPadding<InGroupResultViewModel>()
            {
                result = true,
                msg = "success",
                list = pageData.Items,
                count = pageData.TotalItems
            };
            return Content(result.ToJson());
        }
        private int ConvertExeFlag(string flag)
        {
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
    }
}