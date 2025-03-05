using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace BlogTommy.Models
{
    [Table("Users")]
    public class User
    {
        [Key]
        [Column("Id")]
        public int Id { get; set; }

        [Column("Username")]
        public string Username { get; set; }

        [Column("Email")]
        public string Email { get; set; }

        [Column("Password_Hash")]
        public string PasswordHash { get; set; }

        [Column("Role_Id")]
        public int RoleId { get; set; }

        [Column("Banned")]
        public bool Banned { get; set; }

        [Column("Created_At")]
        public DateTime CreatedAt { get; set; }

        [Column("Updated_At")]
        public DateTime UpdatedAt { get; set; }
    }
}
