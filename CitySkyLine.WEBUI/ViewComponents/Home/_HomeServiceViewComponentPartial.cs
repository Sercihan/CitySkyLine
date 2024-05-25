using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.ServiceDTO;
using CitySkyLine.DAL.Concrete.EFCore;
using CitySkyLine.Entity;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeServiceViewComponentPartial : ViewComponent
    {
        private readonly IServiceService _ServiceService;
        private readonly IMapper _mapper;

        public _HomeServiceViewComponentPartial(IServiceService serviceService, IMapper mapper)
        {
            _ServiceService = serviceService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            var service = _ServiceService.GetAll();
            var model = _mapper.Map<List<ResultServiceDTO>>(service);
            return View(model);
        }
    }
}
