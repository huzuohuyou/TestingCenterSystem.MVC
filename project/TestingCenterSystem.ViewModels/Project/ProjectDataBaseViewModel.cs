using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.Project
{
    public partial class ProjectDataBaseViewModel
    {
        public int TC_PROJ_ID { get; set; }
        public string TC_PROJ_CODE { get; set; }
        public string TC_PROJ_NAME { get; set; }
        public Nullable<int> IS_COMMON { get; set; }
        public Nullable<int> TC_PROJ_TYPE { get; set; }
        public Nullable<int> CDR_DB_CONF_TYPE { get; set; }
        public int CDR_DB_CONF_ID { get; set; }
        public string CDR_SERVER_NAME { get; set; }
        public string CDR_DB_NAME { get; set; }
        public string CDR_DB_USER { get; set; }
        public string CDR_DB_PWD { get; set; }
        public int UNIT_DB_CONF_ID { get; set; }
        public Nullable<int> UNIT_DB_CONF_TYPE { get; set; }
        public string UNIT_SERVER_NAME { get; set; }
        public string UNIT_DB_NAME { get; set; }
        public string UNIT_DB_USER { get; set; }
        public string UNIT_DB_PWD { get; set; }
    }
}
