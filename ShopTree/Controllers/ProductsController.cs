using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopTree.Models;
using PagedList;
using ShopTree.Common;

namespace ShopTree.Controllers
{
    public class ProductsController : Controller
    {
        private ShopTreeEntities db = new ShopTreeEntities();
        private const int pageSize = Constants.PAGE_SIZE_CLIENT;
        private int pageIndex = 1;
        
        public ActionResult _ProductItem(ProductViewModel item)
        {
            return PartialView("_ProductItem", item);
        }

        [HandleError]
        public ActionResult AllProduct(int? page)
        {
            ViewBag.Title = "Sản phẩm";
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;           
            IPagedList<ProductViewModel> pagingProduct = null;
            var list = db.Products.Where(p => p.Status == true)
                                  .OrderByDescending(p => p.Priority)
                                  .Select(product => new ProductViewModel()
                                  {
                                      ProductId = product.Id,
                                      ProductName = product.Name,
                                      SellPrice = product.Price,
                                      Avatar = product.Avatar
                                  }).ToList();
            pagingProduct = list.ToPagedList(pageIndex, pageSize);
            if(pagingProduct.PageCount < page)
            {
                return View();
            }
            return View(pagingProduct);
        }

        [HandleError]
        public ActionResult Detail(int id)
        { 
            var product = db.Products.Where(p => p.Id == id && p.Status == true).SingleOrDefault();
            if(product == null)
            {
                return View();
            }
            product.Views = product.Views + 1;
            db.SaveChanges();
            ProductViewModel productView = new ProductViewModel()
            {
                ProductId = product.Id,
                ProductName = product.Name,
                SellPrice = product.Price,
                Avatar = product.Avatar,
                Description = product.Description,
                CategoryName = product.Category.Name,
                CategoryId = product.CategoryId.Value,
                Quantity = product.StockQuantity,
                View = product.Views
            };
            ViewBag.Title = product.Name;
            return View(productView);
        }

        public ActionResult Search(string keyword)
        {
            ViewBag.Title = "Kết quả";
            if (string.IsNullOrEmpty(keyword))
            {
                return RedirectToAction("AllProduct", "Products");
            }
            else
            {
                var productList = db.Products.Where(p => p.Name.Contains(keyword) && p.Status == true)
                                             .OrderByDescending(p => p.Priority)
                                             .Select(product => new ProductViewModel()
                                             {
                                                 ProductId = product.Id,
                                                 ProductName = product.Name,
                                                 SellPrice = product.Price,
                                                 Avatar = product.Avatar
                                             }).ToList();
                if (productList.Count > 0)
                {
                    //have a result
                    return View("SearchResult", productList);
                }
                else
                {
                    //no result match
                    ViewBag.Message = "Không có kết quả phù hợp";
                    return View("SearchResult", null);
                }
            }
        }

        public ActionResult GetProductByCategoryId(int id)
        {
            ViewBag.Title = db.Categories.Find(id).Name;
            var productList = (from product in db.Products                              
                               where product.CategoryId == id
                               orderby product.Priority descending
                               select new ProductViewModel()
                               {
                                   ProductId = product.Id,
                                   ProductName = product.Name,
                                   SellPrice = product.Price,
                                   Avatar = product.Avatar,
                                   CategoryName = product.Category.Name
                               }).ToList();
            return View("ListProductByCategoryId",productList);
        }

        public ActionResult _RelationProduct(int categoryId,int productId)
        {
            var relationProduct = (from product in db.Products                                  
                                   where product.CategoryId == categoryId && product.Id != productId
                                   orderby product.Priority descending
                                   select new ProductViewModel()
                                   {
                                       ProductId = product.Id,
                                       ProductName = product.Name,
                                       SellPrice = product.Price,
                                       Avatar = product.Avatar
                                   }).Take(12).ToList();
            return PartialView("_RelationProduct", relationProduct);
        }

        public ActionResult _ProductList(int categoryId)
        {
            var list = (from product in db.Products                       
                        where product.CategoryId == categoryId && product.Status == true
                        orderby product.Priority
                        select new ProductViewModel()
                        {
                            ProductId = product.Id,
                            ProductName = product.Name,
                            SellPrice = product.Price,
                            Avatar = product.Avatar
                        }).Take(8).ToList();
            return PartialView("_ProductList", list);
        }
    }
}