using System.Collections.Generic;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.Project;

namespace TestingCenterSystem.Service.Project.Interface
{
    public interface ITeamService
    {
        int DeleteTeam(int projectID);

        Page<TeamViewModel> SelectTeam(int pageIndex, int pageSize, string keyWord);

        int InsertTeam(PDP_PROJECT project);

        int UpdateTeam(PDP_PROJECT project);
    }
}