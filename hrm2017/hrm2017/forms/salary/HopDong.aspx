<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HopDong.aspx.cs" Inherits="hrm2017.forms.salary.HopDong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <a href="HopDongChiTiet.aspx?thaotac=them" class="btn btn-primary">
        <i class="glyphicon glyphicon-plus"></i> Thêm </a>
    <asp:Label ID="lbDsHopDong" runat ="server" />
</asp:Content>
