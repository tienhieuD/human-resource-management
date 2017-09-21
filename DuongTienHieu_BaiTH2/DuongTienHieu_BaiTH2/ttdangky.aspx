<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ttdangky.aspx.cs" Inherits="DuongTienHieu_BaiTH2.ttdangky" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../stylesheets/bootstrap.min.css" rel="stylesheet" />
    <link href="../stylesheets/styles.css" rel="stylesheet" />
    <script src="../stylesheets/bootstrap.min.js"></script>
    <title>BÀI THỰC HÀNH SỐ 2</title>
    <style type="text/css">
        .newStyle2 {
            position: absolute;
            right: 272px;
            top:78px;
            width: 117px;
            left: 453px;
            height: 143px;
        }
        #btnHuy {
            width: 85px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <img src="../images/logotestonline.jpg" />
        <ul>
            <li><a href="#">Trang chủ</a></li>
            <li><a href="#">Quy trình tuyển dụng</a></li>
            <li><a href="#">Danh sách ứng viên</a></li>
            <li><a href="#">Nộp hồ sơ</a></li>
            <li><a href="#">Liên hệ</a></li>
        </ul>
    </header>
      <div class="row">
        <div class="col-md-4">
          <div style="margin: 10px 0;">
                <h3 style="background-image: url('../images/colleft_header_center.gif');
                           height: 60px;
                           border: 1px solid #aabccd;
                           border-top: none;
                           border-radius: 8px;
                           text-align: center;
                           text-transform: uppercase;
                           font-size: 14px;
                           padding-top: 15px;
                           font-weight: bold;
                           ">
                    Thông báo tuyển dụng</h3>
                <ul style="border: 1px solid #c0c0ea;background: #FFF;margin: -19px 0 0 0;z-index: -1;padding: 19px 19px 19px 19px;">
                    <li>Tuyển nhân sự tháng 4/2015</li>
                    <li>Tuyển nhân sự tháng 7/2015</li>
                    <li>Tuyển nhân sự tháng 5/2015</li>
                </ul>
            </div>
            <div style="margin: 10px 0;">
                <h3 style="background-image: url('../images/colleft_header_center.gif');
                           height: 60px;
                           border: 1px solid #aabccd;
                           border-top: none;
                           border-radius: 8px;
                           text-align: center;
                           text-transform: uppercase;
                           font-size: 14px;
                           padding-top: 15px;
                           font-weight: bold;
                           ">
                    vị trí tuyển dụng</h3>
                <ul style="border: 1px solid #c0c0ea;background: #FFF;margin: -19px 0 0 0;z-index: -1;padding: 19px 19px 19px 19px;">
                    <li>Kỹ sư lập trình</li>
                    <li>Chuyên viên nghiên cứu</li>
                    <li>Nhân viên tổng đài</li>
                    <li>Tuyển nhân sự kỹ thuật</li>
                </ul>
            </div>    
        </div>
        <div class="col-md-8"> 
          <h3 style="background-image: url('../images/bg_header_content_center.gif');height: 50px;border: 1px solid #aabccd;border-top-width: 1px;border-top-style: solid;border-top-color: rgb(170, 188, 205);border-top: none;border-radius: 8px;text-align: center;text-transform: uppercase;font-size: 14px;padding-top: 15px;margin: 10px 0;font-weight: bold;">
              Thông tin ứng viên đăng ký tuyển dụng
          </h3>
            <asp:Label ID="lbHoten" runat="server" Text="Họ và tên"></asp:Label>
&nbsp;<br />
            <br />
        </div>
      </div>
    <footer>
        <b>
            Website đc phát triển bởi Dương Văn Hệu, khoa CNTT<br/>
            Liên hệ heu_cute_vip_pro_9x@gmail.com SĐT: 0998776655
        </b>
    </footer>
    </form>
</body>
</html>
