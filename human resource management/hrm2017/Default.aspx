<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="hrm2017.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>HRM ĐĂNG NHẬP</title>
    <link href="styles/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="styles/css/styles.css" rel="stylesheet" />
</head>
<body class="login-bg">
    <form id="form1" runat="server">
        <div>
        </div>

        <div class="header">
	     <div class="container">
	        <div class="row">
	           <div class="col-md-12">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a href="#">HRM ĐĂNG NHẬP</a></h1>
	              </div>
	           </div>
	        </div>
	     </div>
	</div>

	<div class="page-content container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-wrapper">
			        <div class="box">
			            <div class="content-wrap">
			                <h6>ĐĂNG NHẬP</h6>
                            <asp:Label ID="lblNotice" runat="server" /><br />
                            <asp:TextBox ID="txtLogin" class="form-control" runat="server" placeholder="Tài khoản"/>
                            <asp:TextBox ID="txtPwd" class="form-control" runat="server" TextMode="Password" placeholder="Mật khẩu" />
			                <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" class="btn btn-primary signup" OnClick="btnLogin_Click" />              
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
    </form>
</body>
</html>
