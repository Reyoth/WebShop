using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebShop.Domain;

namespace WebShop.Web.Models
{
    public class CommandeViewModel
    {
        public Commande Commande { get; set; }
        public IList<DetailCommande> DetailCommande { get; set; }
    }
}