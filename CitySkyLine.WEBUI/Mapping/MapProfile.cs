using AutoMapper;
using CitySkyLine.BLL.DTOs.AbilityDTO;
using CitySkyLine.BLL.DTOs.AboutDTO;
using CitySkyLine.BLL.DTOs.BlogDetailDTO;
using CitySkyLine.BLL.DTOs.BlogDTO;
using CitySkyLine.BLL.DTOs.CarouselDTO;
using CitySkyLine.BLL.DTOs.CategoryDTO;
using CitySkyLine.BLL.DTOs.CommentDTO;
using CitySkyLine.BLL.DTOs.ProjectDTO;
using CitySkyLine.BLL.DTOs.RecentPostDTO;
using CitySkyLine.BLL.DTOs.ServiceDTO;
using CitySkyLine.BLL.DTOs.TeamDTO;
using CitySkyLine.BLL.DTOs.TestimonialDTO;
using CitySkyLine.Entity;

namespace CitySkyLine.WEBUI.Mapping
{
    public class MapProfile:Profile
    {
        public MapProfile()
        {
            CreateMap<Ability, ResultAbilityDTO>().ReverseMap();
            CreateMap<About, ResultAboutDTO>().ReverseMap();
            CreateMap<Blog, ResultBlogDTO>().ReverseMap();
            CreateMap<BlogDetail, ResultBlogDetailDTO>().ReverseMap();
            CreateMap<Carousel, ResultCarouselDTO>().ReverseMap();
            CreateMap<Category, ResultCategoryDTO>().ReverseMap();
            CreateMap<Comment, ResultCommentDTO>().ReverseMap();
            CreateMap<Project, ResultProjectDTO>().ReverseMap();
            CreateMap<RecentPost, ResultRecentPostDTO>().ReverseMap();
            CreateMap<Service, ResultServiceDTO>().ReverseMap();
            CreateMap<Team, ResultTeamDTO>().ReverseMap();

            CreateMap<Testimonial, ResultTestimonialDTO>().ReverseMap();
            CreateMap<Testimonial, UpdateTestimonialDTO>().ReverseMap();
            CreateMap<Testimonial, CreateTestimonialDTO>().ReverseMap();
        }
    }
}
