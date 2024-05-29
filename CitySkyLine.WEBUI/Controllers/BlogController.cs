using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.ProjectDTO;
using CitySkyLine.BLL;
using CitySkyLine.WEBUI.Models;
using Microsoft.AspNetCore.Mvc;
using CitySkyLine.BLL.DTOs.BlogDTO;
using CitySkyLine.Entity;

namespace CitySkyLine.WEBUI.Controllers
{
    public class BlogController : Controller
    {
        private readonly IBlogService _blogService;
        private readonly IRecentPostService _recentPostService;
        private readonly IBlogDetailService _blogDetailService;
        private readonly ICategoryService _categoryService;
        private readonly IMapper _mapper;

        public BlogController(IBlogService blogService, IRecentPostService recentPostService, IBlogDetailService blogDetailService, IMapper mapper, ICategoryService categoryService)
        {
            _blogService = blogService;
            _recentPostService = recentPostService;
            _blogDetailService = blogDetailService;
            _categoryService = categoryService;
            _mapper = mapper;
        }
        public IActionResult Index()
        {
            var blogs = _blogService.GetAll();

            var model = _mapper.Map<List<ResultBlogDTO>>(blogs);

            return View(model);
        }
        public IActionResult Create()
        {
            ViewBag.RecentPost = _recentPostService.GetAll();
            ViewBag.Categories = _categoryService.GetAll();
            return View(new CreateBlogDTO());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CreateBlogDTO dto, IFormFile file)
        {
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {

                var blog = _blogService.GetOne(i => i.Title == dto.Title);

                if (blog != null)
                {
                    ViewBag.RecentPost = _recentPostService.GetAll();
                    ViewBag.BlogDetail = _blogDetailService.GetAll();
                    ErrorViewModel error = new ErrorViewModel()
                    {
                        Code = 101,
                        Title = "Kayıt Hatası",
                        Description = "Aynı isimde kayıtlı bir Blog vardır. Lütfen farklı isim girişi yapınız.",
                        ReturnUrl = "/Blog/Index",
                        Css = "text-warning"
                    };
                    return View("Error", error);
                }
                if (file == null)
                {
                    ViewBag.RecentPost = _recentPostService.GetAll();
                    ViewBag.BlogDetail = _blogDetailService.GetAll();
                    ModelState.AddModelError("", "Resim için dosya yüklenmedi.");
                    return View(dto);
                }

                dto.Image = await ImageMethods.UploadImage(file);
                dto.DateTime = DateTime.Now;
                _blogService.Create(_mapper.Map<Blog>(dto));
                ViewBag.RecentPost = _recentPostService.GetAll();
                ViewBag.Categories = _categoryService.GetAll();
                return RedirectToAction("Index");
            }
            ViewBag.RecentPost = _recentPostService.GetAll();
            ViewBag.BlogDetail = _blogDetailService.GetAll();
            return View(dto);
        }

        public ActionResult Edit(int id)
        {
            if (id < 1)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Blog Bulunamadı",
                    Description = "Lütfen varolan bir blog seçiniz.",
                    ReturnUrl = "/Blog/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            var blog = _blogService.GetById(id);

            if (blog == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Blog Bulunamadı",
                    Description = "Lütfen varolan bir blog seçiniz.",
                    ReturnUrl = "/Blog/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }
            var model = _mapper.Map<UpdateBlogDTO>(blog);

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UpdateBlogDTO dto, IFormFile file)
        {
            ModelState.Remove("file");
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {
                var blog = _blogService.GetById(dto.Id);

                if (blog == null)
                {
                    ErrorViewModel error = new ErrorViewModel()
                    {
                        Code = 102,
                        Title = "Blog Bulunamadı",
                        Description = "Lütfen varolan bir blog seçiniz.",
                        ReturnUrl = "/Blog/Index",
                        Css = "text-danger"
                    };
                    return View("Error", error);
                }

                if (file != null)
                {
                    ImageMethods.DeleteImage(blog.Image);
                    dto.Image = await ImageMethods.UploadImage(file);
                }

                _blogService.Update(_mapper.Map<Blog>(dto));
                return RedirectToAction("Index");
            }
            ViewBag.RecentPost = _recentPostService.GetAll();
            ViewBag.BlogDetail = _blogDetailService.GetAll();
            return View(dto);
        }

        public IActionResult Delete(int id)
        {
            var blog = _blogService.GetById(id);

            if (blog == null)
            {
                ErrorViewModel error = new ErrorViewModel()
                {
                    Code = 102,
                    Title = "Blog Bulunamadı",
                    Description = "Lütfen varolan bir blog seçiniz.",
                    ReturnUrl = "/Blog/Index",
                    Css = "text-danger"
                };
                return View("Error", error);
            }

            _blogService.Delete(blog);
            ImageMethods.DeleteImage(blog.Image);
            return RedirectToAction("Index");
        }
    }
}
