using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.salary
{
    public partial class LapBangLuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            LoadListThangNam();
        }

        private void LoadListThangNam()
        {
            if (lstNam.Items.Count > 0)
            {
                lstThang.SelectedValue = DateTime.Now.Month.ToString();
                lstNam.SelectedValue = DateTime.Now.Year.ToString();
                return;
            }

            for (int i = 1; i <= 12; i++)
            {
                string thang = i.ToString();
                lstThang.Items.Add(new ListItem(thang, thang));
            }

            int year = DateTime.Now.Year;
            for (int i = year - 1; i <= year + 1; i++)
            {
                string nam = i.ToString();
                lstNam.Items.Add(new ListItem(nam, nam));
            }

            lstThang.SelectedValue = DateTime.Now.Month.ToString();
            lstNam.SelectedValue = DateTime.Now.Year.ToString();
        }


        protected void btnLapBangLuongThang_Click(object sender, EventArgs e)
        {
            
        }
    }
}