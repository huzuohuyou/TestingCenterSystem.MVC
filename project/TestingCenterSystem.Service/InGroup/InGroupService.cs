using Elight.Infrastructure;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Web;
using TestingCenter.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.InGroup.Interface;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.InGroup;
using TestingCenterSystem.ViewModels.Project;

namespace TestingCenterSystem.Service.InGroup
{
    public class InGroupService : BaseService<SD_FILTER_INFO>, IInGroupService
    {
        public IProcStateService _procService = new ProcStateService();
        public IProjectService _projectService = new ProjectService();
        public string user_name = OperatorProvider.Instance.Current.RealName;
        public int sd_id = ProjectProvider.Instance.Current.SD_ID;
        public int proj_id = ProjectProvider.Instance.Current.TC_PROJ_ID;
     

        public Page<InGroupEntity> GetList(int pageIndex, int pageSize, string keyWord)
        {
            List<InGroupEntity> filterlist = new List<InGroupEntity>();
            int totalCount = 0;
            using (var db = new PDPContext())
            {
                totalCount = db.SD_FILTER_INFO.ToList().Where(r => r.SD_ID == sd_id).Count();
                db.SD_FILTER_INFO.AsNoTracking().Where(r => r.SD_ID == sd_id).OrderByDescending(r => r.UPD_DATE).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList().ForEach(
                    r => filterlist.Add(new InGroupEntity()
                    {
                        SD_FILTER_ID = r.SD_FILTER_ID,
                        SD_FILTER_CODE = r.SD_FILTER_CODE,
                        SD_FILTER_NAME = r.SD_FILTER_NAME,
                        ORDER_NO = (int)r.ORDER_NO,
                        SD_FILTER_ALGO = r.SD_FILTER_ALGO,
                        //bug
                        //TC_PROJ_NAME = db.PDP_PROJECT.Where(a => a.TC_PROJ_ID == proj_id).FirstOrDefault().TC_PROJ_NAME,
                        TC_PROJ_NAME = db.PDP_PROJECT.FirstOrDefault(n => n.TC_PROJ_ID == proj_id)?.TC_PROJ_NAME ?? string.Empty,
                        SD_ID = r.SD_ID,
                        SD_CODE = r.SD_CODE,
                        SD_NAME = db.SD_INFO.Where(a => a.SD_ID == sd_id).FirstOrDefault().SD_NAME,
                        VALID_FLAG = r.VALID_FLAG,
                        PROC_STAT_CODE = db.PDP_PROC_STAT.Where(a => a.PROC_CONTENT_ID == r.SD_FILTER_ID.ToString() && a.SD_ID == sd_id).FirstOrDefault().PROC_STAT_CODE,//.Select(a => a.PROC_STAT_CODE).ToString(),
                        UPD_USER_ID = db.PDP_PROC_STAT.Where(a => a.PROC_CONTENT_ID == r.SD_FILTER_ID.ToString() && a.SD_ID == sd_id).FirstOrDefault().UPD_USER_ID,//r.UPD_USER_ID,
                        UPD_DATE = (DateTime)db.PDP_PROC_STAT.Where(a => a.PROC_CONTENT_ID == r.SD_FILTER_ID.ToString() && a.SD_ID == sd_id).FirstOrDefault().UPD_DATE,//(DateTime)r.UPD_DATE
                    }
                    ));
                var result = new Page<InGroupEntity>
                {
                    CurrentPage = pageIndex,
                    ItemsPerPage = pageSize,
                    TotalItems = totalCount,
                    Items = filterlist
                };
                return result;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="orderNO"></param>
        /// <param name="SD_ID"></param>
        /// <param name="flag">添加或删除标记 0:添加；1:删除</param>
        /// <returns></returns>
        public int Update(int orderNO, int SD_ID,int flag)
        {
            List<SD_FILTER_INFO> lists = new List<SD_FILTER_INFO>();
            lists = Db.Set<SD_FILTER_INFO>().Where(r => r.ORDER_NO >= orderNO && r.SD_ID == SD_ID).ToList();
            if (lists.Count != 0)
            {
                using (PDPContext db=new PDPContext())
                { 
                    if (flag == 0)
                    {
                        foreach (var list in lists)
                        {
                            list.ORDER_NO = orderNO + 1;
                            db.SD_FILTER_INFO.Attach(list);
                            db.Entry<SD_FILTER_INFO>(list).State = EntityState.Modified;
                        }
                        return Db.SaveChanges();
                    }
                    else
                    {
                        foreach (var list in lists)
                        {
                            list.ORDER_NO = list.ORDER_NO - 1;
                            db.SD_FILTER_INFO.Attach(list);
                            Db.Entry<SD_FILTER_INFO>(list).State = EntityState.Modified;
                        }
                        return Db.SaveChanges();
                    }
                }
            }
            else
                return 0;
        }

        public new SD_FILTER_INFO Insert(SD_FILTER_INFO model)
        {
            model.VALID_FLAG = 0;
            model.SD_ID = _projectService.GetCurrentSD().SD_ID;
            model.SD_CODE = _projectService.GetCurrentSD().SD_CODE??"ACT";
            model.UPD_USER_ID = OperatorProvider.Instance.Current.RealName;
            model.UPD_DATE = DateTime.Now;
            Update((int)model.ORDER_NO, model.SD_ID,0);
            var modelResult = base.Insert(model);
            _procService.Insert(new PDP_PROC_STAT()
            {
                SD_ID = _projectService.GetCurrentSD().SD_ID,
                PROC_CAT_CODE = _procService.InGroupProcCatCode(),
                PROC_CONTENT_ID = modelResult.SD_FILTER_ID.ToString(),
                PROC_STAT_CODE = _procService.HasNotExeProcStatCode()
            });
            return modelResult;
        }

        public int EditOrUpdate(SD_FILTER_INFO model)
        {
            Expression<Func<SD_FILTER_INFO, bool>> ex = x => x.SD_FILTER_ID == model.SD_FILTER_ID;
            var entity = base.Get(ex);
            if (model.ORDER_NO != entity.ORDER_NO)
            {
                Expression<Func<SD_FILTER_INFO, bool>> oex = x => x.SD_ID == sd_id && x.ORDER_NO == model.ORDER_NO;
                var oentity = base.Get(oex);
                oentity.ORDER_NO = entity.ORDER_NO;
                int orow = base.Update(oentity);
                if (orow <= 0)
                {
                    return -1;
                }
            }
            entity.SD_FILTER_CODE = model.SD_FILTER_CODE;
            entity.SD_FILTER_NAME = model.SD_FILTER_NAME;
            entity.ORDER_NO = model.ORDER_NO;
            entity.UPD_USER_ID = OperatorProvider.Instance.Current.RealName;
            entity.UPD_DATE = DateTime.Now;
            int row = base.Update(entity);
            return row;
        }

        public int Delete(string primaryKey)
        {
            int id = int.Parse(primaryKey);
            Expression<Func<SD_FILTER_INFO, bool>> filterex = x => x.SD_FILTER_ID == id;
            int order_id = (int)base.Get(filterex).ORDER_NO;
            Expression<Func<PDP_PROC_STAT, bool>> stateex = x => x.PROC_CONTENT_ID == primaryKey&&x.SD_ID== sd_id && x.PROC_CAT_CODE=="1";
            int count = _procService.Delete(stateex);
            if (count > 0)
            {
                count = base.Delete(filterex);
            }
            //更新系列号
            if(count > 0)
            {
                count=Update(order_id, sd_id, 1);
            }
            else
            {
                return -1;
            }
            return count;
        }
        /// <summary>
        /// 获取DP_IN_PATIENT的最小时间和最大时间
        /// </summary>
        /// <returns></returns>
        public Tuple<DateTime, DateTime> GetMinAndMaxTime()
        {
            using (CDRContext cdrContext = _projectService.GetCurrentCDRDbContext())
            {
                var minTime = (from a in cdrContext.DP_IN_PATIENT
                               orderby a.OUT_DATE ascending
                               select a).FirstOrDefault().OUT_DATE;
                var maxTime = (from a in cdrContext.DP_IN_PATIENT
                               orderby a.OUT_DATE descending
                               select a).FirstOrDefault().OUT_DATE;
                var tuple = new Tuple<DateTime, DateTime>(minTime, maxTime);
                return tuple;
            }
        }

        public string ExportSQL(int sd_id)
        {
            StringBuilder sql = new StringBuilder();
            sql.Append(ToIdentitySql(r => r.SD_ID == sd_id));
            return sql.ToString();

            //sql.Append(_procService.ToIdentitySql(r => r.SD_ID == sd_id&& r.PROC_CAT_CODE == "1"));
            //filterInfo.ForEach(r => sql.Append(_procService.ToIdentitySql(ex => ex.SD_ID == sd_id && ex.PROC_CAT_CODE == "1"&&ex.PROC_CONTENT_ID == r.SD_FILTER_ID.ToString())));
            //var fileName = string.Format("{0}入组_{1}.sql", ProjectProvider.Instance.Current.SD_NAME, DateTime.Now.ToString("yyyy年MM月dd日 hh时mm分ss秒"));
            //var filePath = string.Format(HttpRuntime.AppDomainAppPath.ToString() + "SQL\\{0}", fileName);
            //File.WriteAllText(filePath, sql.ToString());
            //return string.Format("..\\..\\..\\SQL\\{0}", fileName);
        }
    }
}
