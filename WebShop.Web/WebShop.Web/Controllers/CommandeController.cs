using System;
using System.Collections.Generic;
using System.Data.Entity;
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
                context.Commandes.Where(c => c.COM_CLI_Id == clientId || isAdmin);
            return View(commandes);
        }

        public ActionResult Detail(int id)
        {
            var context = new WebShopEntities();
            var model = context.Commandes.Find(id);
            model.DetailCommandes = context.DetailCommandes
                .Include(d => d.Article)
                .Where(d => d.DCOM_COM_Id == id).ToList();
            // ReSharper disable once InvertIf
            if (model.COM_CLI_Id != UserInfo.GetClientId() && !UserInfo.IsAdmin())
            {
                ViewBag.ErrorMessage = "cette commande ne vous appartient pas";
                return RedirectToAction("Index");
            }

            return View(model);
        }

        public RedirectToRouteResult SetDelivering(int id)
        {
            using (var context = new WebShopEntities())
            {
                var commande = context.Commandes.Find(id);
                commande.COM_Statut = "Livraison en cours";
                context.SaveChanges();
            }
            return RedirectToAction("Detail", new { id });
        }

        public RedirectToRouteResult SetDelivered(int id)
        {
            using (var context = new WebShopEntities())
            {
                var commande = context.Commandes.Find(id);
                commande.COM_Statut = "Livraison terminée";
                context.SaveChanges();
            }
            return RedirectToAction("Detail", new { id });
        }
    }
}