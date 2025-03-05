using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace BlogTommy.Models
{
    [Table("Comments")]
    public class Comment
    {
        [Key]
        [Column("Id")]
        public int Id { get; set; }

        [Column("Post_Id")]
        public int PostId { get; set; }

        [Column("User_Id")]
        public int? UserId { get; set; }
        public User User { get; set; }

        [Column("Content")]
        public string Content { get; set; }

        [Column("Created_At")]
        public DateTime CreatedAt { get; set; }
    }
}
