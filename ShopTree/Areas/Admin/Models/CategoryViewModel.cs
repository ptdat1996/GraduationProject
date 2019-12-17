using System.ComponentModel.DataAnnotations;
using System.Web;
using ShopTree.Common;

namespace ShopTree.Areas.Admin.Models
{
    public class CategoryViewModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage = Constants.ERR_REQUIRED_NAME)]
        public string Name { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_FILE)]
        public HttpPostedFileBase ImageFile { get; set; }

        public string ImagePath { get; set; }
    }
}