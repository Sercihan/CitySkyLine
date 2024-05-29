using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.ProjectDTO
{
    public class CreateProjectDTO
    {
        [StringLength(300)]
        public string Title { get; set; }
        [StringLength(600)]
        public string Image { get; set; }

        [StringLength(100)]
        public string Type { get; set; }

        public int CountryId { get; set; }
        public int CityId { get; set; }
        public int DistrictId { get; set; }
    }
}
