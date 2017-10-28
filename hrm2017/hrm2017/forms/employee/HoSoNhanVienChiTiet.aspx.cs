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

                switch (thaoTac)
                {
                    case "xem":
                        btnSua.Visible = true;
                        btnXoa.Visible = true;
                        LoadThongTinNhanVien(manv);
                        break;

                    case "them":
                        pnlMain.Enabled = true;
                        btnThem.Visible = true;
                        txtManv.ReadOnly = true;
                        break;

                    case "sua":
                        pnlMain.Enabled = true;
                        btnSua_Luu.Visible = true;
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
                    FROM [HRM].[DBO].[TBL_NHANVIEN] 
                    LEFT JOIN [HRM].[DBO].[TBL_PHONGBAN] 
                    ON [HRM].[DBO].[TBL_NHANVIEN].[PHONGBAN] = [HRM].[DBO].[TBL_PHONGBAN].[MAPB]
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
            bool gt = bool.Parse(dt.Rows[0]["GIOITINH"].ToString());
            rb_Nam.Checked = gt;
            rb_Nu.Checked = !gt;

            //Trinh do hoc van
            string sql_hocVan = string.Format(
                @"select TENTRINHDO
                from tbl_nhanvientrinhdohocvan
                join tbl_trinhdohocvan
                on tbl_nhanvientrinhdohocvan.TDHVMATD = tbl_trinhdohocvan.MATD
                Where NHANVIENMANV = '{0}'", manv);
            string hocVan = "";
            DataTable dataTable_HocVan = DataMan.GetDataTable(sql_hocVan);
            for (int i = 0; i < dataTable_HocVan.Rows.Count; i++)
                hocVan += dataTable_HocVan.Rows[i][0].ToString() +
                    ((i != dataTable_HocVan.Rows.Count - 1) ? ", " : " ");
            txtTdHocVan.Text = hocVan;

            //Trinh do ngoai nghu
            string sql_NgoaiNgu = string.Format(
                @"select TENTRINHDONN
                from tbl_nhanvientrinhdongoaingu
                join tbl_trinhdongoaingu 
                on tbl_nhanvientrinhdongoaingu.TDNNMATDNN = tbl_trinhdongoaingu.MATRNN
                Where NHANVIENMANV = '{0}'", manv);
            string ngoaiNgu = "";
            DataTable dataTable_NgoaiNgu = DataMan.GetDataTable(sql_NgoaiNgu);
            for (int i = 0; i < dataTable_NgoaiNgu.Rows.Count; i++)
                ngoaiNgu += dataTable_NgoaiNgu.Rows[i][0].ToString() +
                    ((i != dataTable_NgoaiNgu.Rows.Count - 1) ? ", " : " ");
            txtTdNgoaiNgu.Text = ngoaiNgu;
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
                ,[GHICHU],[ACTIVE])
                VALUES
                (N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N'{6}',N'{7}',
                N'{8}',N'{9}',N'{10}',N'{11}',N'{12}',N'{13}',N'True')", txtHoTen.Text, gt, txtNgaysinh.Text,
                txtNoiSinh.Text, txtDiaChi.Text, txtQuequan.Text, txtSDT.Text, lstDanToc.SelectedValue.ToString(),
                txtTonGiao.Text, txtSocmt.Text, txtEmail.Text, lstChucVu.SelectedValue.ToString(), lstPhongBan.SelectedValue.ToString(),
                txtGhiChu.Text);
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
            Response.Redirect(string.Format("HoSoNhanVienChiTiet.aspx?thaotac=xoa&manv={0}", manv));
        }

        protected void btnSua_Luu_Click(object sender, EventArgs e)
        {
            //SQL update ở đây
            Response.Redirect("");
        }
    }
}