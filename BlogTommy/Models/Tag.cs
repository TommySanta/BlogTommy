using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace BlogTommy.Models
{
    [Table("Tags")]
    public class Tag
    {
        [Key]
        [Column("Id")]
        public int Id { get; set; }

        [Column("Name")]
        public string Name { get; set; }

        [Column("Created_At")]
        public DateTime CreatedAt { get; set; }
    }
}
