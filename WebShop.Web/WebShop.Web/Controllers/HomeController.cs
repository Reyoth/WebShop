using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Domain;
using WebShop.Web.Models;
using X.PagedList;

namespace WebShop.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index( int? page)
        {

            var dbContext = new WebShop.Domain.WebShopEntities();
            var model = dbContext.Articles.OrderBy(a=>a.ART_Libelle);
            ViewBag.listeSouCat = dbContext.SousCategories.ToList();
            ViewBag.listeCat = dbContext.Categories.ToList();
                return View(model);
            
            
           
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}