using CitySkyLine.DAL.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Concrete.EFCore
{
    public class EFCoreStatisticDal : IStatisticDal
    {
        public int BlogCount()
        {
            using (var context = new DataContext())
            {
                return context.Blogs.Count();
            }
        }

        public int CategoryCount()
        {
            using (var context = new DataContext())
            {
                return context.Categories.Count();
            }
        }

        public int CommentCount()
        {
            using (var context = new DataContext())
            {
                return context.Comments.Count();
            }
        }

        public string NewestBlog()
        {
            using (var context = new DataContext())
            {
                return context.Blogs.OrderByDescending(i => i.DateTime).Select(i => i.Title).FirstOrDefault();
            }
        }

        public string NewestCategory()
        {
            using (var context = new DataContext())
            {
                return context.Categories.OrderByDescending(i => i.Id).Select(i => i.Title).FirstOrDefault();
            }
        }

        public string NewestComment()
        {
            using (var context = new DataContext())
            {
                return context.Comments.OrderByDescending(i => i.DateTime).Select(i => i.Description).FirstOrDefault();
            }
        }

        public string NewestProject()
        {
            using (var context = new DataContext())
            {
                return context.Projects.OrderByDescending(i => i.Id).Select(i => i.Title).FirstOrDefault();
            }
        }

        public string NewestService()
        {
            using (var context = new DataContext())
            {
                return context.Services.OrderByDescending(i => i.Id).Select(i => i.Title).FirstOrDefault();
            }
        }

        public string NewestTeam()
        {
            using (var context = new DataContext())
            {
                return context.Teams.OrderByDescending(i => i.Id).Select(i => i.Name).FirstOrDefault();
            }
        }

        public int ProjectCount()
        {
            using (var context = new DataContext())
            {
                return context.Projects.Count();
            }
        }

        public int ServiceCount()
        {
            using (var context = new DataContext())
            {
                return context.Services.Count();
            }
        }

        public int TeamCount()
        {
            using (var context = new DataContext())
            {
                return context.Teams.Count();
            }
        }
    }
}
