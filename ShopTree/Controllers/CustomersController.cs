using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ShopTree.Models;
using ShopTree.Common;

namespace ShopTree.Controllers
{
    public class CustomersController : Controller
    {
        private ShopTreeEntities db = new ShopTreeEntities();

        public ActionResult Login()
        {
            if(Session["CustomerId"] != null)
            {
                return RedirectToAction("Index", "Home", new { area = "" });
            }
            ViewBag.Title = "Đăng nhập";
            return View();
        }

        [HttpPost]
        public ActionResult Login(string email,string password)
        {
            ViewBag.Title = "Đăng nhập";
            var customer = (from cus in db.Customers
                            where cus.Email.Equals(email)
                            select cus).SingleOrDefault();
            if(customer != null)
            {
                if (customer.Password.Equals(password))
                {
                    //login success
                    Session["CustomerName"] = customer.Name;
                    Session["CustomerId"] = customer.Id;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    //wrong password
                    ViewBag.Message = Constants.ERR_WRONG_CREDENTIAL;
                    return View();
                }
            }
            else
            {
                //wrong email
                ViewBag.Message = Constants.ERR_WRONG_CREDENTIAL; 
                return View();
            }
        }

        public ActionResult Logout()
        {
            if (Session["CustomerId"] != null)
            {
                Session.Abandon();
            }
            return RedirectToAction("Login","Customers");
        }

        public ActionResult Register()
        {
            ViewBag.Title = "Đăng ký";
            return View();
        }
      
        [HttpPost]
        public ActionResult Register(FormCollection collection)
        {
            string email = collection["Email"].ToString();
            string customerName = collection["CustomerName"].ToString();
            string password = collection["Password"].ToString();
            string reEnterPassword = collection["ReEnterPassword"].ToString();
            string phone = collection["Phone"].ToString();
            string address = collection["Address"].ToString();

            var customerDB = (from cus in db.Customers
                              where cus.Email.Equals(email)
                              select cus).FirstOrDefault();
            if(customerDB == null)
            {
                //not exist this email yet
                if (collection["Password"].ToString().Equals(collection["ReEnterPassword"].ToString()))
                {
                    //2 password is same
                    Customer customer = new Customer();
                    customer.Email = email;
                    customer.Name = customerName;
                    customer.Password = password;
                    customer.Phone = phone;
                    customer.Address = address;
                    customer.TotalMoney = 0;
                    db.Customers.Add(customer);
                    db.SaveChanges();
                    Session["CustomerName"] = customer.Name;
                    Session["CustomerId"] = customer.Id;
                    SendMail.SendMailForRegister(customer.Email, customer.Name, customer.Password);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    //2 password not equal
                    ViewBag.Message = "Password and Re-enter password is not valid, please try again!";
                    ViewBag.Email = email;
                    ViewBag.Phone = phone;
                    ViewBag.Address = address;
                    ViewBag.CustomerName = customerName; 
                    return View();
                }
            }
            else
            {
                //email exist
                ViewBag.Message = "Email existed, please try another email;";
                ViewBag.Email = email;
                ViewBag.Phone = phone;
                ViewBag.Address = address;
                ViewBag.CustomerName = customerName;
                return View();
            }
        }

        public ActionResult CustomerProfile()
        {
            ViewBag.Title = "Thông tin cá nhân";
            if(Session["CustomerId"] == null)
            {
                return RedirectToAction("Login", "Customers");
            }
            else
            {
                int id = Convert.ToInt32(Session["CustomerId"].ToString());
                var customer = db.Customers.Find(id);
                return View(customer);
            }         
        }

        [HttpPost]
        public ActionResult CustomerProfile(Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.Entry(customer).Property(c => c.Email).IsModified = false;
                db.Entry(customer).Property(c => c.Password).IsModified = false;
                db.Entry(customer).Property(c => c.TotalMoney).IsModified = false;
                db.SaveChanges();
                Session["CustomerName"] = customer.Name;
                ViewBag.Message = "Your information changed successfully!";
            }
            return View();
        }

        public ActionResult ChangePassword()
        {
            ViewBag.Title = "Đổi mật khẩu";
            if (Session["CustomerId"] == null)
            {
                return RedirectToAction("Login", "Customers");
            }
            return View();
        }

        [HttpPost]
        public ActionResult ChangePassword(FormCollection collection)
        {
            ViewBag.Title = "Đổi mật khẩu";
            string oldPassword = collection["OldPassword"].ToString();
            string newPassword = collection["NewPassword"].ToString();
            string reNewPassword = collection["ReNewPassword"].ToString();
            int id = Convert.ToInt32(Session["CustomerId"].ToString());

            var customerDB = db.Customers.Where(cus => cus.Id == id).Select(cus => cus).FirstOrDefault();
            if(customerDB.Password.Equals(oldPassword))
            {
                //old password correctly
                if (newPassword.Equals(reNewPassword))
                {
                    //2 new password is similar
                    customerDB.Password = newPassword;
                    db.SaveChanges();
                    ViewBag.MessageSuccess = "Your password has been changed!";
                    return View();
                }
                else
                {
                    //2 new password not the same
                    ViewBag.MessageFailed = "New password and Re-enter password is not the same!";
                    return View();
                }
            }
            else
            {
                //old password incorrect
                ViewBag.MessageFailed = "Old password is not correct";
                return View();
            }
        }

        public ActionResult ForgotPassword()
        {
            ViewBag.Title = "Quên mật khẩu";
            return View();
        }

        [HttpPost]
        public ActionResult ForgotPassword(string requiredEmail)
        {
            ViewBag.Title = "Quên mật khẩu";
            var customer = db.Customers.Where(cus => cus.Email.Equals(requiredEmail)).Select(cus => cus).FirstOrDefault();
            if(customer == null)
            {
                //this email doesn't exist
                ViewBag.MessageFailed = "Your email doesn't exist, please try again!";
                return View();
            }
            else
            {
                //existed email
                string newPassword = RandomPassword();
                customer.Password = newPassword;
                db.SaveChanges();
                SendMail.SendMailForgotPassword(customer.Email, customer.Name, newPassword);
                ViewBag.MessageSuccess = "Your request have been submited successfully, please check your email";
                return View();
            }
        }

        public ActionResult AttendProduct()
        {
            if (Session["CustomerId"] == null)
            {
                return RedirectToAction("Login", "Customers");
            }
            ViewBag.Title = "Chăm sóc cây";
            int customerId = Convert.ToInt32(Session["CustomerId"].ToString());
            var orderList = db.Orders.Where(o => o.CustomerId == customerId).ToList();
            List<Product> productList = new List<Product>();
            foreach(var order in orderList)
            {
                var list = db.OrderDetails.Where(od => od.OrderId == order.Id).Select(od => od.Product).ToList();
                productList.AddRange(list);
            }
            productList = productList.Distinct().ToList();
            return View(productList);
        }

        public ActionResult TakeCare(int id)
        {
            if (Session["CustomerId"] == null)
            {
                return RedirectToAction("Login", "Customers");
            }
            if (db.Products.Find(id) == null)
            {
                return RedirectToAction("Index", "Home", new { area = "" });
            }
            ViewBag.Title = "Hướng dẫn chăm sóc cây";
            var property = db.Properties.Where(p => p.ProductId == id).SingleOrDefault();
            PropertyViewModel propertyViewModel = new PropertyViewModel()
            {
                ProductId = property.ProductId.Value,
                ProductName = property.Product.Name,
                Avatar = property.Product.Avatar,
                IsLikeSunny = property.IsLikeSunny,
                IsLikeWater = property.IsLikeWater,
                RecommendSunnyHour = property.RecommendSunnyHour,
                RecommendWater = property.RecommendWater,
                RecommendFertilizer = property.RecommendFertilizer,
                RecommendTemperature = property.RecommendTemperature
            };
            return View(propertyViewModel);
        }

        [HttpPost]
        public ActionResult TakeCare(PropertyViewModel propertyViewModel)
        {
            var property = db.Properties.Where(p => p.ProductId == propertyViewModel.ProductId).SingleOrDefault();
            ViewBag.IsReturn = true;
            ViewBag.SunnyHour = propertyViewModel.SunnyHour;
            ViewBag.Water = propertyViewModel.Water;
            ViewBag.Fertilizer = propertyViewModel.Fertilizer;
            ViewBag.Temperature = propertyViewModel.Temperature;
            TakecareResponseMessage advice = new TakecareResponseMessage();

            #region SunnyHour
            if(propertyViewModel.SunnyHour != property.RecommendSunnyHour)
            {
                advice.IsEnoughSunnyHour = false;
                if(propertyViewModel.SunnyHour > property.RecommendSunnyHour)
                {
                    advice.AdviceSunnyHour = Constants.ADVICE_FOR_MUCH_SUNNYHOUR;
                }
                else
                {
                    advice.AdviceSunnyHour = Constants.ADVICE_FOR_LESS_SUNNYHOUR;
                }
            }
            else
            {
                advice.IsEnoughSunnyHour = true;
                advice.AdviceSunnyHour = Constants.ADVICE_FOR_ENOUGH_SUNNYHOUR;
            }
            #endregion SunnyHour

            #region Water
            if (propertyViewModel.Water != property.RecommendWater)
            {
                advice.IsEnoughWater = false;
                if (propertyViewModel.Water > property.RecommendWater)
                {
                    advice.AdviceWater = Constants.ADVICE_FOR_MUCH_WATER;
                }
                else
                {
                    advice.AdviceWater = Constants.ADVICE_FOR_LESS_WATER;
                }
            }
            else
            {
                advice.IsEnoughWater = true;
                advice.AdviceWater = Constants.ADVICE_FOR_ENOUGH_WATER;
            }
            #endregion Water

            #region Fertilizer
            if (propertyViewModel.Fertilizer != property.RecommendFertilizer)
            {
                advice.IsEnoughFertilizer = false;
                if (propertyViewModel.Fertilizer > property.RecommendFertilizer)
                {
                    advice.AdviceFertilizer = Constants.ADVICE_FOR_MUCH_FERTILIZER;
                }
                else
                {
                    advice.AdviceFertilizer = Constants.ADVICE_FOR_LESS_FERTILIZER;
                }
            }
            else
            {
                advice.IsEnoughFertilizer = true;
                advice.AdviceFertilizer = Constants.ADVICE_FOR_ENOUGH_FERTILIZER;
            }
            #endregion Fertilizer

            #region Temperature
            if (propertyViewModel.Temperature != property.RecommendTemperature)
            {
                advice.IsEnoughTemperature = false;
                if (propertyViewModel.Temperature > property.RecommendTemperature)
                {
                    advice.AdviceTemperature = Constants.ADVICE_FOR_HIGH_TEMPERATURE;
                }
                else
                {
                    advice.AdviceTemperature = Constants.ADVICE_FOR_LOW_TEMPERATURE;
                }
            }
            else
            {
                advice.IsEnoughTemperature = true;
                advice.AdviceTemperature = Constants.ADVICE_FOR_ENOUGH_TEMPERATURE;
            }
            #endregion Temperature

            return Json(advice);
        }

        private string RandomPassword()
        {
            Random random = new Random();
            return random.Next(100000, 999999).ToString();
        }
    }
}
