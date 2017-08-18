using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.ViewModels.Project;

namespace TestingCenterSystem.ViewModels
{
    public class ProjectViewModel
    {
        public ProjectViewModel()
        { }

        public ProjectViewModel(PDP_PROJECT project, SD_INFO sdInfo, PDP_DB_CONF cdr, PDP_DB_CONF unit, PDP_DB_CONF ci)
        {
            TC_PROJ_ID = project.TC_PROJ_ID;
            TC_PROJ_CODE = project.TC_PROJ_CODE;
            TC_PROJECT_NAME = project.TC_PROJ_NAME;
            SD_ID = sdInfo.SD_ID;
            TC_PROJ_TYPE = project.TC_PROJ_TYPE;
            SD_CODE = sdInfo.SD_CODE;
            SD_NAME = sdInfo.SD_NAME;
            SD_ALIAS = sdInfo.SD_ALIAS;
            ITEM_CAT_PA_CODE = sdInfo.ITEM_CAT_PA_CODE;
            CITEM_CAT_PA_CODE = sdInfo.CITEM_CAT_PA_CODE;
            EKPI_CAT_PA_CODE = sdInfo.EKPI_CAT_PA_CODE;
            ORDER_NO = sdInfo.ORDER_NO;
            VALID_FLAG = sdInfo.VALID_FLAG;

            CDR_DATA_SOURCE = cdr?.SERVER_NAME;
            CDR_INITIAL_CATALOG = cdr?.DB_NAME;
            CDR_USER_ID = cdr?.DB_USER;
            CDR_PASSWORD = cdr?.DB_PWD;

            UNIT_DATA_SOURCE = unit?.SERVER_NAME;
            UNIT_INITIAL_CATALOG = unit?.DB_NAME;
            UNIT_USER_ID = unit?.DB_USER;
            UNIT_PASSWORD = unit?.DB_PWD;

            CI_DATA_SOURCE = ci?.SERVER_NAME;
            CI_INITIAL_CATALOG = ci?.DB_NAME;
            CI_USER_ID = ci?.DB_USER;
            CI_PASSWORD = ci?.DB_PWD;
        }

        public override string ToString()
        {
            return string.Format("{0}-{1}", TC_PROJECT_NAME, SD_NAME);
        }

        private static string UNIT_STR = "metadata=\"res://*/Unit.UTModel.csdl|res://*/Unit.UTModel.ssdl|res://*/Unit.UTModel.msl\";provider=System.Data.SqlClient;provider connection string=\"Data Source = {0}; Initial Catalog = {1}; User Id = {2}; Password = {3}; MultipleActiveResultSets = True; App = EntityFramework\";";

        private static string CDR_STR = "metadata=\"res://*/CDR.CDRModel.csdl|res://*/CDR.CDRModel.ssdl|res://*/CDR.CDRModel.msl\";provider=System.Data.SqlClient;provider connection string=\"Data Source = {0}; Initial Catalog = {1}; User Id = {2}; Password = {3}; MultipleActiveResultSets = True; App = EntityFramework\";";

        #region 病种信息
        public int TC_PROJ_ID { get; set; }
        public string TC_PROJ_CODE { get; set; }
        /// <summary>
        /// 入组规则ID
        /// </summary>
        public int SD_FILTER_ID { get; set; }
        public string TC_PROJECT_NAME { get; set; }
        public int SD_ID { get; set; }
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
        #endregion

        #region CDR数据库连接信息
        public string CDR_DATA_SOURCE { get; set; }
        public string CDR_INITIAL_CATALOG { get; set; }
        public string CDR_USER_ID { get; set; }
        public string CDR_PASSWORD { get; set; }
        public string CDR_CONNTIONSTRING
        {
            get
            {
                return (string.Format(CDR_STR, 
                    CDR_DATA_SOURCE, 
                    CDR_INITIAL_CATALOG, 
                    CDR_USER_ID, 
                    CDR_PASSWORD));
            }
        }
        #endregion

        #region 单元数据库连接信息
        public string UNIT_DATA_SOURCE { get; set; }
        public string UNIT_INITIAL_CATALOG { get; set; }
        public string UNIT_USER_ID { get; set; }
        public string UNIT_PASSWORD { get; set; }

        public string UNIT_CONNTIONSTRING
        {
            get
            {
                return (string.Format(UNIT_STR, 
                    UNIT_DATA_SOURCE, 
                    UNIT_INITIAL_CATALOG, 
                    UNIT_USER_ID, 
                    UNIT_PASSWORD));
            }
        }
        #endregion

        #region 集成平台链接信息
        public string CI_DATA_SOURCE { get; set; }
        public string CI_INITIAL_CATALOG { get; set; }
        public string CI_USER_ID { get; set; }
        public string CI_PASSWORD { get; set; }
        public string CI_CONNTIONSTRING {
            get
            {
                return (string.Format(UNIT_STR, 
                    CI_DATA_SOURCE, 
                    CI_INITIAL_CATALOG, 
                    CI_USER_ID, 
                    CI_PASSWORD));
            }
        }
        #endregion

    }
}
