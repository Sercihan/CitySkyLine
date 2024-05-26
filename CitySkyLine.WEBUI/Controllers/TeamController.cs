using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.TestimonialDTO;
using CitySkyLine.BLL;
using CitySkyLine.Entity;
using CitySkyLine.WEBUI.Models;
using Microsoft.AspNetCore.Mvc;
using CitySkyLine.BLL.DTOs.TeamDTO;

namespace CitySkyLine.WEBUI.Controllers
{
    public class TeamController : Controller
    {
        private readonly ITeamService _teamService;
        private readonly IMapper _mapper;

        public TeamController(ITeamService teamService, IMapper mapper)
        {
            _teamService = teamService;
            _mapper = mapper;
        }
        public IActionResult Index()
        {
            var teams = _teamService.GetAll();

            var model = _mapper.Map<List<ResultTeamDTO>>(teams);

            return View(model);
        }
        public IActionResult Create()
        {
            return View(new CreateTeamDTO());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CreateTeamDTO dto, IFormFile file)
        {
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {

                var team = _teamService.GetOne(i => i.Name == dto.Name);

                if (team != null)
                {
                    ErrorViewModel error = new ErrorViewModel()
                    {
                        Code = 101,
                        Title = "Kayıt Hatası",
                        Description = "Aynı isimde kayıtlı bir Team vardır. Lütfen farklı isim girişi yapınız.",
                        ReturnUrl = "/Team/Index",
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
                _teamService.Create(_mapper.Map<Team>(dto));

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
                    Title = "Team Bulunamadı",
                    Description = "Lütfen varolan bir team seçiniz.",
                    ReturnUrl = "/Team/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            var team = _teamService.GetById(id);

            if (team == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Team Bulunamadı",
                    Description = "Lütfen varolan bir team seçiniz.",
                    ReturnUrl = "/Team/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }
            var model = _mapper.Map<UpdateTeamDTO>(team);

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UpdateTeamDTO dto, IFormFile file)
        {
            ModelState.Remove("Image");
            ModelState.Remove("file");
            if (ModelState.IsValid)
            {
                var team = _teamService.GetById(dto.Id);

                if (team == null)
                {
                    ErrorViewModel error = new ErrorViewModel()
                    {
                        Code = 102,
                        Title = "Team Bulunamadı",
                        Description = "Lütfen varolan bir team seçiniz.",
                        ReturnUrl = "/Team/Index",
                        Css = "text-danger"
                    };
                    return View("Error", error);
                }

                if (file != null)
                {
                    ImageMethods.DeleteImage(team.Image);
                    dto.Image = await ImageMethods.UploadImage(file);
                }

                _teamService.Update(_mapper.Map<Team>(dto));
                return RedirectToAction("Index");
            }
            return View(dto);
        }

        public IActionResult Delete(int id)
        {
            var team = _teamService.GetById(id);

            if (team == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Team Bulunamadı",
                    Description = "Lütfen varolan bir team seçiniz.",
                    ReturnUrl = "/Team/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            _teamService.Delete(team);
            ImageMethods.DeleteImage(team.Image);
            return RedirectToAction("Index");
        }
    }
}
