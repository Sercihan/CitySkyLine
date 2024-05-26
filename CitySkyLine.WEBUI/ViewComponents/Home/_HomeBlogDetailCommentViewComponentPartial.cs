using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.CommentDTO;
using CitySkyLine.BLL.DTOs.RecentPostDTO;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeBlogDetailCommentViewComponentPartial : ViewComponent
    {
        private readonly ICommentService _commentService;
        private readonly IMapper _mapper;

        public _HomeBlogDetailCommentViewComponentPartial(ICommentService commentService, IMapper mapper)
        {
            _commentService = commentService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            return View(_mapper.Map<List<ResultCommentDTO>>(_commentService.GetAll()));
        }
    }
}
