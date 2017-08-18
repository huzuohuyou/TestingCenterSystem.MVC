using System.Collections.Generic;
using TestingCenterSystem.Models.CDR;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Models.Unit;

namespace TestingCenterSystem.ViewModels.InGroup
{
    public class PatientInfoViewModel
    {
        public List<UN_CPAT_ANESTHESIA_RECORD> ANESTHESIA_RECORD { get; set; }
        public List<UN_CPAT_ASSESSMENT_RECORD> ASSESSMENT_RECORD { get; set; }
        public List<UN_CPAT_CHECK_RECORD> CHECK_RECORD { get; set; }
        public List<UN_CPAT_CONSULT_RECORD> CONSULT_RECORD { get; set; }
        public List<UN_CPAT_DIAGNOSIS> DIAGNOSIS { get; set; }
        public List<UN_CPAT_EMR_RECORD> EMR_RECORD { get; set; }
        public List<UN_CPAT_INFECTION_RECORD> INFECTION_RECORD { get; set; }
        public List<UN_CPAT_IN_ORDERS> IN_ORDERS { get; set; }
        public List<UN_CPAT_IN_PATIENT> IN_PATIENT { get; set; }
        public List<UN_CPAT_MEDICAL_RECORD> MEDICAL_RECORD { get; set; }
        public List<UN_CPAT_NURSE_RECORD> NURSE_RECORD { get; set; }
        public List<UN_CPAT_OPERATION_RECORD> OPERATION_RECORD { get; set; }
        public List<UN_CPAT_OUT_EMR> OUT_EMR { get; set; }
        public List<UN_CPAT_OUT_PATIENT> OUT_PATIENT { get; set; }
        public List<UN_CPAT_OUT_RECIPE> OUT_RECIPE { get; set; }
        public List<UN_CPAT_PATHOLOGY_RECORD> PATHOLOGY_RECORD { get; set; }
        public string PATIENT_ID { get; set; }
        public string PATIENT_NO { get; set; }
        public List<UN_CPAT_TEST_RECORD> TEST_RECORD { get; set; }
        public List<UN_CPAT_TEST_RESULT> TEST_RESULT { get; set; }
        public List<UN_CPAT_TEST_RESULT_GERM> TEST_RESULT_GERM { get; set; }
        public List<UN_CPAT_TRANS_RECORD> TRANS_RECORD { get; set; }
    }


}
