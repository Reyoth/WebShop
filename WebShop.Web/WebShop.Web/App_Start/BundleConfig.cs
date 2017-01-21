using System.Web;
using System.Web.Optimization;

namespace WebShop.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/common").Include(
                        "~/Scripts/common.js"));

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js",
                      "~/Scripts/bootstrap-datepicker.js"));
            bundles.Add(new ScriptBundle("~/bundles/datatables").Include(
                      "~/Scripts/DataTables/jquery.dataTables.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/GridMvc.css",
                      "~/Content/ladda-bootstrap/ladda-themeless.min.css",
                      "~/Content/site.css",
                      "~/Content/Datatables/css/jquery.dataTables.css",
                      "~/Content/gridmvc.datepicker.min.css"));
            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Scripts/jquery-{version}.js",
            //            "~/Scripts/jquery-ui.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/gridmvc").Include(
                        "~/Scripts/gridmvc.min.js",
                        "~/Scripts/gridmvc-ext.js",
                        "~/Scripts/ladda-bootstrap/ladda.min.js",
                        "~/Scripts/ladda-bootstrap/spin.min.js"));


        }
    }
}
