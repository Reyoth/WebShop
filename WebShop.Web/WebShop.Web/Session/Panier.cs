using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebShop.Web.Session
{
    public static class Panier
    {
        // Clé => id article, valeur => quantité
        public static Dictionary<int, int> GetPanier()
        {
            var panier = HttpContext.Current.Session["Panier"] as Dictionary<int, int>;
            return panier ?? new Dictionary<int, int>();
        }

        public static void AddToPanier(int articleId, int quantity)
        {
            var panier = GetPanier();
            if (panier.ContainsKey(articleId))
            {
                panier[articleId] += quantity;
            }
            else
            {
                panier.Add(articleId, quantity);
            }
            HttpContext.Current.Session["Panier"] = panier;
        }

        public static void RemoveFromPanier(int articleId, int quantity)
        {
            var panier = GetPanier();
            if (panier.ContainsKey(articleId))
            {
                panier[articleId] -= quantity;
                if (panier[articleId] <= 0)
                    panier.Remove(articleId);
            }
            HttpContext.Current.Session["Panier"] = panier;
        }
    }
}