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
    public interface IItemDepService: IBaseService<SD_ITEM_DEP>
    {
        Page<ItemDepViewModel> GetPage(int primaryKey, int pageIndex, int pageSize, string keyWord);

        Page<ItemColletionViewModel> GetItemColPage(int primaryKey, int pageIndex, int pageSize, string keyWord);

        List<int> GetDepItemIdList(int primaryKey);
    }
}
