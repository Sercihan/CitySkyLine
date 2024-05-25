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
    public class AboutManager : IAboutService
    {
        private readonly IAboutDal _aboutDal;
        public AboutManager(IAboutDal aboutDal)
        {
            _aboutDal = aboutDal;
        }
        public void Create(About entity)
        {
            _aboutDal.Create(entity);
        }

        public void Delete(About entity)
        {
            _aboutDal.Delete(entity);
        }

        public List<About> GetAll(Expression<Func<About, bool>> filter = null)
        {
            return _aboutDal.GetAll(filter);
        }

        public About GetById(int id)
        {
            return _aboutDal.GetById(id);
        }

        public void Update(About entity)
        {
            _aboutDal.Update(entity);
        }

        public About GetOne(Expression<Func<About, bool>> filter = null)
        {
            return _aboutDal.GetOne(filter);
        }
    }
}
