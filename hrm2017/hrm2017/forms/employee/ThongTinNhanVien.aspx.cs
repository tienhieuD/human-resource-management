using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace hrm2017.forms.employee
{
    public partial class ThongTinNhanVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["manv"] != null)
            {
                btn_addNv.Visible = false;
                btn_Luu.Visible = false;
                btn_RemoveNv.Visible = true;
                btn_EditNv.Visible = true;
                lb_Tieude.Text = "Thông Tin Nhân Viên";
                int manv = int.Parse(Request.QueryString["manv"]);
                string sql = @"
                SELECT *
                FROM [HRM].[DBO].[TBL_NHANVIEN] 
                LEFT JOIN [HRM].[DBO].[TBL_PHONGBAN] ON [HRM].[DBO].[TBL_NHANVIEN].[PHONGBAN] = [HRM].[DBO].[TBL_PHONGBAN].[MAPB]
                LEFT JOIN TBL_CHUCVU ON [TBL_NHANVIEN].[CHUCVU] =  TBL_CHUCVU.MACV WHERE [MANV] =" + manv;
                DataTable db = DataMan.GetDataTable(sql);
                txtManv.Text = db.Rows[0][0].ToString();
                txtHoTen.Text = db.Rows[0][1].ToString();
                txtNgaysinh.Text = db.Rows[0][3].ToString();
                txtNoiSinh.Text = db.Rows[0][4].ToString();
                txtDiaChi.Text = db.Rows[0][5].ToString();
                txtQuequan.Text = db.Rows[0][6].ToString();
                txtSDT.Text = db.Rows[0][7].ToString();
                txtDanToc.Text = db.Rows[0][8].ToString();
                txtTonGiao.Text = db.Rows[0][9].ToString();
                txtSocmt.Text = db.Rows[0][10].ToString();
                txtEmail.Text = db.Rows[0][11].ToString();
                txtChucvu.Text = db.Rows[0][17].ToString();
                txtPhongBan.Text = db.Rows[0][19].ToString();
                txtManv.ReadOnly = true;

            }
            else
            {
                btn_EditNv.Visible = false;
                btn_RemoveNv.Visible = false;
                btn_addNv.Visible = true;
                lb_Tieude.Text = "Thêm Nhân Viên";
                pn1.Visible = false;
                btn_Luu.Visible = false;
            }
            loadNV();
        }
        void loadNV()
        {
            string sql = @"
                SELECT ROW_NUMBER() over (order by manv) as 'STT'
                ,[MANV] AS 'MÃ NHÂN VIÊN'
                ,[HOTEN] AS 'HỌ TÊN'
                ,CASE [GIOITINH] 
				    WHEN 1 THEN 'Nam' 
				    ELSE N'Nữ'
			     END AS 'GIỚI TÍNH'
                ,[NGAYSINH] AS 'NGÀY SINH'
                ,[DIACHI] AS 'ĐỊA CHỈ'
                ,[SODIENTHOAI] AS 'SỐ ĐIỆN THOẠI'
                ,[TBL_CHUCVU].[TENCV] AS 'CHỨC VỤ'
                ,[TBL_PHONGBAN].[TENPB] AS 'PHÒNG BAN'
                FROM [HRM].[DBO].[TBL_NHANVIEN] 
                LEFT JOIN [HRM].[DBO].[TBL_PHONGBAN] ON [HRM].[DBO].[TBL_NHANVIEN].[PHONGBAN] = [HRM].[DBO].[TBL_PHONGBAN].[MAPB]
                LEFT JOIN TBL_CHUCVU ON [TBL_NHANVIEN].[CHUCVU] =  TBL_CHUCVU.MACV ";
            DataTable dataTable = DataMan.GetDataTable(sql);


            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                string manv = dataTable.Rows[i][1].ToString();
            }
            lbDsNhanVien.Text = InterMan.ConvertToHtml(dataTable);
        }
        void addNv()
        {
            
           
        }

        protected void btn_addNv_Click(object sender, EventArgs e)
        {
            

        }

        protected void btn_EditNv_Click(object sender, EventArgs e)
        {
            btn_Luu.Visible = true;
            btn_RemoveNv.Visible = false;
            btn_EditNv.Visible = false;
            txtManv.ReadOnly = false;
            txtManv.Focus();
        }

        protected void btn_RemoveNv_Click(object sender, EventArgs e)
        {
            
        }

        protected void btn_Luu_Click(object sender, EventArgs e)
        {
            try
            {
                int gt;
                if (rb_Nam.Checked == true)
                {
                    gt = 1;
                }
                else
                {
                    gt = 0;
                }
                DateTime ns = Convert.ToDateTime(txtNgaysinh.Text.Trim());
                int sdt = Convert.ToInt32(txtSDT.Text.Trim());
                int cmt = Convert.ToInt32(txtSocmt.Text.Trim());

                string sql = string.Format(@"
                INSERT INTO [hrm].[dbo].[tbl_nhanvien]
                   ([HOTEN]
                   ,[GIOITINH]
                   ,[NGAYSINH]
                   ,[NOISINH]
                   ,[DIACHI]
                   ,[QUEQUAN]
                   ,[SODIENTHOAI]
                   ,[DANTOC]
                   ,[TONGIAO]
                   ,[SOCMT]
                   ,[EMAIL]
                   ,[CHUCVU]
                   ,[PHONGBAN]
                   ,[GHICHU]
                   ,[ACTIVE])
                VALUES
                   ({0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14})",
                       txtHoTen.Text, gt, ns, txtNoiSinh.Text, txtDiaChi.Text, txtQuequan.Text,
                       sdt, txtDanToc.Text, txtTonGiao.Text, cmt, txtEmail.Text, 1, 1, txtGhiChu.Text, 1);
                DataMan.ExcuteCommand(sql);
            }
            catch 
            {
                //error.Text = "Thêm Thất Bại";
            }
        }
    }
}