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
    public class EFCoreTestimonialDal : EFCoreGenericRepository<Testimonial, DataContext> , ITestimonialDal
    {
        public override Testimonial GetOne(Expression<Func<Testimonial, bool>> filter = null)
        {
            using (var context = new DataContext())
            {
                return context.Testimonials.FirstOrDefault(filter);
            }
        }
    }
}
