using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.ProjectDTO
{
    public class UpdateProjectDTO
    {
        public int Id { get; set; }
        [StringLength(300)]
        public string Title { get; set; }
        [StringLength(600)]
        public string Image { get; set; }

        [StringLength(100)]
        public string Type { get; set; }

        public int CountryId { get; set; }
        public Country Country { get; set; }

        public int CityId { get; set; }
        public City City { get; set; }

        public int DistrictId { get; set; }
        public District District { get; set; }
    }
}
