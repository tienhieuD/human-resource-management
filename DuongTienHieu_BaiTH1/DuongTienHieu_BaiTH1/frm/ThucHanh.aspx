<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThucHanh.aspx.cs" Inherits="DuongTienHieu_BaiTH1.frm.ThucHanh" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" action="Get.aspx" method="post">
        <div>
            <%--<asp:Label ID="lblhoten" runat="server" Text="Họ tên"></asp:Label>
            <asp:TextBox ID="txtHoTen" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblGioiTinh" runat="server" Text="Giới tính"></asp:Label>
            <asp:RadioButton ID="rbtnNam" runat="server" Checked="True" GroupName="1" Text="Nam" />
            <asp:RadioButton ID="rbtnNu" runat="server" GroupName="1" Text="Nữ" />
            <br />
            <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Xác nhận" />
            <br />
            <asp:Label ID="lblNotify" runat="server" Text="Thông báo"></asp:Label>
            <br />--%>
            <input id="Text1" name="text" type="text" />
            <input id="Submit1" type="submit" value="submit" />
        </div>
    </form>
</body>
</html>
