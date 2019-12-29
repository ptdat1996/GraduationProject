using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using ShopTree.Areas.Admin.Models;
using ShopTree.Common;
using ShopTree.Models;
using PagedList;

namespace ShopTree.Areas.Admin.Controllers
{
    public class EmployeesController : Controller
    {
        private ShopTreeEntities db = new ShopTreeEntities();
        private const int pageSize = Constants.PAGE_SIZE_ADMIN;
        private int pageIndex = 1;

        [AllowAnonymous]
        public ActionResult Login()
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Home", new { area = "Admin" });
            }

            ViewBag.Title = "Đăng nhập";
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginViewModelAdmin model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var emp = db.Employees.Where(e => e.UserName.Equals(model.UserName) && e.Password.Equals(model.Password)).SingleOrDefault();
            if (emp != null)
            {
                if (emp.Status == true)
                {
                    FormsAuthentication.SetAuthCookie(emp.UserName, true);
                    return Json(new
                    {
                        status= true,
                        url = Url.Action("Index", "Home", new { area = "Admin" })
                    });
                }
                return Json(new
                {
                    status = false,
                    message = Constants.ERR_LOCK_CREDENTIAL
                });
            }
            else
            {
                return Json(new
                {
                    status = false,
                    message = Constants.ERR_WRONG_CREDENTIAL
                });
            }
        }

        [Authorize]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Employees", new { area = "Admin" });
        }

        [Authorize]
        public ActionResult ChangePassword(string userName)
        {        
            if(!userName.Equals(User.Identity.Name))
            {
                FormsAuthentication.SignOut();
                return RedirectToAction("Login", "Employees", new { area = "Admin" });
            }
            ViewBag.Title = "Đổi mật khẩu";
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordViewModel model)
        {        
            var emp = db.Employees.Where(e => e.UserName.Equals(User.Identity.Name)).SingleOrDefault();
            if (emp.Password.Equals(model.OldPassword))
            {
                emp.Password = model.NewPassword;
                db.SaveChanges();

                return Json(new
                {
                    status = true,
                    url = Url.Action("Index", "Home", new { area = "Admin" })
                });
            }
            else
            {
                return Json(new
                {
                    status = false,
                    message = Constants.ERR_COMPARE_OLDPASSWORD
                });
            }
        }

        [Authorize]
        public ActionResult EmployeeProfile(string userName)
        {
            var currentEmpployeeRole = db.Employees.Where(e => e.UserName.Equals(User.Identity.Name)).SingleOrDefault().Level.Name;
            if (!currentEmpployeeRole.Equals(Constants.ROLE_ADMIN))
            {
                if (!userName.Equals(User.Identity.Name))
                {
                    FormsAuthentication.SignOut();
                    return RedirectToAction("Login", "Employees", new { area = "Admin" });
                }     
            }
            var emp = db.Employees.Where(e => e.UserName.Equals(userName)).SingleOrDefault();
            ViewBag.Title = "Thông tin cá nhân";
            EmployeeViewModel employeeViewModel = new EmployeeViewModel()
            {
                UserName = emp.UserName,
                Password = emp.Password,
                FullName = emp.FullName,
                Email = emp.Email,
                Phone = emp.Phone,
                Address = emp.Address,
                LevelName = emp.Level.Name
            };
            return View(employeeViewModel);
        }

        [Authorize]
        [HttpPost]
        public ActionResult EmployeeProfile(EmployeeViewModel employeeViewModel)
        {
            var emp = db.Employees.Where(e => e.UserName.Equals(User.Identity.Name)).SingleOrDefault();
            emp.FullName = employeeViewModel.FullName;
            emp.Phone = employeeViewModel.Phone;
            emp.Address = employeeViewModel.Address;
            db.SaveChanges();
            return RedirectToAction("Index", "Home", new { area = "Admin" });
        }

        [Authorize(Roles = Constants.ROLE_ADMIN)]
        public ActionResult AllEmployee(int? page)
        {
            ViewBag.Title = "Danh sách nhân viên";
            pageIndex = page ?? 1;
            var employees = db.Employees.Where(e => e.Level.Name != Constants.ROLE_ADMIN).ToList();
            IPagedList<Employee> pagingEmployee = employees.ToPagedList(pageIndex, pageSize);
            return View(pagingEmployee);
        }

        [Authorize(Roles = Constants.ROLE_ADMIN)]
        public ActionResult Lock(int id, int? page)
        {
            var emp = db.Employees.Find(id);
            emp.Status = !emp.Status;
            db.SaveChanges();
            ViewBag.PageNumber = page ?? 1;
            return PartialView("_EmployeeRow", emp);
        }
    }
}