using BlogTommy.Data;
using BlogTommy.Models;
using BlogTommy.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;

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
                var categorias = await _repository.GetCategoriesAsync();
                ViewBag.Categorias = new SelectList(categorias, "Id", "Name");

                return View(model);
            }

            string uniqueFileName = null;

            // Guardar la imagen en wwwroot/image
            if (model.Image != null)
            {
                var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images");
                uniqueFileName = $"{Guid.NewGuid()}_{model.Image.FileName}";
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
                Image_url = uniqueFileName != null ? $"/images/{uniqueFileName}" : null,
                StatusId = 1,
                UserId = 2,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now
            };

            _context.Posts.Add(newPost);
            await _context.SaveChangesAsync();

            var postCategory = new PostCategory
            {
                PostId = newPost.Id,
                CategoryId = model.Category
            };
            _context.PostCategories.Add(postCategory);
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = "Post creado correctamente y enviado a revisión.";
            return RedirectToAction("Index", "Home");
        }
        public IActionResult Edit(int id)
        {
            var post = _context.Posts
                               .Include(p => p.PostCategories)
                               .ThenInclude(pc => pc.Category)
                               .FirstOrDefault(p => p.Id == id);

            if (post == null)
            {
                return NotFound();
            }

            var viewModel = new PostViewModel
            {
                Title = post.Title,
                Content = post.Content,
                Category = post.PostCategories.FirstOrDefault()?.CategoryId ?? 0,
            };
            // Pasar la URL de la imagen al ViewBag
            ViewBag.ImageUrl = post.Image_url;

            // Cargar las categorías en el ViewBag
            ViewBag.Categorias = _context.Categories
                                 .Select(c => new SelectListItem
                                 {
                                     Value = c.Id.ToString(),
                                     Text = c.Name,
                                     Selected = c.Id == viewModel.Category // <-- Esta es la clave
                                 }).ToList();
            ViewBag.CategoriaSeleccionada = _context.Categories
                                            .FirstOrDefault(c => c.Id == viewModel.Category)?.Name ?? "Sin categoría";


            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, PostViewModel model)
        {
            if (ModelState.IsValid)
            {
                var post = await _context.Posts
                                          .Include(p => p.PostCategories)
                                          .FirstOrDefaultAsync(p => p.Id == id);

                if (post == null)
                {
                    return NotFound();
                }

                post.Title = model.Title;
                post.Content = model.Content;

                // Actualización de categoría
                var existingCategory = post.PostCategories.FirstOrDefault();
                if (existingCategory != null)
                {
                    _context.PostCategories.Remove(existingCategory);
                }

                if (model.Category != 0)
                {
                    post.PostCategories.Add(new PostCategory
                    {
                        PostId = post.Id,
                        CategoryId = model.Category
                    });
                }

                // Manejo de la imagen
                if (model.Image != null)
                {
                    var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images");
                    var uniqueFileName = Guid.NewGuid().ToString() + "_" + model.Image.FileName;
                    var filePath = Path.Combine(uploadsFolder, uniqueFileName);

                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        await model.Image.CopyToAsync(fileStream);
                    }

                    post.Image_url = "/images/" + uniqueFileName;
                }

                post.UpdatedAt = DateTime.Now;

                _context.SaveChanges();
                TempData["SuccessMessage"] = "Post Editado correctamente.";
                return RedirectToAction("PostDetails", new { id = post.Id });
            }

            // Si el modelo no es válido, recargar las categorías
            ViewBag.Categorias = _context.Categories
                                         .Select(c => new SelectListItem
                                 
                                         {
                                             Value = c.Id.ToString(),
                                             Text = c.Name
                                         }).ToList();

            return View(model);
        }


    }
}
