//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace TestingCenterSystem.Models.CDR
{
    using System;
    using System.Collections.Generic;
    
    public partial class DP_IN_ORDERS
    {
        public string MO_ORDER_NO { get; set; }
        public string PATIENT_ID { get; set; }
        public string PATIENT_NO { get; set; }
        public string APPLY_NO { get; set; }
        public Nullable<System.DateTime> MO_DATE { get; set; }
        public Nullable<System.DateTime> DATE_BEGIN { get; set; }
        public Nullable<System.DateTime> DATE_END { get; set; }
        public Nullable<int> ORDER_TYPE_CODE { get; set; }
        public string ORDER_ITEM_CODE { get; set; }
        public string ORDER_ITEM_NAME { get; set; }
        public Nullable<int> LONG_FLAG { get; set; }
        public Nullable<int> OUT_DRUG_FLAG { get; set; }
        public string DEPT_CODE { get; set; }
        public string DEPT_NAME { get; set; }
        public string DOCTOR_NAME { get; set; }
        public string STOP_DOCTOR_NAME { get; set; }
        public string ITEM_GOODS_NAME { get; set; }
        public string GYTJ_CODE { get; set; }
        public string GYTJ_NAME { get; set; }
        public string USAGE_CODE { get; set; }
        public string USAGE_NAME { get; set; }
        public string FREQ_CODE { get; set; }
        public string FREQ_NAME { get; set; }
        public Nullable<decimal> DOSE_ONCE { get; set; }
        public string DOSE_UNIT { get; set; }
        public Nullable<decimal> QTY_TOT { get; set; }
        public string QTY_TOT_UNIT { get; set; }
        public Nullable<int> CHN_MEDI_QTY { get; set; }
        public Nullable<int> USE_INTENDED_CODE { get; set; }
        public string EXEC_DEPT_CODE { get; set; }
        public string EXEC_DEPT_NAME { get; set; }
        public string EXEC_PERSON { get; set; }
        public Nullable<System.DateTime> EXEC_DATE { get; set; }
        public Nullable<System.DateTime> UPD_DATE { get; set; }
    }
}
