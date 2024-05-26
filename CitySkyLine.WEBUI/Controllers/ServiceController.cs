using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL;
using CitySkyLine.Entity;
using CitySkyLine.WEBUI.Models;
using Microsoft.AspNetCore.Mvc;
using CitySkyLine.BLL.DTOs.ServiceDTO;

namespace CitySkyLine.WEBUI.Controllers
{
    public class ServiceController : Controller
    {
        private readonly IServiceService _serviceService;
        private readonly IMapper _mapper;

        public ServiceController(IServiceService serviceService, IMapper mapper)
        {
            _serviceService = serviceService;
            _mapper = mapper;
        }
        public IActionResult Index()
        {
            var services = _serviceService.GetAll();

            var model = _mapper.Map<List<ResultServiceDTO>>(services);

            return View(model);
        }
        public IActionResult Create()
        {
            return View(new CreateServiceDTO());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CreateServiceDTO dto, IFormFile file)
        {
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {

                var service = _serviceService.GetOne(i => i.Title == dto.Title);

                if (service != null)
                {
                    ErrorViewModel error = new ErrorViewModel()
                    {
                        Code = 101,
                        Title = "Kayıt Hatası",
                        Description = "Aynı isimde kayıtlı bir Service vardır. Lütfen farklı isim girişi yapınız.",
                        ReturnUrl = "/Service/Index",
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
                _serviceService.Create(_mapper.Map<Service>(dto));

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
                    Title = "Service Bulunamadı",
                    Description = "Lütfen varolan bir service seçiniz.",
                    ReturnUrl = "/Service/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            var service = _serviceService.GetById(id);

            if (service == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Service Bulunamadı",
                    Description = "Lütfen varolan bir service seçiniz.",
                    ReturnUrl = "/Service/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }
            var model = _mapper.Map<UpdateServiceDTO>(service);

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UpdateServiceDTO dto, IFormFile file)
        {
            ModelState.Remove("file");
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {
                var service = _serviceService.GetById(dto.Id);

                if (service == null)
                {
                    ErrorViewModel error = new ErrorViewModel()
                    {
                        Code = 102,
                        Title = "Service Bulunamadı",
                        Description = "Lütfen varolan bir service seçiniz.",
                        ReturnUrl = "/Service/Index",
                        Css = "text-danger"
                    };
                    return View("Error", error);
                }

                if (file != null)
                {
                    ImageMethods.DeleteImage(service.Image);
                    dto.Image = await ImageMethods.UploadImage(file);
                }

                _serviceService.Update(_mapper.Map<Service>(dto));
                return RedirectToAction("Index");
            }
            return View(dto);
        }

        public IActionResult Delete(int id)
        {
            var service = _serviceService.GetById(id);

            if (service == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Service Bulunamadı",
                    Description = "Lütfen varolan bir service seçiniz.",
                    ReturnUrl = "/Service/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            _serviceService.Delete(service);
            ImageMethods.DeleteImage(service.Image);
            return RedirectToAction("Index");
        }
    }
}
