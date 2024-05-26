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
        public BlogDetail GetBlogDetailsById(int id)
        {
            using (var context = new DataContext())
            {
                return context.BlogDetails.Include(j => j.Blog).FirstOrDefault(i => i.BlogId == id);
            }
        }
    }
}
