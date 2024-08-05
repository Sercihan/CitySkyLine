using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace CitySkyLine.WEBUI.Identity
{
    public class ApplicationUser : IdentityUser
    {
        [StringLength(100)]
        public string FullName { get; set; }
    }
}
