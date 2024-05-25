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
    public class CommentManager : ICommentService
    {
        private readonly ICommentDal _commentDal;

        public CommentManager(ICommentDal commentDal)
        {
            _commentDal = commentDal;
        }

        public void Create(Comment entity)
        {
            _commentDal.Create(entity);
        }

        public void Delete(Comment entity)
        {
            _commentDal.Delete(entity);
        }

        public List<Comment> GetAll(Expression<Func<Comment, bool>> filter = null)
        {
            return _commentDal.GetAll(filter);
        }

        public Comment GetById(int id)
        {
            return _commentDal.GetById(id);
        }

        public Comment GetOne(Expression<Func<Comment, bool>> filter = null)
        {
            return _commentDal.GetOne(filter);
        }

        public void Update(Comment entity)
        {
            _commentDal.Update(entity);
        }
    }
}
