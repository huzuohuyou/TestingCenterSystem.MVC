using System.Data.Entity.Core.EntityClient;
using System.Data.SqlClient;
using System.Linq;
using TestingCenter.Models.UN;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.KPI.Interface;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels.Project;

namespace TestingCenterSystem.Service.KPI
{
    class PdpKpiValueService : BaseService<SD_EPKI_VALUE>, ICanStoreKpiValue,IPdpKpiValueService
    {
        private static readonly IProjectService _projectService = new ProjectService();
        private static readonly IProcStateService _procStateService = new ProcStateService();

        private int kpiid;
        public PdpKpiValueService(int kpiid)
        {
            this.kpiid = kpiid;
        }
        public void StoreKPIValue()
        {
            using (var db = _projectService.GetCurrentUnitDbContext())
            {
                var list = db.SD_EPKI_VALUE.Where(n=>n.SD_EKPI_ID==kpiid).ToList();
                if (list.Count==0)
                {
                    throw new System.Exception("无可锁定数据，请先执行！！！");
                }
                Delete(m => m.SD_EKPI_ID == kpiid);
                list.ForEach(r => {
                    Insert(new SD_EPKI_VALUE()
                    {
                        SD_EKPI_ID = r.SD_EKPI_ID,
                        SD_ID = r.SD_ID,
                        SD_CODE = r.SD_CODE,
                        SD_CPAT_NO = r.SD_CPAT_NO,
                        INDEX_VALUE = r.INDEX_VALUE,
                        RSN_FLAG = r.RSN_FLAG,
                        UPD_USER_ID = r.UPD_USER_ID,
                        UPD_DATE = r.UPD_DATE
                    });
                });
                _procStateService.KPILockExecute(list[0].SD_ID, list[0].SD_EKPI_ID.ToString());
                throw new System.Exception("数据锁定成功！！！");
            }
            
            //var tt = "metadata=\"res://*/Unit.UTModel.csdl|res://*/Unit.UTModel.ssdl|res://*/Unit.UTModel.msl\";provider=System.Data.SqlClient;provider connection string=\"Data Source = 192.168.2.9\\hjcdr; Initial Catalog = HJ.PDP.SHRJ.UT; User Id = sa; Password = rjgcbzy2.9; MultipleActiveResultSets = True; App = EntityFramework\";";
            //using (var conn = new EntityConnection(ProjectProvider.Instance.Current.UNIT_CONNTIONSTRING))
            //{
            //    conn.Open();
            //    using (var db = new UNContext(conn, false))
            //    {
            //        var list = db.SD_EPKI_VALUE.ToList();
            //        list.ForEach(r => Insert(new SD_EPKI_VALUE()
            //        {
            //            SD_EKPI_ID = r.SD_EKPI_ID,
            //            SD_ID = r.SD_ID,
            //            SD_CODE = r.SD_CODE,
            //            SD_CPAT_NO = r.SD_CPAT_NO,
            //            SD_FILTER_ID = r.SD_FILTER_ID,
            //            INDEX_VALUE = r.INDEX_VALUE,
            //            RSN_FLAG = r.RSN_FLAG,
            //            UPD_USER_ID = r.UPD_USER_ID,
            //            UPD_DATE = r.UPD_DATE
            //        }));
            //    }
            //}
            //******************************************

        }
    }
}
