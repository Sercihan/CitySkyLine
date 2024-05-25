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
    public class RecentPostManager : IRecentPostService
    {
        private readonly IRecentPostDal _recentPostDal;

        public RecentPostManager(IRecentPostDal recentPostDal)
        {
            _recentPostDal = recentPostDal;
        }

        public void Create(RecentPost entity)
        {
            _recentPostDal.Create(entity);
        }

        public void Delete(RecentPost entity)
        {
            _recentPostDal.Delete(entity);
        }

        public List<RecentPost> GetAll(Expression<Func<RecentPost, bool>> filter = null)
        {
            return _recentPostDal.GetAll(filter);
        }

        public RecentPost GetById(int id)
        {
            return _recentPostDal.GetById(id);
        }

        public RecentPost GetOne(Expression<Func<RecentPost, bool>> filter = null)
        {
            return _recentPostDal.GetOne(filter);
        }

        public void Update(RecentPost entity)
        {
            _recentPostDal.Update(entity);
        }
    }
}
