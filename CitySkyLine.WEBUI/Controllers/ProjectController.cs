using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.ServiceDTO;
using CitySkyLine.BLL;
using CitySkyLine.Entity;
using CitySkyLine.WEBUI.Models;
using Microsoft.AspNetCore.Mvc;
using CitySkyLine.BLL.DTOs.ProjectDTO;

namespace CitySkyLine.WEBUI.Controllers
{
    public class ProjectController : Controller
    {
        private readonly IProjectService _projectService;
        private readonly IDistrictService _districtService;
        private readonly ICityService _cityService;
        private readonly ICountryService _countryService;
        private readonly IMapper _mapper;

        public ProjectController(IProjectService projectService, IDistrictService districtService,ICityService cityService, ICountryService countryService ,IMapper mapper)
        {
            _projectService = projectService;
            _districtService = districtService;
            _cityService = cityService;
            _countryService = countryService;
            _mapper = mapper;
        }
        public IActionResult Index()
        {
            var projects = _projectService.GetAll();

            var model = _mapper.Map<List<ResultProjectDTO>>(projects);

            return View(model);
        }
        public IActionResult Create()
        {
            ViewBag.Districts = _districtService.GetAll();
            ViewBag.Cities = _cityService.GetAll();
            ViewBag.Countries = _countryService.GetAll();
            return View(new CreateProjectDTO());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CreateProjectDTO dto, IFormFile file)
        {
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {

                var project = _projectService.GetOne(i => i.Title == dto.Title);

                if (project != null)
                {
                    ErrorViewModel error = new ErrorViewModel()
                    {
                        Code = 101,
                        Title = "Kayıt Hatası",
                        Description = "Aynı isimde kayıtlı bir Project vardır. Lütfen farklı isim girişi yapınız.",
                        ReturnUrl = "/Project/Index",
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
                _projectService.Create(_mapper.Map<Project>(dto));

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
                    Title = "Project Bulunamadı",
                    Description = "Lütfen varolan bir project seçiniz.",
                    ReturnUrl = "/Project/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            var project = _projectService.GetById(id);

            if (project == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Project Bulunamadı",
                    Description = "Lütfen varolan bir project seçiniz.",
                    ReturnUrl = "/Project/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }
            var model = _mapper.Map<UpdateProjectDTO>(project);

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UpdateProjectDTO dto, IFormFile file)
        {
            ModelState.Remove("file");
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {
                var project = _projectService.GetById(dto.Id);

                if (project == null)
                {
                    ErrorViewModel error = new ErrorViewModel()
                    {
                        Code = 102,
                        Title = "Project Bulunamadı",
                        Description = "Lütfen varolan bir project seçiniz.",
                        ReturnUrl = "/Project/Index",
                        Css = "text-danger"
                    };
                    return View("Error", error);
                }

                if (file != null)
                {
                    ImageMethods.DeleteImage(project.Image);
                    dto.Image = await ImageMethods.UploadImage(file);
                }

                _projectService.Update(_mapper.Map<Project>(dto));
                return RedirectToAction("Index");
            }
            return View(dto);
        }

        public IActionResult Delete(int id)
        {
            var project = _projectService.GetById(id);

            if (project == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Project Bulunamadı",
                    Description = "Lütfen varolan bir project seçiniz.",
                    ReturnUrl = "/Project/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            _projectService.Delete(project);
            ImageMethods.DeleteImage(project.Image);
            return RedirectToAction("Index");
        }
    }
}
