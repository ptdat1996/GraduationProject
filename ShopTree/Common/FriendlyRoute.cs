using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Text.RegularExpressions;

namespace ShopTree.Common
{
    public class FriendlyRoute : Route
    {
        public FriendlyRoute(string url, object defaults, string[] namespaces = null)
            : base(url, new RouteValueDictionary(defaults), new MvcRouteHandler())
        {
            DataTokens = new RouteValueDictionary { ["Namespaces"] = namespaces };
        }

        public override RouteData GetRouteData(HttpContextBase httpContext)
        {
            var routeData = base.GetRouteData(httpContext);

            if (routeData != null)
            {
                if (routeData.Values.ContainsKey("id"))
                    routeData.Values["id"] = GetIdValue(routeData.Values["id"]);
            }

            return routeData;
        }

        private object GetIdValue(object id)
        {
            if (id != null)
            {
                string idValue = id.ToString();

                var regex = new Regex(@"(?<id>\d+)$");
                var match = regex.Match(idValue);

                if (match.Success)
                {
                    return match.Groups["id"].Value;
                }
            }

            return id;
        }
    }
}