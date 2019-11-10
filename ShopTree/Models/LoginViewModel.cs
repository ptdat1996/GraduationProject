using ShopTree.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopTree.Models
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = Constants.ERR_REQUIRED_EMAIL)]
        [EmailAddress(ErrorMessage = Constants.ERR_INVALID_EMAIL)]
        public string Email { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_PASSWORD)]
        public string Password { get; set; }
    }
}