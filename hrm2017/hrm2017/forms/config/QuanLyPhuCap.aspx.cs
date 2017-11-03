using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.config
{
    public partial class QuanLyPhuCap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string thaotac = Request.QueryString["thaotac"];
                string mapc = Request.QueryString["mapc"];


                switch (thaotac)
                {
                    case "them":
                        pn2.Visible = true;
                        pnDSPC.Visible = false;
                        txtMaPC.ReadOnly = true;
                        btn_them.Visible = true;

                        lbTieude.Text = "THÊM PHỤ CẤP";
                        break;
                    case "sua":
                        pn2.Visible = true;
                        pnDSPC.Visible = false;
                        txtMaPC.ReadOnly = true;
                        btn_sua.Visible = true;
                        lbTieude.Text = "SỬA PHỤ CẤP";
                        loadPhuCap();
                        txtMaPC.ReadOnly = true;
                        btn_luu.Visible = true;
                        btn_sua.Visible = false;
                        txtTenPC.Focus();
                        break;
                    case "xem":
                        pn2.Visible = true;
                        pnDSPC.Visible = false;
                        btn_xoa.Visible = true;
                        btn_sua.Visible = true;
                        loadPhuCap();
                        lbTieude.Text = "THÔNG TIN PHỤ CẤP";
                        txtMaPC.ReadOnly = true;
                        txtTenPC.ReadOnly = true;
                        txtSoTien.ReadOnly = true;
                        break;
                    default:
                        lbTieude.Text = "DANH SÁCH PHỤ CẤP";
                        break;
                }
            }

            loadDanhSachPhuCap();
        }

        private void loadDanhSachPhuCap()
        {
            string sql = @"SELECT ROW_NUMBER() over (order by MAPC) as 'STT', MAPC as 'MÃ CHỨC VỤ',TENPC as 'TÊN PHỤ CẤP',SOTIEN as 'SỐ TIỀN' FROM tbl_phucap";
            DataTable db = DataMan.GetDataTable(sql);
            db.Columns.Add("CHI TIẾT");
            for (int i = 0; i < db.Rows.Count; i++)
            {
                int n = db.Columns.Count - 1;
                string mapc = db.Rows[i][1].ToString();
                db.Rows[i][n] = string.Format("<a href='QuanLyPhuCap.aspx?thaotac=xem&mapc={0}'>Chi tiết</a>", mapc);

            }
            lbDsPhuCap.Text = InterMan.ConvertToHtml(db);
        }
        private void loadPhuCap()
        {
            string mapc = Request.QueryString["mapc"];
            string sql = string.Format(@"SELECT * FROM tbl_phucap WHERE MAPC = '{0}'", mapc);
            DataTable db = DataMan.GetDataTable(sql);
            txtMaPC.Text = db.Rows[0]["MAPC"].ToString();
            txtTenPC.Text = db.Rows[0]["TENPC"].ToString();
            txtSoTien.Text = db.Rows[0]["SOTIEN"].ToString();


        }
        protected void btn_them_Click(object sender, EventArgs e)
        {
            string sql_check_ma = string.Format(@"SELECT * FROM tbl_phucap WHERE MAPC = '{0}'", txtMaPC.Text);
            DataTable dt = DataMan.GetDataTable(sql_check_ma);

            if (dt.Rows.Count > 0)
            {
                lbThongbao.Text = "Mã phụ cấp đã tồn tại!!";
            }
            else
            {
                string sql = string.Format(@"
                INSERT INTO [dbo].[tbl_phucap] ([TENPC],[SOTIEN])
                VALUES (N'{0}',N'{1}')", txtTenPC.Text,txtSoTien.Text);
                DataMan.ExcuteCommand(sql);
                //lbThongbao.Text = "Thêm thành công";
                Response.Redirect("QuanLyPhuCap.aspx");

            }
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string mapc = Request.QueryString["mapc"];
            Response.Redirect(string.Format("QuanLyPhuCap.aspx?thaotac=sua&mapc={0}", mapc));
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string mapc = Request.QueryString["mapc"];
            string sql = string.Format(@"
                DELETE [dbo].[tbl_phucap]
                WHERE MAPC= {0}", mapc);
            DataMan.ExcuteCommand(sql);
            Response.Redirect("QuanLyPhuCap.aspx");
        }

        protected void btn_luu_Click(object sender, EventArgs e)
        {
            try
            {
                string mapc = Request.QueryString["mapc"];
                string sql = string.Format(@"
                UPDATE [dbo].[tbl_phucap]
                SET [TENPC] = N'{1}',[SOTIEN]=N'{2}'
                WHERE MAPC= {0}", mapc, txtTenPC.Text,txtSoTien.Text);
                DataMan.ExcuteCommand(sql);
                Response.Redirect("QuanLyPhuCap.aspx");

            }
            catch
            {
                lbThongbao.Text = "Thất bại";
            }


        }
    }
}