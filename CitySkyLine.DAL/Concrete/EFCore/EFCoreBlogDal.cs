using CitySkyLine.DAL.Abstract;
using CitySkyLine.Entity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Concrete.EFCore
{
    public class EFCoreBlogDal : EFCoreGenericRepository<Blog, DataContext>, IBlogDal
    {
        public override List<Blog> GetAll(Expression<Func<Blog, bool>> filter = null)
        {
            using (var context = new DataContext())
            {
                var blogs = context.Blogs.Include(i => i.BlogDetails).AsQueryable();

                return filter != null
                    ? blogs.Where(filter).ToList()
                    : blogs.ToList();
            }
        }
    }
}
