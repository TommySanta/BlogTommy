using BlogTommy.Data;
using BlogTommy.Models;
using BlogTommy.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace BlogTommy.Controllers
{
    public class PostController : Controller
    {
        private readonly BlogDBContext _context;
        private RepositoryPosts _repository;

        public PostController(BlogDBContext context, RepositoryPosts repository)
        {
            _context = context;
            _repository = repository;
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
        public async Task<IActionResult> Create()
        {
            // Obtener las categorías desde la base de datos
            var categorias = await _repository.GetCategoriesAsync();

            // Convertir las categorías a un formato adecuado para el select
            ViewBag.Categorias = new SelectList(categorias, "Id", "Name");

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(PostViewModel model)
        {
            if (!ModelState.IsValid)
            {
                // Si el modelo no es válido, vuelve a cargar las categorías
                var categorias = await _repository.GetCategoriesAsync();
                ViewBag.Categorias = new SelectList(categorias, "Id", "Name");

                return View(model);
            }

            // Guardar la imagen en wwwroot/image
            if (model.Image != null)
            {
                var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images");
                var uniqueFileName = $"{Guid.NewGuid()}_{model.Image.FileName}";
                var filePath = Path.Combine(uploadsFolder, uniqueFileName);

                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await model.Image.CopyToAsync(fileStream);
                }
            }

            // Guardar el post en la base de datos
            var newPost = new Post
            {
                Title = model.Title,
                Content = model.Content,
                Image_url = model.Image != null ? $"/image/{model.Image.FileName}" : null,
                StatusId = 1, // El post se crea como borrador
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now
            };

            // Guardar en la base de datos
            _context.Posts.Add(newPost);
            await _context.SaveChangesAsync();

            // Asociar la categoría con el post
            var postCategory = new PostCategory
            {
                PostId = newPost.Id,
                CategoryId = model.Category
            };
            _context.PostCategories.Add(postCategory);
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = "Post creado correctamente y enviado a revisión.";
            return RedirectToAction("Index");
        }
    }
    
}
