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
    public class EFCoreProjectDal : EFCoreGenericRepository<Project, DataContext> , IProjectDal
    {
        public override List<Project> GetAll(Expression<Func<Project, bool>> filter =null)
        {
            using (var context = new DataContext())
            {
                var projects = context.Projects.Include(i => i.District).ThenInclude(i=> i.City).ThenInclude(k => k.Country).AsQueryable();

                return filter != null
                    ? projects.Where(filter).ToList()
                    : projects.ToList();
            }
        }
    }
}
