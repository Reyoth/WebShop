using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebShop.Web.Utils
{
    public static class SelectLists
    {
        public class SelectListItem
        {
            public string Value { get; set; }
            public string Label { get; set; }
        }

        public static SelectList GetCiviliteList(string selected = null)
        {
            var data = new List<SelectListItem>
            {
                new SelectListItem {Value = "Monsieur", Label = "Monsieur"},
                new SelectListItem {Value = "Madame", Label = "Madame"}
            };
            return new SelectList(data, "Value", "Label", selected);
        }
    }
}