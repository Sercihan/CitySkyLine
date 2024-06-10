using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.BlogDTO;
using CitySkyLine.BLL;
using CitySkyLine.Entity;
using CitySkyLine.WEBUI.Models;
using Microsoft.AspNetCore.Mvc;
using CitySkyLine.BLL.DTOs.CommentDTO;

namespace CitySkyLine.WEBUI.Controllers
{
    public class CommentController : Controller
    {
        private readonly ICommentService _commentService;
        private readonly IMapper _mapper;

        public CommentController(ICommentService commentService, IMapper mapper)
        {
            _commentService = commentService;
            _mapper = mapper;
        }
        public IActionResult Create()
        {
            return View(new ResultCommentDTO());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(ResultCommentDTO dto)
        {
            ModelState.Remove("Image");
            if (ModelState.IsValid)
            {
                dto.Image = "user.jpg";
                dto.DateTime = DateTime.Now;
                _commentService.Create(_mapper.Map<Comment>(dto));
                return RedirectToAction("BlogDetail", "Home", new { id = dto.BlogId });
            }
            return View(dto);
        }
    }
}
