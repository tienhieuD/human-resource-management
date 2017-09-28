using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B2_1421050403_DuongTienHieu.frm
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ten = Request.Form.Get("txtTen");
            string ns = Request.Form.Get("lstNgay") + "-" +
                Request.Form.Get("lstThang") + "-" +
                Request.Form.Get("lstNam") + " (Tuổi " + (DateTime.Now.Year - int.Parse(Request.Form.Get("lstNam"))) + ")";
            string gioiTinh = Request.Form.Get("GrpGioiTinh") == "rbNam" ? "Nam" : "Nữ";
            string dienThoai = Request.Form.Get("txtDienThoai");
            string email = Request.Form.Get("txtEmail");
            string diaChi = Request.Form.Get("txtDiaChi");

            lbTen.Text = ten;
            txtNgaySinh.Text = ns;
            txtDienThoai.Text = dienThoai;
            txtEmail.Text = email;
            txtDiaChi.Text = diaChi;

            avatar.ImageUrl = gioiTinh.Equals("Nam") ? "~/img/pic_Nam.png" : "~/img/pic_Nu.png";

#region                 Thơ
            int thangSinh = int.Parse(ns.Split('-')[1]);
            string mua = "";
            if (thangSinh <= 3 && thangSinh >= 1)
            {
                mua = "Xuân";
                picrand.ImageUrl = "~/img/muaxuan.jpg";
                lbtxt.Text = @"XUÂN<br/>
            Tôi có chờ đâu, có đợi đâu <br/>
            Đem chi xuân lại gợi thêm sầu?<br/>
            Với tôi tất cả như vô nghĩa<br/>
            Tất cả không ngoài nghĩa khổ đau!<br/>
            <br/>
            ...<br/>
            <br/>
            Có đứa trẻ thơ không biết khóc<br/>
            Vô tình bỗng nổi tiếng cười ran! <br/>
            Chao ôi! Mong nhớ! Ôi, mong nhớ,<br/>
            Một cánh chim thu lạc cuối ngàn!";
            }
            else if (thangSinh <= 6 && thangSinh >= 3)
            {
                mua = "Hạ";
                picrand.ImageUrl = "~/img/muahe.jpg";
                lbtxt.Text = @"HOA DÂM BỤT<br/>
            Hôm qua trở lại vườn xưa,<br/>
            Đầu cành dâm bụt ,lưa thưa nắng vàng.<br/>
            Thoảng nghe chim hót trên ngàn,<br/>
            Bên hàng bụt đỏ ,ngân vang tiếng cười.<br/>
            Dáng ai, thấp thoáng mơ màng,<br/>
            Nghe chừng như bóng em về đâu đây.<br/>
            Nắng chiều lãng đãng hiên tây,<br/>
            Giật mình tĩnh giấc, còn đây nỗi buồn.
            ";
            }
            else if (thangSinh <= 9 && thangSinh >= 6)
            {
                mua = "Thu";
                picrand.ImageUrl = "~/img/muathu.JPG";
                lbtxt.Text = @"HOA CÚC MÙA THU<br/>
            <br/>
            Thu về cho đoá Cúc vàng,<br/>
            Cho hàng phong trút lá vàng đầy sân.<br/>
            Ngồi nghe một chút hương lân, <br/>
            Nhớ em áo lụa thanh tân thuở nào. <br/>
            Lòng sao nghe vẫn dạt dào,<br/>
            Màu hoa năm ấy ngọt ngào trong tim.<br/>
            ";
            }
            else
            {
                mua = "Đông";
                picrand.ImageUrl = "~/img/muadong.JPG";
                lbtxt.Text = @"MÙA HOA CẢI<br/>
            <br/>
            Có một mùa hoa cải<br/>
            Nở vàng bên bến sông<br/>
            Em đang thì con gái<br/>
            Đợi anh chưa lấy chồng<br/>
            <br/>
            ... <br/>
            <br/>
            Anh lại gieo hạt cải<br/>
            Lại âm thầm đợi mong<br/>
            Có một người con gái<br/>
            Đợi anh chưa lấy chồng<br/>
            ";
            }
#endregion
            lbNgaythangnam.Text = string.Format(
                "HÔM NAY: NGÀY {0} THÁNG {1} NĂM {2}",
                DateTime.Now.Day, DateTime.Now.Month, DateTime.Now.Year);

            lbMua.Text = string.Format("SINH VÀO THÁNG {0} (Mùa {1})", thangSinh, mua);
        }
    }
}