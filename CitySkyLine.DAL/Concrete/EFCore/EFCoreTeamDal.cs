using CitySkyLine.DAL.Abstract;
using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Concrete.EFCore
{
    public class EFCoreTeamDal : EFCoreGenericRepository<Team, DataContext> , ITeamDal
    {
        public override Team GetOne(Expression<Func<Team, bool>> filter = null)
        {
            using (var context = new DataContext())
            {
                return context.Teams.FirstOrDefault(filter);
            }
        }
    }
}
