using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.RecentPostDTO
{
    public class CreateRecentPostDTO
    {
        public int BlogId { get; set; }
        public Blog Blog { get; set; }
    }
}
