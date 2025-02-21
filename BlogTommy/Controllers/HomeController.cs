using System.Diagnostics;
using BlogTommy.Models;
using BlogTommy.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace BlogTommy.Controllers
{
    public class HomeController : Controller
    {
        RepositoryHome repo;

        public HomeController(RepositoryHome repo)
        {
            this.repo = repo;
        }
        public async Task<IActionResult> Index()
        {
            List<Post> topCommentedPosts = await repo.GetTopCommentedPostsAsync();
            List<Post> allPosts = await repo.GetAllPostsAsync();
            List<Category> categories = await repo.GetCategoriesAsync();

            ViewData["TopCommentedPosts"] = topCommentedPosts;
            ViewData["AllPosts"] = allPosts;
            ViewData["Categories"] = categories;

            return View();
        }

    }
}
