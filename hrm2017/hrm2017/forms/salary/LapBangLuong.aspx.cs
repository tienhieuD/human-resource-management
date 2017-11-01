using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.salary
{
    public partial class LapBangLuong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            LoadListThangNam();
        }

        private void LoadListThangNam()
        {
            if (lstNam.Items.Count > 0)
            {
                lstThang.SelectedValue = DateTime.Now.Month.ToString();
                lstNam.SelectedValue = DateTime.Now.Year.ToString();
                return;
            }

            for (int i = 1; i <= 12; i++)
            {
                string thang = i.ToString();
                lstThang.Items.Add(new ListItem(thang, thang));
            }

            int year = DateTime.Now.Year;
            for (int i = year - 1; i <= year + 1; i++)
            {
                string nam = i.ToString();
                lstNam.Items.Add(new ListItem(nam, nam));
            }

            lstThang.SelectedValue = DateTime.Now.Month.ToString();
            lstNam.SelectedValue = DateTime.Now.Year.ToString();
        }


        protected void btnLapBangLuongThang_Click(object sender, EventArgs e)
        {
            DataTable dataTable = GetBangLuongThang();
            lbBangLuong.Text = InterMan.ConvertToHtml(dataTable);
        }

        private DataTable GetBangLuongThang()
        {
            string sql = string.Format(
                @"select 
	                tbl_nhanvien.MANV
	                ,tbl_nhanvien.HOTEN
	                ,tbl_nhanvien.CHUCVU
	                ,TENCV
	                ,(SELECT COUNT(tbl_chamcongngay.MANV) from tbl_chamcongngay where tbl_chamcongngay.MANV =tbl_nhanvien.MANV and  month(tbl_chamcongngay.NGAY) = '{0}' and  year(tbl_chamcongngay.NGAY) = '{1}') 'socong'
	                ,(SELECT case  when SUM(tbl_hopdong.LUONGCOBAN)  is NULL then 0 else SUM(tbl_hopdong.LUONGCOBAN) end from tbl_hopdong where tbl_hopdong.MAUNGVIEN=tbl_nhanvien.MANV) 'luongcb'
	                ,(Select case  when sum(tbl_tamung.SOTIEN) is NULL then 0 else sum(tbl_tamung.SOTIEN) end from tbl_tamung where MANV = tbl_nhanvien.MANV) 'tamung'
	                ,(SELECT case  when sum(tbl_phucap.SOTIEN) is NULL then 0 else sum(tbl_phucap.SOTIEN) end from tbl_phucapchucvu inner join tbl_phucap on tbl_phucap.MAPC = tbl_phucapchucvu.PHUCAPMAPC where CHUCVUMACV=tbl_nhanvien.CHUCVU) 'phucap'
					,(select case  when sum(tbl_khautru.KHAUTRU) is NULL then 0 else sum(tbl_khautru.KHAUTRU) end from tbl_khautru) 'khautru'
	                ,(SELECt case  when sum(tbl_khenthuongnhanvien.SOTIEN)is NULL then 0 else sum(tbl_khenthuongnhanvien.SOTIEN) end from tbl_khenthuongnhanvien where tbl_khenthuongnhanvien.NHANVIENMANV=tbl_nhanvien.MANV and month(tbl_khenthuongnhanvien.NGAYKHENTHUONG) = '{0}' and  year(tbl_khenthuongnhanvien.NGAYKHENTHUONG) = '{1}' and DANHAN = 0)'khenthuong'
	                ,(SELECt case  when sum(tbl_kyluatnhanvien.SOTIEN)is NULL then 0 else sum(tbl_kyluatnhanvien.SOTIEN) end from tbl_kyluatnhanvien where tbl_kyluatnhanvien.NHANVIEN=tbl_nhanvien.MANV and month(tbl_kyluatnhanvien.NGAYKYLUAT) = '{0}' and  year(tbl_kyluatnhanvien.NGAYKYLUAT) = '{1}' and tbl_kyluatnhanvien.DANHAN = 0)'kyluat'
                from tbl_nhanvien
	                inner join 
                        tbl_chucvu on tbl_chucvu.MACV = tbl_nhanvien.CHUCVU
	                full outer join 
                        tbl_phucapchucvu on tbl_phucapchucvu.CHUCVUMACV = tbl_nhanvien.CHUCVU
                where
	                tbl_nhanvien.ACTIVE = 1
                group by 
	                tbl_nhanvien.MANV, tbl_nhanvien.HOTEN,tbl_nhanvien.CHUCVU,TENCV", lstThang.SelectedValue, lstNam.SelectedValue);

            DataTable dataTable = DataMan.GetDataTable(sql);
            dataTable.Columns.Add("tongluong", typeof(double));
            dataTable.Columns.Add("thucnhan", typeof(double));
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                var r = dataTable.Rows[i];
                double luongcb = Convert.ToDouble(r["luongcb"].ToString());
                double socong = Convert.ToDouble(r["socong"].ToString());
                double tamung = Convert.ToDouble(r["tamung"].ToString());
                double phucap = Convert.ToDouble(r["phucap"].ToString());
                double khenthuong = Convert.ToDouble(r["khenthuong"].ToString());
                double kyluat = Convert.ToDouble(r["kyluat"].ToString());
                double khautru = Convert.ToDouble(r["khautru"].ToString());
                int soNgayTrongThang = DateTime.DaysInMonth(
                   int.Parse(lstNam.SelectedValue), int.Parse(lstThang.SelectedValue));
                r["tongluong"] = luongcb / soNgayTrongThang * socong + phucap + khenthuong;
                double tienKhauTru = (luongcb / soNgayTrongThang * socong + phucap) * khautru / 100;
                r["thucnhan"] = luongcb / soNgayTrongThang * socong + phucap + khenthuong - tamung - kyluat - tienKhauTru;
            }

            return dataTable;
        }

        protected void btnLuuBangLuong_Click(object sender, EventArgs e)
        {
            bool daLapBangLuongThang = false;
            string sql_kiemtra = string.Format(
                @"select * from tbl_bangluong
                where THANG = '{0}' and NAM='{1}'",
                lstThang.SelectedValue, lstNam.SelectedValue);
            daLapBangLuongThang = DataMan.GetDataTable(sql_kiemtra).Rows.Count > 0;

            if (daLapBangLuongThang)
            {
                Response.Redirect(
                    string.Format("TraLuong.aspx?thang={0}&nam={1}",
                    lstThang.SelectedValue,lstNam.SelectedValue));
                return;
            }
            else
            {
                DataTable dataTable = GetBangLuongThang();
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    var r = dataTable.Rows[i];
                    string sql = string.Format(
                        @"INSERT INTO [dbo].[tbl_bangluong]
                        ([NV] ,[THANG] ,[NAM] 
                        ,[SOCONGNGAY] ,[TAMUNG]
                        ,[PHUCAP] ,[KHAUTRU] ,[KHENTHUONG]
                        ,[KYLUAT] ,[TONGLUONG] ,[THUCLINH])
                    VALUES
                        (N'{0}',N'{1}',N'{2}',N'{3}',
                        N'{4}',N'{5}',N'{6}',N'{7}',
	                    N'{8}',N'{9}',N'{10}')",
                        r["MANV"].ToString(), lstThang.SelectedValue, lstNam.SelectedValue,
                        r["socong"].ToString(), r["tamung"].ToString(),
                        r["phucap"].ToString(), r["khautru"].ToString(), r["khenthuong"].ToString(),
                        r["kyluat"].ToString(), r["tongluong"].ToString(), r["thucnhan"].ToString());
                    DataMan.ExcuteCommand(sql);
                }

                Response.Redirect(
                    string.Format("TraLuong.aspx?thang={0}&nam={1}",
                    lstThang.SelectedValue, lstNam.SelectedValue));
                return;
            }
        }
    }
}