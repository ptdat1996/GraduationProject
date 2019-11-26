using System.Web.Mvc;
using ShopTree.Common;

namespace ShopTree.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Admin Homepge",
                Constants.ADMIN_HOMEPAGE_PATH,
                new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin Login",
                Constants.ADMIN_LOGIN_PATH,
                new { controller = "Employees", action = "Login", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin Logout",
                Constants.ADMIN_LOGOUT_PATH,
                new { controller = "Employees", action = "Logout", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin List Product",
                Constants.ADMIN_LIST_PRODUCT_PATH,
                new { controller = "Products", action = "AllProduct", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Create Product",
                Constants.ADMIN_CREATE_PRODUCT_PATH,
                new { controller = "Products", action = "Create", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin Product Detail",
                Constants.ADMIN_DETAIL_PRODUCT_PATH,
                new { controller = "Products", action = "Detail", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin Product Edit",
                Constants.ADMIN_EDIT_PRODUCT_PATH,
                new { controller = "Products", action = "Edit", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

           
            context.MapRoute(
                "Admin Deleted Product List",
                Constants.ADMIN_DELETED_PRODUCT_PATH,
                new { controller = "Products", action = "DeletedProduct", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin Active Product",
                Constants.ADMIN_ACTIVE_PRODUCT_PATH,
                new { controller = "Products", action = "ActiveProduct", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin List Category",
                Constants.ADMIN_LIST_CATEGORY_PATH,
                new { controller = "Categories", action = "AllCategory", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin Create Category",
                Constants.ADMIN_CREATE_CATEGORY_PATH,
                new { controller = "Categories", action = "Create", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin Category Detail",
                Constants.ADMIN_DETAIL_CATEGORY_PATH,
                new { controller = "Categories", action = "Detail", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin Edit Category",
                Constants.ADMIN_EDIT_CATEGORY_PATH,
                new { controller = "Categories", action = "Edit", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin List Blog",
                Constants.ADMIN_LIST_BLOG_PATH,
                new { controller = "Blogs", action = "AllBlog", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin Create Blog",
                Constants.ADMIN_CREATE_BLOG_PATH,
                new { controller = "Blogs", action = "Create", id = UrlParameter.Optional },
                new string[] { "ShopTree.Areas.Admin.Controllers" }
            );

            context.MapRoute(
               "Admin List Order",
               Constants.ADMIN_LIST_ORDER_PATH,
               new { controller = "Orders", action = "AllOrder", id = UrlParameter.Optional },
               new string[] { "ShopTree.Areas.Admin.Controllers" }
           );

            context.MapRoute(
              "Admin Process Order",
              Constants.ADMIN_PROCESS_ORDER_PATH,
              new { controller = "Orders", action = "ProcessOrder", id = UrlParameter.Optional },
              new string[] { "ShopTree.Areas.Admin.Controllers" }
          );

            context.MapRoute(
              "Admin List Order Delivering",
              Constants.ADMIN_DELIVERING_ORDER_PATH,
              new { controller = "Orders", action = "ListOrderDelivering", id = UrlParameter.Optional },
              new string[] { "ShopTree.Areas.Admin.Controllers" }
          );

            context.MapRoute(
              "Admin Processing Delivery Order",
              Constants.ADMIN_PROCESS_DELIVERY_ORDER_PATH,
              new { controller = "Orders", action = "Delivering", id = UrlParameter.Optional },
              new string[] { "ShopTree.Areas.Admin.Controllers" }
          );

            context.MapRoute(
              "Admin Order Detail",
              Constants.ADMIN_ORDER_DETAIL_PATH,
              new { controller = "Orders", action = "Detail", id = UrlParameter.Optional },
              new string[] { "ShopTree.Areas.Admin.Controllers" }
          );

            context.MapRoute(
              "Admin List Processed Order",
              Constants.ADMIN_PROCESSED_ORDER_PATH,
              new { controller = "Orders", action = "ListProcessedOrder", id = UrlParameter.Optional },
              new string[] { "ShopTree.Areas.Admin.Controllers" }
          );

            context.MapRoute(
              "Admin List Outstanding Order",
              Constants.ADMIN_OUTSTANDING_ORDER_PATH,
              new { controller = "Orders", action = "ListOutstandingOrder", id = UrlParameter.Optional },
              new string[] { "ShopTree.Areas.Admin.Controllers" }
          );

            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new string [] { "ShopTree.Areas.Admin.Controllers" }
            );
        }
    }
}