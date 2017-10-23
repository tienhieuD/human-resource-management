<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QuanLyPhongBan.aspx.cs" Inherits="hrm2017.forms.config.QuanLyPhongBan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:TextBox ID="txtTenPhongBan" runat="server" />
    <asp:Label ID="lblDsPhongBan" runat="server" />
    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="MAPB" HeaderText="Ma Pb" />
            <asp:BoundField DataField="TENPB" HeaderText="Ten PB" />
            <asp:DynamicField DataField="MAPB" DataFormatString="MAPB" HeaderText="MAPB" />
        </Columns>
    </asp:GridView>
    </asp:Content>
