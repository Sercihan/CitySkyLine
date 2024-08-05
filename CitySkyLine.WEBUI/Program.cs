using Microsoft.AspNetCore.Identity;
using CitySkyLine.BLL.Abstract;
using CitySkyLine.BLL.Concrete;
using CitySkyLine.DAL.Abstract;
using CitySkyLine.DAL.Concrete.EFCore;
using CitySkyLine.WEBUI.Mapping;
using Microsoft.EntityFrameworkCore;
using CitySkyLine.WEBUI.Identity;

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

            builder.Services.AddDbContext<ApplicationIdentityDbContext>(options =>
           options.UseSqlServer(builder.Configuration.GetConnectionString("IdentityConnection")));

            builder.Services.AddIdentity<ApplicationUser, IdentityRole>()
    .AddEntityFrameworkStores<ApplicationIdentityDbContext>()
    .AddDefaultTokenProviders();

            builder.Services.Configure<IdentityOptions>(options =>
            {
                options.Password.RequireDigit = true;
                options.Password.RequireNonAlphanumeric = true;
                options.Password.RequiredLength = 6;
                options.Password.RequireUppercase = true;
                options.Password.RequireLowercase = true;
            });

            builder.Services.ConfigureApplicationCookie(options =>
            {
                options.LoginPath = "/Account/Login";
                options.LogoutPath = "/Account/Logout";
                options.AccessDeniedPath = "/Account/AccessDenied";
                options.ExpireTimeSpan = TimeSpan.FromMinutes(60);
                options.SlidingExpiration = true;
                options.Cookie = new CookieBuilder
                {
                    HttpOnly = true,
                    Name = ".CitySkyLine.Security.Cookie",
                    SameSite = SameSiteMode.Strict
                };
            });

            var userManager = builder.Services.BuildServiceProvider().GetService<UserManager<ApplicationUser>>();
            var roleManager = builder.Services.BuildServiceProvider().GetService<RoleManager<IdentityRole>>();




            builder.Services.AddScoped<IAbilityService, AbilityManager>();
            builder.Services.AddScoped<IAbilityDal, EFCoreAbilityDal>();

            builder.Services.AddScoped<IAboutService, AboutManager>();
            builder.Services.AddScoped<IAboutDal, EFCoreAboutDal>();

            builder.Services.AddScoped<IBlogService, BlogManager>();
            builder.Services.AddScoped<IBlogDal, EFCoreBlogDal>();

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
            app.UseAuthentication();
            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            SeedIdentity.Seed(userManager, roleManager, app.Configuration).Wait();

            app.Run();
        }
    }
}
