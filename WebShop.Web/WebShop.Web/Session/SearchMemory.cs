using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebShop.Web.Session
{
    public class SearchMemory
    {
        public static int GetCategoryId()
        {
            var categoryId = HttpContext.Current.Session["CategoryId"];
            return (int?) categoryId ?? -2;
        }

        public static int GetSubCategoryId()
        {
            var subCategoryId = HttpContext.Current.Session["SubCategoryId"];
            return (int?)subCategoryId ?? -2;
        }

        public static void SaveSearch(int categoryId, int subCategoryId)
        {
            HttpContext.Current.Session["CategoryId"] = categoryId;
            HttpContext.Current.Session["SubCategoryId"] = subCategoryId;
        }
    }
}