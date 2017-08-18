using System.Collections.Generic;

namespace TestingCenter.ViewModels
{
    public class KpiParamViewModel
    {
        public List<string> PatientList { get; set; }
        public string SdCode { get; set; }
        public string KpiId { get; set; }
        public List<SimpleParamViewModel> KParamList{get;set;}
    }
}