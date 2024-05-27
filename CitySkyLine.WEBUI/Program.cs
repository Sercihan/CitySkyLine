    using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.Concrete;
using CitySkyLine.DAL.Abstract;
using CitySkyLine.DAL.Concrete.EFCore;
using CitySkyLine.WEBUI.Mapping;
using Microsoft.EntityFrameworkCore;

namespace CitySkyLine.WEBUI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();
            builder.Services.AddAutoMapper(typeof(MapProfile));
            

            builder.Services.AddScoped<IAbilityService, AbilityManager>();
            builder.Services.AddScoped<IAbilityDal, EFCoreAbilityDal>();

            builder.Services.AddScoped<IAboutService, AboutManager>();
            builder.Services.AddScoped<IAboutDal, EFCoreAboutDal>();

            builder.Services.AddScoped<IBlogService, BlogManager>();
            builder.Services.AddScoped<IBlogDal, EFCoreBlogDal>();

            builder.Services.AddScoped<IBlogDetailService, BlogDetailManager>();
            builder.Services.AddScoped<IBlogDetailDal, EFCoreBlogDetailDal>();

            builder.Services.AddScoped<ICarouselService, CarouselManager>();
            builder.Services.AddScoped<ICarouselDal, EFCoreCarouselDal>();

            builder.Services.AddScoped<ICategoryService, CategoryManager>();
            builder.Services.AddScoped<ICategoryDal, EFCoreCategoryDal>();

            builder.Services.AddScoped<ICityService, CityManager>();
            builder.Services.AddScoped<ICityDal, EFCoreCityDal>();

            builder.Services.AddScoped<ICommentService, CommentManager>();
            builder.Services.AddScoped<ICommentDal, EFCoreCommentDal>();

            builder.Services.AddScoped<ICountryService, CountryManager>();
            builder.Services.AddScoped<ICountryDal, EFCoreCountryDal>();

            builder.Services.AddScoped<IDistrictService, DistrictManager>();
            builder.Services.AddScoped<IDistrictDal, EFCoreDistrictDal>();

            builder.Services.AddScoped<IProjectService, ProjectManager>();
            builder.Services.AddScoped<IProjectDal, EFCoreProjectDal>();

            builder.Services.AddScoped<IRecentPostService, RecentPostManager>();
            builder.Services.AddScoped<IRecentPostDal, EFCoreRecentPostDal>();

            builder.Services.AddScoped<IServiceService, ServiceManager>();
            builder.Services.AddScoped<IServiceDal, EFCoreServiceDal>();

            builder.Services.AddScoped<ITeamService, TeamManager>();
            builder.Services.AddScoped<ITeamDal, EFCoreTeamDal>();

            builder.Services.AddScoped<ITestimonialService, TestimonialManager>();
            builder.Services.AddScoped<ITestimonialDal, EFCoreTestimonialDal>();

            builder.Services.AddScoped<IMailService, MailManager>();
            builder.Services.AddScoped<IMailDal, EFCoreMailDal>();

            builder.Services.AddScoped<IStatisticService, StatisticManager>();
            builder.Services.AddScoped<IStatisticDal, EFCoreStatisticDal>();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");

                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Admin}/{action=Index}/{id?}");

            app.Run();
        }
    }
}
