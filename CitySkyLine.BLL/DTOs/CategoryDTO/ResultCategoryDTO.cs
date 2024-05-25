using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.CategoryDTO
{
    public class ResultCategoryDTO
    {
        public int Id { get; set; }
        [StringLength(300)]
        public string Title { get; set; }
        public List<Blog> Blogs { get; set; }
    }
}
