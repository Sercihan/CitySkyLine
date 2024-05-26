﻿using AutoMapper;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.DTOs.BlogDetailDTO;
using CitySkyLine.BLL.DTOs.ServiceDTO;
using CitySkyLine.DAL.Concrete.EFCore;
using CitySkyLine.Entity;
using Microsoft.AspNetCore.Mvc;

namespace CitySkyLine.WEBUI.ViewComponents.Home
{
    public class _HomeBlogDetailViewComponentPartial : ViewComponent
    {
        private readonly IBlogDetailService _blogDetailService;
        private readonly IMapper _mapper;

        public _HomeBlogDetailViewComponentPartial(IBlogDetailService blogDetailService, IMapper mapper)
        {
            _blogDetailService = blogDetailService;
            _mapper = mapper;
        }

        public IViewComponentResult Invoke()
        {
            var blogDetail = _blogDetailService.GetBlogDetailsById(1);
            var model = _mapper.Map<ResultBlogDetailDTO>(blogDetail);
            return View(model);
        }
    }
}
