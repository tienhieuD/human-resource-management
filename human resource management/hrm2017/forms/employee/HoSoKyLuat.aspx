﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HoSoKyLuat.aspx.cs" Inherits="hrm2017.forms.employee.HoSoKyLuat" %>
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
                <a href="HoSoKyLuat.aspx?thaotac=them" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Thêm </a>
                <br /><br />
                <asp:Label ID="lbHSKL" runat="server" />
            </asp:Panel>
            <asp:Panel ID="pn2" runat="server" Visible="false">
                <asp:Panel ID="pnHTNV" runat="server">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">HỌ TÊN</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="lstManhanvien" runat="server" class="form-control"/>
                    </div>
                </div>
                
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">NGÀY BAN HÀNH</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtNgaybanhanh" runat="server" class="form-control" type="date"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">TÊN KỶ LUẬT</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="lstTenkl" runat="server" class="form-control"/>
                    </div>
                </div>
                </asp:Panel>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">SỐ TIỀN</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtSotien" runat="server" class="form-control"></asp:TextBox>
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-sm-2 col-form-label">ĐÓNG PHẠT</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="lstDanhan" runat="server" class="form-control">
                            <asp:ListItem Value="1">Đã đóng phạt</asp:ListItem>
                            <asp:ListItem Value="0">Chưa đóng phạt</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                 
            </asp:Panel>
            <div class="form-group row">
                    <asp:Button runat="server" ID="btn_them" CssClass="btn btn-info" Text="Thêm" Visible="False" Onclick="btn_them_Click" />
                    <asp:Button runat="server" ID="btn_sua" CssClass="btn btn-info" Text="Sửa" Visible="False" Onclick="btn_sua_Click" />
                    <asp:Button runat="server" ID="btn_xoa" CssClass="btn btn-info" Text="Xóa" Visible="False" Onclick="btn_xoa_Click" />
                    <asp:Button runat="server" ID="btn_luu" CssClass="btn btn-info" Text="Lưu" Visible="False" OnClick="btn_luu_Click" />
            </div>
        </div>
        
        

    </div>
</div>
</asp:Content>
