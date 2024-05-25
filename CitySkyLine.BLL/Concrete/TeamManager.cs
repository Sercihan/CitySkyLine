using CitySkyLine.BLL.Abstract;
using CitySkyLine.DAL.Abstract;
using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.Concrete
{
    public class TeamManager : ITeamService
    {
        private readonly ITeamDal _teamDal;

        public TeamManager(ITeamDal teamDal)
        {
            _teamDal = teamDal;
        }

        public void Create(Team entity)
        {
            _teamDal.Create(entity);
        }

        public void Delete(Team entity)
        {
            _teamDal.Delete(entity);
        }

        public virtual List<Team> GetAll(Expression<Func<Team, bool>> filter = null)
        {
            return _teamDal.GetAll(filter);
        }

        public Team GetById(int id)
        {
            return _teamDal.GetById(id);
        }

        public Team GetOne(Expression<Func<Team, bool>> filter = null)
        {
            return _teamDal.GetOne(filter);
        }

        public void Update(Team entity)
        {
            _teamDal.Update(entity);
        }
    }
}
