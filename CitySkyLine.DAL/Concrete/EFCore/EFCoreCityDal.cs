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
    public class EFCoreCityDal : EFCoreGenericRepository<City, DataContext> , ICityDal
    {
        public List<District> GetDistrictsById(int id)
        {
            using (var context = new DataContext())
            {
                return context.Districts.Where(i => i.CityId == id).ToList();
            }
        }
        public List<City> GetAll(Expression<Func<City, bool>> filter = null)
        {
            using (var context = new DataContext())
            {
                return context.Cities.Include(i => i.Districts).ToList();
            }
        }

        public City GetById(int id)
        {
            using (var context = new DataContext())
            {
                return context.Cities.Where(i => i.CountryId == id).FirstOrDefault();
            }
        }

        public List<City> GetCitiesById(int id)
        {
            using (var context = new DataContext())
            {
                return context.Cities.Where(i => i.CountryId == id).ToList();
            }
        }
    }
}
