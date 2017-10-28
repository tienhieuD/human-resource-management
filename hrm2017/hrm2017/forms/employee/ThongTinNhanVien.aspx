<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ThongTinNhanVien.aspx.cs" Inherits="hrm2017.forms.employee.ThongTinNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container">
        <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">
                <asp:Label ID="lb_Tieude" runat="server"></asp:Label>
            </div>
           
        </div>
        
        <div class="panel-body">
            <hr />
           <form>
                <asp:Panel ID="pn1" runat="server">
                   <div class="form-group row">
                       <label class="col-sm-2 col-form-label">Mã Nhân viên:</label>
                       <div class="col-sm-10">
                              <asp:TextBox ID="txtManv" runat="server" class="form-control"></asp:TextBox>
                       </div>   
                   </div>
               </asp:Panel>
               
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Họ Tên:</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtHoTen" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
                <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Giới Tính</label>
                   <div class="col-sm-10">
                        <asp:RadioButton ID="rb_Nam" GroupName="gt" runat="server" CssClass="form-check-input"  /> Nam &nbsp;
                        <asp:RadioButton ID="rb_Nu" GroupName="gt" runat="server" CssClass="form-check-input"  /> Nữ
                   </div>
               </div>
                <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Ngày Sinh</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtNgaysinh" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Nơi Sinh</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtNoiSinh" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
                <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Địa Chỉ</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtDiaChi" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
              <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Quê Quán</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtQuequan" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
                <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Số Điện Thoại</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtSDT" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Dân Tộc</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtDanToc" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
              
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Tôn Giáo</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtTonGiao" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Số CMT</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtSocmt" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Email</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
                <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Chức Vụ</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtChucvu" runat="server" class="form-control"></asp:TextBox>
                    </div>
               </div>
                <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Phòng Ban</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtPhongBan" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
                <div class="form-group row">
                   <label class="col-sm-2 col-form-label">Ghi chú</label>
                   <div class="col-sm-10">
                        <asp:TextBox ID="txtGhiChu" runat="server" class="form-control"></asp:TextBox>
                   </div>
               </div>
               <div class="form-group row">
                   <label class="col-sm-2 col-form-label"></label>
                   <div class="col-sm-10">
                       <asp:Button ID="btn_addNv" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btn_addNv_Click" />
                       <asp:Button ID="btn_EditNv" runat="server" class="btn btn-info" Text="Edit" OnClick="btn_EditNv_Click" /> &nbsp;
                       <asp:Button ID="btn_RemoveNv" runat="server" CssClass="btn btn-primary" Text="Delete" Onclick="btn_RemoveNv_Click" />
                       <asp:Button ID="btn_Luu" runat="server" CssClass="btn btn-danger" Text ="Save" OnClick="btn_Luu_Click" />
                   </div>
               </div>
           </form>
        </div>
        </div>
    </div>
<div class="container">
    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">DANH SÁCH HỒ SƠ NHÂN VIÊN
            </div>

        </div>
        <div class="panel-body">
            <asp:Label ID="lbDsNhanVien" runat="server" />
        </div>
    </div>
</div>
</asp:Content>
