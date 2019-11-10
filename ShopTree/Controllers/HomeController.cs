using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopTree.Models;
namespace ShopTree.Controllers
{
    public class HomeController : Controller
    {
        private ShopTreeEntities db = new ShopTreeEntities();

        public ActionResult Index()
        {
            ViewBag.Title = "Fairy Garden";
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Title = "Về chúng tôi";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Title = "Liên hệ";

            return View();
        }

        public ActionResult PaymentGuide()
        {
            ViewBag.Title = "Hướng dẫn thanh toán";
            return View();
        }

        public ActionResult ShoppingGuide()
        {
            ViewBag.Title = "Hướng dẫn mua hàng";
            return View();
        }

        public ActionResult TraddingAccount()
        {
            ViewBag.Title = "Tài khoản giao dịch";
            return View();
        }

        public ActionResult Return()
        {
            ViewBag.Title = "Giao hàng - Đổi trả";
            return View();
        }

        public ActionResult Security()
        {
            ViewBag.Title = "Chính sách bảo mật";
            return View();
        }

        [ChildActionOnly]
        public ActionResult Categories()
        {
            var categories = db.Categories.Take(10).ToList();
            return PartialView("_Categories", categories);
        }

        [ChildActionOnly]
        public ActionResult _BlogFooter()
        {
            var blogs = db.Blogs.OrderByDescending(b => b.Priority).Take(6).ToList();
            return PartialView("_BlogFooter", blogs);
        }

        [ChildActionOnly]
        public ActionResult _BlogSideBar()
        {
            var blogs = db.Blogs.Take(5).ToList();
            return PartialView("_BlogSideBar", blogs);
        }

        [ChildActionOnly]
        public ActionResult _CategoriesRight()
        {
            var list = db.Categories.Take(10).ToList();
            return PartialView("_CategoriesRight", list);
        }
    }
}