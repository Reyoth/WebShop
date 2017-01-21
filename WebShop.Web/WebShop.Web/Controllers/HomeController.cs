using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Domain;
using WebShop.Web.Models;
using WebShop.Web.Session;
using X.PagedList;

namespace WebShop.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index( int? page)
        {
            var cat = SearchMemory.GetCategoryId();
            var subCat = SearchMemory.GetSubCategoryId();
            var dbContext = new WebShop.Domain.WebShopEntities();
            var model = dbContext.Articles.OrderBy(a=>a.ART_Libelle)
                .Where(a=>a.ART_SCAT_Id == subCat || subCat==-2 && a.SousCategorie.SCAT_CAT_Id == cat || cat == -2);
            if (UserInfo.IsAdmin())
            {
                return View("IndexAdmin", model);
            }
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
        [HttpGet]
        public JsonResult Search(int categoryId, int subCategoryId)
        {
            SearchMemory.SaveSearch(categoryId, subCategoryId);
            var context = new WebShopEntities();
            var articles = context.Articles
                .Include(a => a.SousCategorie)
                .Where(a => (a.ART_SCAT_Id == subCategoryId || subCategoryId == -2)
                            && (a.SousCategorie.SCAT_CAT_Id == categoryId || categoryId == -2))
                .Select(a => new
                {
                    a.ART_Id,
                    a.ART_Libelle,
                    a.ART_Prix,
                    a.ART_Image,
                    a.ART_Stock
                })
                .ToArray();
            return Json(articles, JsonRequestBehavior.AllowGet);
        }
    }
}