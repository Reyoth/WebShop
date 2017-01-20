using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;

namespace WebShop.Web.Session
{
    public class UserInfo
    {
        public static bool IsAdmin()
        {
            using (var context = new WebShop.Domain.WebShopEntities())
            {
                var userId = HttpContext.Current.User.Identity.GetUserId();
                // check s'il existe un utilisateur avec l'id de l'utilisateur connecté et le role admin
                return context.AspNetUsers
                    .Include(u => u.AspNetRoles)
                    .Any(u => u.Id.Equals(userId)
                              && u.AspNetRoles.Any(r => r.Name.Equals("admin")));
            }
        }
        public static bool IsClient()
        {
            using (var context = new WebShop.Domain.WebShopEntities())
            {
                var userId = HttpContext.Current.User.Identity.GetUserId();
                // check s'il existe un utilisateur avec l'id de l'utilisateur connecté et le role client
                return context.AspNetUsers
                    .Include(u => u.AspNetRoles)
                    .Any(u => u.Id.Equals(userId)
                              && u.AspNetRoles.Any(r => r.Name.Equals("client")));
            }
        }
    }
}