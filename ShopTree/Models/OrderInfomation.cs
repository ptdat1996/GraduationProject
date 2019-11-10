using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopTree.Models
{
    public class OrderInfomation
    {
        public string CustomerName { get; set; }
        public string OrderCode { get; set; }
        public DateTime OrderDate { get; set; }
        public string ShippingName { get; set; }
        public string ShippingEmail { get; set; }
        public string ShippingAddress { get; set; }
        public string ShippingPhone { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerAddress { get; set; }
        public string CustomerPhone { get; set; }
        public string Status { get; set; }
        public decimal Total { get; set; }

        public List<OrderDetail> ListOrderDetail { get; set; }
        


    }
}