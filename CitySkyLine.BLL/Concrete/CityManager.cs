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
    public class CityManager : ICityService
    {
        private readonly ICityDal _cityDal;

        public CityManager(ICityDal cityDal)
        {
            _cityDal = cityDal;
        }

        public void Create(City entity)
        {
            _cityDal.Create(entity);
        }

        public void Delete(City entity)
        {
            _cityDal.Delete(entity);
        }

        public List<City> GetAll(Expression<Func<City, bool>> filter = null)
        {
            return _cityDal.GetAll(filter);
        }

        public City GetById(int id)
        {
            return _cityDal.GetById(id);
        }

        public City GetOne(Expression<Func<City, bool>> filter = null)
        {
            return _cityDal.GetOne(filter);
        }

        public void Update(City entity)
        {
            _cityDal.Update(entity);
        }

        public List<District> GetDistrictsById(int id)
        {
            return _cityDal.GetDistrictsById(id);
        }
        public List<City> GetCitiesById(int id)
        {
            return _cityDal.GetCitiesById(id);
        }
    }
}
