<%@ Page Title="Chi tiết hợp đồng" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HopDongChiTiet.aspx.cs" Inherits="hrm2017.forms.salary.HopDongChiTiet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="panel-heading">
        <div class="panel-title">
            <asp:Label runat="server" ID="lbTieude" ></asp:Label><br />
            <asp:Label ID="lbThongbao" runat="server" ></asp:Label>
        </div>

    </div>
         
    <div class="panel-body">

        <asp:Button ID="btnSuaLuu" class="btn btn-primary" runat="server" OnClick="btnSuaLuu_Click" Text="Lưu" Visible="false"/>
        <asp:Button ID="btnSua" class="btn btn-primary" runat="server" OnClick="btnSua_Click" Text="Sửa" Visible="false"/>
        <asp:Button ID="btnThemLuu" class="btn btn-default" runat="server" OnClick="btnThemLuu_Click" Text="Lưu" Visible="false"/>
        <asp:Button ID="btnXoa" class="btn btn-default" runat="server" OnClick="btnXoa_Click" Text="Xóa" Visible="false"/>
        <br />
        <br />
        <asp:Panel ID="pn2" runat="server" Enabled="false">
            

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">MÃ HỢP ĐỒNG</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtMaHD" runat="server" class="form-control"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">TÊN HỢP ĐỒNG</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTenHD" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">NHÂN VIÊN</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="lstNhanVien" runat="server" class="form-control" AutoPostBack="True" />
                </div>
            </div>
             <div class="form-group row">
                <label class="col-sm-2 col-form-label">LƯƠNG CƠ BẢN</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtLuongBCb" runat="server" class="form-control"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">NGÀY KÝ</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtNgayKy" runat="server" class="form-control" type="date"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">NGÀY HẾT HẠN</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtNgayHh" runat="server" class="form-control" type="date"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">LOẠI HỢP ĐỒNG</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="lstLoaiHd" runat="server" class="form-control" AutoPostBack="True" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">THỎA THUẬN KHÁC</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtThoaThuan" runat="server" class="form-control"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">GHI CHÚ</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtGhiChu" runat="server" class="form-control"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">TRẠNG THÁI</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="lstTrangThai" runat="server" class="form-control" AutoPostBack="True" />
                </div>
            </div>
            </asp:Panel>
        </div>
</asp:Content>
