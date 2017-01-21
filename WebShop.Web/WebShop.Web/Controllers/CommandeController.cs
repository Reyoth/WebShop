using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using WebShop.Domain;
using WebShop.Web.Session;

namespace WebShop.Web.Controllers
{
    public class CommandeController : Controller
    {
        // liste des commandes client ou toutes les commandes si admin
        public ViewResult Index()
        {
            var context = new WebShopEntities();
            var clientId = UserInfo.GetClientId();
            var isAdmin = UserInfo.IsAdmin();
            var commandes =
                context.Commandes.Where(c => c.COM_CLI_Id == clientId || isAdmin)
                .Select(c => new
                    {
                        Id = c.COM_Id,
                        Date = c.COM_Date,
                        Statut = c.COM_Statut
                    });
            return View(commandes);
        }

        public ActionResult Detail(int id)
        {
            using (var context = new WebShopEntities())
            {
                var model = context.Commandes.Find(id);
                // ReSharper disable once InvertIf
                if (model.COM_CLI_Id != UserInfo.GetClientId() && !UserInfo.IsAdmin())
                {
                    ViewBag.ErrorMessage = "cette commande ne vous appartient pas";
                    return RedirectToAction("Index");
                }

                return PartialView(model);
            }
        }

        
    }
}