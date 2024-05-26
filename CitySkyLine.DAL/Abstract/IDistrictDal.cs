using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Abstract
{
    public interface IDistrictDal : IRepository<District>
    {
        List<District> GetAll(Expression<Func<District, bool>> filter);
        public List<District> GetDistrictsById(int id);
    }
}
