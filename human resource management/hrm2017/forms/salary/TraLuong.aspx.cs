using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.salary
{
    public partial class TraLuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string mabl = Request.QueryString["mabl"];
            bool tonTaiMaBl = mabl != null && mabl != "";
            bool chuaNhanLuong = DataMan.GetDataTable(string.Format(@"select * from tbl_bangluong
                                                                    where MABANGLUONG = '{0}'
                                                                    and NGAYLINH is null", mabl)
                                                                    ).Rows.Count > 0;
            if (tonTaiMaBl && chuaNhanLuong)
            {
                string sql_danhan = string.Format(@"UPDATE [dbo].[tbl_bangluong]
                                                SET [NGAYLINH] = GETDATE()
                                                WHERE MABANGLUONG='{0}'", mabl);
                DataMan.ExcuteCommand(sql_danhan);
            }

            string thang = Request.QueryString["thang"];
            string nam = Request.QueryString["nam"];
            lbTraLuong.Text = string.Format("TRẢ LƯƠNG CHO NHÂN VIÊN THÁNG {0} NĂM {1}",thang,nam);

            #region sql này nó dài
            string sql = string.Format(
                @"select MABANGLUONG 'ID'
                ,NV 'MãNV'
                ,HOTEN 'Nhân viên'
                ,TENPB 'Phòng ban'
                ,TENCV 'Chức vụ'
                --,Cast(THANG as nvarchar) +'/'+ Cast(NAM as nvarchar) 'Lương tháng'
                ,SOCONGNGAY 'Công'
                ,case when sum(LUONGCOBAN) is NULL then 0 else sum(LUONGCOBAN) end 'Lương CB'
                ,PHUCAP 'Tổng phụ cấp'
                ,KHAUTRU 'Tổng khấu trừ'
                ,KHENTHUONG 'Khen thưởng'
                ,KYLUAT 'Kỷ luật'
                ,TONGLUONG 'Tổng lương'
                ,TAMUNG 'Đã ứng trước'
                ,THUCLINH 'Thực lĩnh'
                ,tbl_bangluong.GHICHU 'Ghi chú'
                ,case when NGAYLINH is null then N'Chưa lĩnh' else cast(format(NGAYLINH,'dd-MM-yyyy HH:mm') as nvarchar) end 'Ngày lĩnh'
                 from tbl_bangluong
                join tbl_nhanvien on tbl_bangluong.NV= tbl_nhanvien.MANV
                full outer join tbl_hopdong on tbl_hopdong.MAUNGVIEN = tbl_bangluong.NV
                join tbl_phongban on tbl_phongban.MAPB = tbl_nhanvien.PHONGBAN
                join tbl_chucvu on tbl_chucvu.MACV =tbl_nhanvien.CHUCVU
                where
                tbl_nhanvien.ACTIVE = 1
                and THANG = '{0}'
                and NAM='{1}'
                group by MABANGLUONG 
                ,NV
                ,HOTEN 
                ,TENPB
                ,TENCV 
                ,SOCONGNGAY
                ,PHUCAP 
                ,KHAUTRU 
                ,KHENTHUONG 
                ,KYLUAT 
                ,TONGLUONG 
                ,TAMUNG 
                ,THUCLINH 
                ,tbl_bangluong.GHICHU 
                ,NGAYLINH ", thang, nam);
            #endregion

            DataTable dataTable = DataMan.GetDataTable(sql);
            dataTable.Columns.Add("Confirm");
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                var r = dataTable.Rows[i];
                if (r[dataTable.Columns.Count - 2].ToString().Contains("Chưa lĩnh"))
                    r["Confirm"] = string.Format(
                        @"<a href='TraLuong.aspx?thang={0}&nam={1}&mabl={2}'>Đánh dẫu đã nhận</a>",
                        thang, nam, r["ID"]);
                else
                {
                    r["Confirm"] = string.Format(@"Đã lĩnh");
                }
            }
            lbDsLuong.Text = InterMan.ConvertToHtml(dataTable);
        }
    }
}