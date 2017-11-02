<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QuanLyTamUng.aspx.cs" Inherits="hrm2017.forms.config.QuanLyTamUng" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">
                <asp:Label runat="server" ID="lbTieude" ></asp:Label><br />
                <asp:Label ID="lbThongbao" runat="server" ></asp:Label>
               <hr />
            </div>
        </div>
         
        <div class="panel-body">
            <asp:Panel ID="pnDSTU" runat="server" >
                <a href="QuanLyTamUng.aspx?thaotac=them" class="btn btn-info">Thêm</a> 
                <br /><br />
                <asp:Label ID="lbDsTU" runat="server" />
            </asp:Panel>
            <asp:Panel ID="pn2" runat="server" Visible="false">
                 <div class="form-group row">
                    <label class="col-sm-2 col-form-label">MÃ TẠM ỨNG</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtMaTU" runat="server" class="form-control" ReadOnly="true"></asp:TextBox><br />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">HỌ TÊN NHÂN VIÊN</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="lstHoten" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">SỐ  TIỀN</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtSotien" TextMode="Number" CssClass="form-control"  runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">NGÀY TẠM ỨNG</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtNgayung" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Trường này không được để trống" ControlToValidate="txtNgayung">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                </asp:Panel>
             <div class="form-group row">
                    <asp:Button runat="server" ID="btn_them" CssClass="btn btn-info" Text="Thêm" Visible="False" Onclick="btn_them_Click" />
                    <asp:Button runat="server" ID="btn_sua" CssClass="btn btn-info" Text="Sửa" Visible="False" OnClick="btn_sua_Click" />
                    <asp:Button runat="server" ID="btn_xoa" CssClass="btn btn-info" Text="Xóa" Visible="False" OnClick="btn_xoa_Click" />
                    <asp:Button runat="server" ID="btn_luu" CssClass="btn btn-info" Text="Lưu" Visible="False" OnClick="btn_luu_Click" />
              </div>
        </div>
    </div>
</asp:Content>
