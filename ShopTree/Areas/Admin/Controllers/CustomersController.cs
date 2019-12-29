using System.Web.Mvc;
using ShopTree.Models;
using ShopTree.Common;
using System.Linq;
using PagedList;

namespace ShopTree.Areas.Admin.Controllers
{
    [Authorize]
    public class CustomersController : Controller
    {
        private ShopTreeEntities db = new ShopTreeEntities();
        private const int pageSize = Constants.PAGE_SIZE_ADMIN;
        private int pageIndex = 1;

        public ActionResult AllCustomer(int? page)
        {
            ViewBag.Title = "Danh sách khách hàng";
            var customers = db.Customers.ToList();
            pageIndex = page ?? 1;
            IPagedList<Customer> pagingCustomer = customers.ToPagedList(pageIndex, pageSize);
            return View(pagingCustomer);
        }

        public ActionResult Detail(int id, int? page)
        {
            ViewBag.Title = "Chi tiết khách hàng";
            ViewBag.Page = page;
            var customer = db.Customers.Find(id);
            if(customer == null)
            {
                return RedirectToAction("AllCustomer", "Customers", new { area = "Admin" });
            }
            return View(customer);
        }
    }
}