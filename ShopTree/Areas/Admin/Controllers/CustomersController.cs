using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopTree.Areas.Admin.Controllers
{
    [Authorize]
    public class CustomersController : Controller
    {
        // GET: Admin/Customers
        public ActionResult Index()
        {
            return View();
        }
    }
}