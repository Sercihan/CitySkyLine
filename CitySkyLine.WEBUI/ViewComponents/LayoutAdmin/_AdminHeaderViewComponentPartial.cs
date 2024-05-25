using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.LayoutAdmin
{
    public class _AdminHeaderViewComponentPartial : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}
