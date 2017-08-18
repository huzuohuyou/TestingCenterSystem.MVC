using System.Collections.Generic;
using System.Linq;
using TestingCenter.Models;
using System.Data.Entity;
using TestingCenterSystem.ViewModels;
using System;
using System.Linq.Expressions;
using TestingCenterSystem.Service.comm.Interface;
using TestingCenterSystem.Service.InGroup;
using TestingCenterSystem.Models;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using Elight.Infrastructure;
using System.Text;
using System.Reflection;

namespace TestingCenterSystem.Service
{

    /// <summary>
    /// 数据访问层父类。
    /// </summary>
    public partial class BaseService<TEntity> : IBaseService<TEntity> where TEntity : class
    {

        private DbContext _db = null;
        public string RealName { get { return OperatorProvider.Instance.Current.RealName; } }
        public DateTime Now { get { return DateTime.Now; } }
        public DbContext Db
        {
            get
            {
                if (_db == null)
                {
                    _db = new PDPContext();
                }
                return _db;
            }
            set
            {
                _db = value;
            }
        }
        public BaseService()
        {
            Db = new PDPContext();
        }
        //public BaseService(DbContext value)
        //{
        //    Db = value;
        //}

        public bool Exists(Expression<Func<TEntity, bool>> where)
        {
            return Get(where) != null;
        }

        public TEntity Get(Expression<Func<TEntity, bool>> where)
        {
            return Db.Set<TEntity>().Where(where).AsNoTracking().FirstOrDefault();
        }

        /// <summary>
        /// 实体查询
        /// </summary>
        public List<TEntity> GetSearchList(Expression<Func<TEntity, bool>> where)
        {
            return Db.Set<TEntity>().Where(where).ToList();
        }

        /// <summary>
        /// 应保证所有的实体都有UPD_USER_ID & UPD_DATE字段
        /// 否则报错
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public TEntity Insert(TEntity model)
        {
            dynamic temp = (dynamic)model;
            try
            {
                temp.UPD_USER_ID = RealName;
                temp.UPD_DATE = Now;
            }
            catch (Exception)
            {
            }
            Db.Entry<TEntity>(temp).State = EntityState.Added;
            Db.SaveChanges();
            return model;
        }

        /// <summary>
        /// 单个实体删除，字段内容需完全匹配
        ///【过时】
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [Obsolete]
        public int Delete(TEntity model)
        {
            Db.Entry<TEntity>(model).State = EntityState.Deleted;
            return Db.SaveChanges();
        }

        /// <summary>
        /// 支持批量删除
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public int Delete(Expression<Func<TEntity, bool>> where)
        {
            foreach (var item in Db.Set<TEntity>().Where(where))
            {
                Db.Set<TEntity>().Attach(item);
                Db.Set<TEntity>().Remove(item);
            }
            return Db.SaveChanges();
        }

        /// <summary>
        /// 应保证所有的实体都有UPD_USER_ID & UPD_DATE字段
        /// 否则报错
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Update(TEntity model)
        {
            dynamic temp = (dynamic)model;
            try
            {
                temp.UPD_USER_ID = RealName;
                temp.UPD_DATE = Now;
            }
            catch (Exception)
            {
            }
            Db.Entry<TEntity>(temp).State = EntityState.Modified;
            return Db.SaveChanges();
        }

        public List<TEntity> GetManay(Expression<Func<TEntity, bool>> where)
        {
            return Db.Set<TEntity>().Where(where).AsNoTracking().ToList();
        }

        public string ToIdentitySql(Expression<Func<TEntity, bool>> where)
        {
            StringBuilder strBuilder = new StringBuilder();
            var entities = Db.Set<TEntity>().Where(where).AsNoTracking().ToList();
            if (entities.Count>0)
            {
                strBuilder.Append($"DELETE FROM {typeof(TEntity).Name};\n");
                strBuilder.Append($"SET IDENTITY_INSERT {typeof(TEntity).Name} ON;\n");
                entities.ForEach(entity => strBuilder.Append(ToSQL(entity)));
                strBuilder.Append($"SET IDENTITY_INSERT {typeof(TEntity).Name} OFF;\n");
            }
            return strBuilder.ToString();
        }

        public Page<TEntity> GetPage(Expression<Func<TEntity, int?>> order, Expression<Func<TEntity, bool>> where, int pageIndex, int pageSize)
        {
            var tlist = Db.Set<TEntity>()
                .AsNoTracking()
                .OrderBy(order)
                .Where(where).ToList();
            var klist = tlist
                .Skip(((pageIndex - 1) < 0 ? 0 : (pageIndex - 1)) * pageSize)
                .Take(pageSize)
                .ToList();
            var result = new Page<TEntity>
            {
                CurrentPage = pageIndex,
                ItemsPerPage = pageSize,
                TotalItems = tlist.Count,
                Items = klist
            };
            return result;
        }

        public string ToSQL(TEntity model)
        {
            string sql = "INSERT {0} ({1}) VALUES ({2});\n";
            StringBuilder fields = new StringBuilder();
            StringBuilder values = new StringBuilder();
            Type type = model.GetType();
            if (type.GetProperties() != null && type.GetProperties().Length > 0)
            {
                foreach (var propertie in type.GetProperties())
                {
                    if (!string.IsNullOrEmpty(propertie.Name))
                    {
                        fields.Append(propertie.Name).Append(",");
                        var trueValue = model.GetType().GetProperty(propertie.Name).GetValue(model, null);
                        var fixValue = trueValue != null ? string.Format(FixValue(propertie), trueValue) : "NULL";
                        values.Append(fixValue).Append(",");
                    }
                }
                return string.Format(sql, typeof(TEntity).Name, fields.ToString().Trim(','), values.ToString().Trim(','));
            }
            return "";
        }
        public string FixValue(PropertyInfo pi)
        {
            var typestr = pi.PropertyType.ToString();
            if (typestr.Contains("Int32"))
            {
                return "{0}";
            }
            else if (typestr.Contains("String"))
            {
                return "N'{0}'";
            }
            else if (typestr.Contains("DateTime"))
            {
                return " CAST(N'{0}' AS DateTime)";
            }
            else
            {
                return "N'{0}'";
            }

        }

        public Tuple<List<TEntity>, int> GetPageList(Expression<Func<TEntity, int?>> order, Expression<Func<TEntity, bool>> where, int pageIndex, int pageSize)
        {
            var tlist = Db.Set<TEntity>()
               .AsNoTracking()
               .OrderBy(order)
               .Where(where).ToList();
            var klist = tlist
                .Skip(((pageIndex - 1) < 0 ? 0 : (pageIndex - 1)) * pageSize)
                .Take(pageSize)
                .ToList();
            return new Tuple<List<TEntity>, int>(klist,tlist.Count);
        }

        public int Count(Expression<Func<TEntity, bool>> where)
        {
            return Db.Set<TEntity>().Where(where).AsNoTracking().Count();
        }
    }
}
