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
    public class ServiceManager : IServiceService
    {
        private readonly IServiceDal _serviceDal;

        public ServiceManager(IServiceDal serviceDal)
        {
            _serviceDal = serviceDal;
        }

        public void Create(Service entity)
        {
            _serviceDal.Create(entity);
        }

        public void Delete(Service entity)
        {
            _serviceDal.Delete(entity);
        }

        public virtual List<Service> GetAll(Expression<Func<Service, bool>> filter = null)
        {
            return _serviceDal.GetAll(filter);
        }

        public Service GetById(int id)
        {
            return _serviceDal.GetById(id);
        }

        public Service GetOne(Expression<Func<Service, bool>> filter = null)
        {
            return _serviceDal.GetOne(filter);
        }

        public void Update(Service entity)
        {
            _serviceDal.Update(entity);
        }
    }
}
