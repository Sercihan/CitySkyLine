using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.ProjectDTO;
using CitySkyLine.DAL.Concrete.EFCore;
using CitySkyLine.Entity;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomePortfolioViewComponentPartial : ViewComponent
    {
        private readonly IProjectService _ProjectService;
        private readonly IMapper _mapper;

        public _HomePortfolioViewComponentPartial(IProjectService projectService, IMapper mapper)
        {
            _ProjectService = projectService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            var project = _ProjectService.GetAll();
            var model = _mapper.Map<List<ResultProjectDTO>>(project);
            return View(model);
        }
    }
}
