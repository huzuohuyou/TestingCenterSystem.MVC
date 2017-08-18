using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using TestingCenter.Models;
using TestingCenter.Utils;
using TestingCenter.ViewModels;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.KPI;
using TestingCenterSystem.Service.KPI.Interface;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.KPI;
using TestingCenterSystem.ViewModels.Project;

namespace TestingCenterSystem.Service.KPI
{

    public class KPIService : BaseService<SD_EKPI_INFO>, IKPIService
    {
        private static readonly IUnitKpiValueService _unitKpiValueService = new UnitKPIValueService();
        private static readonly IKPIParamService _kpiparamService = new KPIParamService();
        private static readonly IKPISetService _kpisetService = new KPISetService();
        private static readonly IProcStateService _procService = new ProcStateService();
        private static readonly IProjectService _projectService = new ProjectService();
        private ICanStoreKpiValue _storeKPIResultService = null;
        private static readonly int ALL_CAT = 0;
        private static readonly string CLICK_TEST_BTN = "test";
        private static readonly string CLICK_EXCUTE_BTN = "excute";
        private static readonly string CLICK_LOCK_BTN = "lock";
        public Page<KPIViewModel> GetPage(int pageIndex, int pageSize, string keyWord)
        {
            int totalCount = 0;
            var codeorname = keyWord.Split('_')[0];
            var catid = ALL_CAT;
            var rp = int.TryParse(keyWord.Split('_').Length == 2 ? keyWord.Split('_')[1] : catid.ToString(), out catid);
            List<KPIViewModel> klist = new List<KPIViewModel>();
            using (var db = new PDPContext())
            {
                var kpitypelist = db.SD_CAT_CONF.ToList();
                var PROC_CAT_CODE = _procService.KPIProcCatCode();
                var kpistatuslist = db.PDP_PROC_STAT.Where(r => r.PROC_CAT_CODE == PROC_CAT_CODE).ToList();
                var rlist = catid == ALL_CAT ?
                    db.SD_EKPI_INFO
                    .AsNoTracking()
                    .Where(r =>r.SD_ID==ProjectProvider.Instance.Current.SD_ID&& (r.SD_EKPI_CODE.Contains(codeorname) || r.SD_EKPI_NAME.Contains(codeorname))).ToList() :
                    db.SD_EKPI_INFO.AsNoTracking().Where(r => r.SD_ID == ProjectProvider.Instance.Current.SD_ID && r.SD_EKPI_CAT == catid && (r.SD_EKPI_CODE.Contains(codeorname) || r.SD_EKPI_NAME.Contains(codeorname))).ToList();
                totalCount = rlist.Count();
                rlist.OrderBy(r => r.ORDER_NO).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList().ForEach(
                    r =>
                    {
                        var contentId = r.SD_EKPI_ID.ToString();
                        var state = _procService.Get(n => n.PROC_CONTENT_ID == contentId);
                        klist.Add(
                        new KPIViewModel()
                        {
                            SDId = ProjectProvider.Instance.Current.SD_ID,// _projectService.GetCurrentSD().SD_ID,
                            ProjectID = ProjectProvider.Instance.Current.TC_PROJ_ID,
                            KPIID = r.SD_EKPI_ID,
                            KPICode = r.SD_EKPI_CODE,
                            KPIName = r.SD_EKPI_NAME,
                            KPIAlias = r.SD_EKPI_ALIAS,
                            KPIType = r.SD_EKPI_CAT == null ? "[未指定]" : kpitypelist.FirstOrDefault(m => m.CAT_ID == (int)r.SD_EKPI_CAT).CAT_NAME,
                            IsPositive = r.IS_POSITIVE?.ToString(),
                            IsExecuted = ConvertIsExecuted(state?.PROC_STAT_CODE),

                        });
                    });

            }
            var result = new Page<KPIViewModel>
            {
                CurrentPage = pageIndex,
                ItemsPerPage = pageSize,
                TotalItems = totalCount,
                Items = klist
            };
            return result;
        }

        public string ConvertIsExecuted(string code)
        {
            if (code == "1")
            {
                return "未执行";
            }
            else if (code == "2")
            {
                return "已执行";
            }
            else if (code == "3")
            {
                return "已清空";
            }
            else if (code == "4")
            {
                return "已锁定";
            }
            else
            {
                return "未执行";
            }
        }

        public new SD_EKPI_INFO Insert(SD_EKPI_INFO model)
        {

            model.SD_CODE = ProjectProvider.Instance.Current.SD_CODE;
            model.SD_ID = ProjectProvider.Instance.Current.SD_ID;
            model = base.Insert(model);
            _procService.Insert(new PDP_PROC_STAT()
            {
                SD_ID = _projectService.GetCurrentSD().SD_ID,
                PROC_CAT_CODE = _procService.KPIProcCatCode(),
                PROC_CONTENT_ID = model.SD_EKPI_ID.ToString(),
                PROC_STAT_CODE = _procService.HasNotExeProcStatCode()

            });
            return model;

        }

        public List<SD_CPATS> GetAllPats(TestViewModel tvm)
        {
            using (var db = new PDPContext())
            {
                DateTime start = DateTime.Parse(tvm.startDate ?? DateTime.MinValue.ToString());
                DateTime end = DateTime.Parse(tvm.endDate ?? DateTime.MaxValue.ToString());
                var pno = tvm.patientNo ?? "";
                return db.SD_CPATS.AsNoTracking().Where(r => r.SD_ID == ProjectProvider.Instance.Current.SD_ID && r.SD_CPAT_DATE > start && r.SD_CPAT_DATE < end && r.SD_CPAT_NO.Contains(pno)).ToList().ToList();
            }
        }

        public List<PDP_SD_ITEM_VALUE> GetAllItemValue()
        {
            using (var db = new PDPContext())
            {
                return db.SD_ITEM_VALUE.AsNoTracking().ToList();
            }
        }

        public Page<TC_SD_EPKI_VALUEViewModel> Test(TestViewModel tvm)
        {
            var cpats = GetAllPats( tvm);
            var allItemValue = GetAllItemValue();
            List<TC_SD_EPKI_VALUEViewModel> klist = new List<TC_SD_EPKI_VALUEViewModel>();
            using (var sysdb = new PDPContext())
            {
                int kpiid = int.Parse(tvm.primaryKey);
                List<SD_EKPI_PARAM> paramlist = new List<SD_EKPI_PARAM>();

                paramlist = sysdb.SD_EKPI_PARAM.AsNoTracking().Where(r => r.SD_EKPI_ID == kpiid).ToList();
                KPIFormulaViewModel vm = new KPIFormulaViewModel(
                    sysdb.SD_EKPI_FORMULA.FirstOrDefault(r => r.SD_EKPI_ID == kpiid),
                    paramlist
               );
                //初始化python引擎
                UsingPython up = new UsingPython(vm.KPIScript);
                //按照配置EP_KPI_PARAM中KPI的配置组织参数
                List<SimpleParamViewModel> listp = new List<SimpleParamViewModel>();
                cpats.ForEach(
                    p =>
                    {
                        paramlist.ForEach(m =>
                        {
                            listp.Add(new SimpleParamViewModel
                            {
                                Code = m.SD_EKPI_PARAM_NAME,
                                DataType = sysdb.SD_ITEM_INFO.FirstOrDefault(t => t.SD_ITEM_ID == m.SD_ITEM_ID)?.SD_ITEM_DATA_TYPE,
                                Value = allItemValue.FirstOrDefault(k => k.SD_ITEM_ID == m.SD_ITEM_ID && k.SD_CPAT_NO == p.SD_CPAT_NO)?.SD_ITEM_VALUE
                            });
                        }
                        );
                        int kr = 0;
                        var ok = int.TryParse(up.ExcuteScriptFile(listp)?.ToString(), out kr);
                        if (ok)
                        {
                            //测试从集成库取数据
                            using (var db=_projectService.GetCurrentUnitDbContext())
                            {
                                var patientId = db.SD_CPAT_DETAIL.FirstOrDefault(m => m.SD_CPAT_NO == p.SD_CPAT_NO && m.SD_ID == p.SD_ID)?.PATIENT_ID;
                                klist.Add(new TC_SD_EPKI_VALUEViewModel()
                                {
                                    PATIENT_ID = patientId,
                                    SD_EKPI_ID = kpiid,
                                    SD_ID = ProjectProvider.Instance.Current.SD_ID,
                                    SD_CODE = ProjectProvider.Instance.Current.SD_CODE,
                                    SD_CPAT_NO = p.SD_CPAT_NO,
                                    SD_FILTER_ID = ProjectProvider.Instance.Current.SD_FILTER_ID,
                                    INDEX_VALUE = kr
                                });
                            }
                           
                        }
                    }
                    );
            }
            var sotred = StoreKPIResult(klist, tvm.flag);
            if (!sotred.Item1)
            {
                throw new Exception(sotred.Item2);
            }
            var result = new Page<TC_SD_EPKI_VALUEViewModel>
            {
                CurrentPage = 1,
                ItemsPerPage = klist.Count,
                TotalItems = klist.Count,
                Items = klist
            };
            return result;
        }

        /// <summary>
        /// 计算结果存库
        /// </summary>
        /// <param name="klist"></param>
        /// <param name="flag"></param>
        public  Tuple<bool, string> StoreKPIResult(List<TC_SD_EPKI_VALUEViewModel> klist, string flag)
        {
            try
            {
                if (flag == CLICK_EXCUTE_BTN)
                {
                    
                    _storeKPIResultService = new UnitKPIValueService(klist);
                }
                else if (flag == CLICK_LOCK_BTN)
                {
                    _storeKPIResultService = new PdpKpiValueService((int)klist[0]?.SD_EKPI_ID);
                }
                _storeKPIResultService?.StoreKPIValue();
            }
            catch (Exception e)
            {
                return new Tuple<bool, string>(false, e.Message) ;
            }
            return new Tuple<bool, string>(true, "保存成功"); ;
        }

        public Page<TC_SD_EPKI_VALUEViewModel> Clear(string primaryKey)
        {
            List<TC_SD_EPKI_VALUEViewModel> rlist = new List<TC_SD_EPKI_VALUEViewModel>();
            using (var db = _projectService.GetCurrentUnitDbContext())
            {
                int kpiId = int.Parse(primaryKey);
                _procService.KPIDoClear(ProjectProvider.Instance.Current.SD_ID, kpiId.ToString());
                var list = _unitKpiValueService.GetManay(r => r.SD_EKPI_ID == kpiId).ToList();
                list.ForEach(r => _unitKpiValueService.Delete(m=>m.SD_EKPI_ID==r.SD_EKPI_ID));
                db.SaveChanges();
                _unitKpiValueService.GetManay(r => r.SD_EKPI_ID == kpiId).ToList().ForEach(kr =>
                {
                    rlist.Add(new TC_SD_EPKI_VALUEViewModel()
                    {
                        SD_EKPI_ID = kpiId,
                        SD_ID = ProjectProvider.Instance.Current.SD_ID,
                        SD_CODE = ProjectProvider.Instance.Current.SD_CODE,
                        SD_CPAT_NO = kr.SD_CPAT_NO,
                        SD_FILTER_ID = ProjectProvider.Instance.Current.SD_FILTER_ID,
                        INDEX_VALUE = kr.INDEX_VALUE
                    });
                }
                    );
            }
            
            var result = new Page<TC_SD_EPKI_VALUEViewModel>
            {
                CurrentPage = 1,
                ItemsPerPage = rlist.Count,
                TotalItems = rlist.Count,
                Items = rlist
            };
            return result;
        }

        public List<KPIResultViewModel> GetKpiResult(TestViewModel vm)
        {
            List<KPIResultViewModel> list = new List<KPIResultViewModel>();
            int id = int.Parse(vm.primaryKey??"-1");
            if (id==-1)
            {
                return list;
            }
            using (var db = _projectService.GetCurrentUnitDbContext())
            {
                db.SD_EPKI_VALUE.Where(r => r.SD_EKPI_ID == id).ToList().ForEach(
                    r => {
                        var patientId = db.SD_CPAT_DETAIL.FirstOrDefault(m => m.SD_CPAT_NO == r.SD_CPAT_NO && m.SD_ID==r.SD_ID)?.PATIENT_ID;
                        list.Add(new KPIResultViewModel() { PATIENT_ID = patientId, 入组样本ID = r.SD_CPAT_NO, 结果值 = r.INDEX_VALUE }); }
                    );
            };
            return list;
        }

        public string ExportSQL(int SD_ID)
        {
            StringBuilder sql = new StringBuilder();
            var kpiInfo = GetManay(r => r.SD_ID == SD_ID);
            sql.Append(ToIdentitySql(r => r.SD_ID == SD_ID));
            kpiInfo.ForEach(r => sql.Append(_kpiparamService.ToIdentitySql(m => m.SD_EKPI_ID == r.SD_EKPI_ID)));
            kpiInfo.ForEach(r => sql.Append(_kpisetService.ToIdentitySql(m => m.SD_EKPI_ID == r.SD_EKPI_ID)));
            return sql.ToString();
        }
    }
}
