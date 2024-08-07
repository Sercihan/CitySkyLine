﻿using Microsoft.AspNetCore.Identity;

namespace CitySkyLine.WEBUI.Identity
{
    public class SeedIdentity
    {
        public static async Task Seed(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, IConfiguration configuration)
        {
            var username = configuration["Data:AdminUser:username"];
            var password = configuration["Data:AdminUser:password"];
            var role = configuration["Data:AdminUser:role"];

            if (await userManager.FindByNameAsync(username) == null)
                {
                await roleManager.CreateAsync(new IdentityRole(role));

                var user = new ApplicationUser()
                {
                    UserName = username,
                    FullName = "Admin User",
                };

                var result = await userManager.CreateAsync(user, password);
                if (result.Succeeded)
                {
                    await userManager.AddToRoleAsync(user, role);
                }
            }
        }
    }
}
