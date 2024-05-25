using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.AbilityDTO
{
    public class ResultAbilityDTO
    {
        public int Id { get; set; }
        [StringLength(200)]
        public string Name { get; set; }

        public int AboutId { get; set; }
        public About About { get; set; }
    }
}
