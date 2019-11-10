using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopTree.Models
{
    public class OrderViewModel
    {
        public string CustomerName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Description { get; set; }
        public string Address { get; set; }

        public int PaymentMethodIdView { get; set; }

        public string DeliveryName { get; set; }
        public string DeliveryPhone { get; set; }
        public string DeliveryEmail { get; set; }
        public string DeliveryAdress { get; set; }

        public string CartData { get; set; }
    }
}