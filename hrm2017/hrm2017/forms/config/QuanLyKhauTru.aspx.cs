using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.config
{
    public partial class QuanLyKhauTru : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                string makt = Request.QueryString["makt"];
                string thaotac = Request.QueryString["thaotac"];
                switch(thaotac)
                {
                    case "xem":
                        pn1.Visible = false;
                        pn3.Visible = true;
                        btn_sua.Visible = true;
                        btn_xoa.Visible = true;
                        txtKT.ReadOnly = true;
                        txtMaKL.ReadOnly = true;
                        txtTenKT.ReadOnly = true;
                        loadChiTiet();
                        lb_tieude.Text = "THÔNG TIN KHẤU TRỪ";
                        break;
                    case "sua":
                        lb_tieude.Text = "SỬA THÔNG TIN KHẤU TRỪ";
                        pn3.Visible = true;
                        pn1.Visible = false;
                        btn_luu.Visible = true;
                        loadChiTiet();
                        txtMaKL.ReadOnly = true;
                        break;
                    case "them":
                        lb_tieude.Text = "THÊM THÔNG TIN KHẤU TRỪ";
                        txtMaKL.ReadOnly = true;
                        pn3.Visible = true;
                        pn1.Visible = false;
                        btn_them.Visible = true;
                        break;
                    default:
                        lbTieude.Text = "DANH SÁCH KHẤU TRỪ";
                        break;
                }
            }
            loadKhauTru();
        }
        private void loadKhauTru()
        {
            string sql = @"SELECT ROW_NUMBER() over (ORDER BY MAKT) AS 'STT', MAKT AS 'MÃ KHẤU TRỪ',
                            TENKT AS 'TÊN KHẤU TRỪ',KHAUTRU AS 'KHẤU TRỪ (đơn vị %)'
                            FROM tbl_khautru";
            DataTable db = DataMan.GetDataTable(sql);
            db.Columns.Add("CHI TIẾT");

            for(int i=0;i < db.Rows.Count;i++)
            {
                int n = db.Columns.Count - 1;
                string makt = db.Rows[i][1].ToString();
                db.Rows[i][n] = string.Format("<a href='QuanLyKhauTru.aspx?thaotac=xem&makt={0}'>Chi tiết</a>",makt);
               
            }
            lbDsKT.Text = InterMan.ConvertToHtml(db);
            lbtest.Text = InterMan.ConvertToHtml(db);
        }
        private void loadChiTiet()
        {
            string makt = Request.QueryString["makt"];
            string sql = @"SELECT * FROM tbl_khautru WHERE MAKT="+makt;
            DataTable db = DataMan.GetDataTable(sql);
            txtMaKL.Text = db.Rows[0][0].ToString();
            txtTenKT.Text = db.Rows[0][1].ToString();
            txtKT.Text = db.Rows[0][2].ToString();
            
        }
        protected void btn_them_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = string.Format(@"
                        INSERT INTO tbl_khautru(TENKT,KHAUTRU)
                        VALUES(N'{0}','{1}')",txtTenKT.Text,txtKT.Text);
                DataMan.ExcuteCommand(sql);
                lb_tb.Text = "Thêm Thành công";
                loadKhauTru();
                txtTenKT.Text = "";
                txtKT.Text = "";
            }
            catch(Exception ex)
            {
                lbThongbao.Text = "Lỗi!! Vui lòng kiểm tra lại thông tin";
            }
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string makt = Request.QueryString["makt"];
            Response.Redirect(string.Format("QuanLyKhauTru.aspx?thaotac=sua&makt={0}",makt));
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            try
            {
                string makt = Request.QueryString["makt"];
                string sql = string.Format(@"
                    DELETE tbl_khautru
                    WHERE MAKT={0}",makt);
                DataMan.ExcuteCommand(sql);
                lb_tb.Text = "Xóa Thành công";
                loadKhauTru();
                btn_sua.Visible = false;
            }
            catch
            {
                
            }
        }
        protected void btn_luu_Click(object sender, EventArgs e)
        {
            try
            {
                string makt = Request.QueryString["makt"];
                string sql = string.Format(@"
                    UPDATE tbl_khautru
                    SET TENKT='{1}',KHAUTRU='{2}'
                    WHERE MAKT='{0}'", makt, txtTenKT.Text, txtKT.Text);
                DataMan.ExcuteCommand(sql);
               
                lb_tb.Text = "Sửa Thành công";
                loadKhauTru();
            }
            catch
            {
                lbThongbao.Text = "Lỗi!!";
            }
        }
    }
}