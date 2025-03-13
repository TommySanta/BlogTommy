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
                return RedirectToAction("Login");
            }
            var user = _context.Users.FirstOrDefault(u => u.Email == userEmail);

            // Obtener los posts que el usuario ha comentado, incluyendo el post y sus comentarios
            var postsComentados = _context.Comments
                                          .Where(c => c.UserId == user.Id)
                                          .Include(c => c.Post)
                                          .ThenInclude(p => p.Comments) // Incluir los comentarios del post
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
                PostsComentados = postsComentados
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

        // Acción para cambiar la contraseña
        [HttpPost]
        public IActionResult CambiarContraseña(string currentPassword, string newPassword)
        {
            var userEmail = HttpContext.Session.GetString("UserEmail");
            if (string.IsNullOrEmpty(userEmail))
            {
                return Json(new { success = false, message = "Usuario no autenticado." });
            }

            var user = _context.Users.FirstOrDefault(u => u.Email == userEmail);
            if (user == null)
            {
                return Json(new { success = false, message = "Usuario no encontrado." });
            }

            // Verificar la contraseña actual
            if (user.PasswordHash != currentPassword) // Contraseña en texto plano
            {
                return Json(new { success = false, message = "Contraseña actual incorrecta." });
            }

            // Validar la nueva contraseña (puedes añadir más validaciones)
            if (string.IsNullOrEmpty(newPassword) || newPassword.Length < 6)
            {
                return Json(new { success = false, message = "La nueva contraseña debe tener al menos 6 caracteres." });
            }

            // Actualizar la contraseña (en texto plano)
            user.PasswordHash = newPassword;
            _context.SaveChanges();

            return Json(new { success = true, message = "Contraseña actualizada correctamente." });
        }


        // Acción para eliminar la cuenta
        [HttpPost]
        public IActionResult EliminarCuenta()
        {
            var userEmail = HttpContext.Session.GetString("UserEmail");
            if (string.IsNullOrEmpty(userEmail))
            {
                return Json(new { success = false, message = "Sesión expirada. Por favor, inicia sesión nuevamente." });
            }

            var user = _context.Users.FirstOrDefault(u => u.Email == userEmail);
            if (user != null)
            {
                try
                {
                    // 1. Obtener todos los posts del usuario
                    var userPosts = _context.Posts.Where(p => p.UserId == user.Id).ToList();
                    // 2. Eliminar cada post individualmente siguiendo el mismo patrón que en DeletePost
                    foreach (var post in userPosts)
                    {
                        // Eliminar comentarios relacionados con este post
                        var comments = _context.Comments.Where(c => c.PostId == post.Id);
                        _context.Comments.RemoveRange(comments);
                        // Eliminar categorías relacionadas con este post
                        var postCategories = _context.PostCategories.Where(pc => pc.PostId == post.Id);
                        _context.PostCategories.RemoveRange(postCategories);
                        // Eliminar el post
                        _context.Posts.Remove(post);
                    }
                    // 3. Eliminar los comentarios hechos por el usuario en posts de otros usuarios
                    var remainingComments = _context.Comments.Where(c => c.UserId == user.Id);
                    _context.Comments.RemoveRange(remainingComments);
                    // 4. Eliminar el usuario
                    _context.Users.Remove(user);
                    // 5. Guardar los cambios
                    _context.SaveChanges();
                    // 6. Cerrar la sesión
                    HttpContext.Session.Clear();

                    return Json(new { success = true, message = "Tu cuenta ha sido eliminada con éxito." });
                }
                catch (Exception ex)
                {
                    // Registrar la excepción para diagnóstico
                    // Logger.LogError(ex, "Error al eliminar la cuenta del usuario");
                    return Json(new { success = false, message = "Ocurrió un error al eliminar la cuenta: " + ex.Message });
                }
            }
            return Json(new { success = false, message = "Usuario no encontrado." });
        }

        [HttpPost]
        public IActionResult DeletePost([FromBody] DeletePostRequest request)
        {
            var userEmail = HttpContext.Session.GetString("UserEmail");
            if (string.IsNullOrEmpty(userEmail))
            {
                return Json(new { success = false, message = "Usuario no autenticado." });
            }

            var user = _context.Users.FirstOrDefault(u => u.Email == userEmail);
            if (user == null)
            {
                return Json(new { success = false, message = "Usuario no encontrado." });
            }

            var post = _context.Posts.FirstOrDefault(p => p.Id == request.PostId && p.UserId == user.Id);
            if (post == null)
            {
                return Json(new { success = false, message = "Post no encontrado o no pertenece al usuario." });
            }

            // Eliminar comentarios relacionados
            var comments = _context.Comments.Where(c => c.PostId == post.Id);
            _context.Comments.RemoveRange(comments);

            // Eliminar categorías relacionadas
            var postCategories = _context.PostCategories.Where(pc => pc.PostId == post.Id);
            _context.PostCategories.RemoveRange(postCategories);

            // Ahora eliminar el post
            _context.Posts.Remove(post);
            _context.SaveChanges();

            return Json(new { success = true, message = "Post eliminado correctamente." });
        }


        public class DeletePostRequest
        {
            public int PostId { get; set; }
        }
    }
}
