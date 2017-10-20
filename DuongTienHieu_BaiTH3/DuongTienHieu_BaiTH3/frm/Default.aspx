<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DuongTienHieu_BaiTH3.frm.Default" MasterPageFile="Main.Master" Title="Các mùa trong năm" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Bốn mua trong năm rất là đoẹp, đồ ngốk. 
        <% Response.Write(System.Configuration.ConfigurationManager.AppSettings["title"]); %>
    </h3>
    <div class="thumb">
        <p style="background-image: url('../img/muaxuan.jpg')">
            <a href="#">MÙA XUÂN</a>
        </p>
        <p style="background-image: url('../img/muahe.jpg')">
            <a href="#">MÙA HẠ</a>
        </p>
        <p style="background-image: url('../img/muathu.jpg')">
            <a href="#">MÙA THU</a>
        </p>
        <p style="background-image: url('../img/muadong.jpg')">
            <a href="#">MÙA ĐÔNG</a>
        </p>
    </div>

    <!--CKE-->
    <CKEditor:CKEditorControl runat="server" ID="CKEditorMain" BasePath="~/ckeditor" >
    </CKEditor:CKEditorControl>
</asp:Content>
