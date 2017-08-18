using TestingCenter.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using TestingCenter.Models;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;

namespace TestingCenter.ViewModels
{
    public class KPIFormulaViewModel
    {
        public int KPI_ID { get { return (int)TC_SD_EKPI_FORMULA.SD_EKPI_ID; }  }
        //public string SD_CODE { get { return TC_SD_EKPI_FORMULA.; } }
        public string KPI_TYPE_CODE { get; set; }
        public string KPI_NAME { get; set; }
        public int? Status { get; set; }
        private SD_EKPI_FORMULA TC_SD_EKPI_FORMULA {  get;  set; }
        private List<SD_EKPI_PARAM> paramList {  get;  set; }
        public KPIFormulaViewModel(SD_EKPI_FORMULA body, List<SD_EKPI_PARAM> pList)
        {
            TC_SD_EKPI_FORMULA = body;
            paramList = pList;
        }
        public string KPIScript
        {
            get
            {
                try
                {
                    if (TC_SD_EKPI_FORMULA==null)
                    {
                        throw new Exception("null kpi script exist!!!");
                    }
                    string param = string.Empty, body = string.Empty, note = string.Empty;
                    if (TC_SD_EKPI_FORMULA.NUM_FORMULA == string.Empty)
                    {
                        body += string.Format(@"result={0}", TC_SD_EKPI_FORMULA.FRA_FORMULA.Trim());
                    }
                    else
                    {
                        body = string.Format(@"if({0}):
    result={1}", TC_SD_EKPI_FORMULA.NUM_FORMULA.Trim(), TC_SD_EKPI_FORMULA.FRA_FORMULA.Trim());
                    }
                    body = string.Format("\n{0}", body);
                    note = "";

                    using (var db = new PDPContext())
                    {
                        paramList.ForEach(r =>
                        {
                            param += string.Format("{0}\n", r.SD_EKPI_PARAM_NAME.Trim());
                            var dataItem = db.SD_ITEM_INFO.FirstOrDefault(i => i.SD_ITEM_ID == r.SD_ITEM_ID);
                            note += string.Format("编码：{0} 名称：{1} 数据类型：{2}\n", dataItem.SD_ITEM_CODE.Trim(), dataItem.SD_ITEM_NAME.Trim(), dataItem.SD_ITEM_DATA_TYPE.Trim());
                        });
                    }
                    return string.Format("'''{2}'''\n{0}{1}", param, body, note);
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }
    }
}
