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

        [Authorize(Roles = "Admin,Employee")]
        public ActionResult AllOrder(int? page)
        {
            ViewBag.Title = "Danh sách đơn hàng";
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.Orders.ToList();
            IPagedList<Order> pagingOrder = list.ToPagedList(pageIndex, pageSize);
            return View(pagingOrder);
        }

        [Authorize(Roles = Constants.ROLE_EMPLOYEE)]
        public ActionResult Process(int orderId, int? page)
        {
            var order = db.Orders.Find(orderId);
            if (order == null)
            {
                return RedirectToAction("AllOrder", "Orders", new { area = "Admin", page });
            }
            ViewBag.Title = "Xử lý đơn hàng";
            ViewBag.Page = page ?? 1;
            ViewBag.ListShipper = db.Employees.Where(e => e.Level.Name.Equals("Shipper")).ToList();
            ViewBag.ListOrderDetail = db.OrderDetails.Where(od => od.OrderId == orderId).ToList();
            return View(order);
        }

        [Authorize(Roles = Constants.ROLE_EMPLOYEE)]
        [HttpPost]
        public ActionResult Process(int orderId, int shipperEmployeeId, int? page)
        {
            ViewBag.Title = "Xử lý đơn hàng";
            var orderModel = db.Orders.Find(orderId);
            var processingEmployeeId = db.Employees.Where(e => e.UserName.Equals(User.Identity.Name)).Select(e => e.Id).SingleOrDefault();
            orderModel.ProcessingEmployeeId = processingEmployeeId;
            orderModel.ShipperEmployeeId = shipperEmployeeId;
            orderModel.OrderStatusId = (int)Constants.ORDER_STATUS.DELIVERING;
            db.SaveChanges();
            return RedirectToAction("AllOrder", "Orders", new { area = "Admin", page });
        }

        [Authorize(Roles = Constants.ROLE_SHIPPER)]
        public ActionResult Delivering(int? page)
        {
            ViewBag.Title = "Đơn hàng cần giao";
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.Orders
                        .Where(o => o.OrderStatusId == (int)Constants.ORDER_STATUS.DELIVERING && o.Employee1.UserName.Equals(User.Identity.Name))
                        .ToList();
            IPagedList<Order> pagingOrder = list.ToPagedList(pageIndex, pageSize);
            return View(pagingOrder);
        }
    }
}