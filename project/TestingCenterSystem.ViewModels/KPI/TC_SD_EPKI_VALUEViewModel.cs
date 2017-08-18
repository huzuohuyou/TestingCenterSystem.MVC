using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.KPI
{
    public class TC_SD_EPKI_VALUEViewModel
    {
        public string PATIENT_ID { get; set; }
        public int SD_EKPI_ID { get; set; }
        public int SD_ID { get; set; }
        public string SD_CODE { get; set; }
        public string SD_CPAT_NO { get; set; }
        public Nullable<int> SD_FILTER_ID { get; set; }
        public int INDEX_VALUE { get; set; }
        public Nullable<int> RSN_FLAG { get; set; }
        public string UPD_USER_ID { get; set; }
        public Nullable<System.DateTime> UPD_DATE { get; set; }
    }
}
