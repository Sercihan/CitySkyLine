using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Abstract
{
    public interface ITeamDal : IRepository<Team>
    {
        List<Team> GetAll(Expression<Func<Team, bool>> filter);
    }
}
