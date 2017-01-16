using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebShop.Domain;
using WebShop.Web.Models;

namespace WebShop.Web.ApiControllers
{
    public class CategoriesController : ApiController
    {
        public object GetSelectList(bool withEmpty = false, bool withAll = false)
        {
            using (var context = new WebShopEntities())
            {
                var categories = context.Categories
                    .Select(c => new SelectListItemModel
                    {
                        Id = c.CAT_Id.ToString(),
                        Value = c.CAT_Libelle
                    })
                    .ToList();

                var data = new List<SelectListItemModel>();
                if (withEmpty) data.Add(new SelectListItemModel { Id = string.Empty, Value = "-1" });
                if (withAll) data.Add(new SelectListItemModel { Id = "Tous", Value = "-2" });
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
