using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebShop.Domain;
using WebShop.Web.Models;

namespace WebShop.Web.ApiControllers
{
    public class SubCategoriesController : ApiController
    {
        public object GetSelectList(int parentId, bool withEmpty = false)
        {
            using (var context = new WebShopEntities())
            {
                var categories = context.SousCategories
                    .Where(c => c.SCAT_CAT_Id == parentId)
                    .Select(c => new SelectListItemModel
                    {
                        Id = c.SCAT_Id.ToString(),
                        Value = c.SCAT_Libelle
                    })
                    .ToList();

                var data = new List<SelectListItemModel>();
                if (withEmpty) data.Add(new SelectListItemModel { Id = string.Empty, Value = string.Empty });
                data.AddRange(categories);

                return new
                {
                    Success = true,
                    Data = data
                };
            }
        }
    }
}
