<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HoSoNhanVienChiTiet.aspx.cs" Inherits="hrm2017.forms.employee.HoSoNhanVienChiTiet" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            label {text-transform:uppercase;}
        </style>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

        <div class="content-box-large">
            <div class="panel-heading">
                <div class="panel-title">HỒ SƠ NHÂN VIÊN:
                    <asp:Label ID="lbTenNV" runat="server" style="text-transform:uppercase;"/>
                </div>
            </div>
            <div class="panel-body">
                <asp:Button ID="btnSua" runat="server" class="btn btn-primary" 
                    Text="Sửa thông tin nhân viên" Visible="false" OnClick="btnSua_Click"/> 
                <asp:Button ID="btnSua_Luu" runat="server" class="btn btn-primary" 
                    Text="Lưu lại" Visible="false" OnClick="btnSua_Luu_Click"/> 
                <asp:Button ID="btnXoa" runat="server" class="btn btn-danger" 
                    Text="Xóa nhân viên" Visible="false" OnClick="btnXoa_Click"/>
                <br /><br />
                <asp:Panel ID="pnlMain" runat="server" Enabled="false">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Mã Nhân viên:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtManv" runat="server" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Họ Tên:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtHoTen" runat="server" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Giới Tính</label>
                    <div class="col-sm-10">
                        <asp:RadioButton ID="rb_Nam" GroupName="gt" runat="server" CssClass="form-check-input" /> Nam &nbsp;
                        <asp:RadioButton ID="rb_Nu" GroupName="gt" runat="server" CssClass="form-check-input" /> Nữ
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Ngày Sinh</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtNgaysinh" runat="server" class="form-control" type="date"></asp:TextBox>
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
                        <asp:DropDownList ID="lstDanToc" CssClass="form-control" runat="server">
                            <asp:ListItem Value="Ba Na">Ba Na</asp:ListItem>
                            <asp:ListItem Value="Bố Y">Bố Y</asp:ListItem>
                            <asp:ListItem Value="Brâu">Brâu</asp:ListItem>
                            <asp:ListItem Value="Bru - Vân Kiều">Bru - Vân Kiều</asp:ListItem>
                            <asp:ListItem Value="Chơ Ro">Chơ Ro</asp:ListItem>
                            <asp:ListItem Value="Chứt">Chứt</asp:ListItem>
                            <asp:ListItem Value="Chăm">Chăm</asp:ListItem>
                            <asp:ListItem Value="Co">Co</asp:ListItem>
                            <asp:ListItem Value="Cống">Cống</asp:ListItem>
                            <asp:ListItem Value="Cơ Ho">Cơ Ho</asp:ListItem>
                            <asp:ListItem Value="Cơ Lao">Cơ Lao</asp:ListItem>
                            <asp:ListItem Value="Cơ Tu">Cơ Tu</asp:ListItem>
                            <asp:ListItem Value="Chu ru">Chu ru</asp:ListItem>
                            <asp:ListItem Value="Dao">Dao</asp:ListItem>
                            <asp:ListItem Value="Ê Đê">Ê Đê</asp:ListItem>
                            <asp:ListItem Value="Gia Lai">Gia Lai</asp:ListItem>
                            <asp:ListItem Value="Giáy">Giáy</asp:ListItem>
                            <asp:ListItem Value="Gié - Triêng">Gié - Triêng</asp:ListItem>
                            <asp:ListItem Value="H'Mông">H'Mông</asp:ListItem>
                            <asp:ListItem Value="Hà Nhì">Hà Nhì</asp:ListItem>
                            <asp:ListItem Value="Hoa">Hoa</asp:ListItem>
                            <asp:ListItem Value="Hrê">Hrê</asp:ListItem>
                            <asp:ListItem Value="Kháng">Kháng</asp:ListItem>
                            <asp:ListItem Value="Khơ me">Khơ me</asp:ListItem>
                            <asp:ListItem Value="Khơ Mú">Khơ Mú</asp:ListItem>
                            <asp:ListItem Value="Kinh">Kinh</asp:ListItem>
                            <asp:ListItem Value="La Chí">La Chí</asp:ListItem>
                            <asp:ListItem Value="La Ha">La Ha</asp:ListItem>
                            <asp:ListItem Value="La Hủ">La Hủ</asp:ListItem>
                            <asp:ListItem Value="Lào">Lào</asp:ListItem>
                            <asp:ListItem Value="Lô Lô">Lô Lô</asp:ListItem>
                            <asp:ListItem Value="Lự">Lự</asp:ListItem>
                            <asp:ListItem Value="M'Nông">M'Nông</asp:ListItem>
                            <asp:ListItem Value="Mạ">Mạ</asp:ListItem>
                            <asp:ListItem Value="Mảng">Mảng</asp:ListItem>
                            <asp:ListItem Value="Mường">Mường</asp:ListItem>
                            <asp:ListItem Value="Ngái">Ngái</asp:ListItem>
                            <asp:ListItem Value="Nùng">Nùng</asp:ListItem>
                            <asp:ListItem Value="Ô đu">Ô đu</asp:ListItem>
                            <asp:ListItem Value="Pà Thẻn">Pà Thẻn</asp:ListItem>
                            <asp:ListItem Value="Phù Lá">Phù Lá</asp:ListItem>
                            <asp:ListItem Value="Pu Péo">Pu Péo</asp:ListItem>
                            <asp:ListItem Value="Ra Glai">Ra Glai</asp:ListItem>
                            <asp:ListItem Value="Rơ Măm">Rơ Măm</asp:ListItem>
                            <asp:ListItem Value="Sán Chay">Sán Chay</asp:ListItem>
                            <asp:ListItem Value="Sán Dìu">Sán Dìu</asp:ListItem>
                            <asp:ListItem Value="Si La">Si La</asp:ListItem>
                            <asp:ListItem Value="Tà Ôi">Tà Ôi</asp:ListItem>
                            <asp:ListItem Value="Tày">Tày</asp:ListItem>
                            <asp:ListItem Value="Thái">Thái</asp:ListItem>
                            <asp:ListItem Value="Thổ">Thổ</asp:ListItem>
                            <asp:ListItem Value="Xinh Mun">Xinh Mun</asp:ListItem>
                            <asp:ListItem Value="Xtiêng">Xtiêng</asp:ListItem>
                            <asp:ListItem Value="Xơ Đăng">Xơ Đăng</asp:ListItem>
                        </asp:DropDownList>
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
                        <asp:DropDownList ID="lstChucVu" runat="server" class="form-control"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Phòng Ban</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="lstPhongBan" runat="server" class="form-control"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Ghi chú</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtGhiChu" runat="server" class="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Trình độ học vấn</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtTdHocVan" runat="server" class="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Trình độ ngoại ngữ</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtTdNgoaiNgu" runat="server" class="form-control"></asp:TextBox>
                    </div>
                </div>

                    <asp:Button ID="btnThem" runat="server" Text="Thêm" class="btn btn-primary" 
                        Visible="false" OnClick="btnThem_Click"/>
                    </asp:Panel>
            </div>
        </div>
    </asp:Content>