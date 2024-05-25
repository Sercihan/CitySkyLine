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
    public class EFCoreDistrictDal : EFCoreGenericRepository<District, DataContext> , IDistrictDal
    {
        public override List<District> GetAll(Expression<Func<District, bool>> filter = null)
        {
            using (var context = new DataContext())
            {
                var districts = context.Districts;

                return filter != null
                    ? districts.Where(filter).ToList()
                    : districts.ToList();
            }
        }
    }
}
