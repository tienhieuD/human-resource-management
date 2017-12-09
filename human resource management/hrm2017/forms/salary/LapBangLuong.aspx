<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LapBangLuong.aspx.cs" Inherits="hrm2017.forms.salary.LapBangLuong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    
    <br />

    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">Lập bảng lương và tính lương
            </div>

        </div>
        <div class="panel-body">
            <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Tháng</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="lstThang" class="form-control" runat="server" AutoPostBack="True" ></asp:DropDownList>
                    </div>
                </div>
            <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Năm</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="lstNam" class="form-control" runat="server"  AutoPostBack="True" ></asp:DropDownList>
                    </div>
                </div>
    <asp:Button ID="btnLapBangLuongThang" class="btn btn-default"  runat="server" OnClick="btnLapBangLuongThang_Click" Text="Lập bảng lương" />
    <asp:Button ID="btnLuuBangLuong" class="btn btn-primary" runat="server" OnClick="btnLuuBangLuong_Click" Text="Lưu bảng lương tháng và tiến hành trả lương" />

            <asp:Label ID="lbThongTin" runat ="server"  style="
                text-transform: uppercase;
                margin-bottom: 35px;
                margin-top: 35px;
                font-size: 18px;
                font-weight: 600;
                text-align: center;
                display: block;
                " Text="Bảng lương tháng"/>
        <asp:Label ID="lbBangLuong" runat="server" />
        </div>
        
    </div>
</asp:Content>
