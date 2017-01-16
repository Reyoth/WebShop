using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebShop.Domain;

namespace WebShop.Web.Models
{
    public class PanierViewModel
    {
        public Article Article { get; set; }
        public int NbArticle { get; set; }
    }
}