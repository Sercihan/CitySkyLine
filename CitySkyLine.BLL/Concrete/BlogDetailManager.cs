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
    public class BlogDetailManager : IBlogDetailService
    {
        private readonly IBlogDetailDal _blogDetail;
        public BlogDetailManager(IBlogDetailDal blogDetailDal)
        {
            _blogDetail = blogDetailDal;
        }
        public void Create(BlogDetail entity)
        {
            _blogDetail.Create(entity);
        }

        public void Delete(BlogDetail entity)
        {
            _blogDetail.Delete(entity);
        }

        public virtual List<BlogDetail> GetAll(Expression<Func<BlogDetail, bool>> filter = null)
        {
            return _blogDetail.GetAll(filter);
        }

        public BlogDetail GetById(int id)
        {
            return _blogDetail.GetById(id);
        }

        public void Update(BlogDetail entity)
        {
            _blogDetail.Update(entity);
        }

        public BlogDetail GetBlogDetailsById(int id)
        {
            return _blogDetail.GetBlogDetailsById(id);
        }

        public BlogDetail GetOne(Expression<Func<BlogDetail, bool>> filter = null)
        {
            return _blogDetail.GetOne(filter);
        }
    }
}
