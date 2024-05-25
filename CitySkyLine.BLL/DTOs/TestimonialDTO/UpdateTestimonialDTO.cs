using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.TestimonialDTO
{
    public class UpdateTestimonialDTO
    {
        public int Id { get; set; }
        [StringLength(100)]
        public string Name { get; set; }
        [StringLength(200)]
        public string Title { get; set; }
        [StringLength(300)]
        public string Image { get; set; }
        [StringLength(600)]
        public string Description { get; set; }
    }
}
