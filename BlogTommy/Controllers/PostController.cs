using BlogTommy.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BlogTommy.Controllers
{
    public class PostController : Controller
    {
        private readonly BlogDBContext _context;

        public PostController(BlogDBContext context)
        {
            _context = context;
        }

        public IActionResult PostDetails(int id)
        {
            var post = _context.Posts
                .Where(p => p.Id == id)
                .Include(p => p.Comments)
                .Include(p => p.User)
                .FirstOrDefault();

            if (post == null)
            {
                return NotFound();
            }

            return View(post);
        }
    }
}
