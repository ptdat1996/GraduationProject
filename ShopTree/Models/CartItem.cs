﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopTree.Models
{
    public class CartItem
    {
        public int productId { get; set; }
        public string productName { get; set; }
        public int quantity { get; set; }
        public long price { get; set; }
        public string imageUrl { get; set; }
    }
}