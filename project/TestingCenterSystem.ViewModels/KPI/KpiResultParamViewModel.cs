using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenter.ViewModels
{
    public class KpiResultParamViewModel
    {
        public string SdCode { get; set; }

        public string KpiId { get; set; }

        public  List<string> PatientList { get; set; }
    }
}
