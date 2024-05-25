using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.Entity
{
    public class Ability
    {
        public int Id { get; set; }
        [StringLength(200)]
        public string Name { get; set; }

        public int AboutId { get; set; }
        public About About { get; set; }
    }
}
