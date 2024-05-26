using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.DAL.Abstract
{
    public interface IMailDal
    {
        List<Mail> GetAll(Expression<Func<Mail, bool>> filter = null);
        Mail GetById(int id);
        void Create(Mail entity);
        void Update(Mail entity);
    }
}
