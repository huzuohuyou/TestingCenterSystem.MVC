using Elight.Infrastructure;
using System;
using System.Data.Entity;
using System.Linq;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Models.Unit;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;

namespace TestingCenterSystem.Service.DataItem
{
    class UnitItemValue : UnitBaseService<UN_SD_ITEM_VALUE>
    {
        private readonly IProjectService _projectService = new ProjectService();

        #region 新增数据
        /// <summary>
        /// 新增数据
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public new UN_SD_ITEM_VALUE Insert(UN_SD_ITEM_VALUE model)
        {
            model.SD_ID = _projectService.GetCurrentSD().SD_ID;
            model.SD_CODE = _projectService.GetCurrentSD().SD_CODE;
            model.UPD_USER_ID = OperatorProvider.Instance.Current.RealName;
            model.UPD_DATE = DateTime.Now;
            base.Insert(model);
            return model;
            //using (var db = _projectService.GetCurrentUnitDbContext())
            //{
            //    db.SD_ITEM_VALUE.Add(new UN_SD_ITEM_VALUE()
            //    {
            //        SD_CPAT_NO = model.SD_CPAT_NO,
            //        SD_FILTER_ID = model.SD_FILTER_ID,
            //        SD_ITEM_ID = model.SD_ITEM_ID,
            //        ITEM_VALUE = model.ITEM_VALUE,
            //        SD_ID = _projectService.GetCurrentSD().SD_ID,
            //        SD_CODE = _projectService.GetCurrentSD().SD_CODE,
            //        UPD_USER_ID = OperatorProvider.Instance.Current.RealName,
            //        UPD_DATE = DateTime.Now,
            //    });
            //    db.SaveChanges();
            //    return model;
            //}
        }
        #endregion

        #region 修改数据
        ///// <summary>
        ///// 修改数据
        ///// </summary>
        ///// <param name="model"></param>
        ///// <returns></returns>
        //public new int Update(UN_SD_ITEM_VALUE model)
        //{
        //    var result = 0;
        //    using (var db = _projectService.GetCurrentUnitDbContext())
        //    {
        //        //model.UPD_USER_ID = OperatorProvider.Instance.Current.RealName;
        //        //model.UPD_DATE = DateTime.Now;
        //        //model.SD_ID = _projectService.GetCurrentSD().SD_ID;
        //        //model.SD_CODE = _projectService.GetCurrentSD().SD_CODE;
        //        var lastValue = db.SD_ITEM_VALUE.Where(item => item.SD_ITEM_ID == model.SD_ITEM_ID && item.SD_CPAT_NO == model.SD_CPAT_NO).Select(v => v.ITEM_VALUE).FirstOrDefault();
        //        model.LAST_VALUE = lastValue;
        //        db.Entry<UN_SD_ITEM_VALUE>(model).State = EntityState.Modified;
        //        result = db.SaveChanges();
        //    }
        //    return result;
        //}
        #endregion

    }
}
