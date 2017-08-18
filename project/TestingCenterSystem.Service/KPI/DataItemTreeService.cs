using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenter.Models;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Service.KPI.Interface;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels.KPI;

namespace TestingCenterSystem.Service.KPI
{
    public class DataItemTreeService : BaseService<DataitemViewModel>, IDataItemTreeService
    {
        /// <summary>
        /// 1,表示结果数据项
        /// </summary>
        private static readonly int IS_RESULT = 1;
        public IProcStateService _procService = new ProcStateService();
        public IProjectService _projectService = new ProjectService();
        public int Delete(object primaryKey)
        {
            throw new NotImplementedException();
        }

        public bool Exists(object primaryKey)
        {
            throw new NotImplementedException();
        }

        public DataitemViewModel Get(object primaryKey)
        {
            throw new NotImplementedException();
        }



        public List<DataitemViewModel> GetList()
        {
            List<DataitemViewModel> list = new List<DataitemViewModel>();
            using (var db = new PDPContext())
            {
                db.SD_CAT_CONF.ToList().ForEach(r => list.Add(new DataitemViewModel() { Id = r.CAT_ID.ToString(), ParentId = "", Name = r.CAT_SUB_NAME }));
            }
            using (var db = new PDPContext())
            {
                db.SD_ITEM_INFO.ToList().ForEach(r => list.Add(new DataitemViewModel() { Id = r.SD_ITEM_ID.ToString(), ParentId = r.SD_ITEM_CAT_ID.ToString(), Name = r.SD_ITEM_NAME }));
            }
            return list;
        }

        public List<DataitemViewModel> GetList(string keywords)
        {
            int SD_ID =  _projectService.GetCurrentSD().SD_ID;
            List<DataitemViewModel> list = new List<DataitemViewModel>();
            using (var db = new PDPContext())
            {
                List<SD_ITEM_INFO> temp = db.SD_ITEM_INFO.ToList().Where(r => r.IS_RESULT == IS_RESULT && r.SD_ID == SD_ID && (r.SD_ITEM_CODE.Contains(keywords) || r.SD_ITEM_NAME.Contains(keywords))).ToList();
                List<DataitemViewModel> catlist = temp.GroupBy(r => r.SD_ITEM_CAT_ID, (i, r) => new DataitemViewModel()
                {
                    Id = string.Format("class_{0}", db.SD_CAT_CONF.AsNoTracking().FirstOrDefault(j => j.CAT_ID == i).CAT_ID.ToString()),
                    Name = db.SD_CAT_CONF.AsNoTracking().FirstOrDefault(j => j.CAT_ID == i).CAT_NAME,
                    ParentId = ""
                }).ToList();
                catlist.ForEach(r => list.Add(r));
                temp.ForEach(r => list.Add(new DataitemViewModel() { Id = r.SD_ITEM_ID.ToString(), ParentId = string.Format("class_{0}", r.SD_ITEM_CAT_ID.ToString()), Name = r.SD_ITEM_NAME }));
            }
            //清理树枝
            List<DataitemViewModel> result = new List<DataitemViewModel>();
            list.ForEach(r => result.Add(r));
            list.ForEach(r =>
            {
                if (r.ParentId == "" && list.Find(m => m.ParentId == r.Id) == null)
                {
                    result.Remove(r);
                }
            });
            return result;
        }


    }
}
