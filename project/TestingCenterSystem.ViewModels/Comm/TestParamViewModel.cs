using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.Comm
{
    public class TestParamViewModel
    {
        public DateTime startTime { get; set; }
        public DateTime endTime { get; set; }
        public string patientId { get; set; }
        public string url { get; set; }
    }
}
