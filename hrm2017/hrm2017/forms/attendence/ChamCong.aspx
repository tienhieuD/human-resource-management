<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ChamCong.aspx.cs" Inherits="hrm2017.forms.attendence.ChamCong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../styles/jquery.min.js"></script>
    <script>
        var checked_ck = "";
        var unchecked_ck = "";
        $(document).ready(function() {
          $('#btnLuujQ').on('click', function() {
              checked_ck = "";
  	        unchecked_ck = "";
              $("input[type='checkbox']:checked").each ( function() {
                    checked_ck+=$(this).attr("manv")+"w"+$(this).attr("ngay")+"_";
 	          });
      
              $("input[type='checkbox']:not(:checked)").each ( function() {
                    unchecked_ck+=$(this).attr("manv")+"w"+$(this).attr("ngay")+"_";
 	          });
       
              //$("#rs").html(checked_ck + "<br/>" + unchecked_ck);
              window.location.href = "ChamCong.aspx?checked_ck=" + checked_ck + "&unchecked_ck=" + unchecked_ck;
          });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    Phòng ban: <asp:DropDownList ID="lstPhongBan" runat="server" OnSelectedIndexChanged="lstPhongBan_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList><br />
    Tháng: <asp:DropDownList ID="lstThang" runat="server" OnSelectedIndexChanged="lstThang_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList><br />
    Năm: <asp:DropDownList ID="lstNam" runat="server" OnSelectedIndexChanged="lstNam_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList><br />
    <asp:Button ID="btnTaiDuLieu" OnClick="btnTaiDuLieu_Click" Text="Tải dữ liệu" runat="server" />
    <a id="btnLuujQ" class="btn btn-primary">Lưu jQ</a><br/>
    <asp:Label ID="lbThongTin" runat ="server" />
    <asp:Label ID="lbDsNhanVien" runat="server" />
</asp:Content>
