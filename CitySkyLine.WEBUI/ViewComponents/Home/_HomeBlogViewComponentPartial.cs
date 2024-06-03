using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.BlogDTO;
using CitySkyLine.BLL.DTOs.CarouselDTO;
using CitySkyLine.DAL.Concrete.EFCore;
using CitySkyLine.Entity;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeBlogViewComponentPartial : ViewComponent
    {
        private readonly IBlogService _blogService;
        private readonly IMapper _mapper;

        public _HomeBlogViewComponentPartial(IBlogService blogService, IMapper mapper)
        {
            _blogService = blogService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            var blog = _blogService.GetAll();
            var model = _mapper.Map<List<ResultBlogDTO>>(blog);
            return View(model);
        }
    }
}
