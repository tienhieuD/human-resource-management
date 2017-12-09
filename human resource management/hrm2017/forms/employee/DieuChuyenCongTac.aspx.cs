using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.employee
{
    public partial class LichDieuChuyenCongTac : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string thaotac = Request.QueryString["thaotac"];
                string madc = Request.QueryString["madc"];
                loadChucVu();
                loadPhongBan();
                loadnv();
                switch (thaotac)
                {
                    case "them":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;

                        btn_them.Visible = true;

                        lbTieude.Text = "THÊM ĐIỀU CHUYỂN CÔNG TÁC";
                        break;
                    case "sua":
                        pn2.Visible = true;
                        pnDSKL.Visible = false;
                        lbTieude.Text = "SỬA ĐIỀU CHUYỂN CÔNG TÁC";
                        loadDC();
                        btn_luu.Visible = true;
                        btn_sua.Visible = false;
                        pnHT.Enabled = false;
                        break;
                    case "xem":
                        pn2.Visible = true;
                        pn2.Enabled = false;
                        pnDSKL.Visible = false;
                        btn_xoa.Visible = true;
                        btn_sua.Visible = true;
                        loadDC();
                        lbTieude.Text = "THÔNG TIN ĐIỀU CHUYỂN CÔNG TÁC";

                        break;
                    default:
                        lbTieude.Text = "DANH SÁCH ĐIỀU CHUYỂN CÔNG TÁC";
                        break;
                }
            }
            loadChiTet();
        }
        private void loadChiTet()
        {
            string sql = @"
                SELECT ROW_NUMBER() OVER(ORDER BY tbl_chuyencongtac.MADC) as 'STT' 
                  ,[MADC] AS 'MÃ ĐIỀU CHUYỂN'
                  ,tbl_nhanvien.HOTEN AS 'HỌ TÊN',tbl_chucvu.TENCV AS 'TÊN CHỨC VỤ MỚI',tbl_phongban.TENPB AS 'TÊN PHÒNG BAN MỚI'
                  ,CAST([NGAYCHUYEN] AS NVARCHAR) AS 'NGÀY CHUYỂN'
                  ,[LYDO] AS 'LÝ DO'
                FROM [dbo].[tbl_chuyencongtac] 
                    INNER JOIN tbl_nhanvien ON tbl_chuyencongtac.MANV = tbl_nhanvien.MANV 
                    INNER JOIN tbl_chucvu ON tbl_chuyencongtac.MACVMOI = tbl_chucvu.MACV
                    INNER JOIN tbl_phongban ON tbl_chuyencongtac.MAPBMOI = tbl_phongban.MAPB
                WHERE tbl_nhanvien.ACTIVE = N'True'";
            DataTable db = DataMan.GetDataTable(sql);
            db.Columns.Add("CHI TIẾT");
            for (int i = 0; i < db.Rows.Count; i++)
            {
                int n = db.Columns.Count - 1;
                string madc = db.Rows[i][1].ToString();
                db.Rows[i][n] = string.Format("<a href='DieuChuyenCongTac.aspx?thaotac=xem&madc={0}'>Chi tiết</a>", madc);
            }
            lbLDCCT.Text = InterMan.ConvertToHtml(db);
        }
        private void loadDC()
        {
            string madc = Request.QueryString["madc"];
            string sql = @"
                SELECT MADC,MANV,CAST([NGAYCHUYEN] AS NVARCHAR),LYDO,MAPBMOI,MACVMOI,GHICHU
                FROM [dbo].[tbl_chuyencongtac]
                WHERE MADC =" + madc;
            DataTable db = DataMan.GetDataTable(sql);
            lstManhanvien.SelectedValue = db.Rows[0]["MANV"].ToString();
            lstChucvu.SelectedValue = db.Rows[0]["MACVMOI"].ToString();
            lstPB.SelectedValue = db.Rows[0]["MAPBMOI"].ToString();
            txtNgaybanhanh.Text = Convert.ToDateTime(db.Rows[0][2].ToString()).ToString("yyyy-MM-dd");
            txtghichu.Text = db.Rows[0]["GHICHU"].ToString();
            txtLD.Text = db.Rows[0]["LYDO"].ToString();      
        }
        private void loadnv()
        {
            string sql = @"SELECT MANV,HOTEN FROM tbl_nhanvien WHERE ACTIVE = 'True'";
            DataTable dt = DataMan.GetDataTable(sql);
            lstManhanvien.DataSource = dt;
            lstManhanvien.DataTextField = "HOTEN";
            lstManhanvien.DataValueField = "MANV";
            lstManhanvien.DataBind();
        }
       private void loadPhongBan()
        {
            string sql = "SELECT * FROM tbl_phongban";
            DataTable data = DataMan.GetDataTable(sql);
            lstPB.DataSource = data;
            lstPB.DataTextField = "TENPB";
            lstPB.DataValueField = "MAPB";
            lstPB.DataBind();
        }
        private void loadChucVu()
        {
            string sql = "SELECT * FROM tbl_chucvu";
            DataTable data = DataMan.GetDataTable(sql);
            lstChucvu.DataSource = data;
            lstChucvu.DataTextField = "TENCV";
            lstChucvu.DataValueField = "MACV";
            lstChucvu.DataBind();
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            string sql = string.Format(@"
                    INSERT INTO [dbo].[tbl_chuyencongtac]
                               ([MANV]
                               ,[NGAYCHUYEN]
                               ,[LYDO]
                               ,[MAPBMOI]
                               ,[MACVMOI]
                               ,[GHICHU])
                         VALUES
                               (N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}')",lstManhanvien.SelectedValue.ToString(),
                               txtNgaybanhanh.Text,txtLD.Text,lstPB.SelectedValue.ToString(),
                               lstChucvu.SelectedValue.ToString(),txtghichu.Text);
            DataMan.ExcuteCommand(sql);
            UploadThongTinNV(lstManhanvien.SelectedValue.ToString(), lstPB.SelectedValue.ToString(), lstChucvu.SelectedValue.ToString());
            Response.Redirect("DieuChuyenCongTac.aspx");
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            string madc = Request.QueryString["madc"];
            Response.Redirect(string.Format("DieuChuyenCongTac.aspx?thaotac=sua&madc={0}", madc));
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string madc = Request.QueryString["madc"];
            string sql = string.Format(@"
                DELETE FROM [dbo].[tbl_chuyencongtac]
                WHERE MADC={0}",madc);
            DataMan.ExcuteCommand(sql);
            Response.Redirect("DieuChuyenCongTac.aspx");
        }

        protected void btn_luu_Click(object sender, EventArgs e)
        {
            try
            {
                string madc = Request.QueryString["madc"];
                string sql = string.Format(@"
                    UPDATE [dbo].[tbl_chuyencongtac]
                       SET [MANV] = N'{1}'
                          ,[NGAYCHUYEN] = N'{2}'
                          ,[LYDO] = N'{3}'
                          ,[MAPBMOI] = N'{4}'
                          ,[MACVMOI] = N'{5}'
                          ,[GHICHU] = N'{6}'
                     WHERE MADC = {0}", madc, lstManhanvien.SelectedValue.ToString(), txtNgaybanhanh.Text,
                         txtLD.Text, lstPB.SelectedValue.ToString(), lstChucvu.SelectedValue.ToString(), txtghichu.Text);
                DataMan.ExcuteCommand(sql);
                UploadThongTinNV(lstManhanvien.SelectedValue.ToString(), lstPB.SelectedValue.ToString(), lstChucvu.SelectedValue.ToString());
                Response.Redirect("DieuChuyenCongTac.aspx");
            }
            catch
            {
                lbThongbao.Text = "Sửa thất bại!!";
            }
           
        }

        protected void lstManhanvien_SelectedIndexChanged(object sender, EventArgs e)
        {
            string manv = lstManhanvien.SelectedValue.ToString();
            string sql = string.Format("SELECT PHONGBAN,CHUCVU from tbl_nhanvien WHERE MANV={0} AND ACTIVE = N'True'", manv);
            DataTable db = DataMan.GetDataTable(sql);
            lstChucvu.SelectedValue = db.Rows[0][1].ToString();
            lstPB.SelectedValue = db.Rows[0][0].ToString();
        }
        private void UploadThongTinNV(string manv,string pb,string cv)
        {
            string sql = string.Format(@"
                    UPDATE tbl_nhanvien
                    SET [PHONGBAN]=N'{1}',[CHUCVU]=N'{2}'
                    WHERE MANV='{0}'",manv,pb,cv);
            DataMan.ExcuteCommand(sql);
        }
    }
}