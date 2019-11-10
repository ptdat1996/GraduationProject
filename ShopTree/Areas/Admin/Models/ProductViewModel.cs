using ShopTree.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopTree.Areas.Admin.Models
{
    public class ProductViewModelAdmin
    {
        public int Id { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_NAME)]
        public string Name { get; set; }

        public int CategoryId { get; set; }

        public string CategoryName { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_PRICE)]
        public decimal Price { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_DESCRIPTION)]
        public string Description { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_STOCKQUANTITY)]
        public long StockQuantity { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_VIEWS)]
        public long Views { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_PRIORITY)]
        public int Priority { get; set; }

        [Range(0, 100, ErrorMessage = Constants.ERR_VALUE_DISCOUNT)]
        public int Discount { get; set; }

        public bool Status { get; set; }

        public string Avatar { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_FILE)]
        public HttpPostedFileBase ImageFile { get; set; }
    }
}