<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="B2_1421050403_DuongTienHieu.frm.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/style.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .borderR {
            border-radius: 50%;
        }
    p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;
	        margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
        }
        .auto-style3 {
            height: 123px;
            padding-left:10px;
        }
    </style>
</head>
<body>
    <form id="frmThongTin"  class="block"  runat="server">
        <div class="centeredDefault">
            <div style="padding: 10px;background: #3ab3e3;color: white;">THÔNG TIN THÀNH VIÊN</div>
            <div style="padding: 10px;margin: 10px;background: #71cc71;color: white;">
                <asp:Label ID="lbTen" runat="server" Text="Tên"></asp:Label>
            </div>
            <table>
                <tr>
                    <td>
                        <asp:Image ID="avatar" runat="server" CssClass="borderR" Height="138px" ImageUrl="~/img/pic_Nam.png" Width="128px" />
                    </td>
                    <td class="auto-style1">Ngày sinh<br />
                        <asp:TextBox ID="txtNgaySinh" runat="server" Width="233px"></asp:TextBox>
                        <br />
                        Email<br />
                        <asp:TextBox ID="txtEmail" runat="server" Width="231px"></asp:TextBox>
                        <br />
                        Điện thoại<br />
                        <asp:TextBox ID="txtDienThoai" runat="server" Width="231px"></asp:TextBox>
                        <br />
                        Địa chỉ<br />
                        <asp:TextBox ID="txtDiaChi" runat="server" Width="231px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div style="padding: 10px;margin: 10px;background: #71cc71;color: white;">BẠN
                <asp:Label ID="lbMua" runat="server" Text="Label"></asp:Label>
            </div>
            <table>
                <tr>
                    <td class="auto-style3">
                        <asp:Image ID="picrand" runat="server" Height="104px" ImageUrl="~/img/muathu.JPG" Width="153px" /></td>
                    <td class="auto-style3">
                        <div style="font-size:12px;color:forestgreen;text-align:left; padding-left: 10px;">
                            <asp:Label ID="lbtxt" runat="server" Text="Bài thơ"></asp:Label>
                            <br />
                        </div>
                    </td>
                </tr>
            </table>
            <div style="font-size: small;color: white;background: #666;padding: 10px 0;position: absolute;bottom: 0;width: 100%;">
                <asp:Label ID="lbNgaythangnam" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
