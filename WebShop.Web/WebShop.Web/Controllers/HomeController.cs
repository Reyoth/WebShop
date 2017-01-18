using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            return View(model);
            
            
           
        }

        public JsonResult Articles()
        {
            var dbContext = new WebShop.Domain.WebShopEntities();
            var model = dbContext.Articles.OrderBy(a => a.ART_Libelle);
            var ajaxGridFactory = new Grid.Mvc.Ajax.GridExtensions.AjaxGridFactory();
            var grid = ajaxGridFactory.CreateAjaxGrid(model, 1, true);
            return Json(grid, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ArticlesPaged(int page)
        {
            var dbContext = new WebShop.Domain.WebShopEntities();
            var model = dbContext.Articles.OrderBy(a => a.ART_Libelle);
            var ajaxGridFactory = new Grid.Mvc.Ajax.GridExtensions.AjaxGridFactory();
            var grid = ajaxGridFactory.CreateAjaxGrid(model, page, true);
            return Json(grid, JsonRequestBehavior.AllowGet);
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
            var context = new WebShopEntities();
            var articles = context.Articles
                .Include(a => a.SousCategorie)
                .Where(a => (a.ART_SCAT_Id == subCategoryId || subCategoryId == -2)
                            && (a.SousCategorie.SCAT_CAT_Id == categoryId || categoryId == -2))
                .ToList();
            return Json(new {articles}, JsonRequestBehavior.AllowGet);
        }
    }
}