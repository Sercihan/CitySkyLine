using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.BlogDTO;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _Last6BlogViewComponentPartial : ViewComponent
    {
        private readonly IBlogService _blogService;
        private readonly IMapper _mapper;

        public _Last6BlogViewComponentPartial(IBlogService blogService, IMapper mapper)
        {
            _blogService = blogService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            var blogs = _blogService.Last6Blog();

            return View(_mapper.Map<List<ResultBlogDTO>>(blogs));
        }
    }
}
