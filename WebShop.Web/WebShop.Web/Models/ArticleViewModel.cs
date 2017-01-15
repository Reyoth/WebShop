using WebShop.Domain;

namespace WebShop.Web.Models
{
    public class ArticleViewModel
    {
        public Article Article { get; set; }
        public int CategoryId { get; set; }
        public string Category { get; set; }
    }
}