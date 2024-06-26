﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.Entity
{
    public class City
    {
        public int Id { get; set; }
        [StringLength(100)]
        public string Name { get; set; }

        public int CountryId { get; set; }
        public Country Country { get; set; }

        public List<District> Districts { get; set; }


    }
}
