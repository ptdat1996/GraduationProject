using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using ShopTree.Models;

namespace ShopTree.Common
{
    public class MyRoleProvider : RoleProvider
    {
        public override string ApplicationName { get; set; }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            using (ShopTreeEntities db = new ShopTreeEntities())
            {
                return db.Levels.Select(lv => lv.Name).ToArray();
            }
        }

        public override string[] GetRolesForUser(string username)
        {
            using (ShopTreeEntities db = new ShopTreeEntities())
            {
                var user = db.Employees.Where(u => u.UserName.Equals(username)).SingleOrDefault();
                if (user != null)
                {
                    return new string[] { user.Level.Name };
                }
                else
                {
                    return new string[] { };
                }
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            using (ShopTreeEntities db = new ShopTreeEntities())
            {
                var user = db.Employees.Where(u => u.Id.ToString().Equals(username)).SingleOrDefault();
                return user.Level.Name.Equals(roleName);
            }
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}