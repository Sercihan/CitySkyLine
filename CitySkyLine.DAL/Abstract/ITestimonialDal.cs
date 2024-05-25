using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Abstract
{
    public interface ITestimonialDal : IRepository<Testimonial>
    {
        List<Testimonial> GetAll(Expression<Func<Testimonial, bool>> filter);
    }
}
