using BlogTommy.Data;
using BlogTommy.Models;
using Microsoft.EntityFrameworkCore;

namespace BlogTommy.Repositories
{
    public class RepositoryHome
    {
        private readonly BlogDBContext _context;

        public RepositoryHome(BlogDBContext context)
        {
            _context = context;
        }

        //public async Task<List<Post>> GetTopCommentedPostsAsync()
        //{
        //    return await _context.Posts
        //        .OrderByDescending(p => p.Comments.Count())
        //        .Take(4)
        //        .ToListAsync();
        //}

        public async Task<List<Post>> GetAllPostsAsync()
        {
            return await _context.Posts
                .Include(p => p.PostCategories)
                .ThenInclude(pc => pc.Category)
                .OrderByDescending(p => p.CreatedAt)
                .ToListAsync();
        }

        public async Task<List<Category>> GetCategoriesAsync()
        {
            return await _context.Categories.ToListAsync();
        }
        public async Task<List<Post>> GetPostsByCategoryAsync(List<int> categoryIds)
        {
            return await _context.Posts
                .Where(p => p.PostCategories.Any(pc => categoryIds.Contains(pc.CategoryId)))
                .ToListAsync();
        }
    }
}
