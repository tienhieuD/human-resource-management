using System;
using System.Collections.Generic;
using System.Data;
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
                @"select role from login where login = '{0}' and pwd = '{1}'",
                txtLogin.Text, txtPwd.Text);
            DataTable dataTable = DataMan.GetDataTable(sql);
            if (dataTable.Rows.Count > 0)
            {
                Session["login"] = txtLogin.Text;
                Session["role"] = dataTable.Rows[0][0].ToString();
                Response.Redirect("~/forms/Home.aspx");
            }
            else
                lblNotice.Text = "Tài khoản / Mật khẩu không hợp lệ!";
        }
    }
}