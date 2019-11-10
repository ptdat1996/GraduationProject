using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopTree.Controllers
{
    public class ErrorController : Controller
    {
        // GET: Error
        public ActionResult NotFound()
        {
            ViewBag.Title = "404 - Not Found";
            return View();
        }

        public ActionResult InternalServer()
        {
            ViewBag.Title = "500 - Internal Server Error";
            return View();
        }
    }
}