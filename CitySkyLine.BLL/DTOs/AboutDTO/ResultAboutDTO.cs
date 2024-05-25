using CitySkyLine.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.AboutDTO
{
    public class ResultAboutDTO
    {
        public int Id { get; set; }
        [StringLength(200)]
        public string Title { get; set; }
        [StringLength(400)]
        public string Description { get; set; }
        [StringLength(400)]
        public string SubDescription { get; set; }
        [StringLength(600)]
        public string Image1 { get; set; }
        [StringLength(600)]
        public string Image2 { get; set; }
        public List<Ability> Abilities { get; set; }
    }
}
