using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopTree.Models;

namespace ShopTree.Controllers
{
    public class BlogsController : Controller
    {
        private ShopTreeEntities db = new ShopTreeEntities();
        public ActionResult Index()
        {
            ViewBag.Title = "Blogs";
            var blogs = db.Blogs.ToList();
            return View("AllBlog", blogs);
        }

        [HandleError]
        public ActionResult Detail(int id)
        {
            var blog = db.Blogs.Find(id);
            if(blog == null)
            {
                return View();
            }
            ViewBag.Title = blog.Title;
            return View(blog);
        }
    }
}