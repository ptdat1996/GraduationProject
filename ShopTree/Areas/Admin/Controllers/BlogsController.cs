using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopTree.Models;
using ShopTree.Common;
using PagedList;
using ShopTree.Areas.Admin.Models;
using System.IO;

namespace ShopTree.Areas.Admin.Controllers
{
    [Authorize]
    public class BlogsController : Controller
    {
        private ShopTreeEntities db = new ShopTreeEntities();
        private const int pageSize = Constants.PAGE_SIZE_ADMIN;
        private int pageIndex = 1;
             
        // GET: Admin/Blogs
        public ActionResult AllBlog(int? page, string keyword, string sortOrder)
        {
            ViewBag.Title = "Danh sách blog";
            ViewBag.IsSearching = false;
            ViewBag.CurrentSort = sortOrder;
            ViewBag.TitleSortParam = sortOrder == "title_asc" ? "title_desc" : "title_asc";
            ViewBag.DateSortParam = sortOrder == "date_asc" ? "date_desc" : "date_asc";
            ViewBag.ViewSortParam = sortOrder == "view_asc" ? "view_desc" : "view_asc";
            var blogs = db.Blogs.Select(b => b);

            if (!string.IsNullOrEmpty(keyword))
            {
                ViewBag.IsSearching = true;
                ViewBag.Keyword = keyword;
                blogs = blogs.Where(b => b.Title.Contains(keyword));
                if (blogs.Count() > 0)
                {
                    ViewBag.SearchResult = "Có " + blogs.Count() + " kết quả phù hợp";
                }
                else
                {
                    ViewBag.SearchResult = "Không có kết quả phù hợp";
                }
            }
            switch (sortOrder)
            {
                case "title_asc":
                    blogs = blogs.OrderBy(b => b.Title);
                    break;
                case "title_desc":
                    blogs = blogs.OrderByDescending(b => b.Title);
                    break;
                case "date_asc":
                    blogs = blogs.OrderBy(b => b.DatePost);
                    break;
                case "date_desc":
                    blogs = blogs.OrderByDescending(b => b.DatePost);
                    break;
                case "view_asc":
                    blogs = blogs.OrderBy(b => b.View);
                    break;
                case "view_desc":
                    blogs = blogs.OrderByDescending(b => b.View);
                    break;
                default:
                    blogs = blogs.OrderBy(b => b.Id);
                    break;
            }
            pageIndex = page ?? 1;
            return View(blogs.ToList().ToPagedList(pageIndex, pageSize));
        }

        public ActionResult Create()
        {
            ViewBag.Title = "Tạo mới blog";
            return View();
        }

        [HttpPost]
        public ActionResult Create(BlogViewModel blogViewModel)
        {
            ViewBag.Title = "Tạo mới blog";
            if (ModelState.IsValid)
            {
                string fileName = Path.GetFileName(blogViewModel.ImageFile.FileName);
                string fileExtension = Path.GetExtension(blogViewModel.ImageFile.FileName);
                fileName = Slug.CreateSlug(blogViewModel.Title) + fileExtension;

                string path = Path.Combine(Server.MapPath(Constants.BLOG_IMAGE_PATH), fileName);
                blogViewModel.ImageFile.SaveAs(path);
                var empployeeId = db.Employees.Where(e => e.UserName.Equals(User.Identity.Name)).Select(e => e.Id).SingleOrDefault();
                Blog blog = new Blog()
                {
                    Title = blogViewModel.Title,
                    Description = blogViewModel.Description,
                    Priority = blogViewModel.Priority,
                    Avatar = Constants.BLOG_IMAGE_PATH + fileName,
                    View = 1,
                    DatePost = DateTime.Now,
                    EmployeeId = empployeeId
                };
                db.Blogs.Add(blog);
                db.SaveChanges();
                return RedirectToAction("AllBlog", "Blogs", new { area = "Admin" });
            }
            return View(blogViewModel);
        }
    }
}