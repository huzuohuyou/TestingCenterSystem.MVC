using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenter.Models;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.KPI.Interface;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.KPI;

namespace TestingCenterSystem.Service.KPI
{
    public class KPIParamService : BaseService<SD_EKPI_PARAM>, IKPIParamService
    {
        public Page<PParamViewModel> GetList(int projectId,int sdId,int kpiId)
        {
            List<PParamViewModel> list = new List<PParamViewModel>();
            using (var db = new PDPContext())
            {//##projectid限制
                db.SD_EKPI_PARAM.Where(r=>r.SD_EKPI_ID==kpiId).ToList().ForEach(r => {
                    var dataitem = db.SD_ITEM_INFO.FirstOrDefault(m => m.SD_ITEM_ID == r.SD_ITEM_ID);
                    list.Add(new PParamViewModel(projectId, sdId, kpiId)
                    {
                        Id = string.Format("{0}_{1}", r.SD_EKPI_ID, r.SD_ITEM_ID),
                        ShowCode = r.SD_EKPI_PARAM_NAME,
                        DataItemID = r.SD_ITEM_ID.ToString(),
                        DataItemCode = dataitem.SD_ITEM_CODE,
                        DataItemName = dataitem.SD_ITEM_NAME,
                        DataType = dataitem.SD_ITEM_DATA_TYPE,
                    });
                });
                var result = new Page<PParamViewModel>
                {
                    CurrentPage = 0,
                    ItemsPerPage = 0,
                    TotalItems = 0,
                    Items = list
                };
                return result;
            }
        }
        
    }
}
