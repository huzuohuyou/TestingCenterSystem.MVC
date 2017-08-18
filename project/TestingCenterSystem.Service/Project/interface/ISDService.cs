using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.Project;
using TestingCenterSystem.ViewModels.SD;

namespace TestingCenterSystem.Service.Project.Interface
{
    public interface ISDService : IBaseService<SD_INFO>
    {
        Page<SD_INFOViewModel> GetPage(int pageIndex, int pageSize, SDViewModels vm);

        string ExportSQL(int SD_ID);

        ProjectViewModel Switch(int SD_ID);

        string CurrentSD();


    }
}