using Elight.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.Project;
using System.Data.Entity;
using System.Data.Entity.Core.EntityClient;
using TestingCenter.Models.UN;
using TestingCenter.Models;

namespace TestingCenterSystem.Service.Project
{
    public class ProjectService : BaseService<PDP_PROJECT>, IProjectService
    {
        public ProjectService()
        {
        }
        /// <summary>
        /// 请使用 ProjectProvider.Instance.Current 获取当前项目对象；
        /// </summary>
        /// <returns></returns>
        [Obsolete("推荐使用ProjectProvider.Instance.Current")]
        public ProjectViewModel GetCurrentSD()
        {
            return ProjectProvider.Instance.Current;
        }

        [Obsolete("请创建继承UnitBaseService的服务操作Unit数据库。")]
        public UNContext GetCurrentUnitDbContext()
        {
            var conn = new EntityConnection(ProjectProvider.Instance.Current.UNIT_CONNTIONSTRING);
            conn.Open();
            var db = new UNContext(conn, false);
            return db;
        }

        public CDRContext GetCurrentCDRDbContext()
        {
            try
            {
                var s = ProjectProvider.Instance.Current.CDR_CONNTIONSTRING;
                var conn = new EntityConnection(s);
                conn.Open();
                var db = new CDRContext(conn, false);
                return db;
            }
            catch (Exception e)
            {
                throw;
            }

        }
    }
}
