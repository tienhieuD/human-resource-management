using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.employee
{
    public partial class HoSoNhanVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
           
            string sql = @"
                SELECT ROW_NUMBER() over (order by manv) as 'STT'
                ,[MANV] AS 'MÃ NHÂN VIÊN'
                ,[HOTEN] AS 'HỌ TÊN'
                ,CASE [GIOITINH] 
				    WHEN 1 THEN 'Nam' 
				    ELSE N'Nữ'
			     END AS 'GIỚI TÍNH'
                ,CAST([NGAYSINH] AS VARCHAR) AS 'NGÀY SINH'
                ,[DIACHI] AS 'ĐỊA CHỈ'
                ,[SODIENTHOAI] AS 'SỐ ĐIỆN THOẠI'
                ,[TBL_CHUCVU].[TENCV] AS 'CHỨC VỤ'
                ,[TBL_PHONGBAN].[TENPB] AS 'PHÒNG BAN'
                FROM [DBO].[TBL_NHANVIEN] 
                LEFT JOIN [DBO].[TBL_PHONGBAN] ON [DBO].[TBL_NHANVIEN].[PHONGBAN] = [DBO].[TBL_PHONGBAN].[MAPB]
                LEFT JOIN TBL_CHUCVU ON [TBL_NHANVIEN].[CHUCVU] =  TBL_CHUCVU.MACV WHERE ACTIVE = N'True'";
            DataTable dataTable = DataMan.GetDataTable(sql);
            dataTable.Columns.Add("CHI TIẾT");

            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                int n = dataTable.Columns.Count-1;
                string manv = dataTable.Rows[i][1].ToString();
                dataTable.Rows[i][n] = string.Format("<a href='HoSoNhanVienChiTiet.aspx?thaotac=xem&manv={0}'>Chi tiết</a>", manv);
               
            }
            lbDsNhanVien.Text= InterMan.ConvertToHtml(dataTable);
            loadListPhongBan();
            laodListChucVu();
        }

        protected void btn_timkiem_Click(object sender, EventArgs e)
        {
            string sql = string.Format(@"
                SELECT ROW_NUMBER() over (order by manv) as 'STT'
                ,[MANV] AS 'MÃ NHÂN VIÊN'
                ,[HOTEN] AS 'HỌ TÊN'
                ,CASE [GIOITINH] 
				    WHEN 1 THEN 'Nam' 
				    ELSE N'Nữ'
			     END AS 'GIỚI TÍNH'
                ,CAST([NGAYSINH] AS VARCHAR) AS 'NGÀY SINH'
                ,[DIACHI] AS 'ĐỊA CHỈ'
                ,[SODIENTHOAI] AS 'SỐ ĐIỆN THOẠI'
                ,[TBL_CHUCVU].[TENCV] AS 'CHỨC VỤ'
                ,[TBL_PHONGBAN].[TENPB] AS 'PHÒNG BAN'
                FROM [DBO].[TBL_NHANVIEN] 
                    LEFT JOIN [DBO].[TBL_PHONGBAN] ON [DBO].[TBL_NHANVIEN].[PHONGBAN] = [DBO].[TBL_PHONGBAN].[MAPB]
                    LEFT JOIN TBL_CHUCVU ON [TBL_NHANVIEN].[CHUCVU] =  TBL_CHUCVU.MACV 
                WHERE ACTIVE = N'True' AND ( HOTEN LIKE N'%{0}%' OR DIACHI LIKE N'%{0}%')", txtTimKiem.Text);
            DataTable db = DataMan.GetDataTable(sql);
            DataTable dataTable = DataMan.GetDataTable(sql);
            if (dataTable.Rows.Count > 0)
            {
                dataTable.Columns.Add("CHI TIẾT");
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    int n = dataTable.Columns.Count - 1;
                    string manv = dataTable.Rows[i][1].ToString();
                    dataTable.Rows[i][n] = string.Format("<a href='HoSoNhanVienChiTiet.aspx?thaotac=xem&manv={0}'>Chi tiết</a>", manv);
                }
                lbDsNhanVien.Text = InterMan.ConvertToHtml(dataTable);
            }
            else
            {
                lbDsNhanVien.Text = "Không có kết quả";
            }

        }
        private void loadListPhongBan()
        {
            string sql = "SELECT * FROM tbl_phongban ";
            DataTable data = DataMan.GetDataTable(sql);
            lstPhongBan.DataSource = data;
            lstPhongBan.DataTextField = "TENPB";
            lstPhongBan.DataValueField = "MAPB";
            lstPhongBan.DataBind();
        }
        private void laodListChucVu()
        {
            string sql = "SELECT * FROM tbl_chucvu";
            DataTable data = DataMan.GetDataTable(sql);
            lstChucVu.DataSource = data;
            lstChucVu.DataTextField = "TENCV";
            lstChucVu.DataValueField = "MACV";
            lstChucVu.DataBind();
        }
        protected void lstPhongBan_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = string.Format(@"
                SELECT ROW_NUMBER() over (order by manv) as 'STT'
                ,[MANV] AS 'MÃ NHÂN VIÊN'
                ,[HOTEN] AS 'HỌ TÊN'
                ,CASE [GIOITINH] 
				    WHEN 1 THEN 'Nam' 
				    ELSE N'Nữ'
			     END AS 'GIỚI TÍNH'
                ,CAST([NGAYSINH] AS VARCHAR) AS 'NGÀY SINH'
                ,[DIACHI] AS 'ĐỊA CHỈ'
                ,[SODIENTHOAI] AS 'SỐ ĐIỆN THOẠI'
                ,[TBL_CHUCVU].[TENCV] AS 'CHỨC VỤ'
                ,[TBL_PHONGBAN].[TENPB] AS 'PHÒNG BAN'
                FROM [DBO].[TBL_NHANVIEN] 
                    LEFT JOIN [DBO].[TBL_PHONGBAN] ON [DBO].[TBL_NHANVIEN].[PHONGBAN] = [DBO].[TBL_PHONGBAN].[MAPB]
                    LEFT JOIN TBL_CHUCVU ON [TBL_NHANVIEN].[CHUCVU] =  TBL_CHUCVU.MACV
                WHERE ACTIVE = 1 AND PHONGBAN = '{0}'",lstPhongBan.SelectedValue);
            DataTable dataTable = DataMan.GetDataTable(sql);
            if (dataTable.Rows.Count > 0)
            {
                dataTable.Columns.Add("CHI TIẾT");
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    int n = dataTable.Columns.Count - 1;
                    string manv = dataTable.Rows[i][1].ToString();
                    dataTable.Rows[i][n] = string.Format("<a href='HoSoNhanVienChiTiet.aspx?thaotac=xem&manv={0}'>Chi tiết</a>", manv);
                }
                lbDsNhanVien.Text = InterMan.ConvertToHtml(dataTable);
            }
            else
            {
                lbDsNhanVien.Text = "Không có kết quả";
            }
        }

        protected void lstChucVu_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = string.Format(@"
                SELECT ROW_NUMBER() over (order by manv) as 'STT'
                ,[MANV] AS 'MÃ NHÂN VIÊN'
                ,[HOTEN] AS 'HỌ TÊN'
                ,CASE [GIOITINH] 
				    WHEN 1 THEN 'Nam' 
				    ELSE N'Nữ'
			     END AS 'GIỚI TÍNH'
                ,CAST([NGAYSINH] AS VARCHAR) AS 'NGÀY SINH'
                ,[DIACHI] AS 'ĐỊA CHỈ'
                ,[SODIENTHOAI] AS 'SỐ ĐIỆN THOẠI'
                ,[TBL_CHUCVU].[TENCV] AS 'CHỨC VỤ'
                ,[TBL_PHONGBAN].[TENPB] AS 'PHÒNG BAN'
                FROM [DBO].[TBL_NHANVIEN] 
                    LEFT JOIN [DBO].[TBL_PHONGBAN] ON [DBO].[TBL_NHANVIEN].[PHONGBAN] = [DBO].[TBL_PHONGBAN].[MAPB]
                    LEFT JOIN TBL_CHUCVU ON [TBL_NHANVIEN].[CHUCVU] =  TBL_CHUCVU.MACV
                WHERE ACTIVE = 1 AND CHUCVU = '{0}'", lstChucVu.SelectedValue);
            DataTable dataTable = DataMan.GetDataTable(sql);
            if(dataTable.Rows.Count > 0)
            {
                dataTable.Columns.Add("CHI TIẾT");
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    int n = dataTable.Columns.Count - 1;
                    string manv = dataTable.Rows[i][1].ToString();
                    dataTable.Rows[i][n] = string.Format("<a href='HoSoNhanVienChiTiet.aspx?thaotac=xem&manv={0}'>Chi tiết</a>", manv);
                }
                lbDsNhanVien.Text = InterMan.ConvertToHtml(dataTable);
            }else
            {
                lbDsNhanVien.Text = "Không có kết quả";
            }
            
        }
    }
}