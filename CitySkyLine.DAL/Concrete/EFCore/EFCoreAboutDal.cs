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
    public class EFCoreAboutDal : EFCoreGenericRepository<About, DataContext>, IAboutDal
    {
        public override About GetOne(Expression<Func<About, bool>> filter = null)
        {
            using (var context = new DataContext())
            {
                return context.Abouts.Include(i => i.Abilities).FirstOrDefault();
            }
        }
    }
}
