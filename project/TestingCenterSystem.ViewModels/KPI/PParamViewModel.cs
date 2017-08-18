using System.Collections.Generic;
using System.Linq;
using TestingCenter.Models;

namespace TestingCenterSystem.ViewModels.KPI
{
    public class PParamViewModel
    {
        List<string> plist = new List<string>()
        { "P1",  "P2",  "P3",  "P4",  "P5",
          "P6",  "P7",  "P8",  "P9" , "P10",
          "P11", "P12", "P13", "P14" ,"P15",
          "P16", "P17", "P18", "P19" ,"P20",
          "P21", "P22", "P23", "P24" ,"P25",
          "P26", "P27", "P28", "P29" ,"P30",
          "P31", "P32", "P33", "P34" ,"P35"};
        public string Id { get; set; }
        public PParamViewModel(int pid,int sdId,int? kid) { ProjectId = pid;SDId = sdId; KPIId = kid; }
        public int ProjectId { get; set; }
        public int SDId { get; set; }
        public string ShowCode { get; set; }
        public int? KPIId { get; set; }
        private string paramCode;
        public string ParamCode
        {
            get
            {
                using (var db = new PDPContext())
                {
                    List<string> list = db.SD_EKPI_PARAM.Where(r => r.SD_EKPI_ID == KPIId).Select(r => r.SD_EKPI_PARAM_NAME).ToList();
                    list.ForEach(r => { plist.Contains(r); plist.Remove(r); });
                    return plist[0];
                }
            }
            set { paramCode = value; }
        }
        public string DataItemID { get; set; }
        public string DataType { get; set; }

        public string DataItemCode { get; set; }
        public string DataItemName { get; set; }
    }
}
