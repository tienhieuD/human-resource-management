using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DuongTienHieu_BaiTH2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (lstDay.Items.Count<1)
                for (int i = 1; i <= 31; i++)
                {
                    lstDay.Items.Add(new ListItem(i.ToString(), i.ToString()));
                    if (i<=12)
                        lstMonth.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
                for (int i = DateTime.Now.Year; i > DateTime.Now.Year - 100; i--)
                {
                    lstYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
        }

        protected void rbgender1_CheckedChanged(object sender, EventArgs e)
        {
            if (rbgender1.Checked)
                imgAva.ImageUrl = "~/images/pic_Nam.png";
           
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            txtname.Text = null;
        }

        protected void rbgender2_CheckedChanged(object sender, EventArgs e)
        {
            if (rbgender2.Checked)
                imgAva.ImageUrl = "~/images/pic_Nu.png";
        }

        protected void lstDay_SelectedIndexChanged(object sender, EventArgs e)
        {
            ValidateDate();
        }

        protected void lstMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            ValidateDate();
        }

        protected void lstYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            ValidateDate();
        }

        void ValidateDate()
        {
            string date = lstYear.SelectedValue.ToString() + "-"
                + lstMonth.SelectedValue.ToString() + "-"
                + lstDay.SelectedValue.ToString();
            try
            {
                Convert.ToDateTime(date);
                validate.Text = "";
            }
            catch
            {
                validate.Text="Ngày không hợp lệ";
                lstDay.SelectedValue = "1";
                lstMonth.SelectedValue = "1";
                lstYear.SelectedValue = DateTime.Now.Year.ToString();
            }
        }

        protected void txtname_TextChanged(object sender, EventArgs e)
        {
        }

        protected void CheckBox10_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}