using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.BlogDTO
{
    public class UpdateBlogDTO
    {
        public int Id { get; set; }
        [StringLength(300)]
        public string Title { get; set; }
        [StringLength(600)]
        public string Image { get; set; }
        [StringLength(200)]
        public string UserName { get; set; }
        public DateTime DateTime { get; set; }

        [StringLength(600)]
        public string Description1 { get; set; }
        [StringLength(600)]
        public string? Description2 { get; set; }
        [StringLength(600)]
        public string? Description3 { get; set; }


        public int CategoryId { get; set; }
        public List<Comment> Comments { get; set; }
    }
}
