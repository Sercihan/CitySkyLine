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
    public class EFCoreBlogDetailDal : EFCoreGenericRepository<BlogDetail, DataContext>, IBlogDetailDal
    {
        public override List<BlogDetail> GetAll(Expression<Func<BlogDetail, bool>> filter = null)
        {
            using (var context = new DataContext())
            {
                var blogDetails = context.BlogDetails.Include(i => i.Blog).AsQueryable();

                return filter != null
                    ? blogDetails.Where(filter).ToList()
                    : blogDetails.ToList();
            }
        }

        public BlogDetail GetBlogDetailsById(int id)
        {
            using (var context = new DataContext())
            {
                return context.BlogDetails.Where(i => i.BlogId == id).FirstOrDefault();
            }
        }
    }
}
