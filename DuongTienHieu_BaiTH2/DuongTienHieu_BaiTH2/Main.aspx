<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="DuongTienHieu_BaiTH2.WebForm1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet" />
    <link href="stylesheets/styles.css" rel="stylesheet" />
    <script src="stylesheets/bootstrap.min.js"></script>
    <script src="stylesheets/jquery-3.2.1.min.js"></script>
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
            <form id="form1" runat="server" action="ttdangky.aspx">
                <div class="text-left">
            <b>Thông tin ứng viên:</b><br />
                    <asp:Label ID="lbName" runat="server" Text="Họ và tên"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtname" runat="server" OnTextChanged="txtname_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ErrorMessage="Nhập tên" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Giới tính"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton name="rbgender1" ID="rbgender1" runat="server" Text="Nam" GroupName="gt" Checked="True" OnCheckedChanged="rbgender1_CheckedChanged" AutoPostBack="False"/>
                    
&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="rbgender2" runat="server" Text="Nữ" GroupName="gt" AutoPostBack="False" OnCheckedChanged="rbgender2_CheckedChanged" />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Ngày sinh"></asp:Label>
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="Label11" runat="server" Text="Ngày"></asp:Label>
                    <asp:DropDownList ID="lstDay" runat="server" Width="55px" AutoPostBack="False" OnSelectedIndexChanged="lstDay_SelectedIndexChanged">
                    </asp:DropDownList>
                    &nbsp;<asp:Label ID="Label12" runat="server" Text="Tháng"></asp:Label>
                    <asp:DropDownList ID="lstMonth" runat="server" Width="55px" AutoPostBack="False" OnSelectedIndexChanged="lstMonth_SelectedIndexChanged">
                    </asp:DropDownList>
&nbsp;<asp:Image ID="imgAva" runat="server" CssClass="newStyle2" ImageUrl="~/images/pic_Nam.png" />
                    <script>
                        $(document).ready(function () {
                            $('#rbgender1').change(function () {
                                if (this.checked == true) {
                                    $("#imgAva").attr("src", "images/pic_Nam.png");
                                }
                            });

                            $('#rbgender2').change(function () {
                                if (this.checked == true) {
                                    $("#imgAva").attr("src", "images/pic_Nu.png");
                                }
                            });
                        });
                    </script>
                    <asp:Label ID="Label13" runat="server" Text="Năm"></asp:Label>
                    <asp:DropDownList ID="lstYear" runat="server" Width="55px" AutoPostBack="False" OnSelectedIndexChanged="lstYear_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="validate" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email sai" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Điện thoại"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="Sai định dạng" ForeColor="Red" ValidationExpression="[\d]+"></asp:RegularExpressionValidator>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Địa chỉ"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtAddress" runat="server" Height="79px" TextMode="MultiLine" Width="407px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Ngôn ngữ lập trình bạn biết"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="ckcpp" runat="server" Text="C/C++" />
&nbsp;<asp:CheckBox ID="ckpy" runat="server" Text="Python" />
&nbsp;<asp:CheckBox ID="ckja" runat="server" Text="Java" />
&nbsp;<asp:CheckBox ID="ckfr" runat="server" Text="Fronchan" />
&nbsp;<asp:CheckBox ID="ckphp" runat="server" Text="PHP" />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="ckasp" runat="server" Text="ASP.Net" />
&nbsp;<asp:CheckBox ID="ckcs" runat="server" Text="C#" />
&nbsp;<asp:CheckBox ID="ckjs" runat="server" Text="Javascript" />
&nbsp;<asp:CheckBox ID="ckvb" runat="server" Text="VB.Net" />
&nbsp;<asp:CheckBox ID="ckdel" runat="server" Text="DelPhi" OnCheckedChanged="CheckBox10_CheckedChanged" />
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="Vị trí tuyển dụng"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="lstViTriTD" runat="server" Width="180px">
                        <asp:ListItem>Lập trình winform</asp:ListItem>
                        <asp:ListItem>Lập trình webform</asp:ListItem>
                        <asp:ListItem>Lập trình di động</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="Tên đăng nhập"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtlogin" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlogin" ErrorMessage="Nhập tên đăng nhập" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="Mật khẩu"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtmk1" runat="server" TextMode="Password" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtmk1" ErrorMessage="Nhập mật khẩu" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="Nhập lại mật khẩu"></asp:Label>
&nbsp;&nbsp;
                    <asp:TextBox ID="txtmk2" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtmk2" ErrorMessage="Nhập mật khẩu" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtmk1" ControlToValidate="txtmk2" ErrorMessage="Mật khẩu không khớp" ForeColor="Red"></asp:CompareValidator>
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="btnNopHoSo" class="auto-style1" type="submit" value="Nộp hồ sơ" />&nbsp;&nbsp;&nbsp;
                    <input id="btnHuy" type="reset" value="Hủy" /><br />
                </div>
            </form>
        </div>
      </div>
    <footer>
        <b>
            Website đc phát triển bởi Dương Văn Hệu, khoa CNTT<br/>
            Liên hệ heu_cute_vip_pro_9x@gmail.com SĐT: 0998776655
        </b>
    </footer>
</body>
</html>
