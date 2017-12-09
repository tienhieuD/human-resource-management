using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.salary
{
    public partial class HopDong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string manv = Request.QueryString["manv"];
            if (manv == null || manv == "")
            {
                string sql = string.Format(@"
                SELECT [MAHD] 'Mã hợp đồng'
                    ,[TENHD] 'Tên hợp đồng'
					,HOTEN 'Nhân viên'
                    ,[LUONGCOBAN] 'Lương cơ bản'
                    ,CAST(FORMAT([NGAYKY],'dd/MM/yyyy') as nvarchar(10)) 'Ngày ký kết'
                    ,CAST(FORMAT(NGAYHETHAN,'dd/MM/yyyy') as nvarchar(10)) 'Ngày hết hạn'
                    ,TENLOAIHD 'Loại hợp đồng'
                    ,TENTRANGTHAI 'Trạng thái'
                FROM [dbo].[tbl_hopdong]
                inner join tbl_loaihopdong on tbl_loaihopdong.MALOAIHD =[tbl_hopdong].LOAIHOPDONG
                inner join tbl_trangthai on tbl_trangthai.MATRANGTHAI = [tbl_hopdong].TRANGTHAI
				join tbl_nhanvien on tbl_nhanvien.MANV = [tbl_hopdong].MAUNGVIEN");
                DataTable dataTable = DataMan.GetDataTable(sql);
                dataTable.Columns.Add("Chi tiết", typeof(string));
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    string mahd = dataTable.Rows[i][0].ToString();
                    string link = string.Format("HopDongChiTiet.aspx?thaotac=xem&mahd={0}", mahd);
                    dataTable.Rows[i][dataTable.Columns.Count - 1] = string.Format("<a href='{0}'>Chi tiết</a>", link);
                }
                lbDsHopDong.Text = InterMan.ConvertToHtml(dataTable);
            }
            else
            {
                string sql = string.Format(@"
                SELECT [MAHD] 'Mã hợp đồng'
                    ,[TENHD] 'Tên hợp đồng'
                    ,[LUONGCOBAN] 'Lương cơ bản'
                    ,CAST(FORMAT([NGAYKY],'dd/MM/yyyy') as nvarchar(10)) 'Ngày ký kết'
                    ,CAST(FORMAT(NGAYHETHAN,'dd/MM/yyyy') as nvarchar(10)) 'Ngày hết hạn'
                    ,TENLOAIHD 'Loại hợp đồng'
                    ,TENTRANGTHAI 'Trạng thái'
                FROM [dbo].[tbl_hopdong]
                inner join tbl_loaihopdong on tbl_loaihopdong.MALOAIHD =[tbl_hopdong].LOAIHOPDONG
                inner join tbl_trangthai on tbl_trangthai.MATRANGTHAI = [tbl_hopdong].TRANGTHAI
                where MAUNGVIEN = '{0}'", manv);
                DataTable dataTable = DataMan.GetDataTable(sql);
                dataTable.Columns.Add("Chi tiết", typeof(string));
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    string mahd = dataTable.Rows[i][0].ToString();
                    string link = string.Format("HopDongChiTiet.aspx?thaotac=xem&mahd={0}", mahd);
                    dataTable.Rows[i][dataTable.Columns.Count - 1] = string.Format("<a href='{0}'>Chi tiết</a>", link);
                }
                lbDsHopDong.Text = InterMan.ConvertToHtml(dataTable);
            }
        }
    }
}