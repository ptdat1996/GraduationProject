using ShopTree.Common;
using System.ComponentModel.DataAnnotations;

namespace ShopTree.Areas.Admin.Models
{
    public class ChangePasswordViewModel
    {
        [Required(ErrorMessage = Constants.ERR_REQUIRED_PASSWORD)]
        [MinLength(Constants.MIN_LENGTH_PASSWORD, ErrorMessage = Constants.ERR_MIN_LENGTH_PASSWORD)]
        public string OldPassword { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_NEWPASSWORD)]
        [MinLength(Constants.MIN_LENGTH_PASSWORD, ErrorMessage = Constants.ERR_MIN_LENGTH_PASSWORD)]
        public string NewPassword { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_RENEWPASSWORD)]
        [Compare("NewPassword", ErrorMessage = Constants.ERR_COMPARE_TWO_NEWPASSWORD)]
        public string ReNewPassword { get; set; }
    }
}