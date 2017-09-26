using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B2_1421050403_DuongTienHieu.frm
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbNgayThang.Text = string.Format(
                "HÔM NAY: NGÀY {0} THÁNG {1} NĂM {2}",
                DateTime.Now.Day, DateTime.Now.Month, DateTime.Now.Year);

                if (lstNam.Items.Count == 0)
                {
                    for (int i = 1; i < 32; i++)
                    {
                        string str = i.ToString();
                        lstNgay.Items.Add(new ListItem(str, str));
                    }

                    for (int i = 1; i < 13; i++)
                    {
                        string str = i.ToString();
                        lstThang.Items.Add(new ListItem(str, str));
                    }

                    for (int i = DateTime.Now.Year; i >= 1960; i--)
                    {
                        string str = i.ToString();
                        lstNam.Items.Add(new ListItem(str, str));
                    }
                }

        }
    }
}