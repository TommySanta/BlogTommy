using System.ComponentModel.DataAnnotations.Schema;

namespace BlogTommy.Models
{
    [Table("PostTags")]
    public class PostTag
    {
        [Column("Post_Id")]
        public int PostId { get; set; }

        [Column("Tag_Id")]
        public int TagId { get; set; }
    }
}
