using System.ComponentModel.DataAnnotations;
using System.Web;
using ShopTree.Common;

namespace ShopTree.Areas.Admin.Models
{
    public class BlogViewModel
    {
        public int Id { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_TITLE)]
        public string Title { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_DESCRIPTION)]
        public string Description { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_FILE)]
        public HttpPostedFileBase ImageFile { get; set; }

        public string ImagePath { get; set; }

        public int Priority { get; set; }
    }
}