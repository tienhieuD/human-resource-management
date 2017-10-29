using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.employee
{
    public partial class HoSoKhenThuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string thaotac = Request.QueryString["thaotac"];
                string manv = Request.QueryString["manv"];
                loadTennv();
                loadTenkhenthuong();
                

                switch (thaotac)
                {
                    case "them":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;

                        btn_them.Visible = true;

                        lbTieude.Text = "THÊM KHEN THƯỞNG NHÂN VIÊN";
                        break;
                    case "sua":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;
                        lbTieude.Text = "SỬA KHEN THƯỞNG NHÂN VIÊN";
                        loadChiTiet();
                        btn_luu.Visible = true;
                        btn_sua.Visible = false;
                        lstManhanvien.Enabled = false;
                        
                        break;
                    case "xem":
                        pn2.Visible = true;
                        pn2.Enabled = false;
                        pnDSKL.Visible = false;
                        btn_xoa.Visible = true;
                        btn_sua.Visible = true;
                        loadChiTiet();
                        lbTieude.Text = "THÔNG TIN KHEN THƯỞNG NHÂN VIÊN";
                        
                        break;
                    default:
                        lbTieude.Text = "DANH SÁCH KHEN THƯỞNG NHÂN VIÊN";
                        break;
                }
            }
            loadHSKT();
        }
        private void loadHSKT()
        {
            string sql = @"
                SELECT ROW_NUMBER() OVER(ORDER BY tbl_khenthuongnhanvien.NHANVIENMANV) as 'STT' ,
                    tbl_khenthuongnhanvien.NHANVIENMANV as 'MÃ NHÂN VIÊN',tbl_nhanvien.HOTEN as 'HỌ TÊN',
                    tbl_khenthuong.TENKHENTHUONG AS 'TÊN KHEN THƯỞNG',
                    CAST ([tbl_khenthuongnhanvien].[NGAYKHENTHUONG] AS VARCHAR ) as 'NGÀY BAN HÀNH',tbl_khenthuongnhanvien.SOTIEN as 'SỐ TIỀN',
	                CASE tbl_khenthuongnhanvien.DANHAN 
		                WHEN 1 THEN N'Đã nhận thưởng'
		                ELSE N'Chưa nhận thưởng'
	                END AS 'GHI CHÚ'
                FROM tbl_khenthuongnhanvien INNER JOIN tbl_nhanvien ON tbl_khenthuongnhanvien.NHANVIENMANV = tbl_nhanvien.MANV 
		        INNER JOIN tbl_khenthuong ON tbl_khenthuongnhanvien.KHENTHUONGMAKT = tbl_khenthuong.MAKHENTHUONG
            ";
            DataTable db = DataMan.GetDataTable(sql);
            db.Columns.Add("CHI TIẾT");
            for(int i = 0; i< db.Rows.Count; i++)
            {
                int n = db.Columns.Count - 1;
                string manv = db.Rows[i][1].ToString();
                db.Rows[i][n] = string.Format("<a href='HoSoKhenThuong.aspx?thaotac=xem&manv={0}'>Chi tiết</a>", manv);
            }
            lbHSKT.Text = InterMan.ConvertToHtml(db);
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
        private void loadTenkhenthuong()
        {
            string sql = @"SELECT * FROM tbl_khenthuong";
            DataTable dt = DataMan.GetDataTable(sql);
            lstTenkhenthuong.DataSource = dt;
            lstTenkhenthuong.DataTextField = "TENKHENTHUONG";
            lstTenkhenthuong.DataValueField = "MAKHENTHUONG";
            lstTenkhenthuong.DataBind();
        }
        private void loadChiTiet()
        {
            string manv = Request.QueryString["manv"];
            string sql = string.Format(@"
                SELECT tbl_khenthuong.MAKHENTHUONG,
		            CAST ([tbl_khenthuongnhanvien].[NGAYKHENTHUONG] AS VARCHAR ),
		            tbl_khenthuongnhanvien.SOTIEN,tbl_khenthuongnhanvien.DANHAN
                FROM	tbl_khenthuongnhanvien INNER JOIN tbl_nhanvien ON tbl_khenthuongnhanvien.NHANVIENMANV = tbl_nhanvien.MANV 
		                INNER JOIN tbl_khenthuong ON tbl_khenthuongnhanvien.KHENTHUONGMAKT = tbl_khenthuong.MAKHENTHUONG 
                WHERE MANV = {0}", manv);
            DataTable db = DataMan.GetDataTable(sql);
            lstManhanvien.SelectedValue = manv;
            lstTenkhenthuong.SelectedValue = db.Rows[0][0].ToString();
            lstDanhan.SelectedValue =db.Rows[0][3].ToString();
            txtNgaybanhanh.Text = db.Rows[0][1].ToString();
            txtSotien.Text = db.Rows[0][2].ToString();
            
        }
        protected void btn_them_Click(object sender, EventArgs e)
        {
            string sql = string.Format(@"
                INSERT INTO [hrm].[dbo].[tbl_khenthuongnhanvien]
                       ([KHENTHUONGMAKT]
                       ,[NHANVIENMANV]
                       ,[NGAYKHENTHUONG]
                       ,[SOTIEN]
                       ,[DANHAN])
                 VALUES
                       (N'{0}',N'{1}',N'{2}',N'{3}',N'{4}')",
                       lstTenkhenthuong.SelectedValue.ToString(),lstManhanvien.SelectedValue.ToString(),
                       txtNgaybanhanh.Text,txtSotien.Text,lstDanhan.SelectedValue.ToString());
            DataMan.ExcuteCommand(sql);
            lbThongbao.Text = "Thêm thành công!!";
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string manv = Request.QueryString["manv"];
            Response.Redirect(string.Format("HoSoKhenThuong.aspx?thaotac=sua&manv={0}", manv));
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string manv = Request.QueryString["manv"];
            string sql = string.Format(@"
                DELETE FROM [hrm].[dbo].[tbl_khenthuongnhanvien]
                WHERE NHANVIENMANV = '{0}'",manv);
            DataMan.ExcuteCommand(sql);
            Response.Redirect("HoSoKhenThuong.aspx");
        }

        protected void btn_luu_Click(object sender, EventArgs e)
        {
            try
            {
                string manv = Request.QueryString["manv"];
                string sql = string.Format(@"
                UPDATE [hrm].[dbo].[tbl_khenthuongnhanvien]
                   SET [KHENTHUONGMAKT] = N'{1}',
                       [NGAYKHENTHUONG] = N'{2}',
                       [SOTIEN] = N'{3}',
                       [DANHAN] = N'{4}'
                 WHERE NHANVIENMANV = {0}", manv,
                     lstTenkhenthuong.SelectedValue.ToString(), txtNgaybanhanh.Text, txtSotien.Text, lstDanhan.SelectedValue.ToString());
                DataMan.ExcuteCommand(sql);
                Response.Redirect("HoSoKhenThuong.aspx");
            }
            catch(Exception ex)
            {
                lbThongbao.Text = ex.Message.ToString();
            }
           

        }
    }
}