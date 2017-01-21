using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.ApplicationInsights.Extensibility.Implementation;
using WebShop.Domain;
using WebShop.Web.Models;
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
                dt.Columns.Add(new DataColumn("Total", typeof(string)));
                foreach (var article in data)
                {
                    DataRow row = dt.NewRow();
                    row["Id"] = article.ART_Id;
                    row["Libelle"] = article.ART_Libelle;
                    row["Prix"] = article.ART_Prix;
                    row["Quantité"] = panier[article.ART_Id];
                    row["Total"] = article.ART_Prix*panier[article.ART_Id];
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

        [Authorize]
        public ViewResult CommanderPanier()
        {
            using (var context = new WebShopEntities())
            {
                var client = context.Clients.Find(UserInfo.GetClientId());
                var model = new Commande
                {
                    COM_CLI_Id = client.CLI_Id,
                    COM_Nom = client.CLI_Nom,
                    COM_Prenom = client.CLI_Prenom,
                    COM_Civilite = client.CLI_Civilite,
                    COM_Adresse = client.CLI_Adresse,
                    COM_CodePostal = client.CLI_CodePostal,
                    COM_Ville = client.CLI_Ville,
                    COM_DateLivDesiree = DateTime.Now.AddDays(2)
                };

                return View(model);
            }
        }

        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public ActionResult CommanderPanier(Commande model)
        {
            if (!ModelState.IsValid) return View(model);

            using (var context = new WebShopEntities())
            {
                model.COM_Date = DateTime.Now;
                model.COM_Statut = "En attente";
                context.Commandes.Add(model);

                var panier = Panier.GetPanier();
                foreach (var kvp in panier)
                {
                    var article = context.Articles.Find(kvp.Key);
                    var detailCommande = new DetailCommande
                    {
                        DCOM_COM_Id = model.COM_Id,
                        DCOM_ART_Id = article.ART_Id,
                        DCOM_Quantite = kvp.Value,
                        DCOM_PrixUnitaire = article.ART_Prix
                    };
                    model.DetailCommandes.Add(detailCommande);
                }
                context.SaveChanges();
            }

            Panier.ClearPanier();

            return RedirectToAction("Index", "Home");
        }
    }
}
