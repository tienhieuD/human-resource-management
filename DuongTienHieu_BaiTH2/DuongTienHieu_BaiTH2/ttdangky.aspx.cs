using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DuongTienHieu_BaiTH2
{
    public partial class ttdangky : System.Web.UI.Page
    {
        bool getBool(string s)
        {
            try
            {
                Request.Form.Get(s).Contains("on");
                return true;
            }
            catch
            {
                return false;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string nnlt = getBool("ckcpp") ? "C/C++, " : "";
            nnlt += getBool("ckpy") ? "Python, " : "";
            nnlt += getBool("ckja") ? "Java, " : "";
            nnlt += getBool("ckfr") ? "Fronchan, " : "";
            nnlt += getBool("ckphp") ? "PHP, " : "";
            nnlt += getBool("ckasp") ? "ASP.Net, " : "";
            nnlt += getBool("ckcs") ? "C#, " : "";
            nnlt += getBool("ckjs") ? "Javascript, " : "";
            nnlt += getBool("ckvb") ? "VB.Net, " : "";
            nnlt += getBool("ckdel") ? "DelPhi, " : "";

            Dictionary <string, string> dictionary = new Dictionary<string, string>();
            dictionary.Add("Họ và tên:", Request.Form.Get("txtname"));
            dictionary.Add("Giới tính:", Request.Form.Get("gt") == "rbgender2" ? "Nữ" : "Nam");
            dictionary.Add("Ngày sinh:", Request.Form.Get("lstDay") + "-"
                + Request.Form.Get("lstMonth") + "-"
                + Request.Form.Get("lstYear"));
            dictionary.Add("Email:", Request.Form.Get("txtEmail"));
            dictionary.Add("Điện thoại:", Request.Form.Get("txtPhone"));
            dictionary.Add("Địa chỉ:", Request.Form.Get("txtAddress"));
            dictionary.Add("Ngôn ngữ lập trình: ", nnlt);
            dictionary.Add("Vị trí tuyển dụng:", Request.Form.Get("lstViTriTD"));
            dictionary.Add("Tên đăng nhập:", Request.Form.Get("txtlogin"));
            dictionary.Add("Mật khẩu:", Request.Form.Get("txtmk1"));

            string str = "";
            foreach (var item in dictionary)
            {
                str += item.Key + " " + item.Value + "<br/>";
            }
            lbHoten.Text = str;
        }

    }
}