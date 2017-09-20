using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DuongTienHieu_BaiTH1.frm
{
    public partial class Get : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblName.Text=Request.Form.Get("text");
            if (lblName.Text.Contains("0"))
            {
                lblName.Text = "0123456788";
            }
        }
    }
}