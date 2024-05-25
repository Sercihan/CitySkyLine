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
    public class ProjectManager : IProjectService
    {
        private readonly IProjectDal _projectDal;

        public ProjectManager(IProjectDal projectDal)
        {
            _projectDal = projectDal;
        }

        public void Create(Project entity)
        {
            _projectDal.Create(entity);
        }

        public void Delete(Project entity)
        {
            _projectDal.Delete(entity);
        }

        public virtual List<Project> GetAll(Expression<Func<Project, bool>> filter = null)
        {
            return _projectDal.GetAll(filter);
        }

        public Project GetById(int id)
        {
            return _projectDal.GetById(id);
        }

        public Project GetOne(Expression<Func<Project, bool>> filter = null)
        {
            return _projectDal.GetOne(filter);
        }

        public void Update(Project entity)
        {
            _projectDal.Update(entity);
        }
    }
}
