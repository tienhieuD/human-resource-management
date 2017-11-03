using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.config
{
    public partial class QuanLyKyLuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string thaotac = Request.QueryString["thaotac"];
                string makl = Request.QueryString["makl"];
                switch (thaotac)
                {
                    case "them":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;
                        btn_them.Visible = true;
                        Them_maKL();
                        lbTieude.Text = "THÊM KỸ LUẬT";
                        txtMaKL.ReadOnly = true;
                        break;
                    case "sua":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;
                        txtMaKL.ReadOnly = true;
                        btn_sua.Visible = true;
                        lbTieude.Text = "SỬA KỸ LUẬT";
                        loadKyLuat();
                        txtMaKL.ReadOnly = true;
                        btn_luu.Visible = true;
                        btn_sua.Visible = false;
                        txtTenKL.Focus();
                        break;
                    case "xem":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;
                        btn_xoa.Visible = true;
                        btn_sua.Visible = true;
                        loadKyLuat();
                        lbTieude.Text = "THÔNG TIN KỸ LUẬT";
                        txtMaKL.ReadOnly = true;
                        txtTenKL.ReadOnly = true;
                        break;
                    default:
                        lbTieude.Text = "DANH SÁCH KỸ LUẬT";
                        break;
                }
            }

            loadDanhSachKyLuat();
        }
        private void loadDanhSachKyLuat()
        {
            string sql = @"SELECT ROW_NUMBER() over (order by MAKYLUAT) as 'STT', MAKYLUAT as 'MÃ KỸ LUẬT',TENKYLUAT as 'TÊN KỸ LUẬT' FROM tbl_kyluat";
            DataTable db = DataMan.GetDataTable(sql);
            
            db.Columns.Add("CHI TIẾT");
            for (int i = 0; i < db.Rows.Count; i++)
            {
                int n = db.Columns.Count - 1;
                string makl = db.Rows[i][1].ToString();
                db.Rows[i][n] = string.Format("<a href='QuanLyKyLuat.aspx?thaotac=xem&makl={0}'>Chi tiết</a>", makl);
            }
            lbDsKyLuat.Text = InterMan.ConvertToHtml(db);
        }
        private void loadKyLuat()
        {
            string makl = Request.QueryString["makl"];
            string sql = string.Format(@"SELECT * FROM tbl_kyluat WHERE MAKYLUAT = '{0}'", makl);
            DataTable db = DataMan.GetDataTable(sql);
            txtMaKL.Text = db.Rows[0]["MAKYLUAT"].ToString();
            txtTenKL.Text = db.Rows[0]["TENKYLUAT"].ToString();
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
     
            string sql = string.Format(@"
            INSERT INTO [dbo].[tbl_kyluat] ([TENKYLUAT])
            VALUES (N'{0}')",txtTenKL.Text);
            DataMan.ExcuteCommand(sql);
            
            Response.Redirect("QuanLyKyLuat.aspx");

     
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string makl = Request.QueryString["makl"];
            Response.Redirect(string.Format("QuanLyKyLuat.aspx?thaotac=sua&makl={0}", makl));
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string makl = Request.QueryString["makl"];
            string sql = string.Format(@"
                DELETE [dbo].[tbl_kyluat]
                WHERE MAKYLUAT= {0}", makl);
            DataMan.ExcuteCommand(sql);
            Response.Redirect("QuanLyKyLuat.aspx");
        }

        protected void btn_luu_Click(object sender, EventArgs e)
        {
            try
            {
                string makl = Request.QueryString["makl"];
                string sql = string.Format(@"
                UPDATE [dbo].[tbl_kyluat]
                SET [TENKYLUAT] = N'{1}'
                WHERE MAKYLUAT= {0}", makl, txtTenKL.Text);
                DataMan.ExcuteCommand(sql);
                Response.Redirect("QuanLyKyLuat.aspx");

            }
            catch(Exception ex)
            {
                lbThongbao.Text = ex.ToString();
            }
        }
        void Them_maKL()
        {
            string tang_ma = @"select MAKYLUAT from tbl_kyluat order by MAKYLUAT DESC";
            DataTable db = DataMan.GetDataTable(tang_ma);
            int ma_cuoi = Convert.ToInt16(db.Rows[0][0].ToString()) + 1;
            txtMaKL.Text = ma_cuoi.ToString();
            txtMaKL.ReadOnly = true;
        }
    }
}