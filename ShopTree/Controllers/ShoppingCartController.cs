using ShopTree.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using ShopTree.Common;

namespace ShopTree.Controllers
{
    public class ShoppingCartController : Controller
    {
        private ShopTreeEntities db = new ShopTreeEntities();

        // GET: ShoppingCart
        public ActionResult ViewCart()
        {
            ViewBag.Title = "Giỏ hàng";
            return View("Cart");
        }

        public ActionResult Checkout()
        {
            ViewBag.Title = "Thanh toán";
            OrderViewModel orderViewModel = new OrderViewModel();
            if (Session["CustomerId"] != null)
            {
                int id = Convert.ToInt32(Session["CustomerId"].ToString());
                var customer = db.Customers.Where(cus => cus.Id == id).Select(cus => cus).FirstOrDefault();
                orderViewModel.CustomerName = customer.Name;
                orderViewModel.Email = customer.Email;
                orderViewModel.Phone = customer.Phone;
                orderViewModel.Address = customer.Address;
            }
            return View(orderViewModel);
        }

        [HttpPost]
        public ActionResult Checkout(OrderViewModel orderViewModel)
        {
            try
            {
                Order order = new Order();
                order.Discount = 0;
                order.Tax = 0;
                order.OrderDate = DateTime.Now;
                db.Orders.Add(order);
                db.SaveChanges();

                long totalMoney = 0;

                if (!string.IsNullOrEmpty(orderViewModel.DeliveryEmail))
                {
                    Delivery delivery = new Delivery()
                    {
                        Name = orderViewModel.DeliveryName,
                        Email = orderViewModel.DeliveryEmail,
                        Phone = orderViewModel.DeliveryPhone,
                        Address = orderViewModel.DeliveryAdress
                    };
                    db.Deliveries.Add(delivery);
                    db.SaveChanges();
                    order.DeliveryId = delivery.Id;
                }

                List<CartItem> shoppingCart = JsonConvert.DeserializeObject<List<CartItem>>(orderViewModel.CartData);
                foreach (var item in shoppingCart)
                {
                    OrderDetail detail = new OrderDetail()
                    {
                        ProductId = item.productId,
                        Quantity = item.quantity,
                        Price = item.price,
                        Tax = 0,
                        Discount = 0,
                        OrderId = order.Id
                    };
                    totalMoney += item.quantity * item.price;
                    db.OrderDetails.Add(detail);
                    db.SaveChanges();

                    var product = db.Products.Find(item.productId);
                    product.StockQuantity -= item.quantity;
                    db.SaveChanges();
                }
                Customer customer;
                if (Session["CustomerId"] == null)
                {
                    //not login
                    customer = new Customer()
                    {
                        Name = orderViewModel.CustomerName,
                        Email = orderViewModel.Email,
                        Phone = orderViewModel.Phone,
                        Address = orderViewModel.Address,
                        TotalMoney = totalMoney
                    };
                    db.Customers.Add(customer);
                    db.SaveChanges();
                    order.CustomerId = customer.Id;
                }
                else
                {
                    //login
                    customer = db.Customers.Find(Convert.ToInt32(Session["CustomerId"].ToString()));
                    order.CustomerId = customer.Id;
                }

                order.PaymentMethodId = orderViewModel.PaymentMethodIdView;
                order.Total = totalMoney;
                order.OrderStatusId = 1;
                order.OrderCode = GenerateOrderCode(customer.Id, order.Id);
                db.SaveChanges();
                return View("PaymentSuccess", order);
            }
            catch
            {
                return View("Error");
            }

        }

        public ActionResult CheckOrderWithoutLogin()
        {
            ViewBag.Title = "Kiểm tra đơn hàng";
            ViewBag.OrderCode = "";
            return View();
        }

        [HttpPost]
        public ActionResult CheckOrderWithoutLogin(string orderCode)
        {
            ViewBag.Title = "Kiểm tra đơn hàng";

            var orderDB = (from order in db.Orders
                           where order.OrderCode.Equals(orderCode)
                           select order).FirstOrDefault();
            if (orderDB != null)
            {
                //found order
                ViewBag.OrderCode = orderCode;
                var list = db.OrderDetails.Where(order => order.Order.OrderCode.Equals(orderCode)).ToList();
                OrderInfomation orderInfomation = new OrderInfomation()
                {
                    OrderCode = orderCode,
                    OrderDate = orderDB.OrderDate,
                    CustomerName = orderDB.Customer.Name,
                    CustomerEmail = orderDB.Customer.Email,
                    CustomerPhone = orderDB.Customer.Phone,
                    CustomerAddress = orderDB.Customer.Address,
                    Status = orderDB.OrderStatus.Status,
                    Total = orderDB.Total,
                    ListOrderDetail = list
                };
                if (orderDB.Delivery == null)
                {
                    //no shipping
                    return View(orderInfomation);
                }
                else
                {
                    //have shiping
                    orderInfomation.DeliveryName = orderDB.Delivery.Name;
                    orderInfomation.DeliveryEmail = orderDB.Delivery.Email;
                    orderInfomation.DeliveryPhone = orderDB.Delivery.Phone;
                    orderInfomation.DeliveryAddress = orderDB.Delivery.Address;
                    return View(orderInfomation);
                }
            }
            else
            {
                //order not found
                ViewBag.Message = "Cannot find your order code, please try again!";
                ViewBag.OrderCode = orderCode;
                return View();
            }
        }

        public ActionResult CheckOrder()
        {
            if (Session["CustomerId"] == null)
            {
                return RedirectToAction("Login", "Customers");
            }
            else
            {
                ViewBag.Title = "Theo dõi đơn hàng";
                int id = Convert.ToInt32(Session["CustomerId"].ToString());
                var order = db.Orders.Where(ord => ord.CustomerId == id).ToList();
                return View(order);
            }
        }

        public ActionResult ViewOrderDetail(int orderId)
        {
            ViewBag.Title = "Chi tiết đơn hàng";

            var orderDB = (from order in db.Orders
                           where order.Id == orderId
                           select order).FirstOrDefault();

            //found order
            var list = db.OrderDetails.Where(order => order.OrderId == orderId).ToList();
            OrderInfomation orderInfomation = new OrderInfomation()
            {
                OrderCode = orderDB.OrderCode,
                OrderDate = orderDB.OrderDate,
                CustomerName = orderDB.Customer.Name,
                CustomerEmail = orderDB.Customer.Email,
                CustomerPhone = orderDB.Customer.Phone,
                CustomerAddress = orderDB.Customer.Address,
                Status = orderDB.OrderStatus.Status,
                Total = orderDB.Total,
                ListOrderDetail = list
            };
            if (orderDB.Delivery != null)
            {
                orderInfomation.DeliveryName = orderDB.Delivery.Name;
                orderInfomation.DeliveryEmail = orderDB.Delivery.Email;
                orderInfomation.DeliveryPhone = orderDB.Delivery.Phone;
                orderInfomation.DeliveryAddress = orderDB.Delivery.Address;
                return View(orderInfomation);
            }
            return View(orderInfomation);
        }

        public ActionResult _PaymentOption()
        {
            var options = db.PaymentMethods.ToList();
            return PartialView("_PaymentOption", options);
        }

        public ActionResult _ShowOrderDetail(int orderId)
        {
            var details = db.OrderDetails.Where(od => od.OrderId == orderId).Select(od => od).ToList();
            return PartialView("_ShowOrderDetail", details);
        }

        private string GenerateOrderCode(int customerId, int orderIdParameter)
        {
            Random random = new Random();
            return DateTime.Now.ToFileTime().ToString() + orderIdParameter.ToString() + customerId.ToString() + random.Next(10, 99).ToString();
        }
    }
}