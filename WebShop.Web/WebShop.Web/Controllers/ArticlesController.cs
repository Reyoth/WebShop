using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Domain;
using WebShop.Web.Models;

namespace WebShop.Web.Controllers
{
    public class ArticlesController : Controller
    {
        public PartialViewResult Detail(int id)
        {
            using (var context = new WebShopEntities())
            {
                var article = context.Articles.Find(id);
                var model = new ArticleViewModel
                {
                    Article = article,
                    CategoryId = article.SousCategorie.SCAT_CAT_Id,
                    Category = article.SousCategorie.Categorie.CAT_Libelle
                };
                return PartialView(model);
            }
        }

        [HttpGet]
        [Authorize]
        public ViewResult Create()
        {
            var model = new ArticleViewModel {Article = new Article()};
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create(ArticleViewModel model)
        {
            if (!ModelState.IsValid) return View(model);

            using (var context = new WebShopEntities())
            {
                context.Articles.Add(model.Article);
                context.SaveChanges();
            }

            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        [Authorize]
        public PartialViewResult Edit(int id)
        {
            using (var context = new WebShopEntities())
            {
                var article = context.Articles.Find(id);
                var model = new ArticleViewModel
                {
                    Article = article,
                    CategoryId = article.SousCategorie.SCAT_CAT_Id
                };
                return PartialView(model);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Edit(ArticleViewModel model)
        {
            using (var context = new WebShopEntities())
            {
                context.Articles.Attach(model.Article);
                context.Entry(model.Article).State = EntityState.Modified;
                context.SaveChanges();
            }

            return RedirectToAction("Index", "Home");
        }

        [Authorize]
        [HttpPost]
        public ActionResult Delete(int id)
        {
            using (var context = new WebShopEntities())
            {
                var model = context.Articles.Find(id);
                context.Entry(model).State = EntityState.Deleted;
                context.SaveChanges();
            }

            return RedirectToAction("Index", "Home");
        }
    }
}