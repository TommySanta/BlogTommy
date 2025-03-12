using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;

namespace BlogTommy.Filter
{
    public class AuthenticatedUserFilter : IActionFilter
    {
        public void OnActionExecuting(ActionExecutingContext context)
        {
            // Verificar si el usuario está autenticado
            var userEmail = context.HttpContext.Session.GetString("UserEmail");

            if (string.IsNullOrEmpty(userEmail))
            {
                // Redirigir al login si no está autenticado
                context.Result = new RedirectToActionResult("Login", "User", null);
            }
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
        }
    }
}
