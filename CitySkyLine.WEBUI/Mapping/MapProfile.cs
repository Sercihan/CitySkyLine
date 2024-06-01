using AutoMapper;
using CitySkyLine.BLL.DTOs.AbilityDTO;
using CitySkyLine.BLL.DTOs.AboutDTO;
using CitySkyLine.BLL.DTOs.BlogDTO;
using CitySkyLine.BLL.DTOs.CarouselDTO;
using CitySkyLine.BLL.DTOs.CategoryDTO;
using CitySkyLine.BLL.DTOs.CommentDTO;
using CitySkyLine.BLL.DTOs.MailDTO;
using CitySkyLine.BLL.DTOs.ProjectDTO;
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
            CreateMap<Category, ResultCategoryDTO>().ReverseMap();
            CreateMap<Comment, ResultCommentDTO>().ReverseMap();

            CreateMap<Mail, ResultMailDTO>().ReverseMap();
            CreateMap<Mail, UpdateMailDTO>().ReverseMap();

            CreateMap<Blog, ResultBlogDTO>().ReverseMap();
            CreateMap<Blog, UpdateBlogDTO>().ReverseMap();
            CreateMap<Blog, CreateBlogDTO>().ReverseMap();

            CreateMap<Carousel, ResultCarouselDTO>().ReverseMap();
            CreateMap<Carousel, UpdateCarouselDTO>().ReverseMap();
            CreateMap<Carousel, CreateCarouselDTO>().ReverseMap();

            CreateMap<Project, ResultProjectDTO>().ReverseMap();
            CreateMap<Project, UpdateProjectDTO>().ReverseMap();
            CreateMap<Project, CreateProjectDTO>().ReverseMap();

            CreateMap<Service, ResultServiceDTO>().ReverseMap();
            CreateMap<Service, UpdateServiceDTO>().ReverseMap();
            CreateMap<Service, CreateServiceDTO>().ReverseMap();
            

            CreateMap<Team, ResultTeamDTO>().ReverseMap();
            CreateMap<Team, UpdateTeamDTO>().ReverseMap();
            CreateMap<Team, CreateTeamDTO>().ReverseMap();

            CreateMap<Testimonial, ResultTestimonialDTO>().ReverseMap();
            CreateMap<Testimonial, UpdateTestimonialDTO>().ReverseMap();
            CreateMap<Testimonial, CreateTestimonialDTO>().ReverseMap();
        }
    }
}
