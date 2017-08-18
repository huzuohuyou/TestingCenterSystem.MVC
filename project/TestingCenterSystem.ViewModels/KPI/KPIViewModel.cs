using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.KPI
{
    public class KPIViewModel
    {
        public int ProjectID { get; set; }
        public int SDId { get; set; }
        public int KPIID { get; set; }
        public string KPICode { get; set; }
        public string KPIName { get; set; }
        public string KPIAlias { get; set; }
        public string KPIType { get; set; }
        public int OrderNO { get; set; }
        public string IsPositive { get; set; }
        public string IsNegitve { get; set; }
        public string IsExecuted { get; set; }
        public string LastExePersion { get; set; }
        public string LastExeTime { get; set; }
        public string Remark { get; set; }
    }
}
