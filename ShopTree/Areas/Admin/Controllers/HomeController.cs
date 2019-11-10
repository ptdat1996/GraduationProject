using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopTree.Models;
namespace ShopTree.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {        
        [Authorize]
        public ActionResult Index()
        {
            ViewBag.Title = "Trang chủ";
            using (var db = new ShopTreeEntities())
            {
                ViewBag.Name = db.Employees.Where(emp => emp.UserName.Equals(User.Identity.Name)).Select(emp => emp.FullName).SingleOrDefault();
                return View();
            }                
        }
    }
}