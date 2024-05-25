﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.Entity
{
    public class Country
    {
        public int Id { get; set; }
        [StringLength(100)]
        public string Name { get; set; }

        public List<City> Cities { get; set; }
        //public List<ProjectLocation> ProjectLocations { get; set; }
        //public List<Project> Projects { get; set; }

    }
}
