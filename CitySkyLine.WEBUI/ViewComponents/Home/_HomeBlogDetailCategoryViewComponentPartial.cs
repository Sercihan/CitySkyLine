using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.CategoryDTO;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeBlogDetailCategoryViewComponentPartial:ViewComponent
    {
        private readonly ICategoryService _categoryService;
        private readonly IMapper _mapper;

        public _HomeBlogDetailCategoryViewComponentPartial(ICategoryService categoryService, IMapper mapper)
        {
            _categoryService = categoryService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            return View(_mapper.Map<List<ResultCategoryDTO>>(_categoryService.GetAll()));
        }
    }
}
