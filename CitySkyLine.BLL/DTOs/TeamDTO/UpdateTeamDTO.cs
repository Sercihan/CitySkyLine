using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.BLL.DTOs.TeamDTO
{
    public class UpdateTeamDTO
    {
        public int Id { get; set; }
        [StringLength(200)]
        public string Name { get; set; }
        [StringLength(100)]
        public string Title { get; set; }
        [StringLength(300)]
        public string Image { get; set; }
        [StringLength(300)]
        public string TwitterURL { get; set; }
        [StringLength(300)]
        public string FacebookURL { get; set; }
        [StringLength(300)]
        public string LinkedinURL { get; set; }
        [StringLength(300)]
        public string InstagramURL { get; set; }
        [StringLength(300)]
        public string YoutubeURL { get; set; }
    }
}
