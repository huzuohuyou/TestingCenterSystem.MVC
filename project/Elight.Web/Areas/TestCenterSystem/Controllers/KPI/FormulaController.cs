using Elight.Entity;
using Elight.Infrastructure;
using Elight.Web.Controllers;
using System.Collections.Generic;
using System.Web.Mvc;
using TestingCenterSystem.Service.KPI;
using TestingCenterSystem.Service.KPI.Interface;

namespace Elight.Web.Areas.TestCenterSystem.Controllers
{
    public class FormulaController : BaseController
    {
        private readonly IDataItemTreeService _dataiteService = new DataItemTreeService();
        // GET: TestCenterSystem/Formula
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Form()
        {
            return View();
        }

        public ActionResult GetListTree(string keywords)
        {
            var listAllItems = _dataiteService.GetList(keywords);
            List<ZTreeNode> result = new List<ZTreeNode>();
            foreach (var item in listAllItems)
            {
                ZTreeNode model = new ZTreeNode();
                model.id = item.Id;
                model.pId = item.ParentId;
                model.name = item.Name;
                model.open = true;
                result.Add(model);
            }
            return Content(result.ToJson());
        }
    }
}