using BlogTommy.Data;

namespace BlogTommy.Repositories
{
    public class RepositoryPosts
    {
        private readonly BlogDBContext _context;

        public RepositoryPosts(BlogDBContext context)
        {
            _context = context;
        }
    }
}
