using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.Entity
{
    public class Mail
    {
        public int Id { get; set; }
        [StringLength(100)]
        public string Name { get; set; }
        [StringLength(300)]
        public string Email { get; set; }
        [StringLength(200)]
        public string Subject { get; set; }
        [StringLength(900)]
        public string Message { get; set; }
        public bool Read { get; set; }
    }
}
