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
    public class TestimonialManager : ITestimonialService
    {
        private readonly ITestimonialDal _testimonialDal;

        public TestimonialManager(ITestimonialDal testimonialDal)
        {
            _testimonialDal = testimonialDal;
        }

        public void Create(Testimonial entity)
        {
            _testimonialDal.Create(entity);
        }

        public void Delete(Testimonial entity)
        {
            _testimonialDal.Delete(entity);
        }

        public List<Testimonial> GetAll(Expression<Func<Testimonial, bool>> filter = null)
        {
            return _testimonialDal.GetAll(filter);
        }

        public Testimonial GetById(int id)
        {
            return _testimonialDal.GetById(id);
        }

        public Testimonial GetOne(Expression<Func<Testimonial, bool>> filter = null)
        {
            return _testimonialDal.GetOne(filter);
        }

        public void Update(Testimonial entity)
        {
            _testimonialDal.Update(entity);
        }

    }
}
