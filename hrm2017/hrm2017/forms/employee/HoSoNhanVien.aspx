<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HoSoNhanVien.aspx.cs" Inherits="hrm2017.forms.employee.HoSoNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="container">
    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">DANH SÁCH HỒ SƠ NHÂN VIÊN
            </div>

        </div>
        <div class="panel-body">
            <a href="HoSoNhanVienChiTiet.aspx?thaotac=them" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Thêm </a>
            <br /><br />
            <asp:Label ID="lbDsNhanVien" runat="server" />
        </div>
    </div>
</div>
</asp:Content>
