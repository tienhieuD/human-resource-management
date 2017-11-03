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

    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">ĐIỂM DANH CHẤM CÔNG NHÂN VIÊN
            </div>

        </div>
        <div class="panel-body">
             <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Phòng ban</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="lstPhongBan" class="form-control" runat="server" OnSelectedIndexChanged="lstPhongBan_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList>
                    </div>
                </div>
            <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Tháng</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="lstThang" class="form-control" runat="server" OnSelectedIndexChanged="lstThang_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList>
                    </div>
                </div>
            <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Năm</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="lstNam" class="form-control" runat="server" OnSelectedIndexChanged="lstNam_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList>
                    </div>
                </div>
    <asp:Button ID="btnTaiDuLieu" class="btn btn-default" OnClick="btnTaiDuLieu_Click" Text="Tải dữ liệu" runat="server" />
    <a id="btnLuujQ" class="btn btn-primary">Lưu lại</a><br/>


            <asp:Label ID="lbThongTin" runat ="server"  style="
                text-transform: uppercase;
                margin-bottom: 35px;
                margin-top: 35px;
                font-size: 18px;
                font-weight: 600;
                text-align: center;
                display: block;
                "/>
            <asp:Label ID="lbDsNhanVien" runat="server" />
        </div>
        
    </div>
</asp:Content>
