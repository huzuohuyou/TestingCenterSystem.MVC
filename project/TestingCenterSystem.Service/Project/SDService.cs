using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Text;
using System.Web;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.comm;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.DataItem;
using TestingCenterSystem.Service.DataItem.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.InGroup.Interface;
using TestingCenterSystem.Service.KPI;
using TestingCenterSystem.Service.KPI.Interface;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.Project;
using TestingCenterSystem.ViewModels.SD;

namespace TestingCenterSystem.Service.Project
{
    public class SDService : BaseService<SD_INFO>, ISDService
    {
        private readonly IKPIParamService _kpiparamService = new KPIParamService();
        private readonly IKPISetService _kpisetService = new KPISetService();
        private readonly IInGroupService _ingroupService = new InGroupService();
        private readonly IDataItemService _dataitemService = new DataItemService();
        private readonly IKPIService _kpiService = new KPIService();
        private readonly IProjectService _projectService = new ProjectService();
        private readonly IDbConfService _dbConfService = new DbConfService();
        public string ExportSQL(int SD_ID)
        {
            var sdInfo = Get(r => r.SD_ID == SD_ID);
            var sql = new StringBuilder();
            sql.Append(ToIdentitySql(r => r.SD_ID == SD_ID));
            sql.Append(_ingroupService.ExportSQL(SD_ID));
            sql.Append(_kpiService.ExportSQL(SD_ID));
            sql.Append(_dataitemService.ExportSqlFile(SD_ID));
           
            return sql.ToString();
        }

        public Page<SD_INFOViewModel> GetPage(int pageIndex, int pageSize, SDViewModels vm)
        {
            string keyWord = vm?.keyWord??"";
            int? projectId = vm?.ProjectId;
            List<SD_INFOViewModel> list = new List<SD_INFOViewModel>();
            Tuple<List<SD_INFO>, int> models = null;
            if (projectId == null)
            {
                models = GetPageList(
                    r => r.ORDER_NO, 
                    r => r.TC_PROJ_ID != 0 
                    && (r.SD_CODE.Contains(keyWord) || r.SD_NAME.Contains(keyWord)), 
                    pageIndex, 
                    pageSize);
            }
            else
            {
                var id = (int)projectId;
                models = GetPageList(r => r.ORDER_NO, 
                    r => r.TC_PROJ_ID == id 
                    && (r.SD_CODE.Contains(keyWord) || r.SD_NAME.Contains(keyWord)), 
                    pageIndex, 
                    pageSize);
            }
            models.Item1.ForEach(model => list.Add(
                new SD_INFOViewModel() {

                    SD_ID = model.SD_ID,
                    TC_PROJ_ID = model.TC_PROJ_ID,
                    TC_PROJ_NAME = _projectService.Get(r=>r.TC_PROJ_ID==model.TC_PROJ_ID)?.TC_PROJ_NAME,
                    TC_PROJ_TYPE = model.TC_PROJ_TYPE,
                    SD_CODE = model.SD_CODE,
                    SD_NAME = model.SD_NAME,
                    SD_ALIAS = model.SD_ALIAS,
                    ITEM_CAT_PA_CODE = model.ITEM_CAT_PA_CODE,
                    CITEM_CAT_PA_CODE = model.CITEM_CAT_PA_CODE,
                    EKPI_CAT_PA_CODE = model.EKPI_CAT_PA_CODE,
                    ORDER_NO = model.ORDER_NO,
                    VALID_FLAG = model.VALID_FLAG,
                    IN_GROUP_COUNT=_ingroupService.Count(i=>i.SD_ID==model.SD_ID),
                    DATA_ITEM_COUNT= _dataitemService.Count(i => i.SD_ID == model.SD_ID),
                    KPI_COUNT= _kpiService.Count(i => i.SD_ID == model.SD_ID)
                }
                ));
            var result = new Page<SD_INFOViewModel>
            {
                CurrentPage = pageIndex,
                ItemsPerPage = pageSize,
                TotalItems = models.Item2,
                Items = list
            };
            return result;
        }

        public ProjectViewModel Switch(int SD_ID)
        {
            var sd = Get(r => r.SD_ID == SD_ID);
            var project = _projectService.Get(r => r.TC_PROJ_ID == sd.TC_PROJ_ID);

            int cdrType = _dbConfService.CDR_CONF_FLAG();
            var cdrConf = _dbConfService.Get(r=>r.TC_PROJ_ID==project.TC_PROJ_ID&&r.DB_CONF_TYPE== cdrType);
            int unitType = _dbConfService.UNIT_CONF_FLAG();
            var unitConf = _dbConfService.Get(r => r.TC_PROJ_ID == project.TC_PROJ_ID && r.DB_CONF_TYPE == unitType);
            int ciType = _dbConfService.CI_CONF_FLAG();
            var ciConf = _dbConfService.Get(r => r.TC_PROJ_ID == project.TC_PROJ_ID && r.DB_CONF_TYPE == ciType);
            ProjectProvider.Instance.Current = new ProjectViewModel(project, sd, cdrConf, unitConf, ciConf);
            return ProjectProvider.Instance.Current;
        }

        public string CurrentSD()
        {
            return ProjectProvider.Instance.Current.ToString();
        }
    }
}