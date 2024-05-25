using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
