using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.Abstract
{
    public interface ICityService : IRepositoryService<City>
    {
        List<District> GetDistrictsById(int id);
        List<City> GetCitiesById(int id);

        List<City> GetByCountryId(int id);
    }
}
