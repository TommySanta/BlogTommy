using System.Diagnostics;
using BlogTommy.Data;
using BlogTommy.Models;
using BlogTommy.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BlogTommy.Controllers
{
    public class HomeController : Controller
    {
        RepositoryHome repo;
        private readonly BlogDBContext _context;

        public HomeController(RepositoryHome repo, BlogDBContext context)
        {
            this.repo = repo;
            _context = context;
        }
        public async Task<IActionResult> Index()
        {
            List<Post> allPosts = await repo.GetAllPostsAsync();
            List<Category> categories = await repo.GetCategoriesAsync();
            List<Post> recentPosts = await _context.Posts
                .OrderByDescending(p => p.CreatedAt) 
               .Take(2)
               .ToListAsync();

            ViewData["AllPosts"] = allPosts;
            ViewData["Categories"] = categories;
            ViewData["RecentPosts"] = recentPosts;

            return View();
        }
        public async Task<List<Post>> GetPostsByCategoryAsync(List<int> categoryIds)
        {
            return await _context.Posts
                .Where(p => p.PostCategories.Any(pc => categoryIds.Contains(pc.CategoryId)))
                .ToListAsync();
        }

    }
}
