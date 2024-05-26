using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.BlogDetailDTO
{
    public class ResultBlogDetailDTO
    {
        public int Id { get; set; }
        [StringLength(600)]
        public string Description1 { get; set; }
        [StringLength(600)]
        public string? Description2 { get; set; }
        [StringLength(600)]
        public string? Description3 { get; set; }
        [StringLength(200)]

        public int BlogId { get; set; }
        public Blog Blog { get; set; }
    }
}
