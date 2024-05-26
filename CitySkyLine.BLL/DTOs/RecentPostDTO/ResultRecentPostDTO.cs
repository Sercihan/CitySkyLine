﻿using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.RecentPostDTO
{
    public class ResultRecentPostDTO
    {
        public int Id { get; set; }

        public int BlogId { get; set; }
        public Blog Blog { get; set; }
    }
}
