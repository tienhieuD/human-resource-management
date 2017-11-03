<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HoSoNhanVien.aspx.cs" Inherits="hrm2017.forms.employee.HoSoNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="row">
    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">DANH SÁCH HỒ SƠ NHÂN VIÊN
            </div>
        </div>
        <div class="panel-body">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <a href="HoSoNhanVienChiTiet.aspx?thaotac=them" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Thêm </a>
                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList ID="lstPhongBan" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="lstPhongBan_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList ID="lstChucVu" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="lstChucVu_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <div class="row">
                            <div class="col-sm-7">
                                <asp:TextBox ID="txtTimKiem" CssClass="form-control" runat="server" required="true" placeholder="Nhập từ khóa.."></asp:TextBox>
                            </div>
                            <div class="col-sm-5">
                                <asp:Button ID="btn_timkiem" runat="server" Text="Tìm Kiếm" CssClass="btn btn-info" OnClick="btn_timkiem_Click" />
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
           
            
            <br /><br />
            <asp:Label ID="lbDsNhanVien" runat="server" />
        </div>

    </div>
</div>
</asp:Content>
