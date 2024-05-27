using CitySkyLine.BLL.Abstract;
using CitySkyLine.DAL.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.Concrete
{
    public class StatisticManager : IStatisticService
    {
        private readonly IStatisticDal _statisticDal;

        public StatisticManager(IStatisticDal statisticDal)
        {
            _statisticDal = statisticDal;
        }

        public int BlogCount()
        {
            return _statisticDal.BlogCount();
        }

        public int CategoryCount()
        {
            return _statisticDal.CategoryCount();
        }

        public int CommentCount()
        {
            return _statisticDal.CommentCount();
        }

        public string NewestBlog()
        {
            return _statisticDal.NewestBlog();
        }

        public string NewestCategory()
        {
            return _statisticDal.NewestCategory();
        }

        public string NewestComment()
        {
            return _statisticDal.NewestComment();
        }

        public string NewestProject()
        {
            return _statisticDal.NewestProject();
        }

        public string NewestService()
        {
            return _statisticDal.NewestService();
        }

        public string NewestTeam()
        {
            return _statisticDal.NewestTeam();
        }

        public int ProjectCount()
        {
            return _statisticDal.ProjectCount();
        }

        public int ServiceCount()
        {
            return _statisticDal.ServiceCount();
        }

        public int TeamCount()
        {
            return _statisticDal.TeamCount();
        }
    }
}
