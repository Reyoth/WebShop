using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using WebShop.Domain;

namespace WebShop.Web.Controllers
{
    public class CommandeController : Controller
    {
        // GET: Commande
        public ActionResult Index()
        {
            using (var context = new WebShopEntities())
            {
                var commandes =
                    context.Commandes.Where(c => c.COM_CLI_Id = System.Web.HttpContext.Current.User.Identity.GetUserId());
                var lstcommandes = new {id = commandes.COM_Id, date = commandes.COM_Date, statut = commandes.COM_Statut};
                return View(lstcommandes);
            }
        }

        public ActionResult Detail()
        {
            using (var context = new WebShopEntities())
            {
                return null;
            }
        }

        
    }
}