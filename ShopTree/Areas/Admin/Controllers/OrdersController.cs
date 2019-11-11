using PagedList;
using ShopTree.Common;
using ShopTree.Models;
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
        private ShopTreeEntities db = new ShopTreeEntities();
        private const int pageSize = Constants.PAGE_SIZE_ADMIN;
        private int pageIndex = 1;

        public ActionResult AllOrder(int? page)
        {
            ViewBag.Title = "Danh sách đơn hàng";
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.Orders.ToList();
            IPagedList<Order> pagingOrder = list.ToPagedList(pageIndex, pageSize);
            return View(pagingOrder);
        }
        
    }
}