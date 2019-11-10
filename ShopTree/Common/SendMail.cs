using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;

namespace ShopTree.Common
{
    public class SendMail
    {
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
            };
        }

        //done
        public static void SendMailForRegister(string customerEmail, string customerName, string password)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, customerEmail))
            {
                mail.Subject = "Welcome to Fairy Garden Shop " + Environment.NewLine;

                string body = "Hello " + customerName + Environment.NewLine;
                body += "Welcome to our website, Mr/Mrs " + customerName + Environment.NewLine;
                body += "Your information to login :" + Environment.NewLine;
                body += "\tYour user name  : " + customerEmail + Environment.NewLine;
                body += "\tYour password  : " + password + Environment.NewLine;
                body += Environment.NewLine;
                body += "Thank you for using our services." + Environment.NewLine;
                body += "Best regards." + Environment.NewLine;
                body += "Fairy Garden Team";

                mail.Body = body;

                stmp.Send(mail);
            };
        }

        //not finish yet
        public static void SendEmailToCustomerForNewOrder(string customerEmail, string customerName, string password)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, customerEmail))
            {
                mail.Subject = "About order of  " + customerEmail + Environment.NewLine;

                string body = "Hello " + customerName + Environment.NewLine;
                body += "Welcome to our website, Mr/Mrs " + customerName + Environment.NewLine;
                body += "Your information to login :" + Environment.NewLine;
                body += "\tYour user name  : " + customerEmail + Environment.NewLine;
                body += "\tYour password  : " + password + Environment.NewLine;
                body += Environment.NewLine;
                body += "Thank you for using our services." + Environment.NewLine;
                body += "Best regards." + Environment.NewLine;
                body += "Fairy Garden Team";

                mail.Body = body;

                stmp.Send(mail);
            };
        }

        //not finish yet
        public static void SendEmailToShippingForNewOrder(string customerEmail, string customerName, string password)
        {
            using (var mail = new MailMessage(Constants.EmailAccount, customerEmail))
            {
                mail.Subject = "About order of  " + customerEmail + Environment.NewLine;

                string body = "Hello " + customerName + Environment.NewLine;
                body += "Welcome to our website, Mr/Mrs " + customerName + Environment.NewLine;
                body += "Your information to login :" + Environment.NewLine;
                body += "\tYour user name  : " + customerEmail + Environment.NewLine;
                body += "\tYour password  : " + password + Environment.NewLine;
                body += Environment.NewLine;
                body += "Thank you for using our services." + Environment.NewLine;
                body += "Best regards." + Environment.NewLine;
                body += "Fairy Garden Team";

                mail.Body = body;

                stmp.Send(mail);
            };
        }   
    }
}