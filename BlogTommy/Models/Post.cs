using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace BlogTommy.Models
{
    [Table("Posts")]
    public class Post
    {
        [Key]
        [Column("Id")]
        public int Id { get; set; }

        [Column("User_Id")]
        public int UserId { get; set; }

        [Column("Title")]
        public string Title { get; set; }

        [Column("Content")]
        public string Content { get; set; }

        [Column("Status_Id")]
        public int StatusId { get; set; }

        [Column("Created_At")]
        public DateTime CreatedAt { get; set; }

        [Column("Updated_At")]
        public DateTime UpdatedAt { get; set; }
        [Column("Image_url")]
        public string Image_url { get; set; }

        public ICollection<Comment> Comments { get; set; }
        public ICollection<PostCategory> PostCategories { get; set; }
    }
}
