using BlogTommy.Data;
using BlogTommy.Models;
using Microsoft.EntityFrameworkCore;

namespace BlogTommy.Repositories
{
    public class RepositoryPosts
    {
        private readonly BlogDBContext _context;

        public RepositoryPosts(BlogDBContext context)
        {
            _context = context;
        }
        public async Task<List<Category>> GetCategoriesAsync()
        {
            return await _context.Categories.ToListAsync();
        }
        public async Task CreatePostCategoryAsync(int postId, int categoryId)
        {
            var postCategory = new PostCategory
            {
                PostId = postId,
                CategoryId = categoryId
            };

            _context.PostCategories.Add(postCategory);
            await _context.SaveChangesAsync();
        }
    }
}
