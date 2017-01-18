using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using WebShop.Domain;

namespace WebShop.Web.ApiControllers
{
    public class ArticlesController : ApiController
    {
        public object GetArticles(int categoryId, int subCategoryId)
        {
            var context = new WebShopEntities();
            var articles = context.Articles
                .Include(a => a.SousCategorie)
                .Where(a => (a.ART_SCAT_Id == subCategoryId || subCategoryId == -2)
                            && (a.SousCategorie.SCAT_CAT_Id == categoryId || categoryId == -2))
                .ToList();
            return new { success = true, data = articles };
        }
    }
}
