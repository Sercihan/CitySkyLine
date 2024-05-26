using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.TestimonialDTO;
using CitySkyLine.BLL;
using CitySkyLine.Entity;
using CitySkyLine.WEBUI.Models;
using Microsoft.AspNetCore.Mvc;
using CitySkyLine.BLL.DTOs.CarouselDTO;

namespace CitySkyLine.WEBUI.Controllers
{
    public class CarouselController : Controller
    {
        private readonly ICarouselService _carouselService;
        private readonly IMapper _mapper;

        public CarouselController(ICarouselService carouselService, IMapper mapper)
        {
            _carouselService = carouselService;
            _mapper = mapper;
        }
        public IActionResult Index()
        {
            var carousels = _carouselService.GetAll();

            var model = _mapper.Map<List<ResultCarouselDTO>>(carousels);

            return View(model);
        }
        public IActionResult Create()
        {
            return View(new CreateCarouselDTO());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CreateCarouselDTO dto, IFormFile file)
        {
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {

                var carousel = _carouselService.GetOne(i => i.Title == dto.Title);

                if (carousel != null)
                {
                    ErrorViewModel error = new ErrorViewModel()
                    {
                        Code = 101,
                        Title = "Kayıt Hatası",
                        Description = "Aynı isimde kayıtlı bir Carousel vardır. Lütfen farklı isim girişi yapınız.",
                        ReturnUrl = "/Carousel/Index",
                        Css = "text-warning"
                    };
                    return View("Error", error);
                }
                if (file == null)
                {
                    ModelState.AddModelError("", "Resim için dosya yüklenmedi.");
                    return View(dto);
                }

                dto.Image = await ImageMethods.UploadImage(file);
                _carouselService.Create(_mapper.Map<Carousel>(dto));

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
                    Title = "Carousel Bulunamadı",
                    Description = "Lütfen varolan bir carousel seçiniz.",
                    ReturnUrl = "/Carousel/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            var carousel = _carouselService.GetById(id);

            if (carousel == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Carousel Bulunamadı",
                    Description = "Lütfen varolan bir carousel seçiniz.",
                    ReturnUrl = "/Carousel/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }
            var model = _mapper.Map<UpdateCarouselDTO>(carousel);

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UpdateCarouselDTO dto, IFormFile file)
        {
            ModelState.Remove("file");
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {
                var carousel = _carouselService.GetById(dto.Id);

                if (carousel == null)
                {
                    ErrorViewModel error = new ErrorViewModel()
                    {
                        Code = 102,
                        Title = "Carousel Bulunamadı",
                        Description = "Lütfen varolan bir carousel seçiniz.",
                        ReturnUrl = "/Carousel/Index",
                        Css = "text-danger"
                    };
                    return View("Error", error);
                }

                if (file != null)
                {
                    ImageMethods.DeleteImage(carousel.Image);
                    dto.Image = await ImageMethods.UploadImage(file);
                }

                _carouselService.Update(_mapper.Map<Carousel>(dto));
                return RedirectToAction("Index");
            }
            return View(dto);
        }

        public IActionResult Delete(int id)
        {
            var carousel = _carouselService.GetById(id);

            if (carousel == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Carousel Bulunamadı",
                    Description = "Lütfen varolan bir carousel seçiniz.",
                    ReturnUrl = "/Carousel/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            _carouselService.Delete(carousel);
            ImageMethods.DeleteImage(carousel.Image);
            return RedirectToAction("Index");
        }
    }
}
