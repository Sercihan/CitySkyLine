using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitySkyLine.Entity
{
    public class BlogDetail
    {
        public int Id { get; set; }
        [StringLength(300)]
        public string Title { get; set; }
        [StringLength(600)]
        public string Description1 { get; set; }
        [StringLength(600)]
        public string? Description2 { get; set; }
        [StringLength(600)]
        public string? Description3 { get; set; }
        [StringLength(200)]
        public string UserName { get; set; }
        public DateTime DateTime { get; set; }

        public List<RecentPost> RecentPosts { get; set; }

        public List<Comment> Comments { get; set; }

        public int BlogId { get; set; }
        public Blog Blog { get; set; }
    }
}
