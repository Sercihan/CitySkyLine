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
    public class EFCoreCountryDal : EFCoreGenericRepository<Country, DataContext> , ICountryDal
    {
        public List<City> GetCityById(int id)
        {
            using (var context = new DataContext())
            {
                return context.Cities.Where(i => i.CountryId == id).ToList();
            }
        }
        public List<Country> GetAll(Expression<Func<Country, bool>> filter = null)
        {
            using (var context = new DataContext())
            {
                return context.Countries.Include(i => i.Cities).ToList();
            }
        }
    }
}
