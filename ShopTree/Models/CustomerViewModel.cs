using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopTree.Models
{
    public class CustomerViewModel
    {
        public string CustomerName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string ReEnterPasswrod { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
    }
}