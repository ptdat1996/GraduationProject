using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopTree.Common;
using System.ComponentModel.DataAnnotations;

namespace ShopTree.Areas.Admin.Models
{
    public class EmployeeViewModel
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string LevelName { get; set; }
    }
}