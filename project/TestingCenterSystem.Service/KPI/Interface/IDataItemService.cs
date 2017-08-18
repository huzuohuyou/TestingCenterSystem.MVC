using System.Collections.Generic;
using TestingCenterSystem.ViewModels.KPI;

namespace TestingCenterSystem.Service.KPI.Interface
{
    public interface IDataItemTreeService: IBaseService<DataitemViewModel>
    {
        List<DataitemViewModel> GetList();
        List<DataitemViewModel> GetList(string keywords);
    }
}
