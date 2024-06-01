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
    public class EFCoreCommentDal : EFCoreGenericRepository<Comment, DataContext> , ICommentDal
    {
        public override List<Comment> GetAll(Expression<Func<Comment, bool>> filter = null)
        {
            using (var context = new DataContext())
            {
                var comments = context.Comments.Include(i => i.Blog).AsQueryable();

                return filter != null
                    ? comments.Where(filter).ToList()
                    : comments.ToList();
            }
        }

        public List<Comment> GetBlogCommentsById(int id)
        {
            using (var context = new DataContext())
            {
                return context.Comments.Include(i => i.Blog).Where(i => i.BlogId == id).ToList();
            }
        }
    }
}
