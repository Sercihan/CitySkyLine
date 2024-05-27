using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Abstract
{
    public interface IStatisticDal
    {
        int ProjectCount();
        string NewestProject();
        int ServiceCount();
        string NewestService();
        int TeamCount();
        string NewestTeam();
        int BlogCount();
        string NewestBlog();
        int CommentCount();
        string NewestComment();
        int CategoryCount();
        string NewestCategory();
    }
}
