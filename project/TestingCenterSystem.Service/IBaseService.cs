using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.ViewModels;

namespace TestingCenterSystem.Service
{
    /// <summary>
    /// 数据访问层父接口。
    /// </summary>
    /// <typeparam name="TEntity"></typeparam>
    public partial interface IBaseService<TEntity> where TEntity : class
    {
        
        /// <summary>
        /// 记录是否存在。
        /// </summary>
        /// <param name="primaryKey">主键</param>
        /// <returns></returns>
        bool Exists(Expression<Func<TEntity, bool>> where);
        /// <summary>
        /// 查询一条记录。
        /// </summary>
        /// <param name="primaryKey">主键</param>
        /// <returns></returns>
        TEntity Get(Expression<Func<TEntity, bool>> where);

        /// <summary>
        /// 查询一条记录。
        /// </summary>
        /// <param name="primaryKey">主键</param>
        /// <returns></returns>
        List<TEntity> GetManay(Expression<Func<TEntity, bool>> where);

        /// <summary>
        /// 新增一条记录。
        /// </summary>
        /// <param name="model">新增对象</param>
        /// <returns></returns>
        TEntity Insert(TEntity model);
        
        /// 删除一条记录。
        /// </summary>
        /// <param name="model">删除对象</param>
        /// <returns></returns>
        [Obsolete]
        int Delete(TEntity model);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        int Delete(Expression<Func<TEntity, bool>> where);
        /// <summary>
        /// 更新一条记录。
        /// </summary>
        /// <param name="model">修改对象</param>
        /// <returns></returns>
        int Update(TEntity model);

        List<TEntity> GetSearchList(Expression<Func<TEntity, bool>> where);

        /// <summary>
        /// 导出带有自增主键处理的sql语句
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        string ToIdentitySql(Expression<Func<TEntity, bool>> where);

        /// <summary>
        /// 导出sql语句
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        string ToSQL(TEntity model);

        Page<TEntity> GetPage(Expression<Func<TEntity, int?>> order, Expression<Func<TEntity, bool>> where, int pageIndex, int pageSize);

        Tuple< List<TEntity>,int> GetPageList(Expression<Func<TEntity, int?>> order, Expression<Func<TEntity, bool>> where, int pageIndex, int pageSize);

        /// <summary>
        /// 返回个数
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        int Count(Expression<Func<TEntity, bool>> where);
    }
}
