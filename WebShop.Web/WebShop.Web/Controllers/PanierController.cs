using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.ApplicationInsights.Extensibility.Implementation;
using WebShop.Domain;
using WebShop.Web.Session;

namespace WebShop.Web.Controllers
{
    public class PanierController : Controller
    {
        // GET: Panier
        public ActionResult Index()
        {
            using (var context = new WebShopEntities())
            {
                var panier = Panier.GetPanier();
                var ids = panier.Select(kvp => kvp.Key);
                var data = context.Articles
                    .Where(a => ids.Contains(a.ART_Id))
                    .ToList();
                DataTable dt = new DataTable("Mon Panier");
                dt.Columns.Add(new DataColumn("Id", typeof(string)));
                dt.Columns.Add(new DataColumn("Libelle", typeof(string)));
                dt.Columns.Add(new DataColumn("Prix", typeof(string)));
                dt.Columns.Add(new DataColumn("Quantité", typeof(string)));
                foreach (var article in data)
                {
                    DataRow row = dt.NewRow();
                    row["Id"] = article.ART_Id;
                    row["Libelle"] = article.ART_Libelle;
                    row["Prix"] = article.ART_Prix;
                    row["Quantité"] = panier[article.ART_Id];
                    dt.Rows.Add(row);

                }
                return View(dt);
            }
        }

        public RedirectToRouteResult AddToPanier(int articleId)
        {
            Panier.AddToPanier(articleId, 1);
            return RedirectToAction("Index", "Panier");
        }

        public RedirectToRouteResult RemoveFromPanier(int articleId)
        {
            Panier.RemoveFromPanier(articleId, 1);
            return RedirectToAction("Index", "Panier");
        }
        public ActionResult CommanderPanier()
        {
            return null;
        }
    }
}
