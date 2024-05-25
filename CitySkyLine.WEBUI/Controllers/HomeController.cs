using CitySkyLine.BLL.Abstract;
using CitySkyLine.WEBUI.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace CitySkyLine.WEBUI.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult About()
        {
            return View();
        }
        public IActionResult Blog()
        {
            return View();
        }
        public IActionResult BlogDetail()
        {
            return View();
        }
        public IActionResult Contact()
        {
            return View();
        }
        public IActionResult Project()
        {
            return View();
        }
        public IActionResult Service()
        {
            return View();
        }
        public IActionResult Team()
        {
            return View();
        }
        public IActionResult Testimonial()
        {
            return View();
        }
    }
}
