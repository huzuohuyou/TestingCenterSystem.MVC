using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.KPI;

namespace TestingCenterSystem.Service.KPI.Interface
{
    public interface IKPIParamService : IBaseService<SD_EKPI_PARAM>
    {
        Page<PParamViewModel> GetList(int projectId, int sdID,int kpiId);
    }
}
