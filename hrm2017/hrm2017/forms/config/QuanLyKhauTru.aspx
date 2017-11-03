<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QuanLyKhauTru.aspx.cs" Inherits="hrm2017.forms.config.QuanLyKhauTru" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<asp:Panel ID="pn1" runat="server">
<div class="row">
    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">
                <asp:Label runat="server" ID="lbTieude" ></asp:Label><br />
                <asp:Label ID="lbThongbao" runat="server" ></asp:Label>
            </div>
        </div>
         
        <div class="panel-body">
            <a href="QuanLyKhauTru.aspx?thaotac=them" class="btn btn-danger">Thêm </a>
            <br /><br />
            <asp:Label ID="lbDsKT" runat="server" />  
        </div>
    </div>
</div>
</asp:Panel>
<asp:Panel ID="pn3" runat="server" Visible="false">
<div class="row">
	<div class="col-md-6">
	  	<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title"><asp:Label ID="lb_tieude" runat="server"></asp:Label>
				</div>
			</div>
			<div class="panel-body">
			  	<div class="form-horizontal" role="form">
					<div class="form-group">
					<label for="" class="col-sm-2 control-label">Mã khấu trừ</label>
					<div class="col-sm-10">
						<asp:TextBox ID="txtMaKL" runat="server" class="form-control"></asp:TextBox>
					</div>
					</div>
					<div class="form-group">
					<label for="" class="col-sm-2 control-label">Tên Khấu Trừ</label>
					<div class="col-sm-10">
						<asp:TextBox ID="txtTenKT" runat="server" class="form-control"></asp:TextBox>
					</div>
					</div>
					<div class="form-group">
					<label class="col-sm-2 control-label">Khấu Trừ</label>
					<div class="col-sm-10">
						<asp:TextBox TextMode="Number" ID="txtKT" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					</div>
					<div class="form-group">
                    
					<div class="col-sm-offset-2 col-sm-10">
                        <asp:Button runat="server" ID="btn_them" CssClass="btn btn-info" Text="Thêm" Visible="False" OnClick="btn_them_Click" />
                        <asp:Button runat="server" ID="btn_sua" CssClass="btn btn-info" Text="Sửa" Visible="False" OnClick="btn_sua_Click" />
                        <asp:Button runat="server" ID="btn_xoa" CssClass="btn btn-info" Text="Xóa" Visible="False" OnClick="btn_xoa_Click" />
                        <asp:Button runat="server" ID="btn_luu" CssClass="btn btn-info" Text="Lưu" Visible="False" OnClick="btn_luu_Click" />
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6">
	  	<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title">DANH SÁCH KHẤU TRỪ <br />
                    <asp:Label ID="lb_tb" runat="server"></asp:Label>
				</div>
			</div>
			<div class="panel-body">
			  	   <asp:Label ID="lbtest" runat="server"></asp:Label>
			</div>
		</div>
	</div>
</div>
</asp:Panel>
</asp:Content>
