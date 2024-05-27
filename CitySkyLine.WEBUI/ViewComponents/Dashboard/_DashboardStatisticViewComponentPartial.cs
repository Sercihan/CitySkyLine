using CitySkyLine.BLL.Abstract;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.DashBoard
{
    public class _DashboardStatisticViewComponentPartial : ViewComponent
    {
        private readonly IStatisticService _statisticService;

        public _DashboardStatisticViewComponentPartial(IStatisticService statisticService)
        {
            _statisticService = statisticService;
        }

        public IViewComponentResult Invoke()
        {
            ViewBag.BlogCount = _statisticService.BlogCount();
            ViewBag.NewestBlog = _statisticService.NewestBlog();
            ViewBag.CommentCount = _statisticService.CommentCount();
            ViewBag.NewestComment = _statisticService.NewestComment();
            return View();
        }
    }
}
