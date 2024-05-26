using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.BlogDetailDTO
{
    public class CreateBlogDetailDTO
    {
        [StringLength(600)]
        public string Description1 { get; set; }
        [StringLength(600)]
        public string? Description2 { get; set; }
        [StringLength(600)]
        public string? Description3 { get; set; }

        public int BlogId { get; set; }
        public Blog Blog { get; set; }
    }
}
