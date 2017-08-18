using System.Web.Mvc;
using Elight.Infrastructure;
using Elight.Entity;
using TestingCenterSystem.Service.Comm;
using TestingCenterSystem.Service.Comm.Interface;

namespace Elight.Web.Controllers
{
    /// <summary>
    /// 控制器基类。
    /// </summary>
    public class BaseController : Controller
    {
        public readonly IProcLogService _procLogService = new ProcLogService();
        public readonly IErrorLogService _errorLogService = new ErrorLogService();

        #region 快捷方法
        protected ActionResult Success(string message = "恭喜您，操作成功。", object data = null)
        {
            return Content(new AjaxResult(ResultType.Success, message, data).ToJson());
        }
        protected ActionResult Error(string message = "对不起，操作失败。", object data = null)
        {
            return Content(new AjaxResult(ResultType.Error, message, data).ToJson());
        }
        protected ActionResult Warning(string message, object data = null)
        {
            return Content(new AjaxResult(ResultType.Warning, message, data).ToJson());
        }
        protected ActionResult Info(string message, object data = null)
        {
            return Content(new AjaxResult(ResultType.Info, message, data).ToJson());
        }
        #endregion
    }
}
