using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.BlogDetailDTO;
using CitySkyLine.BLL.DTOs.ServiceDTO;
using CitySkyLine.DAL.Concrete.EFCore;
using CitySkyLine.Entity;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeBlogDetailViewComponentPartial : ViewComponent
    {
        private readonly IBlogDetailService _BlogDetailService;
        private readonly IMapper _mapper;

        public _HomeBlogDetailViewComponentPartial(IBlogDetailService blogDetailService, IMapper mapper)
        {
            _BlogDetailService = blogDetailService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            var blogDetail = _BlogDetailService.GetBlogDetailsById(1);
            var model = _mapper.Map<ResultBlogDetailDTO>(blogDetail);
            return View(model);
        }
    }
}
