using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.employee
{
    public partial class HoSoKyLuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string thaotac = Request.QueryString["thaotac"];
                string manv = Request.QueryString["manv"];
                loadTennv();
                loadTenkl();
                switch (thaotac)
                {
                    case "them":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;

                        btn_them.Visible = true;

                        lbTieude.Text = "THÊM KỶ LUẬT NHÂN VIÊN";
                        break;
                    case "sua":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;
                        lbTieude.Text = "SỬA KỶ LUẬT NHÂN VIÊN";
                        loadChiTiet();
                        btn_luu.Visible = true;
                        btn_sua.Visible = false;
                        pnHTNV.Enabled = false;
                        break;
                    case "xem":
                        pn2.Visible = true;
                        pn2.Enabled = false;
                        pnDSKL.Visible = false;
                        btn_xoa.Visible = true;
                        btn_sua.Visible = true;
                        loadChiTiet();
                        lbTieude.Text = "THÔNG TIN KỶ LUẬT NHÂN VIÊN";

                        break;
                    default:
                        lbTieude.Text = "DANH SÁCH KỶ LUẬT NHÂN VIÊN";
                        break;
                }
            }
            loadHSKL();
        }
        private void loadHSKL()
        {
            string sql = @"
                SELECT ROW_NUMBER() OVER(ORDER BY tbl_kyluatnhanvien.NHANVIEN) as 'STT' ,
                    tbl_kyluatnhanvien.NHANVIEN as 'MÃ NHÂN VIÊN',tbl_nhanvien.HOTEN as 'HỌ TÊN',
                    tbl_kyluat.TENKYLUAT AS 'TÊN KỸ LUẬT',
                    CAST ([tbl_kyluatnhanvien].[NGAYKYLUAT] AS VARCHAR ) as 'NGÀY BAN HÀNH',tbl_kyluatnhanvien.SOTIEN as 'SỐ TIỀN',
	                CASE tbl_kyluatnhanvien.DANHAN 
		                WHEN 1 THEN N'Đã đóng'
		                ELSE N'Chưa đóng'
	                END AS 'GHI CHÚ'
                FROM tbl_kyluatnhanvien INNER JOIN tbl_nhanvien ON tbl_kyluatnhanvien.NHANVIEN = tbl_nhanvien.MANV 
		        INNER JOIN tbl_kyluat ON tbl_kyluatnhanvien.KYLUATMAKL = tbl_kyluat.MAKYLUAT
                WHERE tbl_nhanvien.ACTIVE = 'True'
            ";
            DataTable db = DataMan.GetDataTable(sql);
            db.Columns.Add("CHI TIẾT");
            for (int i = 0; i < db.Rows.Count; i++)
            {
                int n = db.Columns.Count - 1;
                string manv = db.Rows[i][1].ToString();
                db.Rows[i][n] = string.Format("<a href='HoSoKyLuat.aspx?thaotac=xem&manv={0}'>Chi tiết</a>", manv);
            }
            lbHSKL.Text = InterMan.ConvertToHtml(db);
        }
        private void loadTennv()
        {
            string sql = @"SELECT MANV,HOTEN FROM tbl_nhanvien WHERE ACTIVE = 'True'";
            DataTable dt = DataMan.GetDataTable(sql);
            lstManhanvien.DataSource = dt;
            lstManhanvien.DataTextField = "HOTEN";
            lstManhanvien.DataValueField = "MANV";
            lstManhanvien.DataBind();
        }
        private void loadTenkl()
        {
            string sql = @"SELECT * FROM tbl_kyluat";
            DataTable dt = DataMan.GetDataTable(sql);
            lstTenkl.DataSource = dt;
            lstTenkl.DataTextField = "TENKYLUAT";
            lstTenkl.DataValueField = "MAKYLUAT";
            lstTenkl.DataBind();
        }
        private void loadChiTiet()
        {
            string manv = Request.QueryString["manv"];
            string sql = string.Format(@"
                SELECT tbl_kyluat.MAKYLUAT,
		            CAST ([tbl_kyluatnhanvien].[NGAYKYLUAT] AS VARCHAR ),
		            tbl_kyluatnhanvien.SOTIEN,tbl_kyluatnhanvien.DANHAN
                FROM	tbl_kyluatnhanvien INNER JOIN tbl_nhanvien ON tbl_kyluatnhanvien.NHANVIEN = tbl_nhanvien.MANV 
		                INNER JOIN tbl_kyluat ON tbl_kyluatnhanvien.KYLUATMAKL = tbl_kyluat.MAKYLUAT 
                WHERE MANV = {0}", manv);
            DataTable db = DataMan.GetDataTable(sql);
            lstManhanvien.SelectedValue = manv;
            lstTenkl.SelectedValue = db.Rows[0][0].ToString();
            lstDanhan.SelectedValue = db.Rows[0][3].ToString();
            txtNgaybanhanh.Text = db.Rows[0][1].ToString();
            txtSotien.Text = db.Rows[0][2].ToString();

        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            string sql = string.Format(@"
                INSERT INTO [dbo].[tbl_kyluatnhanvien]
                       ([KYLUATMAKL]
                       ,[NHANVIEN]
                       ,[NGAYKYLUAT]
                       ,[SOTIEN]
                       ,[DANHAN])
                 VALUES
                       (N'{0}',N'{1}',N'{2}',N'{3}',N'{4}')",
                       lstTenkl.SelectedValue.ToString(), lstManhanvien.SelectedValue.ToString(),
                       txtNgaybanhanh.Text, txtSotien.Text, lstDanhan.SelectedValue.ToString());
            DataMan.ExcuteCommand(sql);
            Response.Redirect("HoSoKyLuat.aspx");
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string manv = Request.QueryString["manv"];
            Response.Redirect(string.Format("HoSoKyLuat.aspx?thaotac=sua&manv={0}", manv));
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string manv = Request.QueryString["manv"];
            string sql = string.Format(@"
                DELETE FROM [dbo].[tbl_kyluatnhanvien]
                WHERE NHANVIEN = '{0}'", manv);
            DataMan.ExcuteCommand(sql);
            Response.Redirect("HoSoKyLuat.aspx");
        }

        protected void btn_luu_Click(object sender, EventArgs e)
        {
            try
            {
                string manv = Request.QueryString["manv"];
                string sql = string.Format(@"
                UPDATE [dbo].[tbl_kyluatnhanvien]
                   SET [SOTIEN] = N'{1}',
                       [DANHAN] = N'{2}'
                 WHERE NHANVIEN = {0}", manv,txtSotien.Text, lstDanhan.SelectedValue.ToString());
                DataMan.ExcuteCommand(sql);
                Response.Redirect("HoSoKyLuat.aspx");
            }
            catch (Exception ex)
            {
                lbThongbao.Text = ex.Message.ToString();
            }
        }
    }
}