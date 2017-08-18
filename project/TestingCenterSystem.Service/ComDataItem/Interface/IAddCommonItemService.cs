using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.ComDataItem;

namespace TestingCenterSystem.Service.ComDataItem
{
    public interface IAddCommonItemService<TEntity>: IBaseService<TEntity> where TEntity : class
    {
        Page<AddCommonItemViewModel> GetPage(int pageIndex, int pageSize, string keyWord);
    }
}
