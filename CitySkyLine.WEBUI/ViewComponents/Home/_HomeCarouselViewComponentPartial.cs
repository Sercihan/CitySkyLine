using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.CarouselDTO;
using CitySkyLine.BLL.DTOs.ProjectDTO;
using CitySkyLine.DAL.Concrete.EFCore;
using CitySkyLine.Entity;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeCarouselViewComponentPartial : ViewComponent
    {
        private readonly ICarouselService _CarouselService;
        private readonly IMapper _mapper;

        public _HomeCarouselViewComponentPartial(ICarouselService carouselService, IMapper mapper)
        {
            _CarouselService = carouselService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            var carousel = _CarouselService.GetAll();
            var model = _mapper.Map<List<ResultCarouselDTO>>(carousel);
            return View(model);
        }
    }
}
