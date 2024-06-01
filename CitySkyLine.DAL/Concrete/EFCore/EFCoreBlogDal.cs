using CitySkyLine.DAL.Abstract;
using CitySkyLine.Entity;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;


namespace CitySkyLine.DAL.Concrete.EFCore
{
    public class EFCoreBlogDal : EFCoreGenericRepository<Blog, DataContext>, IBlogDal
    {
        public override List<Blog> GetAll(Expression<Func<Blog, bool>> filter = null)
        {
            using (var context = new DataContext())
            {
                var blogs = context.Blogs.AsQueryable();

                return filter != null
                    ? blogs.Where(filter).ToList()
                    : blogs.ToList();
            }
        }

        public List<Blog> GetBlogByCategoryId(int id)
        {
            using (var context = new DataContext())
            {
                return context.Blogs.Include(i => i.Category).Where(i => i.CategoryId == id).ToList();
            }
        }

        public List<Blog> Last6Blog()
        {
            using (var context = new DataContext())
            {
                return context.Blogs.OrderByDescending(i => i.DateTime).Take(6).ToList();
            }
        }
    }
}
