using System.Collections.Generic;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Models.Unit;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.KPI.Interface;
using TestingCenterSystem.ViewModels.KPI;
using TestingCenterSystem.ViewModels.Project;

namespace TestingCenterSystem.Service.KPI
{
    public class UnitKPIValueService : UnitBaseService<UN_SD_EPKI_VALUE>, ICanStoreKpiValue,IUnitKpiValueService
    {
        private readonly IProcStateService _procService = new ProcStateService();
        List<TC_SD_EPKI_VALUEViewModel> list = new List<TC_SD_EPKI_VALUEViewModel>();
        public UnitKPIValueService()
        {
        }
        public UnitKPIValueService(List<TC_SD_EPKI_VALUEViewModel> l)
        {
            list = l;
        }
        public void StoreKPIValue()
        {
            try
            {
                if (list.Count==0)
                {
                    throw new System.Exception("无可执行记录！！！");
                }
                list.ForEach(r => Insert(new UN_SD_EPKI_VALUE()
                {
                    SD_EKPI_ID = r.SD_EKPI_ID,
                    SD_ID = r.SD_ID,
                    SD_CODE = r.SD_CODE,
                    SD_CPAT_NO = r.SD_CPAT_NO,
                    INDEX_VALUE = r.INDEX_VALUE,
                    RSN_FLAG = r.RSN_FLAG,
                    UPD_USER_ID = r.UPD_USER_ID,
                    UPD_DATE = r.UPD_DATE
                }));
                var kpiId = list[0].SD_EKPI_ID.ToString();
                _procService.KPIDoExecute(ProjectProvider.Instance.Current.SD_ID, kpiId);
            }
            catch (System.Exception e)
            {
                if ((bool)e?.InnerException?.InnerException?.Message.Contains("违反了 PRIMARY KEY 约束"))
                {
                    throw new System.Exception("数据库中已存在记录，要想插入新纪录请执行清库操作！！！");
                }
            }
            
        }

        public void UpdateProcStatus(int sdId,string kpiId) {
            var status = _procService.Get(r => r.SD_ID == sdId && r.PROC_CONTENT_ID == kpiId);
            if (status == null)
            {
                _procService.Insert(new Models.PDP.PDP_PROC_STAT()
                {
                    SD_ID = sdId,
                    PROC_CAT_CODE = _procService.KPIProcCatCode(),
                    PROC_CONTENT_ID = kpiId,
                    PROC_STAT_CODE = _procService.HadExedProcStatCode()
                });
            }
            else
            {
                status.PROC_STAT_CODE = _procService.HadExedProcStatCode();
                _procService.Update(status);
            }
        }
    }
}
