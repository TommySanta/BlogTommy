using System.ComponentModel.DataAnnotations;

namespace BlogTommy.Models
{
    public class PostViewModel
    {
        [Required]
        public string Title { get; set; }

        [Required]
        public int Category { get; set; }

        [Required]
        public string Content { get; set; }

        // Hacemos que la propiedad Image no sea obligatoria
        public IFormFile Image { get; set; }

    }

}
