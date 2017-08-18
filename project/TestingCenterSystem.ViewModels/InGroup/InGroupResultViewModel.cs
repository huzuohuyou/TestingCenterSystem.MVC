using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.InGroup
{
    public class InGroupResultViewModel
    {
        public string SD_FILTER_ID { get; set; }
        public DateTime SD_CPAT_DATE { get; set; }
        public string PATIENT_ID { get; set; }
        public string PATIENT_NO { get; set; }
        public string IN_FLAG { get; set; }
        public int BASE_FLAG { get; set; }
        public DateTime IN_DATE { get; set; }
        public DateTime OUT_DATE { get; set; }
        
    }
}
