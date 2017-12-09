using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.config
{
    public partial class QuanLyTamUng : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                string matu = Request.QueryString["matu"];
                string thaotac = Request.QueryString["thaotac"];
                loadTennv();
                switch (thaotac)
                {
                    case "them":
                        lbTieude.Text = "THÊM THÔNG TIN TẠM ỨNG";
                        pn2.Visible = true;
                        pnDSTU.Visible = false;
                        tang_ma();
                        btn_them.Visible = true;
                        break;
                    case "sua":
                        lbTieude.Text = "SỬA THÔNG TIN TẠM ỨNG";
                        pn2.Visible = true;
                        pnDSTU.Visible = false;
                        btn_sua.Visible = false;
                        btn_luu.Visible = true;
                        btn_xoa.Visible = false;
                        pnTU.Enabled = false;
                        loadChiTiet(matu);
                        break;
                    case "xem":
                        pn2.Visible = true;
                        pnDSTU.Visible = false;
                        btn_xoa.Visible = true;
                        btn_sua.Visible = true;
                        loadChiTiet(matu);
                        pn2.Enabled = false;
                        lbTieude.Text = "THÔNG TIN TẠM ỨNG";
                        break;
                    default:
                        lbTieude.Text = "DANH SÁCH TẠM ỨNG";
                        break;
                }
            }
            loadTamUng();
        }
        private void loadTamUng()
        {
            string sql = @"SELECT ROW_NUMBER() over (order by MATU) AS 'STT',
                               MATU AS 'MÃ TẠM ỨNG',tbl_nhanvien.HOTEN AS 'HỌ TÊN NHÂN VIÊN',
                               SOTIEN AS 'SỐ TIỀN',
                               CAST([NGAYTU] AS NVARCHAR) AS 'NGÀY TẠM ỨNG'
                           FROM tbl_tamung INNER JOIN tbl_nhanvien ON tbl_tamung.MANV = tbl_nhanvien.MANV";
            DataTable db = DataMan.GetDataTable(sql);
            db.Columns.Add("Chi tiết");
            for(int i = 0; i < db.Rows.Count; i++)
            {
                int n = db.Columns.Count - 1;
                string matu = db.Rows[i][1].ToString();
                db.Rows[i][n] = string.Format("<a href='QuanLyTamUng.aspx?thaotac=xem&matu={0}'>Chi tiết</a>", matu);
            }
            lbDsTU.Text = InterMan.ConvertToHtml(db);
        }
        private void loadTennv()
        {
            string sql = @"SELECT MANV,HOTEN FROM tbl_nhanvien WHERE ACTIVE = 'True'";
            DataTable dt = DataMan.GetDataTable(sql);
            lstHoten.DataSource = dt;
            lstHoten.DataTextField = "HOTEN";
            lstHoten.DataValueField = "MANV";
            lstHoten.DataBind();
        }
        private void loadChiTiet(string matu)
        {
            string sql = string.Format("SELECT * FROM tbl_tamung WHERE MATU={0}",matu);
            DataTable db = DataMan.GetDataTable(sql);
            txtMaTU.Text = db.Rows[0]["MATU"].ToString();
            lstHoten.SelectedValue = db.Rows[0][1].ToString();
            txtNgayung.Text = Convert.ToDateTime(db.Rows[0][3].ToString()).ToString("yyyy-MM-dd");
            txtSotien.Text = db.Rows[0][2].ToString();
        }
        protected void btn_them_Click(object sender, EventArgs e)
        {
            try
            {
                string sql_ma = @"SELECT MATU from tbl_tamung ORDER BY MATU DESC";
                DataTable db = DataMan.GetDataTable(sql_ma);
                txtMaTU.Text = db.Rows[0][0].ToString();
                string matu = Request.QueryString["matu"];
                string sql = string.Format(
                        @"INSERT INTO tbl_tamung([MANV],[SOTIEN],[NGAYTU])
                          VALUES('{0}','{1}','{2}')",lstHoten.SelectedValue.ToString(),txtSotien.Text,txtNgayung.Text);
                DataMan.ExcuteCommand(sql);
                Response.Redirect("QuanLyTamUng.aspx");

            }catch(Exception ex)
            {
                lbThongbao.Text = ex.ToString();
            }
            
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string matu = Request.QueryString["matu"];
            Response.Redirect(string.Format("QuanLyTamUng.aspx?thaotac=sua&matu={0}",matu));
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            try
            {
                string matu = Request.QueryString["matu"];
                DataMan.ExcuteCommand(string.Format(@"DELETE tbl_tamung WHERE MATU={0}", matu));
                Response.Redirect("QuanLyTamUng.aspx");
            }
            catch(Exception ex)
            {
                lbThongbao.Text = ex.ToString();
            }
            
        }

        protected void btn_luu_Click(object sender, EventArgs e)
        {
            try
            {
                string matu = Request.QueryString["matu"];
                DataMan.ExcuteCommand(string.Format(@"
                        UPDATE tbl_tamung
                        SET [MANV] = '{1}',[SOTIEN]='{2}',[NGAYTU]='{3}'
                        WHERE MATU={0}",matu,lstHoten.SelectedValue.ToString(),txtSotien.Text,txtNgayung.Text));
                Response.Redirect("QuanLyTamUng.aspx");
            }catch(Exception ex)
            {
                lbThongbao.Text = ex.ToString();
            }
        }
        private void tang_ma()
        {
            DataTable db = DataMan.GetDataTable(@"SELECT MATU FROM tbl_tamung ORDER BY MATU DESC");
            if(db.Rows.Count > 0)
            {
                int matu = Convert.ToInt16(db.Rows[0][0].ToString())+1;
                txtMaTU.Text = matu.ToString();
            }
            else
            {
                txtMaTU.Text = "1";
            }
        }
    }
}