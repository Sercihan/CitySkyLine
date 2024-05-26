using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.RecentPostDTO;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeBlogDetailRecentPostViewComponentPartial : ViewComponent
    {
        private readonly IRecentPostService _recentPostService;
        private readonly IMapper _mapper;

        public _HomeBlogDetailRecentPostViewComponentPartial(IRecentPostService recentPostService, IMapper mapper)
        {
            _recentPostService = recentPostService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            return View(_mapper.Map<List<ResultRecentPostDTO>>(_recentPostService.GetAll()));
        }
    }
}
