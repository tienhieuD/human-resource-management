<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="B2_1421050403_DuongTienHieu.frm.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/style.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 22px;
            height: 16px;
        }
        .auto-style2 {
            width: 16px;
            height: 16px;
        }
        .avatar {
            width: 128px;
            height:160px;
            border: 1px solid #0099ff;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            font-size: small;
        }
    </style>
</head>
<body>
    <form class="block" runat="server" id="frmRegister">
    <div class="fixed">
        <img class="auto-style1" src="../img/AYS1.gif" />
        MÔN HỌC LẬP TRÌNH .NET 2 - PHÁT TRIỂN ỨNG DỤNG WEB VỚI ASP.NET
        <img class="auto-style2" src="../img/calendar_16.png" />
        <asp:Label ID="lbNgayThang" runat="server" Text="HÔM NAY: NGÀY THÁNG NĂM"></asp:Label>
    </div>
        <div class="centered">
            <h3>&nbsp;</h3>
            <h3>THÔNG TIN CÁ NHÂN CỦA THÀNH VIÊN</h3>
            <p>&nbsp;</p>
            <table width="100%">
                <tr>
                    <td width="30%">
                        <asp:Image ID="imgAvatar" runat="server" CssClass="avatar" ImageUrl="~/img/user.png"/>
                    </td>
                    <td width="70%">
                        <table width="100%">
                            <tr>
                                <td width="30%" class="auto-style3">Họ tên: (*)</td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="txtTen" runat="server" Width="208px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" class="auto-style3">Ngày sinh:</td>
                                <td class="auto-style3"><span class="auto-style4">Ngày </span>
                                    <asp:DropDownList ID="lstNgay" runat="server" CssClass="auto-style4" Height="23px" Width="51px">
                                    </asp:DropDownList>
                                    <span class="auto-style4">&nbsp;Tháng </span>
                                    <asp:DropDownList ID="lstThang" runat="server" CssClass="auto-style4" Height="23px" Width="40px">
                                    </asp:DropDownList>
&nbsp;<span class="auto-style4">Năm </span>
                                    <asp:DropDownList ID="lstNam" runat="server" CssClass="auto-style4" Height="23px" Width="66px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" class="auto-style3">Giới tính:</td>
                                <td class="auto-style3">
                                    <asp:RadioButton ID="rbNam" runat="server" GroupName="GrpGioiTinh" Text="Nam" />
&nbsp;<asp:RadioButton ID="rbNu" runat="server" GroupName="GrpGioiTinh" Text="Nữ" />
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" class="auto-style3">Điện thoại: (*)</td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="txtDienThoai" runat="server" Width="209px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" class="auto-style3">Email: (*)</td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="txtEmail" runat="server" Width="207px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" class="auto-style3">Địa chỉ:</td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="txtDiaChi" runat="server" TextMode="MultiLine" Width="278px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <asp:Button ID="btnDongY" runat="server" Text="Đồng ý" />
                        <asp:Button ID="btnHuy" runat="server" Text="Hủy" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
