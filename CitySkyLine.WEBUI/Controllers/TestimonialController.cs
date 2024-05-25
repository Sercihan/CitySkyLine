using AutoMapper;
using CitySkyLine.BLL;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.TestimonialDTO;
using CitySkyLine.Entity;
using CitySkyLine.WEBUI.Models;
using Humanizer;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.Controllers
{
    public class TestimonialController : Controller
    {
        private readonly ITestimonialService _testimonialService;
        private readonly IMapper _mapper;

        public TestimonialController(ITestimonialService testimonialService, IMapper mapper)
        {
            _testimonialService = testimonialService;
            _mapper = mapper;
        }
        public IActionResult Index()
        {
            var testimonials = _testimonialService.GetAll();

            var model = _mapper.Map<List<ResultTestimonialDTO>>(testimonials);

            return View(model);
        }
        public IActionResult Create()
        {
            return View(new CreateTestimonialDTO());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CreateTestimonialDTO dto, IFormFile file)
        {
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {

                var testimonial = _testimonialService.GetOne(i => i.Name == dto.Name);

                //if (testimonial != null)
                //{
                //    ErrorViewModel error = new ErrorViewModel()
                //    {
                //        Code = 101,
                //        Title = "Kayıt Hatası",
                //        Description = "Aynı isimde kayıtlı bir Testimonial vardır. Lütfen farklı isim girişi yapınız.",
                //        ReturnUrl = "/Testimonial/Index",
                //        Css = "text-warning"
                //    };
                //    return View("Error", error);
                //}
                //if (file == null)
                //{
                //    ModelState.AddModelError("", "Resim için dosya yüklenmedi.");
                //    return View(dto);
                //}

                dto.Image = await ImageMethods.UploadImage(file);
                _testimonialService.Create(_mapper.Map<Testimonial>(dto));

                return RedirectToAction("Index");
            }
            return View(dto);
        }

        public ActionResult Edit(int id)
        {
            if (id < 1)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Testimonial Bulunamadı",
                    Description = "Lütfen varolan bir testimonial seçiniz.",
                    ReturnUrl = "/Testimonial/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            var testimonial = _testimonialService.GetById(id);

            if (testimonial == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Testimonial Bulunamadı",
                    Description = "Lütfen varolan bir testimonial seçiniz.",
                    ReturnUrl = "/Testimonial/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }
            var model = _mapper.Map<UpdateTestimonialDTO>(testimonial);

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UpdateTestimonialDTO dto, IFormFile file)
        {
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {
                var testimonial = _testimonialService.GetById(dto.Id);

                if (testimonial == null)
                {
                    ErrorViewModel error = new ErrorViewModel()
                    {
                        Code = 102,
                        Title = "Testimonial Bulunamadı",
                        Description = "Lütfen varolan bir testimonial seçiniz.",
                        ReturnUrl = "/Testimonial/Index",
                        Css = "text-danger"
                    };
                    return View("Error", error);
                }

                if (file != null)
                {
                    ImageMethods.DeleteImage(testimonial.Image);
                    dto.Image = await ImageMethods.UploadImage(file);
                }

                _testimonialService.Update(_mapper.Map<Testimonial>(dto));
                return RedirectToAction("Index");
            }
            return View(dto);
        }

        public IActionResult Delete(int id)
        {
            var testimonial = _testimonialService.GetById(id);

            if (testimonial == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Testimonial Bulunamadı",
                    Description = "Lütfen varolan bir testimonial seçiniz.",
                    ReturnUrl = "/Testimonial/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            _testimonialService.Delete(testimonial);
            ImageMethods.DeleteImage(testimonial.Image);
            return RedirectToAction("Index");
        }
    }
}
