namespace BlogTommy.Models
{
    public class PerfilViewModel
    {
        public User User { get; set; }
        public List<Post> Publicaciones { get; set; }
        public List<Post> PostsComentados { get; set; }
    }
}
