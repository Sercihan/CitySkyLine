using CitySkyLine.BLL.Abstract;
using CitySkyLine.Entity;
using CitySkyLine.WEBUI.EmailServices;
using CitySkyLine.WEBUI.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace CitySkyLine.WEBUI.Controllers
{
    public class HomeController : Controller
    {
        private IMailService _mailService;

        public HomeController(IMailService mailService)
        {
            _mailService = mailService;
        }
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
        public IActionResult BlogDetail(int id)
        {
            return View(id);
        }
        public IActionResult BlogByCategory(int id)
        {
            return View(id);
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
        public IActionResult SendEmail(Mail mail)
        {
            string body = $"<h1>Ýletiþim Bilgileri</h1><br>Ad Soyad:{mail.Name}<br>Email:{mail.Email}<br>Konu:{mail.Subject}<br>Mesaj:{mail.Message}";
            bool result = MailHelper.SendMail(body, "sercihan19@gmail.com", mail.Subject);
            if (result)
            {
                mail.Read = false;
                _mailService.Create(mail);
                TempData["MailSuccess"] = "true";
            }
            else
            {
                TempData["MailSuccess"] = "false";
            }

            return RedirectToAction("Contact");
        }
    }
}
