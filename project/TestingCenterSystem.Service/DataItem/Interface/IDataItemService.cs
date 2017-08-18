using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.DataItem;

namespace TestingCenterSystem.Service.DataItem.Interface
{
    public interface IDataItemService: IBaseService<SD_ITEM_INFO>
    {
        Page<DataItemViewModel> GetPage(int pageIndex, int pageSize, string keyWord);
        List<SD_ITEM_INFO> GetItemDepList(int primaryKey);
        //Page<DataItemEntity> GetPage(int pageIndex, int pageSize, string keyWord);
        string ExportSqlFile(int sdId);
    }
}
