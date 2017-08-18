using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models;

namespace TestingCenterSystem.ViewModels.InGroup
{
    public class InGroupEntity
    {
        public int SD_FILTER_ID { get; set; }
        public string SD_FILTER_CODE { get; set; }
        public string SD_FILTER_NAME { get; set; }
        public int ORDER_NO { get; set; }
        public string SD_FILTER_ALGO { get; set; }
        public string TC_PROJ_NAME { get; set; }
        public int SD_ID { get; set; }
        public string SD_CODE { get; set; }
        public string SD_NAME { get; set; }
        public int VALID_FLAG { get; set; }
        public string PROC_STAT_CODE { get; set; }
        public string UPD_USER_ID { get; set; }
        public DateTime UPD_DATE { get; set; }
    }
}
