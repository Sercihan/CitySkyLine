using System.ComponentModel.DataAnnotations;

namespace CitySkyLine.WEBUI.Models
{
    public class LoginModel
    {
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public string ReturnUrl { get; set; }
    }
}
