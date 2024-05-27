using CitySkyLine.BLL.Abstract;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.Controllers
{
    public class StatisticController : Controller
    {
        private readonly IStatisticService _statisticService;

        public StatisticController(IStatisticService statisticService)
        {
            _statisticService = statisticService;
        }

        public IActionResult Index()
        {
            ViewBag.ProjectCount = _statisticService.ProjectCount();
            ViewBag.NewestProject = _statisticService.NewestProject();
            ViewBag.ServiceCount = _statisticService.ServiceCount();
            ViewBag.NewestService = _statisticService.NewestService();
            ViewBag.TeamCount = _statisticService.TeamCount();
            ViewBag.NewestTeam = _statisticService.NewestTeam();
            ViewBag.BlogCount = _statisticService.BlogCount();
            ViewBag.NewestBlog = _statisticService.NewestBlog();
            ViewBag.CommentCount = _statisticService.CommentCount();
            ViewBag.NewestComment = _statisticService.NewestComment();
            ViewBag.CategoryCount = _statisticService.CategoryCount();
            ViewBag.NewestCategory = _statisticService.NewestCategory();
            return View();
        }
    }
}
