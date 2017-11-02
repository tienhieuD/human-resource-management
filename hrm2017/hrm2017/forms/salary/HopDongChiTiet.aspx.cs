using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017.forms.salary
{
    public partial class HopDongChiTiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string mahd = Request.QueryString["mahd"];
            string thaotac = Request.QueryString["thaotac"];

            LoadListLoaiHd();
            LoadListTrangThai();
            LoadListNhanVien();

            switch (thaotac)
            {
                case "xem":
                    btnSua.Visible = true;
                    btnXoa.Visible = true;
                    LoadHopDong(mahd);
                    break;
                case "sua":
                    pn2.Enabled = true;
                    btnSuaLuu.Visible = true;
                    txtMaHD.Enabled = false;
                    LoadHopDong(mahd);
                    break;
                case "them":
                    pn2.Enabled = true;
                    txtMaHD.Visible = false;
                    btnThemLuu.Visible = true;
                    break;
                case "xoa":
                    string sql = string.Format(@"DELETE FROM [dbo].[tbl_hopdong] WHERE MAHD='{0}'",mahd);
                    try
                    {
                        DataMan.ExcuteCommand(sql);
                        Response.Redirect(String.Format("HopDong.aspx?manv={0}", lstNhanVien.SelectedValue));
                    }
                    catch (Exception ex) { lbThongbao.Text = ex.Message; }
                    break;
                default:
                    break;
            }
        }

        private void LoadHopDong(string mahd)
        {
            string sql = string.Format(
                @"SELECT *
                FROM [dbo].[tbl_hopdong]
                inner join tbl_loaihopdong on tbl_loaihopdong.MALOAIHD =[tbl_hopdong].LOAIHOPDONG
                inner join tbl_trangthai on tbl_trangthai.MATRANGTHAI = [tbl_hopdong].TRANGTHAI
                inner join tbl_nhanvien on tbl_nhanvien.MANV = [tbl_hopdong].MAUNGVIEN
                WHERE MAHD='{0}'", mahd);
            var col = DataMan.GetDataTable(sql).Rows[0];
            txtMaHD.Text = col["MAHD"].ToString();
            txtTenHD.Text = col["TENHD"].ToString();
            lstNhanVien.Text = col["HOTEN"].ToString();
            txtLuongBCb.Text = col["LUONGCOBAN"].ToString();
            try { txtNgayKy.Text = Convert.ToDateTime(col["NGAYKY"].ToString()).ToString("yyyy-MM-dd"); } catch { };
            try { txtNgayHh.Text = Convert.ToDateTime(col["NGAYHETHAN"].ToString()).ToString("yyyy-MM-dd"); } catch { };
            lstLoaiHd.Text = col["TENLOAIHD"].ToString();
            txtThoaThuan.Text = col["THOATHUANKHAC"].ToString();
            txtGhiChu.Text = col["GHICHU"].ToString();
            lstTrangThai.Text = col["TENTRANGTHAI"].ToString();
        }

        private void LoadListNhanVien()
        {
            string sql = @"SELECT MANV,HOTEN FROM tbl_nhanvien WHERE ACTIVE = 'True'";
            InterMan.LoadDropDownList(lstNhanVien, new string[] { sql, "MANV", "HOTEN" });
        }

        private void LoadListTrangThai()
        {
            string sql = @"SELECT * FROM tbl_trangthai";
            InterMan.LoadDropDownList(lstTrangThai, new string[] { sql, "MATRANGTHAI", "TENTRANGTHAI" });
        }

        private void LoadListLoaiHd()
        {
            string sql = @"SELECT * FROM tbl_loaihopdong";
            InterMan.LoadDropDownList(lstLoaiHd, new string[] { sql, "MALOAIHD", "TENLOAIHD" });
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("HopDongChiTiet.aspx?thaotac=sua&mahd={0}",
                Request.QueryString["mahd"]));
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("HopDongChiTiet.aspx?thaotac=xoa&mahd={0}",
                Request.QueryString["mahd"]));
        }

        protected void btnSuaLuu_Click(object sender, EventArgs e)
        {
            string sql = string.Format(
                @"UPDATE [dbo].[tbl_hopdong]
                SET [TENHD] = N'{1}'
                ,[MAUNGVIEN] =  N'{2}'
                ,[LUONGCOBAN] =  N'{3}'
                ,[NGAYKY] =  N'{4}'
                ,[NGAYHETHAN] =  N'{5}'
                ,[LOAIHOPDONG] =  N'{6}'
                ,[THOATHUANKHAC] =  N'{7}'
                ,[GHICHU] = N'{8}'
                ,[TRANGTHAI] =  N'{9}'
                WHERE MAHD =  N'{0}'",txtMaHD.Text,
                txtTenHD.Text, lstNhanVien.SelectedValue, txtLuongBCb.Text, txtNgayKy.Text, txtNgayHh.Text,
                lstLoaiHd.SelectedValue, txtThoaThuan.Text, txtGhiChu.Text, lstTrangThai.SelectedValue);
            try
            {
                DataMan.ExcuteCommand(sql);
                Response.Redirect(String.Format("HopDong.aspx?manv={0}", lstNhanVien.SelectedValue));
                //Response.Redirect(string.Format("HopDongChiTiet.aspx?thaotac=xem&mahd={0}",txtMaHD.Text));
            }
            catch(Exception ex) { lbThongbao.Text = ex.Message; }
        }

        protected void btnThemLuu_Click(object sender, EventArgs e)
        {
            string sql = string.Format(
                @"INSERT INTO [dbo].[tbl_hopdong]
                ([TENHD] ,[MAUNGVIEN] ,[LUONGCOBAN] ,[NGAYKY]
                ,[NGAYHETHAN] ,[LOAIHOPDONG] ,[THOATHUANKHAC] ,[GHICHU] ,[TRANGTHAI])
                VALUES (N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N'{6}',N'{7}',N'{8}')",
                txtTenHD.Text,lstNhanVien.SelectedValue,txtLuongBCb.Text,txtNgayKy.Text,txtNgayHh.Text,
                lstLoaiHd.SelectedValue,txtThoaThuan.Text,txtGhiChu.Text,lstTrangThai.SelectedValue);
            try
            {
                DataMan.ExcuteCommand(sql);
                Response.Redirect(String.Format("HopDong.aspx?manv={0}", lstNhanVien.SelectedValue));
            }
            catch (Exception ex) { lbThongbao.Text = ex.Message; }
        }
    }
}