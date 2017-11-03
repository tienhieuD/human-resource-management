using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.config
{
    public partial class QuanLyKhenThuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string thaotac = Request.QueryString["thaotac"];
                string makl = Request.QueryString["makt"];


                switch (thaotac)
                {
                    case "them":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;
                        Them_maKT();
                        txtMaKT.ReadOnly = true;
                        btn_them.Visible = true;

                        lbTieude.Text = "THÊM KHEN THƯỞNG";
                        break;
                    case "sua":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;
                        txtMaKT.ReadOnly = true;
                        btn_sua.Visible = true;
                        lbTieude.Text = "SỬA KHEN THƯỞNG";
                        loadKT();
                        txtMaKT.ReadOnly = true;
                        btn_luu.Visible = true;
                        btn_sua.Visible = false;
                        txtTenKT.Focus();
                        break;
                    case "xem":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;
                        btn_xoa.Visible = true;
                        btn_sua.Visible = true;
                        loadKT();
                        lbTieude.Text = "THÔNG TIN KHEN THƯỞNG";
                        txtMaKT.ReadOnly = true;
                        txtTenKT.ReadOnly = true;
                        break;
                    default:
                        lbTieude.Text = "DANH SÁCH HÌNH THỨC KHEN THƯỞNG";
                        break;
                }
            }

            loadDanhSachKT();
        }
        private void loadDanhSachKT()
        {
            string sql = @"SELECT ROW_NUMBER() over (order by MAKHENTHUONG) as 'STT', MAKHENTHUONG as 'MÃ KHEN THƯỞNG',TENKHENTHUONG as 'TÊN KHEN THƯỞNG' FROM tbl_khenthuong";
            DataTable db = DataMan.GetDataTable(sql);
            db.Columns.Add("CHI TIẾT");
            for (int i = 0; i < db.Rows.Count; i++)
            {
                int n = db.Columns.Count - 1;
                string makt = db.Rows[i][1].ToString();
                db.Rows[i][n] = string.Format("<a href='QuanLyKhenThuong.aspx?thaotac=xem&makt={0}'>Chi tiết</a>", makt);

            }
            lbDsKhenThuong.Text = InterMan.ConvertToHtml(db);
        }
        private void loadKT()
        {
            string makt = Request.QueryString["makt"];
            string sql = string.Format(@"SELECT * FROM tbl_khenthuong WHERE MAKHENTHUONG = '{0}'", makt);
            DataTable db = DataMan.GetDataTable(sql);
            txtMaKT.Text = db.Rows[0]["MAKHENTHUONG"].ToString();
            txtTenKT.Text = db.Rows[0]["TENKHENTHUONG"].ToString();
        }
        protected void btn_them_Click(object sender, EventArgs e)
        {
            string sql = string.Format(@"
            INSERT INTO [dbo].[tbl_khenthuong] ([TENKHENTHUONG])
            VALUES (N'{0}')",txtTenKT.Text);
            DataMan.ExcuteCommand(sql);
            Response.Redirect("QuanLyKhenThuong.aspx");
    
        }
        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string makt = Request.QueryString["makt"];
            Response.Redirect(string.Format("QuanLyKhenThuong.aspx?thaotac=sua&makt={0}", makt));
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string makt = Request.QueryString["makt"];
            string sql = string.Format(@"
                DELETE [dbo].[tbl_khenthuong]
                WHERE MAKHENTHUONG = {0}", makt);
            DataMan.ExcuteCommand(sql);
            Response.Redirect("QuanLyKhenThuong.aspx");
        }

        protected void btn_luu_Click(object sender, EventArgs e)
        {
            try
            {
                string makt = Request.QueryString["makt"];
                string sql = string.Format(@"
                UPDATE [dbo].[tbl_khenthuong]
                SET [TENKHENTHUONG] = N'{1}'
                WHERE MAKHENTHUONG= {0}", makt, txtTenKT.Text);
                DataMan.ExcuteCommand(sql);
                Response.Redirect("QuanLyKhenThuong.aspx");

            }
            catch
            {
                lbThongbao.Text = "Thất bại";
            }
        }
        void Them_maKT()
        {
            string tang_ma = @"select MAKHENTHUONG from tbl_khenthuong order by MAKHENTHUONG DESC";
            DataTable db = DataMan.GetDataTable(tang_ma);
            int ma_cuoi = Convert.ToInt16(db.Rows[0][0].ToString()) + 1;
            txtMaKT.Text = ma_cuoi.ToString();
        }
    }
}