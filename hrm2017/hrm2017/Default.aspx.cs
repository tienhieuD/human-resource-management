using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string sql = string.Format(
                @"select count(*) from login where login = '{0}' and pwd = '{1}'",
                txtLogin.Text, txtPwd.Text);
            if (DataMan.ExecuteCommandSingle(sql) > 0)
                Response.Redirect("~/forms/Home.aspx");
            else
                lblNotice.Text = "Tài khoản / Mật khẩu không hợp lệ!";
        }
    }
}