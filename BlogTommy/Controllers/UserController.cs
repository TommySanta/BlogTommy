using BlogTommy.Data;
using BlogTommy.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BlogTommy.Controllers
{
    public class UserController : Controller
    {
        private readonly BlogDBContext _context;

        public UserController(BlogDBContext context)
        {
            _context = context;
        }

        // Acción para mostrar el perfil
        public IActionResult Perfil()
        {
            var userEmail = HttpContext.Session.GetString("UserEmail");

            if (string.IsNullOrEmpty(userEmail))
            {
                return RedirectToAction("Login"); // Si no está autenticado, redirigir al login
            }

            var user = _context.Users.FirstOrDefault(u => u.Email == userEmail);

            // Obtener los posts que el usuario ha comentado, incluyendo el post relacionado
            var postsComentados = _context.Comments
                                          .Where(c => c.UserId == user.Id)
                                          .Include(c => c.Post)
                                          .OrderByDescending(c => c.CreatedAt)
                                          .Select(c => c.Post)
                                          .Distinct()
                                          .ToList();

            var model = new PerfilViewModel
            {
                User = user,
                Publicaciones = _context.Posts
                                        .Where(p => p.UserId == user.Id)
                                        .Include(p => p.Comments)
                                        .OrderByDescending(p => p.CreatedAt)
                                        .ToList(),
                PostsComentados = postsComentados // Añadimos los posts comentados
            };

            return View(model);
        }

        // Acción para mostrar Login
        public IActionResult Login()
        {
            var userEmail = HttpContext.Session.GetString("UserEmail");
            if (!string.IsNullOrEmpty(userEmail))
            {
                return RedirectToAction("Perfil"); // Si ya está logueado, redirigir al perfil
            }

            return View();
        }

        // Acción para procesar el login
        [HttpPost]
        public IActionResult Login(string email, string password)
        {
            var user = _context.Users.FirstOrDefault(u => u.Email == email);

            if (user != null && user.PasswordHash == password)
            {
                HttpContext.Session.SetString("UserEmail", user.Email);
                return RedirectToAction("Perfil");
            }

            ModelState.AddModelError("", "Credenciales incorrectas.");
            return View();
        }

        // Acción para el Logout
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("UserEmail"); // Eliminar la sesión del usuario
            return RedirectToAction("Login"); // Redirigir al login
        }
    }
}
