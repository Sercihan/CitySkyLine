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
    public class BlogManager : IBlogService
    {
        private readonly IBlogDal _blogDal;
        public BlogManager(IBlogDal blogDal)
        {
            _blogDal = blogDal;
        }
        public void Create(Blog entity)
        {
            _blogDal.Create(entity);
        }

        public void Delete(Blog entity)
        {
            _blogDal.Delete(entity);
        }

        public virtual List<Blog> GetAll(Expression<Func<Blog, bool>> filter = null)
        {
            return _blogDal.GetAll(filter);
        }

        public Blog GetById(int id)
        {
            return _blogDal.GetById(id);
        }

        public Blog GetOne(Expression<Func<Blog, bool>> filter = null)
        {
            return _blogDal.GetOne(filter);
        }

        public void Update(Blog entity)
        {
            _blogDal.Update(entity);
        }

        public List<Blog> Last6Blog()
        {
            return _blogDal.Last6Blog();
        }
    }
}
