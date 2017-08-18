using System.Collections.Generic;
using System.Data;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.KPI;

namespace TestingCenterSystem.Service.KPI.Interface
{
    public interface IKPIService: IBaseService<SD_EKPI_INFO>
    {
        Page<KPIViewModel> GetPage( int pageIndex, int pageSize, string keyWord);

        Page<TC_SD_EPKI_VALUEViewModel> Test(TestViewModel vm);

        Page<TC_SD_EPKI_VALUEViewModel> Clear(string primaryKey);

        List<KPIResultViewModel> GetKpiResult(TestViewModel vm);

        string ExportSQL(int SD_ID);
    }
}
