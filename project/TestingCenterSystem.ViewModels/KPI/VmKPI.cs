using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.KPI
{
    public class VmKPI
    {
        public int? SD_EKPI_ID { get; set; }
        public int? SD_ID { get; set; }
        public string SD_CODE { get; set; }
        public string SD_EKPI_CODE { get; set; }
        public string SD_EKPI_NAME { get; set; }
        public string SD_EKPI_ALIAS { get; set; }
        public int? ORDER_NO { get; set; }
        public int? SD_EKPI_CAT { get; set; }
        public int? IS_POSITIVE { get; set; }
        public string SD_EKPI_ALGO { get; set; }
        public int? VALID_FLAG { get; set; }
        public string UPD_USER_ID { get; set; }
        public DateTime? UPD_DATE { get; set; }
        public bool IS_RSN { get; set; }
        public bool IS_DISTRIBUTION { get; set; }
        public bool IS_TREND { get; set; }
    }
}
