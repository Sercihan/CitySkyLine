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
    public class EFCoreRecentPostDal : EFCoreGenericRepository<RecentPost, DataContext>, IRecentPostDal
    {
        public override List<RecentPost> GetAll(Expression<Func<RecentPost, bool>> filter = null)
        {
            using (var context = new DataContext())
            {
                var recentPosts = context.RecentPosts.Include(i => i.Blog).AsQueryable();

                return filter != null
                    ? recentPosts.Where(filter).ToList()
                    : recentPosts.ToList();
            }
        }
    }
}
