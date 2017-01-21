using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using WebShop.Domain;

namespace WebShop.Web.Session
{
    public class UserInfo
    {
        // check s'il existe un utilisateur avec l'id de l'utilisateur connecté et le role admin
        public static bool IsAdmin()
        {
            using (var context = new WebShop.Domain.WebShopEntities())
            {
                var userId = GetUserId();
                return context.AspNetUsers
                    .Include(u => u.AspNetRoles)
                    .Any(u => u.Id.Equals(userId)
                              && u.AspNetRoles.Any(r => r.Name.Equals("admin")));
            }
        }

        // check s'il existe un utilisateur avec l'id de l'utilisateur connecté et le role client
        public static bool IsClient()
        {
            using (var context = new WebShop.Domain.WebShopEntities())
            {
                var userId = GetUserId();
                return context.AspNetUsers
                    .Include(u => u.AspNetRoles)
                    .Any(u => u.Id.Equals(userId)
                              && u.AspNetRoles.Any(r => r.Name.Equals("client")));
            }
        }
        //id utilisateur connecté
        public static string GetUserId()
        {
            return HttpContext.Current.User.Identity.GetUserId();
        }
        //id client de l'utilisateur connecté
        public static int GetClientId()
        {
            using (var context = new WebShopEntities())
            {
                var userId = GetUserId();
                var client = context.Clients
                    .FirstOrDefault(c => c.CLI_NetUserId.Equals(userId));
                return client?.CLI_Id ?? -1; // coalesce
            }
        }
    }
}