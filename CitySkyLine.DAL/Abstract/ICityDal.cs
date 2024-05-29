using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Abstract
{
    public interface ICityDal : IRepository<City>
    {
        List<District> GetDistrictsById(int id);
        List<City> GetCitiesById(int id);
        List<City> GetByCountryId(int id);
    }
}
