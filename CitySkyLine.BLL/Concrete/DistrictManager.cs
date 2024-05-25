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
    public class DistrictManager : IDistrictService
    {
        private readonly IDistrictDal _districtDal;

        public DistrictManager(IDistrictDal districtDal)
        {
            _districtDal = districtDal;
        }

        public void Create(District entity)
        {
            _districtDal.Create(entity);
        }

        public void Delete(District entity)
        {
            _districtDal.Delete(entity);
        }

        public List<District> GetAll(Expression<Func<District, bool>> filter = null)
        {
            return _districtDal.GetAll(filter);
        }

        public District GetById(int id)
        {
            return _districtDal.GetById(id);
        }

        public District GetOne(Expression<Func<District, bool>> filter = null)
        {
            return _districtDal.GetOne(filter);
        }

        public void Update(District entity)
        {
            _districtDal.Update(entity);
        }
    }
}
