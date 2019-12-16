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
            pageIndex = page ?? 1;
            var list = db.Orders.ToList();
            IPagedList<Order> pagingOrder = list.ToPagedList(pageIndex, pageSize);
            return View(pagingOrder);
        }

        [Authorize(Roles = "Admin,Employee")]
        public ActionResult ListProcessedOrder(int? page)
        {
            ViewBag.Title = "Đơn hàng đã xử lý";
            pageIndex = page ?? 1;
            var list = db.Orders.Where(o=>o.OrderStatusId != (int)Constants.ORDER_STATUS.WAITING).ToList();
            IPagedList<Order> pagingOrder = list.ToPagedList(pageIndex, pageSize);
            return View(pagingOrder);
        }

        [Authorize(Roles = "Admin,Employee")]
        public ActionResult ListOutstandingOrder(int? page)
        {
            ViewBag.Title = "Đơn hàng chưa xử lý";
            pageIndex = page ?? 1;
            var list = db.Orders.Where(o => o.OrderStatusId == (int)Constants.ORDER_STATUS.WAITING).ToList();
            IPagedList<Order> pagingOrder = list.ToPagedList(pageIndex, pageSize);
            return View(pagingOrder);
        }

        [Authorize(Roles = Constants.ROLE_EMPLOYEE)]
        public ActionResult ProcessOrder(int orderId, int? page)
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
        public ActionResult ProcessOrder(int orderId, int shipperEmployeeId, int? page)
        {
            ViewBag.Title = "Xử lý đơn hàng";
            var orderModel = db.Orders.Find(orderId);
            var processingEmployeeId = db.Employees.Where(e => e.UserName.Equals(User.Identity.Name)).Select(e => e.Id).SingleOrDefault();
            orderModel.ProcessingEmployeeId = processingEmployeeId;
            orderModel.ShipperEmployeeId = shipperEmployeeId;
            orderModel.OrderStatusId = (int)Constants.ORDER_STATUS.DELIVERING;
            db.SaveChanges();
            SendMail.SendMailToCustomerWhenAcceptOrder(orderModel.Customer.Email, orderId);
            if(orderModel.Delivery != null)
            {
                SendMail.SendMailToReceiverWhenAcceptOrder(orderModel.Delivery.Email, orderId);
            }
            return RedirectToAction("AllOrder", "Orders", new { area = "Admin", page });
        }

        [Authorize(Roles = Constants.ROLE_SHIPPER)]
        public ActionResult ListOrderDelivering(int? page)
        {
            ViewBag.Title = "Đơn hàng cần giao";
            pageIndex = page ?? 1;
            var list = db.Orders
                        .Where(o => o.OrderStatusId == (int)Constants.ORDER_STATUS.DELIVERING && o.Employee1.UserName.Equals(User.Identity.Name))
                        .ToList();
            IPagedList<Order> pagingOrder = list.ToPagedList(pageIndex, pageSize);
            return View(pagingOrder);
        }

        [Authorize(Roles = Constants.ROLE_SHIPPER)]
        public ActionResult Delivering(int orderId, int? page)
        {
            var order = db.Orders
                        .Where(o => o.Id == orderId && o.OrderStatusId == (int)Constants.ORDER_STATUS.DELIVERING)
                        .SingleOrDefault();
            if (order == null)
            {
                return RedirectToAction("Delivering", "Orders", new { area = "Admin", page });
            }
            ViewBag.Title = "Mã đơn hàng - " + order.OrderCode;
            ViewBag.ListOrderDetail = db.OrderDetails.Where(od => od.OrderId == orderId).ToList();
            pageIndex = page ?? 1;
            return View(order);
        }

        [Authorize(Roles = Constants.ROLE_SHIPPER)]
        [HttpPost]
        public ActionResult Delivering(int orderId, int orderStatusId, int? page, string cancelReason = null)
        {
            var order = db.Orders.Find(orderId);
            order.DeliveryDate = DateTime.Now;
            order.OrderStatusId = orderStatusId;
            db.SaveChanges();
            if (orderStatusId == (int)Constants.ORDER_STATUS.DELIVERED)
            {
                var listOrderDetail = db.OrderDetails.Where(od => od.OrderId == orderId).ToList();
                foreach (var item in listOrderDetail)
                {
                    var product = db.Products.Find(item.ProductId);
                    product.StockQuantity -= item.Quantity;
                }
                db.SaveChanges();
                SendMail.SendMailToCustomerWhenDelivered(order.Customer.Email, orderId);
                if (order.Delivery != null)
                {
                    SendMail.SendMailToReceiverWhenDelivered(order.Delivery.Email, orderId);
                }
            }
            else if(orderStatusId == (int)Constants.ORDER_STATUS.CANCEL)
            {
                order.CancelReason = cancelReason;
                db.SaveChanges();
                var listOrderDetail = db.OrderDetails.Where(od => od.OrderId == orderId).ToList();
                foreach (var item in listOrderDetail)
                {
                    var product = db.Products.Find(item.ProductId);
                    product.StockQuantity += item.Quantity;
                }
                db.SaveChanges();
                SendMail.SendMailToCustomerWhenCancelOrder(order.Customer.Email, orderId);
            }           
            db.SaveChanges();
            return RedirectToAction("ListOrderDelivering", "Orders", new { area = "Admin", page });
        }

        [Authorize(Roles = "Admin,Employee")]
        public ActionResult Detail(int orderId, string action, int? page)
        {
            var order = db.Orders.Find(orderId);
            if (order == null)
            {
                return RedirectToAction(action, "Orders", new { area = "Admin", page });
            }
            ViewBag.Title = "Chi tiết đơn hàng";
            ViewBag.Page = page ?? 1;
            ViewBag.ListOrderDetail = db.OrderDetails.Where(od => od.OrderId == orderId).ToList();
            ViewBag.Action = action;
            return View(order);
        }
    }
}