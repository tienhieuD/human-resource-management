<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LapBangLuong.aspx.cs" Inherits="hrm2017.forms.salary.LapBangLuong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    Năm: <asp:DropDownList ID ="lstNam" runat="server"  AutoPostBack="True" />
    Tháng: <asp:DropDownList ID ="lstThang" runat="server"  AutoPostBack="True" />
    <asp:Button ID="btnLapBangLuongThang" runat="server" OnClick="btnLapBangLuongThang_Click" Text="Lập bảng lương" />

    <br />
    <asp:Label ID="lbBangLuong" runat="server" />
</asp:Content>
