using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenter.Models;
using TestingCenter.Utils;
using TestingCenter.ViewModels;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.KPI.Interface;

namespace TestingCenterSystem.Service.KPI
{
    public class KPISetService : BaseService<SD_EKPI_FORMULA>, IKPISetService
    {
        public Tuple<string, bool> ValidateFormula(SD_EKPI_FORMULA body, List<SD_EKPI_PARAM> pList)
        {
            try
            {
                var formula = new KPIFormulaViewModel(body, pList);
                UsingPython python = new UsingPython(formula.KPIScript);
                List<Param> list = new List<Param>();

                pList.ForEach(r => {
                    SD_ITEM_INFO dataitem = null;
                    using (var db = new PDPContext())
                    {
                        dataitem = db.SD_ITEM_INFO.AsNoTracking().FirstOrDefault(m => m.SD_ITEM_ID == r.SD_ITEM_ID);
                    }

                    list.Add(new Param() { Code = r.SD_EKPI_PARAM_NAME, DataType= dataitem .SD_ITEM_DATA_TYPE});
                });
                python.DebugScriptFile(list).ToString();
                return new Tuple<string, bool>("语法验证通过！！！", true);
            }
            catch (Exception ex)
            {
                return new Tuple<string, bool>(string.Format("语法错误:{0}",ex.Message), false);
            }
           
        }
    }
}
