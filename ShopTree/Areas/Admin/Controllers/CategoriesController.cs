using PagedList;
using ShopTree.Models;
using System;
using System.Linq;
using System.Web.Mvc;
using ShopTree.Common;
using ShopTree.Areas.Admin.Models;
using System.IO;

namespace ShopTree.Areas.Admin.Controllers
{
    [Authorize]
    public class CategoriesController : Controller
    {
        private ShopTreeEntities db = new ShopTreeEntities();
        private const int pageSize = Constants.PAGE_SIZE_ADMIN;
        private int pageIndex = 1;

        // GET: Admin/Categories
        public ActionResult AllCategory(int? page)
        {
            ViewBag.Title = "Danh sách danh mục";
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.Categories.ToList();
            IPagedList<Category> pagingCategory = list.ToPagedList(pageIndex, pageSize);
            return View(pagingCategory);
        }

        public ActionResult Create()
        {
            ViewBag.Title = "Tạo mới danh mục";
            return View();
        }

        [HttpPost]
        public ActionResult Create(CategoryViewModel categoryViewModel)
        {
            ViewBag.Title = "Tạo mới danh mục";
            if (ModelState.IsValid)
            {
                string fileName = Path.GetFileNameWithoutExtension(categoryViewModel.ImageFile.FileName);
                string fileExtension = Path.GetExtension(categoryViewModel.ImageFile.FileName);
                fileName = Slug.CreateSlug(categoryViewModel.Name) + fileExtension;

                string path = Path.Combine(Server.MapPath(Constants.CATEGORY_ICON_PATH), fileName);
                categoryViewModel.ImageFile.SaveAs(path);
                Category category = new Category()
                {
                    Name = categoryViewModel.Name,
                    Avatar = Constants.CATEGORY_ICON_PATH + fileName
                };
                db.Categories.Add(category);
                db.SaveChanges();
                return RedirectToAction("AllCategory", "Categories", new { area = "Admin" });
            }
            return View();
        }

        public ActionResult Detail(int id, int? page)
        {
            ViewBag.Title = "Chi tiết danh mục";
            ViewBag.Page = page ?? 1;
            var category = db.Categories.Find(id);
            if(category == null)
            {
                return RedirectToAction("AllCategory", "Categories", new { area = "Admin" });
            }
            return View(category);
        }

        public ActionResult Edit(int id, int? page)
        {
            ViewBag.Title = "Chỉnh sửa danh mục";
            ViewBag.Page = page ?? 1;
            var category = db.Categories.Find(id);
            if (category == null)
            {
                return RedirectToAction("AllCategory", "Categories", new { area = "Admin" });
            }
            CategoryViewModel categoryViewModel = new CategoryViewModel()
            {
                Id = category.Id,
                Name = category.Name,
                ImagePath = category.Avatar
            };
            return View(categoryViewModel);
        }

        [HttpPost]
        public ActionResult Edit(CategoryViewModel categoryViewModel,int page)
        {
            var category = db.Categories.Find(categoryViewModel.Id);
            category.Name = categoryViewModel.Name;
            if (categoryViewModel.ImageFile != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(categoryViewModel.ImageFile.FileName);
                string fileExtension = Path.GetExtension(categoryViewModel.ImageFile.FileName);
                fileName = Slug.CreateSlug(categoryViewModel.Name) + fileExtension;

                string path = Path.Combine(Server.MapPath(Constants.CATEGORY_ICON_PATH), fileName);
                categoryViewModel.ImageFile.SaveAs(path);

                category.Avatar = Constants.CATEGORY_ICON_PATH + fileName;
            }
            db.SaveChanges();
            return RedirectToAction("AllCategory", "Categories", new { area = "Admin" });
        }
    }
}