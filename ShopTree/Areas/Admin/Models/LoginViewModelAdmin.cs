﻿using System.ComponentModel.DataAnnotations;
using ShopTree.Common;

namespace ShopTree.Areas.Admin.Models
{
    public class LoginViewModelAdmin
    {
        [Required(ErrorMessage = Constants.ERR_REQUIRED_USERNAME)]
        public string UserName { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_PASSWORD)]
        [MinLength(Constants.MIN_LENGTH_PASSWORD, ErrorMessage = Constants.ERR_MIN_LENGTH_PASSWORD)]
        public string Password { get; set; }
    }
}