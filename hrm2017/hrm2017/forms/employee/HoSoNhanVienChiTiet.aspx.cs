using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.employee
{
    public partial class HoSoNhanVienChiTiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string thaoTac = Request.QueryString["thaotac"];
                string manv = Request.QueryString["manv"];

                LoadListChucVu();
                LoadListPhongBan();
                LoadListHocVan();
                LoadListNgoaiNgu();
                switch (thaoTac)
                {
                    case "xem":
                        btnSua.Visible = true;
                        btnXoa.Visible = true;
                        btnHopDong.Visible = true;
                        LoadThongTinNhanVien(manv);
                        break;

                    case "them":
                        pnlMain.Enabled = true;
                        btnThem.Visible = true;
                        txtManv.ReadOnly = true;
                        txtHoTen.Focus();
                        break;

                    case "sua":
                        pnlMain.Enabled = true;
                        btnSua_Luu.Visible = true;
                        txtManv.ReadOnly = true;
                        txtHoTen.Focus();
                        LoadThongTinNhanVien(manv);
                        break;

                    case "xoa":

                        break;

                    default:
                        break;
                }
            }
        }
       
        private void LoadThongTinNhanVien(string manv)
        {
            DataTable dt = DataMan.GetDataTable(
                string.Format(@"SELECT *
                    FROM [DBO].[TBL_NHANVIEN] 
                    LEFT JOIN [DBO].[TBL_PHONGBAN] 
                    ON [DBO].[TBL_NHANVIEN].[PHONGBAN] = [DBO].[TBL_PHONGBAN].[MAPB]
                    LEFT JOIN TBL_CHUCVU 
                    ON [TBL_NHANVIEN].[CHUCVU] =  TBL_CHUCVU.MACV 
                    WHERE [MANV] = '{0}'", manv));
            lbTenNV.Text = dt.Rows[0]["HOTEN"].ToString();
            txtManv.Text = dt.Rows[0][0].ToString();
            txtHoTen.Text = dt.Rows[0][1].ToString();
            txtNgaysinh.Text = Convert.ToDateTime(dt.Rows[0][3].ToString()).ToString("yyyy-MM-dd");
            txtNoiSinh.Text = dt.Rows[0][4].ToString();
            txtDiaChi.Text = dt.Rows[0][5].ToString();
            txtQuequan.Text = dt.Rows[0][6].ToString();
            txtSDT.Text = dt.Rows[0][7].ToString();
            lstDanToc.Text = dt.Rows[0][8].ToString();
            txtTonGiao.Text = dt.Rows[0][9].ToString();
            txtSocmt.Text = dt.Rows[0][10].ToString();
            txtEmail.Text = dt.Rows[0][11].ToString();
            lstChucVu.SelectedValue = dt.Rows[0]["CHUCVU"].ToString();
            lstPhongBan.SelectedValue = dt.Rows[0]["PHONGBAN"].ToString();
            txtGhiChu.Text = dt.Rows[0]["GHICHU"].ToString();
            lstTDNN.SelectedValue = dt.Rows[0]["TRINHDONN"].ToString();
            lstTDHV.SelectedValue = dt.Rows[0]["TRINHDOHV"].ToString();
            bool gt = bool.Parse(dt.Rows[0]["GIOITINH"].ToString());
            rb_Nam.Checked = gt;
            rb_Nu.Checked = !gt;
        }
        private void LoadListHocVan()
        {
            string sql = "SELECT * FROM tbl_trinhdohocvan";
            DataTable data = DataMan.GetDataTable(sql);
            lstTDHV.DataSource = data;
            lstTDHV.DataTextField = "TENTRINHDO";
            lstTDHV.DataValueField = "MATD";
            lstTDHV.DataBind();
        }
        private void LoadListNgoaiNgu()
        {
            string sql = "SELECT * FROM tbl_trinhdongoaingu";
            DataTable data = DataMan.GetDataTable(sql);
            lstTDNN.DataSource = data;
            lstTDNN.DataTextField = "TENTRINHDONN";
            lstTDNN.DataValueField = "MATRNN";
            lstTDNN.DataBind();
        }
        private void LoadListChucVu()
        {
            string sql = "SELECT * FROM tbl_chucvu";
            DataTable data = DataMan.GetDataTable(sql);
            lstChucVu.DataSource = data;
            lstChucVu.DataTextField = "TENCV";
            lstChucVu.DataValueField = "MACV";
            lstChucVu.DataBind();
        }

        private void LoadListPhongBan()
        {
            string sql = "SELECT * FROM tbl_phongban";
            DataTable data = DataMan.GetDataTable(sql);
            lstPhongBan.DataSource = data;
            lstPhongBan.DataTextField = "TENPB";
            lstPhongBan.DataValueField = "MAPB";
            lstPhongBan.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
           
            int gt = rb_Nam.Checked ? 1 : 0;
            string sql = string.Format(
                @"INSERT INTO [dbo].[tbl_nhanvien]
                ([HOTEN],[GIOITINH],[NGAYSINH],[NOISINH]
                ,[DIACHI],[QUEQUAN],[SODIENTHOAI],[DANTOC]
                ,[TONGIAO],[SOCMT],[EMAIL],[CHUCVU],[PHONGBAN]
                ,[GHICHU],[ACTIVE],[TRINHDOHV],[TRINHDONN])
                VALUES
                (N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N'{6}',N'{7}',
                N'{8}',N'{9}',N'{10}',N'{11}',N'{12}',N'{13}',N'True','{14}','{15}')", txtHoTen.Text, gt, txtNgaysinh.Text,
                txtNoiSinh.Text, txtDiaChi.Text, txtQuequan.Text, txtSDT.Text, lstDanToc.SelectedValue.ToString(),
                txtTonGiao.Text, txtSocmt.Text, txtEmail.Text, lstChucVu.SelectedValue.ToString(), lstPhongBan.SelectedValue.ToString(),
                txtGhiChu.Text,lstTDHV.SelectedValue.ToString(),lstTDNN.SelectedValue.ToString());
            DataMan.ExcuteCommand(sql);
            Response.Redirect("HoSoNhanVien.aspx");
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            string manv = Request.QueryString["manv"];
            Response.Redirect(string.Format("HoSoNhanVienChiTiet.aspx?thaotac=sua&manv={0}",manv));
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string manv = Request.QueryString["manv"];
            string sql = string.Format(@" 
                UPDATE [dbo].[tbl_nhanvien]
                SET ACTIVE = N'False' WHERE MANV = {0}", manv);
            DataMan.ExcuteCommand(sql);
            Response.Redirect("HoSoNhanVien.aspx");
            
        }

        protected void btnSua_Luu_Click(object sender, EventArgs e)
        {
            //SQL update ở đây
            try
            {
                txtManv.ReadOnly = true;
                string manv = Request.QueryString["manv"];
                int gt = rb_Nam.Checked ? 1 : 0;
                string sql = string.Format(@"
                UPDATE [dbo].[tbl_nhanvien]
                SET [HOTEN] = N'{1}'
                    ,[GIOITINH] = N'{2}'
                    ,[NGAYSINH] = N'{3}'
                    ,[NOISINH] = N'{4}'
                    ,[DIACHI] = N'{5}'
                    ,[QUEQUAN] = N'{6}'
                    ,[SODIENTHOAI] = N'{7}'
                    ,[DANTOC] = N'{8}'
                    ,[TONGIAO] = N'{9}'
                    ,[SOCMT] = N'{10}'
                    ,[EMAIL] = N'{11}'
                    ,[CHUCVU] = N'{12}'
                    ,[PHONGBAN] = N'{13}'
                    ,[GHICHU] = N'{14}'
                    ,[TRINHDOHV] = '{15}'
                    ,[TRINHDONN] = '{16}'
                WHERE MANV = {0}",manv, txtHoTen.Text, gt, txtNgaysinh.Text,
                txtNoiSinh.Text, txtDiaChi.Text, txtQuequan.Text, txtSDT.Text, lstDanToc.SelectedValue.ToString(),
                txtTonGiao.Text, txtSocmt.Text, txtEmail.Text, lstChucVu.SelectedValue.ToString(), lstPhongBan.SelectedValue.ToString(),
                txtGhiChu.Text,lstTDHV.SelectedValue.ToString(),lstTDNN.SelectedValue.ToString());
                DataMan.ExcuteCommand(sql);
                Response.Redirect(string.Format("HoSoNhanVienChiTiet.aspx?thaotac=xem&manv={0}",manv)); 
            }
            catch(Exception ex)
            {
                lbThongbao.Text = ex.ToString();
            }
        }

        protected void btnHopDong_Click(object sender, EventArgs e)
        {
            string manv = Request.QueryString["manv"];
            Response.Redirect(string.Format("/forms/salary/HopDong.aspx?manv={0}", manv));
        }
    }
}