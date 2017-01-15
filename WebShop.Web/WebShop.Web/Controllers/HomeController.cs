using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Domain;
using X.PagedList;

namespace WebShop.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index( int? page)
        {

            var dbContext = new WebShop.Domain.WebShopEntities();
            
                var model = dbContext.Articles.OrderBy(a=>a.ART_Libelle);
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