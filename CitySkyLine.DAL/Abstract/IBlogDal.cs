using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Abstract
{
    public interface IBlogDal : IRepository<Blog>
    {
        List<Blog> GetAll(Expression<Func<Blog, bool>> filter);
        List<Blog> Last6Blog();
        List<Blog> GetBlogByCategoryId(int id);
    }
}
