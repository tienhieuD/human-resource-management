<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DieuChuyenCongTac.aspx.cs" Inherits="hrm2017.forms.employee.LichDieuChuyenCongTac" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="row">
<div class="content-box-large">
       
    <div class="panel-heading">
        <div class="panel-title">
            <asp:Label runat="server" ID="lbTieude" ></asp:Label><br />
            <asp:Label ID="lbThongbao" runat="server" ></asp:Label>
        </div>

    </div>
    <div class="panel-body">
        <asp:Panel ID="pnDSKL" runat="server" >
            <a href="DieuChuyenCongTac.aspx?thaotac=them" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Thêm </a>
            <br /><br />
            <asp:Label ID="lbLDCCT" runat="server" />
        </asp:Panel>
        <asp:Panel ID="pn2" runat="server" Visible="false">
            <asp:Panel ID="pnHT" runat="server">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">HỌ TÊN</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="lstManhanvien" runat="server" class="form-control" OnSelectedIndexChanged="lstManhanvien_SelectedIndexChanged" AutoPostBack="True"/>
                    </div>
                </div>
            </asp:Panel>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">NGÀY ĐIỀU CHUYỂN</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtNgaybanhanh" runat="server" class="form-control" type="date"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">PHÒNG BAN</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="lstPB" runat="server" class="form-control"/>
                </div>
            </div>
             <div class="form-group row">
                <label class="col-sm-2 col-form-label">CHỨC VỤ</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="lstChucvu" runat="server" class="form-control"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">LÝ DO</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtLD" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>    
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">GHI CHÚ</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtghichu" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>    
        </asp:Panel>
        <div class="form-group row">
                <asp:Button runat="server" ID="btn_them" CssClass="btn btn-info" Text="Thêm" Visible="False" OnClick="btn_them_Click"  />
                <asp:Button runat="server" ID="btn_sua" CssClass="btn btn-info" Text="Sửa" Visible="False" OnClick="btn_sua_Click" />
                <asp:Button runat="server" ID="btn_xoa" CssClass="btn btn-info" Text="Xóa" Visible="False" OnClick="btn_xoa_Click" />
                <asp:Button runat="server" ID="btn_luu" CssClass="btn btn-info" Text="Lưu" Visible="False" OnClick="btn_luu_Click" />
        </div>
    </div>
        
        

</div>
</div>
</asp:Content>
