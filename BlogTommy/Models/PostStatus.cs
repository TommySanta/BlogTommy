using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace BlogTommy.Models
{
    [Table("PostStatus")]
    public class PostStatus
    {
        [Key]
        [Column("Id")]
        public int Id { get; set; }

        [Column("Status")]
        public string Status { get; set; }
    }
}
