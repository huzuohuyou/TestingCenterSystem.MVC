using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.Project
{
    public class SD_INFOViewModel
    {
        
        public int SD_ID { get; set; }
        public int TC_PROJ_ID { get; set; }
        public string TC_PROJ_NAME { get; set; }
        public Nullable<int> TC_PROJ_TYPE { get; set; }
        public string SD_CODE { get; set; }
        public string SD_NAME { get; set; }
        public string SD_ALIAS { get; set; }
        public string ITEM_CAT_PA_CODE { get; set; }
        public string CITEM_CAT_PA_CODE { get; set; }
        public string EKPI_CAT_PA_CODE { get; set; }
        public Nullable<int> ORDER_NO { get; set; }
        public int VALID_FLAG { get; set; }
        public string UPD_USER_ID { get; set; }
        public Nullable<System.DateTime> UPD_DATE { get; set; }
        public int IN_GROUP_COUNT { get; set; }
        public int DATA_ITEM_COUNT { get; set; }
        public int KPI_COUNT { get; set; }
    }
}
