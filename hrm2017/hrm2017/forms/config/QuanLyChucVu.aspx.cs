using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.config
{
    public partial class QuanLyChucVu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string thaotac = Request.QueryString["thaotac"];
                string macv = Request.QueryString["macv"];


                switch (thaotac)
                {
                    case "them":
                        pn2.Visible = true;
                        pnDSCV.Visible = false;
                        //txtMaPB.ReadOnly = true;
                        btn_them.Visible = true;

                        lbTieude.Text = "THÊM CHỨC VỤ";
                        break;
                    case "sua":
                        pn2.Visible = true;
                        pnDSCV.Visible = false;
                        txtMaCV.ReadOnly = true;
                        btn_sua.Visible = true;
                        lbTieude.Text = "SỬA CHỨC VỤ";
                        loadChucVu();
                        txtMaCV.ReadOnly = true;
                        btn_luu.Visible = true;
                        btn_sua.Visible = false;
                        txtTenCV.Focus();
                        break;
                    case "xem":
                        pn2.Visible = true;
                        pnDSCV.Visible = false;
                        btn_xoa.Visible = true;
                        btn_sua.Visible = true;
                        loadChucVu();
                        lbTieude.Text = "THÔNG TIN CHỨC VỤ";
                        txtMaCV.ReadOnly = true;
                        txtTenCV.ReadOnly = true;
                        break;
                    default:
                        lbTieude.Text = "DANH SÁCH CHỨC VỤ";
                        break;
                }
            }

            loadDanhSachChucVu();
        }
        private void loadDanhSachChucVu()
        {
            string sql = @"SELECT ROW_NUMBER() over (order by MACV) as 'STT', MACV as 'MÃ CHỨC VỤ',TENCV as 'TÊN CHỨC VỤ' FROM tbl_chucvu";
            DataTable db = DataMan.GetDataTable(sql);
            db.Columns.Add("CHI TIẾT");
            for (int i = 0; i < db.Rows.Count; i++)
            {
                int n = db.Columns.Count - 1;
                string macv = db.Rows[i][1].ToString();
                db.Rows[i][n] = string.Format("<a href='QuanLyChucVu.aspx?thaotac=xem&macv={0}'>Chi tiết</a>", macv);

            }
            lbDsPhongBan.Text = InterMan.ConvertToHtml(db);
        }
        private void loadChucVu()
        {
            string macv = Request.QueryString["macv"];
            string sql = string.Format(@"SELECT * FROM tbl_chucvu WHERE MACV = '{0}'", macv);
            DataTable db = DataMan.GetDataTable(sql);
            txtMaCV.Text = db.Rows[0]["MACV"].ToString();
            txtTenCV.Text = db.Rows[0]["TENCV"].ToString();

        }
        protected void btn_them_Click(object sender, EventArgs e)
        {
            string sql_check_ma = string.Format(@"SELECT * FROM tbl_chucvu WHERE MACV = '{0}'", txtMaCV.Text);
            DataTable dt = DataMan.GetDataTable(sql_check_ma);

            if (dt.Rows.Count > 0)
            {
                lbThongbao.Text = "Mã chức vụ đã tồn tại!!";
            }
            else
            {
                string sql = string.Format(@"
                INSERT INTO [hrm].[dbo].[tbl_chucvu] ([MACV],[TENCV])
                VALUES (N'{0}',N'{1}')", txtMaCV.Text, txtTenCV.Text);
                DataMan.ExcuteCommand(sql);
                //lbThongbao.Text = "Thêm thành công";
                Response.Redirect("QuanLyChucVu.aspx");

            }
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string macv = Request.QueryString["macv"];
            Response.Redirect(string.Format("QuanLyChucVu.aspx?thaotac=sua&macv={0}", macv));
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string macv = Request.QueryString["macv"];
            string sql = string.Format(@"
                DELETE [hrm].[dbo].[tbl_chucvu]
                WHERE MACV= {0}", macv);
            DataMan.ExcuteCommand(sql);
            Response.Redirect("QuanLyChucVu.aspx");
        }

        protected void btn_luu_Click(object sender, EventArgs e)
        {
            try
            {
                string macv = Request.QueryString["macv"];
                string sql = string.Format(@"
                UPDATE [hrm].[dbo].[tbl_chucvu]
                SET [TENCV] = N'{1}'
                WHERE MACV= {0}", macv, txtTenCV.Text);
                DataMan.ExcuteCommand(sql);
                Response.Redirect("QuanLyChucVu.aspx");

            }
            catch
            {
                lbThongbao.Text = "Thất bại";
            }


        }
    }
}