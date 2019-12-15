using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using ShopTree.Common;

namespace ShopTree
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
              name: "Index",
              url: "trang-chu",
              defaults: new { controller = "Home", action = "Index" },
              namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
              name: "About",
              url: "gioi-thieu",
              defaults: new { controller = "Home", action = "About" },
              namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
              name: "Contact",
              url: "lien-he",
              defaults: new { controller = "Home", action = "Contact" },
              namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
              name: "Payment Guide",
              url: "huong-dan-thanh-toan",
              defaults: new { controller = "Home", action = "PaymentGuide" },
              namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
              name: "Shopping Guide",
              url: "huong-dan-mua-hang",
              defaults: new { controller = "Home", action = "ShoppingGuide" },
              namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
              name: "Tradding Account",
              url: "tai-khoan-thanh-toan",
              defaults: new { controller = "Home", action = "TraddingAccount" },
              namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
              name: "Return",
              url: "giao-hang-doi-tra",
              defaults: new { controller = "Home", action = "Return" },
              namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
              name: "Security",
              url: "chinh-sach-bao-mat",
              defaults: new { controller = "Home", action = "Security" },
              namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "Blog",
                url: "blog",
                defaults: new { controller = "Blogs", action = "Index" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "View Cart",
                url: "gio-hang",
                defaults: new { controller = "ShoppingCart", action = "ViewCart" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "Payment",
                url: "thanh-toan",
                defaults: new { controller = "ShoppingCart", action = "Checkout" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "Login",
                url: "dang-nhap",
                defaults: new { controller = "Customers", action = "Login" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "Register",
                url: "dang-ky",
                defaults: new { controller = "Customers", action = "Register" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "Forgot Password",
                url: "quen-mat-khau",
                defaults: new { controller = "Customers", action = "ForgotPassword" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "Logout",
                url: "dang-xuat",
                defaults: new { controller = "Customers", action = "Logout" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.Add("Blog Detail",new FriendlyRoute("blog/chi-tiet/{id}",
                                                       new { controller = "Blogs", action = "Detail" },
                                                       new[] { "ShopTree.Controllers" })
            );

            routes.MapRoute(
                name: "All Product",
                url: "san-pham",
                defaults: new { controller = "Products", action = "AllProduct" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "Search Product Result",
                url: "tim-kiem",
                defaults: new { controller = "Products", action = "Search" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.Add("Product Detail",new FriendlyRoute("san-pham/chi-tiet/{id}",
                                                          new { controller = "Products", action = "Detail" },
                                                          new[] { "ShopTree.Controllers" })
            );

            routes.Add("Categories",new FriendlyRoute("danh-muc/{id}",
                                                      new { controller = "Products", action = "GetProductByCategoryId" },
                                                      new[] { "ShopTree.Controllers" })
            );

            routes.MapRoute(
                name: "Customer Information",
                url: "khach-hang/thong-tin-ca-nhan",
                defaults: new { controller = "Customers", action = "CustomerProfile" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "Customer Change Password",
                url: "khach-hang/doi-mat-khau",
                defaults: new { controller = "Customers", action = "ChangePassword" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "Customer Attend Product",
                url: "cham-soc-cay",
                defaults: new { controller = "Customers", action = "AttendProduct" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "Customer Check Order",
                url: "khach-hang/don-hang-cua-toi",
                defaults: new { controller = "ShoppingCart", action = "CheckOrder" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "Check Order Without Login",
                url: "kiem-tra-don-hang",
                defaults: new { controller = "ShoppingCart", action = "CheckOrderWithoutLogin" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.MapRoute(
                name: "View Order Detail",
                url: "don-hang/chi-tiet",
                defaults: new { controller = "ShoppingCart", action = "ViewOrderDetail" },
                namespaces: new[] { "ShopTree.Controllers" }
            );

            routes.Add("Takecare", new FriendlyRoute("cham-soc-cay/{id}",
                                                      new { controller = "Customers", action = "TakeCare" },
                                                      new[] { "ShopTree.Controllers" })
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces : new [] { "ShopTree.Controllers" }
            );
        }
    }
}
