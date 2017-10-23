<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="hrm2017.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblNotice" runat="server" /><br />
            <asp:TextBox ID="txtLogin" runat="server" placeholder="Tài khoản"/><br />
            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" placeholder="Mật khẩu" /><br />
            <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
