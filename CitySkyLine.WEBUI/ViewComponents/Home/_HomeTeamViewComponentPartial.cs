using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.TeamDTO;
using CitySkyLine.DAL.Concrete.EFCore;
using CitySkyLine.Entity;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeTeamViewComponentPartial : ViewComponent
    {
        private readonly ITeamService _TeamService;
        private readonly IMapper _mapper;

        public _HomeTeamViewComponentPartial(ITeamService teamService, IMapper mapper)
        {
            _TeamService = teamService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            var team = _TeamService.GetAll();
            var model = _mapper.Map<List<ResultTeamDTO>>(team);
            return View(model);
        }
    }
}
