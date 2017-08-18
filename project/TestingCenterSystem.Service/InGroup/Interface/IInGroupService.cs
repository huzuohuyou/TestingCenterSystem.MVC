using System;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.InGroup;

namespace TestingCenterSystem.Service.InGroup.Interface
{
    public interface IInGroupService : IBaseService<SD_FILTER_INFO>
    {
        Page<InGroupEntity> GetList(int pageIndex, int pageSize, string keyWord);
        int Update(int orderNO, int SD_ID, int flag);
        int EditOrUpdate(SD_FILTER_INFO model);
        int Delete(string primaryKey);
        Tuple<DateTime, DateTime> GetMinAndMaxTime();
        string ExportSQL(int sd_id);

    }
}
