<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QuanLyPhongBan.aspx.cs" Inherits="hrm2017.forms.config.QuanLyPhongBan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:TextBox ID="txtTenPhongBan" runat="server" />
    <asp:Label ID="lblDsPhongBan" runat="server" />
    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="MAPB" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="MAPB" HeaderText="MAPB" ReadOnly="True" SortExpression="MAPB" />
            <asp:BoundField DataField="TENPB" HeaderText="TENPB" SortExpression="TENPB" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conStr %>" SelectCommand="SELECT * FROM [tbl_phongban]"></asp:SqlDataSource>
    </asp:Content>
