using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.Entity
{
    public class Comment
    {
        public int Id { get; set; }
        [StringLength(200)]
        public string Name { get; set; }
        [StringLength(600)]
        public string Image { get; set; }
        [StringLength(600)]
        public string Description { get; set; }
        public DateTime DateTime { get; set; }

        public int BlogId { get; set; }
        public Blog Blog { get; set; }
        
    }
}
