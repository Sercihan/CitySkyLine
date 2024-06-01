using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.BlogDTO;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeBlogDetailViewComponentPartial : ViewComponent
    {
        private readonly IBlogService _blogService;
        private readonly IMapper _mapper;

        public _HomeBlogDetailViewComponentPartial(IBlogService blogService, IMapper mapper)
        {
            _blogService = blogService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke(int id)
        {
            var blog = _blogService.GetById(id);
            var model = _mapper.Map<ResultBlogDTO>(blog);
            return View(model);
        }
    }
}
