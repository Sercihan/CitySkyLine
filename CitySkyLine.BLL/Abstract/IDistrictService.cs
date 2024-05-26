using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.Abstract
{
    public interface IDistrictService : IRepositoryService<District>
    {
        public List<District> GetDistrictsById(int id);
    }
}
