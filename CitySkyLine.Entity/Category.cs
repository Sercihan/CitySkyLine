using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.Entity
{
    public class Category
    {
        public int Id { get; set; }
        [StringLength(300)]
        public string Title { get; set; }
        public List<Blog> Blogs { get; set; }
    }
}
