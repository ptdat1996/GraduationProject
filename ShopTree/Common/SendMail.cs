using System;
using System.Linq;
using System.Net.Mail;
using System.Net;
using ShopTree.Models;
using System.Globalization;

namespace ShopTree.Common
{
    public class SendMail
    {
        private static ShopTreeEntities db = new ShopTreeEntities();

        public static SmtpClient stmp = new SmtpClient
        {
            Host = "smtp.gmail.com",
            Port = 587,
            EnableSsl = true,
            DeliveryMethod = SmtpDeliveryMethod.Network,
            UseDefaultCredentials = false,
            Credentials = new NetworkCredential(Constants.EmailAccount, Constants.EmailPassword)
        };

        //done
        public static void SendMailForgotPassword(string deliveryEmail, string customerName, string newPassword)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, deliveryEmail))
            {
                try
                {
                    mail.Subject = "About recovery password of " + deliveryEmail;

                    string body = "Hello " + customerName + Environment.NewLine;
                    body += "You have just sent a request about recovery your password." + Environment.NewLine;
                    body += "Here is your new password : " + newPassword + Environment.NewLine;
                    body += Environment.NewLine;
                    body += "Thank you for using our services." + Environment.NewLine;
                    body += "Best regards." + Environment.NewLine;
                    body += "Fairy Garden Team";

                    mail.Body = body;

                    stmp.Send(mail);
                }
                catch
                {
                    return;
                }
            };
        }

        //done
        public static void SendMailForRegister(string customerEmail, string customerName, string password)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, customerEmail))
            {
                try
                {
                    mail.Subject = "Welcome to Fairy Garden Shop";

                    string body = "Hi " + customerName + "," + Environment.NewLine;
                    body += "Welcome to our website, Mr/Mrs " + customerName + Environment.NewLine;
                    body += "Your information to login :" + Environment.NewLine;
                    body += "\tYour user name  : " + customerEmail + Environment.NewLine;
                    body += "\tYour password  : " + password + Environment.NewLine;
                    body += "Hope we have a good time together." + Environment.NewLine;
                    body += Environment.NewLine;
                    body += "Thank you for using our services." + Environment.NewLine;
                    body += "Best regards." + Environment.NewLine;
                    body += "Fairy Garden Team";

                    mail.Body = body;

                    stmp.Send(mail);
                }
                catch
                {
                    return;
                }
            };
        }

        //done
        public static void SendMailToCustomerForNewOrder(string customerEmail, Order order)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, customerEmail))
            {
                try
                {
                    mail.Subject = "About order of  " + customerEmail;

                    string body = "Hi Mr/Mrs " + order.Customer.Name + Environment.NewLine;
                    body += "Thank you for your order in our shop." + Environment.NewLine;
                    body += "OrderCode : " + order.OrderCode + Environment.NewLine;
                    body += "OrderDate : " + order.OrderDate.ToString("dd/MM/yyyy") + Environment.NewLine;
                    body += "Your cart details are below :" + Environment.NewLine;
                    var orderDetails = db.OrderDetails.Where(od => od.OrderId == order.Id).ToList();
                    foreach (var item in orderDetails)
                    {
                        body += "\t" + item.Product.Name + " x " + item.Quantity + Environment.NewLine;
                    }
                    body += "Total : " + order.Total.ToString("C", CultureInfo.GetCultureInfo("vi-VN")) + Environment.NewLine;
                    body += "Payer : " + Environment.NewLine;
                    body += "\tName :" + order.Customer.Name + Environment.NewLine;
                    body += "\tEmail :" + order.Customer.Email + Environment.NewLine;
                    body += "\tPhone :" + order.Customer.Phone + Environment.NewLine;
                    body += "\tAddress :" + order.Customer.Address + Environment.NewLine;
                    body += "Receiver : " + Environment.NewLine;
                    if(order.Delivery == null)
                    {
                        body += "\tName :" + order.Customer.Name + Environment.NewLine;
                        body += "\tEmail :" + order.Customer.Email + Environment.NewLine;
                        body += "\tPhone :" + order.Customer.Phone + Environment.NewLine;
                        body += "\tAddress :" + order.Customer.Address + Environment.NewLine;
                    }
                    else
                    {
                        body += "\tName :" + order.Delivery.Name + Environment.NewLine;
                        body += "\tEmail :" + order.Delivery.Email + Environment.NewLine;
                        body += "\tPhone :" + order.Delivery.Phone + Environment.NewLine;
                        body += "\tAddress :" + order.Delivery.Address + Environment.NewLine;
                    }
                    body += Environment.NewLine;
                    body += "Thank you for using our services." + Environment.NewLine;
                    body += "Best regards." + Environment.NewLine;
                    body += "Fairy Garden Team.";

                    mail.Body = body;

                    stmp.Send(mail);
                }
                catch
                {
                    return;
                }
            };
        }

        //done
        public static void SendMailToReceiverForNewOrder(string receiverEmail, Order order)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, receiverEmail))
            {
                try
                {
                    mail.Subject = "A new order is delivering to you";

                    string body = "Hi Mr/Mrs " + order.Delivery.Name + Environment.NewLine;
                    body += "A new order from " + order.Customer.Name + " is delivering to you." + Environment.NewLine;
                    body += "OrderCode : " + order.OrderCode + Environment.NewLine;
                    body += "OrderDate : " + order.OrderDate.ToString("dd/MM/yyyy") + Environment.NewLine;
                    body += "Your cart details are below :" + Environment.NewLine;
                    var orderDetails = db.OrderDetails.Where(od => od.OrderId == order.Id).ToList();
                    foreach (var item in orderDetails)
                    {
                        body += "\t" + item.Product.Name + " x " + item.Quantity + Environment.NewLine;
                    }
                    body += "Total : " + order.Total.ToString("C", CultureInfo.GetCultureInfo("vi-VN")) + Environment.NewLine;
   
                    body += Environment.NewLine;
                    body += "Thank you for using our services." + Environment.NewLine;
                    body += "Best regards." + Environment.NewLine;
                    body += "Fairy Garden Team.";

                    mail.Body = body;

                    stmp.Send(mail);
                }
                catch
                {
                    return;
                }
            };
        }

        //done
        public static void SendMailToCustomerWhenAcceptOrder(string customerEmail, int orderId)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, customerEmail))
            {
                try
                {
                    var order = db.Orders.Find(orderId);
                    mail.Subject = "Your order is being shipped";

                    string body = "Hi Mr/Mrs " + order.Customer.Name + Environment.NewLine;
                    body += "Your order has been accepted in our system at " + DateTime.Now.ToString("dd/MM/yyyy") + ". We will delivery it to you soon." + Environment.NewLine;
                    body += "Your order code : " + order.OrderCode + Environment.NewLine;
                    body += "Please wait patiently for us to ship your order." + Environment.NewLine;

                    body += Environment.NewLine;
                    body += "Thank you for using our services." + Environment.NewLine;
                    body += "Best regards." + Environment.NewLine;
                    body += "Fairy Garden Team.";

                    mail.Body = body;

                    stmp.Send(mail);
                }
                catch
                {
                    return;
                }
            };
        }

        //done
        public static void SendMailToReceiverWhenAcceptOrder(string receiverEmail, int orderId)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, receiverEmail))
            {
                try
                {
                    var order = db.Orders.Find(orderId);
                    mail.Subject = "An order from " + order.Customer.Email + " is being shipped to you";

                    string body = "Hi Mr/Mrs " + order.Delivery.Name + Environment.NewLine;
                    body += "An order from " + order.Customer.Email + " has been accepted in our system at " + DateTime.Now.ToString("dd/MM/yyyy") + ". We will delivery it to you soon." + Environment.NewLine;
                    body += "Your order code : " + order.OrderCode + Environment.NewLine;
                    body += "Please wait patiently for us to ship your order." + Environment.NewLine;

                    body += Environment.NewLine;
                    body += "Thank you for using our services." + Environment.NewLine;
                    body += "Best regards." + Environment.NewLine;
                    body += "Fairy Garden Team.";

                    mail.Body = body;

                    stmp.Send(mail);
                }
                catch
                {
                    return;
                }
            };
        }

        //done
        public static void SendMailToCustomerWhenDelivered(string customerEmail, int orderId)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, customerEmail))
            {
                try
                {
                    var order = db.Orders.Find(orderId);
                    mail.Subject = "Your order has been delivered successfully.";

                    string body = "Hi Mr/Mrs " + order.Customer.Name + Environment.NewLine;
                    body += "Your order has been delivered successfully at " + order.DeliveryDate.Value.ToString("dd/MM/yyyy") + Environment.NewLine;
                    body += "Your order code : " + order.OrderCode + Environment.NewLine;
                    body += "Hope you are satisfied with our product." + Environment.NewLine;

                    body += Environment.NewLine;
                    body += "Thank you for using our services." + Environment.NewLine;
                    body += "Best regards." + Environment.NewLine;
                    body += "Fairy Garden Team.";

                    mail.Body = body;

                    stmp.Send(mail);
                }
                catch
                {
                    return;
                }
            };
        }

        //done
        public static void SendMailToReceiverWhenDelivered(string receiverEmail, int orderId)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, receiverEmail))
            {
                try
                {
                    var order = db.Orders.Find(orderId);
                    mail.Subject = "An order from " + order.Customer.Email + " has been delivered successfully.";

                    string body = "Hi Mr/Mrs " + order.Delivery.Name + Environment.NewLine;
                    body += "An order from " + order.Customer.Name + " has been delivered to you at " + order.DeliveryDate.Value.ToString("dd/MM/yyyy") + Environment.NewLine;
                    body += "Order code : " + order.OrderCode + Environment.NewLine;
                    body += "Hope you are satisfied with our product." + Environment.NewLine;

                    body += Environment.NewLine;
                    body += "Thank you for using our services." + Environment.NewLine;
                    body += "Best regards." + Environment.NewLine;
                    body += "Fairy Garden Team.";

                    mail.Body = body;

                    stmp.Send(mail);
                }
                catch
                {
                    return;
                }
            };
        }

        //done
        public static void SendMailToCustomerWhenCancelOrder(string customerEmail,int orderId)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, customerEmail))
            {
                try
                {
                    var order = db.Orders.Find(orderId);
                    mail.Subject = "An order " + order.OrderCode + " has been cancelled.";

                    string body = "Hi Mr/Mrs " + order.Customer.Name + Environment.NewLine;
                    body += "Your order has been cancelled at " + order.DeliveryDate.Value.ToString("dd/MM/yyyy") + Environment.NewLine;
                    body += "Your order code : " + order.OrderCode + Environment.NewLine;
                    body += "Cancel reason : " + order.CancelReason + Environment.NewLine;
                    body += "We are sorry about it. Hope you still support us in the future." + Environment.NewLine;

                    body += Environment.NewLine;
                    body += "Thank you for using our services." + Environment.NewLine;
                    body += "Best regards." + Environment.NewLine;
                    body += "Fairy Garden Team.";

                    mail.Body = body;

                    stmp.Send(mail);
                }
                catch
                {
                    return;
                }
            };
        }
    }
}