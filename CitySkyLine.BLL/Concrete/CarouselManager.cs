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
    public class CarouselManager : ICarouselService
    {
        private readonly ICarouselDal _carouselDal;

        public CarouselManager(ICarouselDal carouselDal)
        {
            _carouselDal = carouselDal;
        }

        public void Create(Carousel entity)
        {
            _carouselDal.Create(entity);
        }

        public void Delete(Carousel entity)
        {
            _carouselDal.Delete(entity);
        }

        public virtual List<Carousel> GetAll(Expression<Func<Carousel, bool>> filter = null)
        {
            return _carouselDal.GetAll(filter);
        }

        public Carousel GetById(int id)
        {
            return _carouselDal.GetById(id);
        }

        public Carousel GetOne(Expression<Func<Carousel, bool>> filter = null)
        {
            return _carouselDal.GetOne(filter);
        }

        public void Update(Carousel entity)
        {
            _carouselDal.Update(entity);
        }
    }
}
