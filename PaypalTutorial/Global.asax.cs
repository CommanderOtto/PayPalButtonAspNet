using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace PaypalTutorial
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // For PayPal TLS support
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            // Code that runs on application startup
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}