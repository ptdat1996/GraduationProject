using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopTree.Models;
using PagedList;
using System.Data.Entity;
using ShopTree.Common;
using System.IO;
using ShopTree.Areas.Admin.Models;

namespace ShopTree.Areas.Admin.Controllers
{
    [Authorize]
    public class ProductsController : Controller
    {
        private ShopTreeEntities db = new ShopTreeEntities();
        private const int pageSize = Constants.PAGE_SIZE_ADMIN;
        private int pageIndex = 1;

        // GET: Admin/Products
        public ActionResult AllProduct(int? page, string sortOrder, string keyword)
        {
            ViewBag.Title = "Danh sách sản phẩm";
            ViewBag.IsSearching = false;
            ViewBag.CurrentSort = sortOrder;
            ViewBag.CategorySortParam = sortOrder == "category_asc" ? "category_desc" : "category_asc";
            var products = db.Products.Select(p => p);

            if (!string.IsNullOrEmpty(keyword))
            {
                ViewBag.IsSearching = true;
                ViewBag.Keyword = keyword;
                products = products.Where(p => p.Name.Contains(keyword));
                if (products.Count() > 0)
                {
                    ViewBag.SearchResult = "Có " + products.Count() + " kết quả phù hợp";
                }
                else
                {
                    ViewBag.SearchResult = "Không có kết quả phù hợp";
                }
            }
            switch (sortOrder)
            {
                case "name_asc":
                    products = products.OrderBy(p => p.Name);
                    break;
                case "name_desc":
                    products = products.OrderByDescending(p => p.Name);
                    break;
                case "category_asc":
                    products = products.OrderBy(p => p.CategoryId);
                    break;
                case "category_desc":
                    products = products.OrderByDescending(p => p.CategoryId);
                    break;
                case "price_asc":
                    products = products.OrderBy(p => p.Price);
                    break;
                case "price_desc":
                    products = products.OrderByDescending(p => p.Price);
                    break;
                default:
                    products = products.OrderBy(p => p.Id);
                    break;
            }
            pageIndex = page ?? 1;
            return View(products.ToList().ToPagedList(pageIndex, pageSize));
        }

        public ActionResult Create()
        {
            ViewBag.Title = "Tạo sản phẩm";
            ViewBag.CategoryList = db.Categories.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Create(ProductViewModelAdmin productViewModel)
        {
            ViewBag.Title = "Tạo mới sản phẩm";
            if (ModelState.IsValid)
            {
                string fileName = Path.GetFileNameWithoutExtension(productViewModel.ImageFile.FileName);
                string fileExtension = Path.GetExtension(productViewModel.ImageFile.FileName);

                fileName = Slug.CreateSlug(productViewModel.Name) + fileExtension;

                string path = Path.Combine(Server.MapPath(Constants.PRODUCT_IMAGE_PATH), fileName);
                productViewModel.ImageFile.SaveAs(path);

                Product product = new Product()
                {
                    Name = productViewModel.Name,
                    CategoryId = productViewModel.CategoryId,
                    Price = productViewModel.Price,
                    Description = productViewModel.Description,
                    StockQuantity = productViewModel.StockQuantity,
                    Views = productViewModel.Views,
                    Priority = productViewModel.Priority,
                    Discount = productViewModel.Discount,
                    Status = productViewModel.Status,
                    Avatar = Constants.PRODUCT_IMAGE_PATH + fileName
                };

                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("AllProduct", "Products", new { area = "Admin" });
            }
            return View(productViewModel);
        }

        public ActionResult Detail(int id, int? page)
        {
            ViewBag.Title = "Chi tiết sản phẩm";
            ViewBag.Page = page.HasValue ? page : 1;
            var product = db.Products.Find(id);
            return View(product);
        }

        public ActionResult Edit(int id, int? page)
        {
            ViewBag.Title = "Chỉnh sửa sản phẩm";
            ViewBag.Page = page ?? 1;
            var product = db.Products.Find(id);
            if(product == null)
            {
                return RedirectToAction("AllProduct", "Products", new { area = "Admin" });
            }
            ProductViewModelAdmin productViewModel = new ProductViewModelAdmin()
            {
                Id = product.Id,
                Name = product.Name,
                CategoryId = product.CategoryId.Value,
                CategoryName = product.Category.Name,
                Price = product.Price,
                Description = product.Description,
                StockQuantity = product.StockQuantity,
                Views = product.Views,
                Priority = product.Priority,
                Discount = product.Discount,
                Status = product.Status,
                Avatar = product.Avatar
            };
            ViewBag.CategoryList = db.Categories.ToList();
            return View(productViewModel);
        }

        [HttpPost]
        public ActionResult Edit(ProductViewModelAdmin productViewModel, int page)
        {
            var product = db.Products.Find(productViewModel.Id);
            product.Name = productViewModel.Name;
            product.Price = productViewModel.Price;
            product.Description = productViewModel.Description;
            product.StockQuantity = productViewModel.StockQuantity;
            product.Views = productViewModel.Views;
            product.Priority = productViewModel.Priority;
            product.Discount = productViewModel.Discount;
            product.Status = productViewModel.Status;
            product.CategoryId = productViewModel.CategoryId;
            if (productViewModel.ImageFile != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(productViewModel.ImageFile.FileName);
                string fileExtension = Path.GetExtension(productViewModel.ImageFile.FileName);
                fileName = Slug.CreateSlug(productViewModel.Name) + fileExtension;

                string path = Path.Combine(Server.MapPath(Constants.PRODUCT_IMAGE_PATH), fileName);
                productViewModel.ImageFile.SaveAs(path);

                product.Avatar = Constants.PRODUCT_IMAGE_PATH + fileName;
            }
            db.SaveChanges();
            return RedirectToAction("AllProduct", "Products", new { area = "Admin", page });
        }

        [Authorize(Roles = Constants.ROLE_ADMIN)]
        public ActionResult Delete(int id, int page)
        {
            var product = db.Products.Find(id);
            product.Status = !product.Status;
            db.SaveChanges();
            return RedirectToAction("AllProduct", "Products", new { area = "Admin", page });
        }
       
        [Authorize(Roles = Constants.ROLE_ADMIN)]
        [ActionName("DeletedProduct")]
        public ActionResult ShowDeletedProduct(int? page)
        {
            ViewBag.Title = "Sản phẩm đã xoá";
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.Products.Where(p => p.Status == false).ToList();
            IPagedList<Product> pagingProduct = list.ToPagedList(pageIndex, pageSize);
            return View(pagingProduct);
        }

        [Authorize(Roles = Constants.ROLE_ADMIN)]
        public ActionResult ActiveProduct(int id, int page)
        {
            var product = db.Products.Find(id);
            product.Status = !product.Status;
            db.SaveChanges();
            return RedirectToAction("DeletedProduct", "Products", new { area = "Admin", page });
        }
    }
}