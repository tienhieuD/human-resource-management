using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string sql = "Select * from tbl_nhanvien";
            //DataTable dataTable = DataMan.GetDataTable(sql);
            //lbDsNhanVien.Text = InterMan.ConvertToHtml(dataTable);
            //lbDsNhanVien.Text = Session["login"].ToString();
        }
    }
}