using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.attendence
{
    public partial class ChamCong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string[] phongBan = new string[] { "SELECT * FROM tbl_phongban", "MAPB", "TENPB" };
            InterMan.LoadDropDownList(lstPhongBan, phongBan);
            LoadListThangNam();
            lbThongTin.Text = "Tải dữ liệu để xem bảng công.";

            string checked_ck = Request.QueryString["checked_ck"];
            string unchecked_ck = Request.QueryString["unchecked_ck"];
            if (checked_ck != "" && checked_ck != null)
            {
                string[] manv_ngays = checked_ck
                    .Substring(0, checked_ck.Length - 1)
                    .Split('_');
                foreach (var item in manv_ngays)
                {
                    string[] ma_ngay = item.Split('w');
                    string sql = string.Format(
                        @"INSERT INTO [dbo].[tbl_chamcongngay]
                        ([MANV] ,[NGAY]) VALUES ('{0}' ,'{1}')",
                        ma_ngay[0], ma_ngay[1]);
                    try { DataMan.ExcuteCommand(sql); } catch { }
                }
            }
            if (unchecked_ck != "" && unchecked_ck != null)
            {
                string[] manv_ngays = unchecked_ck
                    .Substring(0, unchecked_ck.Length - 1)
                    .Split('_');
                foreach (var item in manv_ngays)
                {
                    string[] ma_ngay = item.Split('w');
                    string sql = string.Format(
                        @"DELETE FROM [dbo].[tbl_chamcongngay]
                        WHERE MANV='{0}' and NGAY='{1}'",
                        ma_ngay[0], ma_ngay[1]);
                    try { DataMan.ExcuteCommand(sql); } catch { }
                }
            }
            if (unchecked_ck != "" && unchecked_ck != null &&
                checked_ck != "" && checked_ck != null)
                Response.Redirect("ChamCong.aspx");
            btnTaiDuLieu_Click(sender, e);
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
            for (int i = year-1; i <= year+1; i++)
            {
                string nam = i.ToString();
                lstNam.Items.Add(new ListItem(nam, nam));
            }

            lstThang.SelectedValue = DateTime.Now.Month.ToString();
            lstNam.SelectedValue = DateTime.Now.Year.ToString();
        }

        protected void lstPhongBan_SelectedIndexChanged(object sender, EventArgs e) { }

        protected void lstThang_SelectedIndexChanged(object sender, EventArgs e) { }

        protected void lstNam_SelectedIndexChanged(object sender, EventArgs e) { }

        protected void btnTaiDuLieu_Click(object sender, EventArgs e)
        {
            string sql = string.Format(
                @"SELECT MANV, HOTEN FROM tbl_nhanvien WHERE PHONGBAN = N'{0}' and ACTIVE='1'",
                lstPhongBan.SelectedValue.ToString());
            DataTable dataTable = DataMan.GetDataTable(sql);

            int year = int.Parse(lstNam.SelectedValue.ToString());
            int month = int.Parse(lstThang.SelectedValue.ToString());
            int daysInMonth = DateTime.DaysInMonth(year, month);
            for (int i = 0; i < daysInMonth; i++)
            {
                string day = (i + 1).ToString();
                dataTable.Columns.Add(day, typeof(string));
            }
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                for (int j = 2; j < dataTable.Columns.Count; j++)
                {
                    string manv = dataTable.Rows[i][0].ToString();
                    string ngay = (j - 1).ToString();
                    string sql_checked = string.Format(
                        @"SELECT * FROM tbl_chamcongngay
                        WHERE NGAY = '{0}-{1}-{2}' AND MANV = '{3}'", 
                        year, month, ngay, manv);
                    string check = DataMan.GetDataTable(sql_checked).Rows.Count > 0 ? " checked='checked' " : "";
                    string namthangngay = string.Format("{0}-{1}-{2}", year, month, ngay);
                    dataTable.Rows[i][j] = string.Format(
                        @"<input type='checkbox' {0} manv='{1}' ngay='{2}'/>",
                        check, manv, namthangngay);
                }
            }
            lbThongTin.Text = string.Format("Bảng công tháng {0} năm {1}.", month, year);
            lbDsNhanVien.Text = InterMan.ConvertToHtml(dataTable);
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {

        }
    }
}