using Elight.Infrastructure;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Models.Unit;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.InGroup.Interface;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.InGroup;
using TestingCenterSystem.ViewModels.Project;

namespace TestingCenterSystem.Service.InGroup
{
    public class InGroupResultService : BaseService<InGroupResultViewModel>, IInGroupResultService
    {
        UnitResultDetail _unitResultDetail = new UnitResultDetail();
        UnitResultMaster _unitResultMaster = new UnitResultMaster();
        UnitPatientInfo _unitPatientInfo = new UnitPatientInfo();
        public IProcStateService _procService = new ProcStateService();
        public int sd_id = ProjectProvider.Instance.Current.SD_ID;

        public Page<InGroupResultViewModel> GetList(int pageIndex, int pageSize, List<InGroupResultViewModel> data)//, List<InGroupResultViewModel> list
        {
            List<InGroupResultViewModel> filterlist = new List<InGroupResultViewModel>();
            filterlist = data.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            int totalCount = data.Count;
            var result = new Page<InGroupResultViewModel>
            {
                CurrentPage = pageIndex,
                ItemsPerPage = pageSize,
                TotalItems = totalCount,
                Items = filterlist
            };
            return result;
        }

        public List<InGroupResultViewModel> GetList(List<UN_SD_CPAT_DETAIL> details, string primaryKey)
        {
            try
            {
                List<InGroupResultViewModel> resultlist = new List<InGroupResultViewModel>();
                details.ForEach(r => resultlist.Add(new InGroupResultViewModel()
                {
                    SD_FILTER_ID = primaryKey,
                    SD_CPAT_DATE = (DateTime)r.UPD_DATE,
                    PATIENT_ID = r.PATIENT_ID,
                    PATIENT_NO = r.PATIENT_NO,
                    IN_FLAG = r.IN_FLAG,
                    BASE_FLAG = r.BASE_FLAG,
                    IN_DATE = (DateTime)r.IN_DATE,
                    OUT_DATE = (DateTime)r.OUT_DATE,
                }));
                return resultlist;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<InGroupResultViewModel> GetResultList(string fiterId)//string patientId,DateTime startTime,DateTime endTime,
        {
            int? id = int.Parse(fiterId);
            var tuple = GetMasterAndDetillist(id);
            var list = GetList(tuple.Item2, fiterId);
            return list;
        }
        private Tuple<List<UN_SD_CPATS>, List<UN_SD_CPAT_DETAIL>> GetMasterAndDetillist(int? fiterId)
        {
            var resultlist = new List<UN_SD_CPAT_DETAIL>();
            var cpats = _unitResultMaster.GetSearchList(ex => ex.SD_ID == sd_id && ex.SD_FILTER_ID == fiterId);
            cpats.ForEach(r => resultlist.Add(_unitResultDetail.GetSearchList(ex => ex.SD_ID == r.SD_ID && ex.SD_CPAT_NO == r.SD_CPAT_NO).FirstOrDefault()));
            return new Tuple<List<UN_SD_CPATS>, List<UN_SD_CPAT_DETAIL>>(cpats, resultlist);
        }
        public Tuple<bool, string> Locking(int filterId)
        {
            //先查询单元库主表信息、明细表信息，再根据查询平台库是否有数据，如果有，先删除平台库明细表，再删主表，然后再插入主表，明细表
            var tuple = GetMasterAndDetillist(filterId);
            if (tuple.Item1.Count == 0 || tuple.Item2.Count == 0)
                return new Tuple<bool, string>(false, "未找到需要锁定的数据，请先进行执行功能");

            var tupleString = tuple.ToJson();
            var resultlist = JsonConvert.DeserializeObject<Tuple<List<SD_CPATS>, List<SD_CPAT_DETAIL>>>(tupleString);
            try
            {
                using (var db = new PDPEntities())
                {
                    using (var trans = db.Database.BeginTransaction(IsolationLevel.ReadCommitted))
                    {
                        db.SD_CPATS.Where(e => e.SD_FILTER_ID == filterId && e.SD_ID == sd_id).ToList().ForEach(r => db.SD_CPAT_DETAIL.Where(e => e.SD_ID == r.SD_ID && e.SD_CPAT_NO == r.SD_CPAT_NO).DeleteFromQuery());
                        db.SD_CPATS.Where(e => e.SD_FILTER_ID == filterId && e.SD_ID == sd_id).DeleteFromQuery();

                        db.BulkInsert(resultlist.Item1);
                        db.BulkInsert(resultlist.Item2);
                        db.BulkSaveChanges();
                        //提交事务
                        trans.Commit();
                    }
                }
            }
            catch (Exception ex)
            {
                return new Tuple<bool, string>(false, ex.Message);
            }
            return new Tuple<bool, string>(true, "数据锁定成功");
        }

        public Tuple<bool, string> ClearUniteData(int filterId)
        {
            var pnolist = _unitResultMaster.GetSearchList(ex => ex.SD_ID == sd_id && ex.SD_FILTER_ID == filterId).Select(s => s.SD_CPAT_NO.Remove(0, s.SD_CPAT_NO.LastIndexOf("_") + 1)).ToList();
            if (pnolist.Count == 0)
                return new Tuple<bool, string>(false, "没有需要清除的数据");
            var pnootherslist = _unitResultMaster.GetSearchList(ex => ex.SD_ID != sd_id).Select(s => s.SD_CPAT_NO.Remove(0, s.SD_CPAT_NO.LastIndexOf("_") + 1)).ToList();
            pnolist.ForEach(r =>
            {
                if (pnootherslist.Contains(r))
                {
                    pnolist.Remove(r);
                }
            });
            var count = _unitPatientInfo.clear(pnolist, filterId);
            if (count > 0)
            {
                //string mes = "清库成功，共清除" + count + "条数据";
                _procService.InGroupDoClear(sd_id, filterId.ToString());
                return new Tuple<bool, string>(true, "清库成功");
            }
            else
                return new Tuple<bool, string>(false, "清库失败");
        }
        public PDP_PROC_STAT getStat(string filterId)
        {
            using (var db = new PDPEntities())
            {
                var state = db.PDP_PROC_STAT.Where(ex => ex.PROC_CONTENT_ID == filterId && ex.SD_ID == sd_id && ex.PROC_CAT_CODE == "1").FirstOrDefault();
                return state;
            }
        }
    }
}
