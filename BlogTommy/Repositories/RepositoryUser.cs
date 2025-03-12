using BlogTommy.Data;

namespace BlogTommy.Repositories
{
    public class RepositoryUser
    {
        private readonly BlogDBContext _context;
        public RepositoryUser(BlogDBContext context)
        {
            _context = context;
        }
    }
}
