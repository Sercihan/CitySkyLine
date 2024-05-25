using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.TestimonialDTO;
using CitySkyLine.DAL.Concrete.EFCore;
using CitySkyLine.Entity;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeTestimonialViewComponentPartial : ViewComponent
    {
        private readonly ITestimonialService _TestimonialService;
        private readonly IMapper _mapper;

        public _HomeTestimonialViewComponentPartial(ITestimonialService testimonialService, IMapper mapper)
        {
            _TestimonialService = testimonialService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            var testimonial = _TestimonialService.GetAll();
            var model = _mapper.Map<List<ResultTestimonialDTO>>(testimonial);
            return View(model);
        }
    }
}
