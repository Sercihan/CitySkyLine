using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.LayoutAdmin
{
    public class _AdminNavbarViewComponentPartial : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}
