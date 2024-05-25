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
    public class AbilityManager : IAbilityService
    {
        private readonly IAbilityDal _abilityDal;

        public AbilityManager(IAbilityDal abilityDal)
        {
            _abilityDal = abilityDal;
        }
        public void Create(Ability entity)
        {
            _abilityDal.Create(entity);
        }

        public void Delete(Ability entity)
        {
            _abilityDal.Delete(entity);
        }

        public List<Ability> GetAll(Expression<Func<Ability, bool>> filter = null)
        {
            return _abilityDal.GetAll(filter);
        }

        public Ability GetById(int id)
        {
            return _abilityDal.GetById(id);
        }

        public Ability GetOne(Expression<Func<Ability, bool>> filter = null)
        {
            return _abilityDal.GetOne(filter);
        }

        public void Update(Ability entity)
        {
            _abilityDal.Update(entity);
        }
    }
}
