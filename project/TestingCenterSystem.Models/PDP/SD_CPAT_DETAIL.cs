//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace TestingCenterSystem.Models.PDP
{
    using System;
    using System.Collections.Generic;
    
    public partial class SD_CPAT_DETAIL
    {
        public int DETAIL_ID { get; set; }
        public Nullable<int> SD_ID { get; set; }
        public string SD_CPAT_NO { get; set; }
        public string PATIENT_NO { get; set; }
        public string IN_FLAG { get; set; }
        public int BASE_FLAG { get; set; }
        public string PATIENT_ID { get; set; }
        public Nullable<System.DateTime> IN_DATE { get; set; }
        public Nullable<System.DateTime> OUT_DATE { get; set; }
        public string UPD_USER_ID { get; set; }
        public Nullable<System.DateTime> UPD_DATE { get; set; }
    }
}
