using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.AboutDTO;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeAboutViewComponentPartial : ViewComponent
    {
        private readonly IAboutService _AboutService;
        private readonly IMapper _mapper;

        public _HomeAboutViewComponentPartial(IAboutService aboutService, IMapper mapper)
        {
            _AboutService = aboutService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            var about = _AboutService.GetOne();
            var model = _mapper.Map<ResultAboutDTO>(about);
            return View(model);
        }
    }
}
