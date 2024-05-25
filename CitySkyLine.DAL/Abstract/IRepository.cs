using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Abstract
{
    public interface IRepository<T> where T:class
    {
        List<T> GetAll(Expression<Func<T, bool>> filter);
        T GetById(int id);
        T GetOne(Expression<Func<T, bool>> filter);

        void Create(T entity);
        void Update(T entity);
        void Delete(T entity);
    }
}
