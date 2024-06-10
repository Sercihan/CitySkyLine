using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.CommentDTO;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeBlogDetailCommentFormViewComponentPartial : ViewComponent
    {
        private readonly ICommentService _commentService;
        private readonly IMapper _mapper;

        public _HomeBlogDetailCommentFormViewComponentPartial(ICommentService commentService, IMapper mapper)
        {
            _commentService = commentService;
            _mapper = mapper;
        }
        public IViewComponentResult Invoke(int blogId)
        {
            var comment = new ResultCommentDTO
            {
                BlogId = blogId,
                
            };
            return View(comment);
        }
    }
}
