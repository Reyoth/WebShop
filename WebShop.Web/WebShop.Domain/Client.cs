//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebShop.Domain
{
    using System;
    using System.Collections.Generic;
    
    public partial class Client
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Client()
        {
            this.Commandes = new HashSet<Commande>();
        }
    
        public int CLI_Id { get; set; }
        public string CLI_Nom { get; set; }
        public string CLI_Prenom { get; set; }
        public string CLI_Civilite { get; set; }
        public string CLI_Email { get; set; }
        public string CLI_Adresse { get; set; }
        public string CLI_CodePostal { get; set; }
        public string CLI_Ville { get; set; }
        public string CLI_Telephone { get; set; }
        public string CLI_AspNetUsersId { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Commande> Commandes { get; set; }
    }
}
