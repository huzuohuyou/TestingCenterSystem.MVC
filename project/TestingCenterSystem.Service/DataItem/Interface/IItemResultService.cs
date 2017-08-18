using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Models.Unit;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.DataItem;
using TestingCenterSystem.ViewModels.InGroup;

namespace TestingCenterSystem.Service.DataItem.Interface
{
    public interface IItemResultService : IBaseService<PDP_SD_ITEM_VALUE>
    {
        /// <summary>
        /// 获取数据项测试结果列表分页加载
        /// </summary>
        /// <param name="valueList"></param>
        /// <param name="primaryKey">数据项ID</param>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageSize">每页行数</param>
        /// <param name="keyWord">筛选字符串</param>
        /// <returns></returns>
        Page<ItemValueViewModel> GetPage(List<ItemValueViewModel> valueList, int primaryKey, int pageIndex, int pageSize, string keyWord);
        /// <summary>
        /// 获取数据项执行结果
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        List<ItemValueViewModel> GetList(int primaryKey);
        /// <summary>
        /// 获取已入组的患者信息列表
        /// </summary>
        /// <param name="startTime"></param>
        /// <param name="endTime"></param>
        /// <param name="patiendID"></param>
        /// <returns></returns>
        Dictionary<UN_SD_CPATS, PatientInfoViewModel> GetPatientInfoList(DateTime startTime, DateTime endTime, string patiendID);

        /// <summary>
        /// 判断数据项结果集在单元库中是否存在
        /// </summary>
        /// <param name="itemId"></param>
        /// <param name="cpatNo"></param>
        /// <returns></returns>
        bool UnitIsExist(int itemId, string cpatNo);
        /// <summary>
        /// 根据数据项ID清除数据
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        int UnitClearData(int primaryKey);
        /// <summary>
        /// 根据数据项ID列表获取数据项值字典
        /// </summary>
        /// <param name="itemIdList"></param>
        /// <returns></returns>
        Dictionary<int, List<UN_SD_ITEM_VALUE>> GetItemValueList(List<int> itemIdList, string cpatNo);
        /// <summary>
        /// 获取患者ID、数据项代码、数据项结果值组成的字典
        /// </summary>
        /// <param name="itemValueList"></param>
        /// <returns></returns>
        Dictionary<string, Dictionary<int, string>> GetPatientIdByItemValue(Dictionary<int, List<UN_SD_ITEM_VALUE>> itemValueList);
        /// <summary>
        /// 锁定
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        Tuple<bool, string> LockData(int primaryKey);
        /// <summary>
        /// 单元库新增
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        PDP_SD_ITEM_VALUE UnitInsert(PDP_SD_ITEM_VALUE model);
        ItemValueViewModel CreatModel(int id, string sdCpatNo, int sdFilterId, string value,string patientId);
    }
}
