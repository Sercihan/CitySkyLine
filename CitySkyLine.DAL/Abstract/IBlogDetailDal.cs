using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Abstract
{
    public interface IBlogDetailDal : IRepository<BlogDetail>
    {
        List<BlogDetail> GetAll(Expression<Func<BlogDetail, bool>> filter);
        BlogDetail GetBlogDetailsById(int id);
    }
}
