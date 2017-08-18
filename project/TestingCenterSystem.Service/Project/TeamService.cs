using System.Linq;
using System.Data.Entity;
using System.Collections.Generic;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.ViewModels.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels;

namespace TestingCenterSystem.Service.Project
{
    public class TeamService : ITeamService
    {
        public int DeleteTeam(int projectID)
        {
            using (PDPEntities context = new PDPEntities())
            {
                var obj = context.PDP_PROJECT.Where(x => x.TC_PROJ_ID == projectID).FirstOrDefault();
                context.PDP_PROJECT.Remove(obj);
                return context.SaveChanges();
            }
        }

        public int InsertTeam(PDP_PROJECT project)
        {
            using (PDPEntities context = new PDPEntities())
            {
                context.PDP_PROJECT.Add(project);
                return context.SaveChanges();
            }
        }

        public Page<TeamViewModel> SelectTeam(int pageIndex, int pageSize, string keyWord)
        {
            var val = new List<TeamViewModel>();
            using (PDPEntities context = new PDPEntities())
            {
                var searchList = keyWord.Split(';');
                var projectList = (from project in context.PDP_PROJECT
                                   select new
                                   {
                                       projectID = project.TC_PROJ_ID,
                                       projectName = project.TC_PROJ_NAME,
                                       projectType = project.TC_PROJ_TYPE,
                                       isCommon = project.IS_COMMON,
                                       createTime = project.UPD_DATE,
                                       sdCount = context.SD_INFO.Where(x => x.TC_PROJ_ID == project.TC_PROJ_ID).Count()
                                   }).ToList();
                if (!string.IsNullOrWhiteSpace(searchList[0]) && searchList[0] != "all")
                {
                    var projectType = int.Parse(searchList[0]);
                    projectList = projectList.Where(project => project.projectType == projectType).ToList();
                }
                if (!string.IsNullOrWhiteSpace(searchList[1]))
                {
                    var projectName = searchList[1];
                    projectList =
                        projectList.Where(
                            project => project.projectName.Contains(projectName)).ToList();
                }
                projectList.ForEach((item) => { val.Add(new TeamViewModel { ProjectID = item.projectID, ProjectName = item.projectName, ProjectType = item.projectType, IsCommon = item.isCommon, CreateTime = item.createTime, SDCount = item.sdCount }); });
            }
            var values = val.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            var temp = new Page<TeamViewModel>() { CurrentPage = pageIndex, TotalItems = val.Count, Items = values };
            return temp;
        }

        private IQueryable<PDP_PROJECT> SearchInfo(IQueryable<PDP_PROJECT> projectList, string[] searchList)
        {

            return projectList;
        }
        public int UpdateTeam(PDP_PROJECT project)
        {
            using (PDPEntities context = new PDPEntities())
            {
                context.Entry<PDP_PROJECT>(project).State = EntityState.Modified;
                return context.SaveChanges();
            }
        }
    }
}