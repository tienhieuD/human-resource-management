using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Foo()
        {
            ViewBag.Wtf = "Hello, foo!";

            return View();
        }

        public ActionResult Nv(string manv)
        {
            Dictionary<string, string> dict = new Dictionary<string, string>();
            dict.Add("0000", "Nguyễn thị không");
            dict.Add("0001", "Nguyễn văn một");

            if (dict.ContainsKey(manv))
            {
                return Content(dict[manv]);
            }
            else
                return View("Index");
            //return Content("");
                //return RedirectToAction("Index");
                //return Content(dict.Any(item => item.Key == manv).ToString());
                //return Json(new { manv = manv, content = "Không tồn tại" }, JsonRequestBehavior.AllowGet);
        }
    }
}