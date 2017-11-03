using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.config
{
    public partial class QuanLyPhuCapChucPhu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string thaotac = Request.QueryString["thaotac"];
                string mapc = Request.QueryString["mapc"];
                string macv = Request.QueryString["macv"];
                LoadListPhuCap();
                LoadListChucVu();


                switch (thaotac)
                {
                    case "them":
                        pnlForm.Visible = true;
                        pnlDs.Visible = false;
                        btnThem.Visible = true;
                        lbTieude.Text = "THÊM PHỤ CẤP CHỨC VỤ";
                        break;
                    case "sua":
                        pnlForm.Visible = true;
                        pnlDs.Visible = false;
                        lbTieude.Text = "SỬA PHỤ CẤP CHỨC VỤ";
                        btn_luu.Visible = false;
                        btn_sua.Visible = false;
                        break;
                    case "xem":
                        pnlForm.Visible = true;
                        pnlDs.Visible = false;
                        btn_xoa.Visible = true;
                        btn_sua.Visible = false;
                        pnlForm.Enabled = false;
                        lbTieude.Text = "THÔNG TIN PHỤ CẤP CHỨC VỤ";
                        loadDanhSachPhuCapChucVu();

                        break;
                    default:
                        lbTieude.Text = "DANH SÁCH PHỤ CẤP-CHỨC VỤ";
                        break;
                }
            }

            loadDanhSachPhuCapChucVu();
        }

        private void loadDanhSachPhuCapChucVu()
        {
           
           string sql = string.Format(
                   @"SELECT	MACV'Mã Chức Vụ',[TENCV] 'Tên Chức vụ',
		MAPC'Mã Phụ Cấp',[TENPC]	'Tên Phụ Cấp'
  FROM [dbo].[tbl_phucapchucvu]
  join tbl_phucap on tbl_phucap.MAPC=tbl_phucapchucvu.PHUCAPMAPC
  join tbl_chucvu on tbl_chucvu.MACV=tbl_phucapchucvu.CHUCVUMACV");
            DataTable dataTable = DataMan.GetDataTable(sql);
            dataTable.Columns.Add("Chi Tiết");
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                var donghientai = dataTable.Rows[i];
                string macv = donghientai[0].ToString();
                string mapc = donghientai[2].ToString();
                donghientai[4] = string.Format(
                    @"<a href = 'QuanLyPhuCapChucVu.aspx?thaotac=xem&macv={0}&mapc={1}'>chi tiết</a>",
                    macv,mapc);
            }
            lbDsPhuCapChucVu.Text =   InterMan.ConvertToHtml(dataTable);
        }
        
        protected void btn_them_Click(object sender,EventArgs e)
        {
            string sql = string.Format(
                @"INSERT INTO [dbo].[tbl_phucapchucvu]
           ([PHUCAPMAPC]
           ,[CHUCVUMACV])
     VALUES
           (N'{0}',N'{1}')",
                LstPhuCap.SelectedValue,
                LstChucVu.SelectedValue
                );
            try
            {
                DataMan.ExcuteCommand(sql);
                Response.Redirect(String.Format("QuanLyPhuCapChucVu.aspx?mapc={0}&macv={1}", 
                    LstPhuCap.SelectedValue,
                    LstChucVu.SelectedValue));
            }
            catch (Exception ex) { lbThongbao.Text = ex.Message; }
        }
        private void LoadListPhuCap()
        {
            string sql = @"SELECT * FROM tbl_phucap";
            InterMan.LoadDropDownList(LstPhuCap, new string[] { sql, "MAPC", "TENPC" });
        }
        private void LoadListChucVu()
        {
            string sql = @"SELECT * FROM tbl_chucvu";
            InterMan.LoadDropDownList(LstChucVu, new string[] { sql, "MACV", "TENCV" });
        }
        protected void btn_sua_Click(object sender, EventArgs e)
        {
          //  string mapc = Request.QueryString["mapc"];
           // Response.Redirect(string.Format("QuanLyPhuCapChucVu.aspx?thaotac=sua&map={0}&mcv={}", mapc));
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string mapc = Request.QueryString["mapc"];
            string macv = Request.QueryString["macv"];

            string sql = string.Format(
              @"DELETE FROM [dbo].[tbl_phucapchucvu]
      WHERE PHUCAPMAPC='{0}' AND CHUCVUMACV='{1}'",
              mapc, macv
              );
            try
            {
                DataMan.ExcuteCommand(sql);
                Response.Redirect(String.Format("QuanLyPhuCapChucVu.aspx?mapc={0}&macv={1}",
                    LstPhuCap.SelectedValue,
                    LstChucVu.SelectedValue));
            }
            catch (Exception ex) { lbThongbao.Text = ex.Message; }
        }

        protected void btn_luu_Click(object sender, EventArgs e)
        {
           try
           {
               string mapc = Request.QueryString["mapc"];
               string sql = string.Format(@"
                UPDATE [dbo].[tbl_phucapchucvu]
                SET[KHOANPC]=N'{1}'
               WHERE MAPC= {0}", mapc);
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