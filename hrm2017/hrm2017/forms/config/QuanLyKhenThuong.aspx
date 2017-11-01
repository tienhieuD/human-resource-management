<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QuanLyKhenThuong.aspx.cs" Inherits="hrm2017.forms.config.QuanLyKhenThuong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="">
    <div class="content-box-large">
       
        <div class="panel-heading">
            <div class="panel-title">
                <asp:Label runat="server" ID="lbTieude" ></asp:Label><br />
                <asp:Label ID="lbThongbao" runat="server" ></asp:Label>
            </div>

        </div>
         
        <div class="panel-body">
            <asp:Panel ID="pnDSKL" runat="server" >
                <a href="QuanLyKhenThuong.aspx?thaotac=them" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Thêm </a>
                <br /><br />
                <asp:Label ID="lbDsKhenThuong" runat="server" />
            </asp:Panel>
            <asp:Panel ID="pn2" runat="server" Visible="false">
                 <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Mã Khen thưởng</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtMaKT" runat="server" class="form-control"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Trường này không được để trống" ControlToValidate="txtMaKT">

                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Tên khen thưởng</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtTenKT" runat="server" class="form-control"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Trường này không được để trống" ControlToValidate="txtTenKT">

                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <asp:Button runat="server" ID="btn_them" CssClass="btn btn-info" Text="Thêm" Visible="False" OnClick="btn_them_Click" />
                    <asp:Button runat="server" ID="btn_sua" CssClass="btn btn-info" Text="Sửa" Visible="False" OnClick="btn_sua_Click" />
                    <asp:Button runat="server" ID="btn_xoa" CssClass="btn btn-info" Text="Xóa" Visible="False" OnClick="btn_xoa_Click" />
                    <asp:Button runat="server" ID="btn_luu" CssClass="btn btn-info" Text="Lưu" Visible="False" OnClick="btn_luu_Click" />
                </div>
            </asp:Panel>
        </div>
        
        

    </div>
</div>
</asp:Content>
