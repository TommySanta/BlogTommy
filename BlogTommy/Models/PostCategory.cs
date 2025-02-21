using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BlogTommy.Models
{
    [Table("PostCategories")]
    public class PostCategory
    {
        [Column("Post_Id")]
        public int PostId { get; set; }

        [Column("Category_Id")]
        public int CategoryId { get; set; }

        public Category Category { get; set; }
        public Post Post { get; set; }
    }
}
