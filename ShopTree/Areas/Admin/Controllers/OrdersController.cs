using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopTree.Areas.Admin.Controllers
{
    [Authorize]
    public class OrdersController : Controller
    {
        // GET: Admin/Orders
        public ActionResult Index()
        {
            return View();
        }
    }
}