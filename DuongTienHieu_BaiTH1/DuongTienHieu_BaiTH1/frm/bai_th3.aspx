<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bai_th3.aspx.cs" Inherits="DuongTienHieu_BaiTH1.frm.bai_th3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
	.tkb {
		width: 1015px;
		font-family: Arial;
		font-size: 8pt;
		font-weight: bold;
		cursor: default;
	}
	.thu, .monhoc {
		width: 120px;
	}
	.tkb, .tkb td {
		border-collapse: collapse;
		border: 1px solid #666;
		padding: 5px;
	}
	
	.thu, .tiet {
		text-align: center;
		background-color: #6699cc;
		color: white;
	}
	
	.tiet, .none {
		width: 70px;
	}
	
	.monhoc {
		background-color: beige;
		color: teal;
	}
	.monhoc i {
		color: gray;
	}
	
</style>
</head>
<body>
    <div align="center" style="padding-top: 10px;">
	<table class="tkb">
		<caption style="padding: 10px; color: rgba(102, 153, 204, 1); text-transform: uppercase; font-size: 12pt;">Thời khóa biểu
            <br /><img src="../img/logokhoa.png" />
		</caption>
		<tbody>
			<tr>
				<td class="none" id="x0">&nbsp;</td>
				<td class="thu" id="x1">Thứ 2</td>
				<td class="thu" id="x2">Thứ 3</td>
				<td class="thu" id="x3">Thứ 4</td>
				<td class="thu" id="x4">Thứ 5</td>
				<td class="thu" id="x5">Thứ 6</td>
				<td class="thu" id="x6">Thứ 7</td>
				<td class="thu" id="x7">Chủ nhật</td>
				<td class="none" id="x8">&nbsp;</td>
			</tr>
			<tr>
				<td class="tiet" id="x9">Tiết 1</td>
				<td id="x10">&nbsp;</td>
				<td class="monhoc" rowspan="2"> 
					<i>MH :</i> Trí tuệ nhân tạo + BTL.. <br/>
					<i>PH :</i> HNBG201  
				</td>
				<td id="x12">&nbsp;</td>
				<td class="monhoc" rowspan="2"> 
					<i>MH :</i> Cơ sở xử lý ảnh số.. <br/>
					<i>PH :</i> HNBG201  
				</td>
				<td id="x14">&nbsp;</td>
				<td id="x15">&nbsp;</td>
				<td id="x16">&nbsp;</td>
				<td class="tiet" id="x17">Tiết 1</td>
			</tr>
			<tr>
				<td class="tiet" id="x18">Tiết 2</td>
				<td id="x19">&nbsp;</td>
				<td id="x21">&nbsp;</td>
				<td id="x23">&nbsp;</td>
				<td id="x24">&nbsp;</td>
				<td id="x25">&nbsp;</td>
				<td class="tiet" id="x26">Tiết 2</td>
			</tr>
			<tr>
				<td class="tiet" id="x27">Tiết 3</td>
				<td class="monhoc" rowspan="2"> 
					<i>MH :</i> Trí tuệ nhân tạo + BTL.. <br/>
					<i>PH :</i> HNBG201  
				</td>
				<td class="monhoc" rowspan="3"> 
					<i>MH :</i>  Quản trị dự án công nghệ thông tin.. <br/>
					<i>PH :</i> HNBG201  
				</td>
				<td id="x30">&nbsp;</td>
				<td class="monhoc" rowspan="2"> 
					<i>MH :</i> Trí tuệ nhân tạo + BTL.. <br/>
					<i>PH :</i> HNBG201  
				</td>
				<td class="monhoc" rowspan="2"> 
					<i>MH :</i>  Quản trị dự án công nghệ thông tin.. <br/>
					<i>PH :</i> HNBG201  
				</td>
				<td id="x33">&nbsp;</td>
				<td id="x34">&nbsp;</td>
				<td class="tiet" id="x35">Tiết 3</td>
			</tr>
			<tr>
				<td class="tiet" id="x36">Tiết 4</td>
				<td id="x39">&nbsp;</td>
				<td id="x42">&nbsp;</td>
				<td id="x43">&nbsp;</td>
				<td class="tiet" id="x44">Tiết 4</td>
			</tr>
			<tr>
				<td class="tiet" id="x45">Tiết 5</td>
				<td id="x46">&nbsp;</td>
				<td id="x48">&nbsp;</td>
				<td id="x49">&nbsp;</td>
				<td id="x50">&nbsp;</td>
				<td id="x51">&nbsp;</td>
				<td id="x52">&nbsp;</td>
				<td class="tiet" id="x53">Tiết 5</td>
			</tr>
			<tr>
				<td class="tiet" id="x54">Tiết 6</td>
				<td class="monhoc" rowspan="2"> 
					<i>MH :</i> Phát triển ứng dụng Web + BTL.. <br/>
					<i>PH :</i> HNBG201  
				</td>
				<td id="x56">&nbsp;</td>
				<td class="monhoc" rowspan="3"> 
					<i>MH :</i> Công nghệ phần mềm..<br/>
					<i>PH :</i> HNBG201  
				</td>
				<td class="monhoc" rowspan="2"> 
					<i>MH :</i> Phát triển ứng dụng Web + BTL.. <br/>
					<i>PH :</i> HNBG201  
				</td>
				<td id="x59">&nbsp;</td>
				<td class="monhoc" rowspan="2"> 
					<i>MH :</i> Công nghệ phần mềm..<br/>
					<i>PH :</i> HNBG201  
				</td>
				<td id="x61">&nbsp;</td>
				<td class="tiet" id="x62">Tiết 6</td>
			</tr>
			<tr>
				<td class="tiet" id="x63">Tiết 7</td>
				<td id="x65">&nbsp;</td>
				<td id="x68">&nbsp;</td>
				<td id="x70">&nbsp;</td>
				<td class="tiet" id="x71">Tiết 7</td>
			</tr>
			<tr>
				<td class="tiet" id="x72">Tiết 8</td>
				<td id="x73">&nbsp;</td>
				<td id="x74">&nbsp;</td>
				<td id="x76">&nbsp;</td>
				<td id="x77">&nbsp;</td>
				<td id="x78">&nbsp;</td>
				<td id="x79">&nbsp;</td>
				<td class="tiet" id="x80">Tiết 8</td>
			</tr>
			<tr>
				<td class="tiet" id="x81">Tiết 9</td>
				<td id="x82">&nbsp;</td>
				<td id="x83">&nbsp;</td>
				<td id="x84">&nbsp;</td>
				<td id="x85">&nbsp;</td>
				<td id="x86">&nbsp;</td>
				<td id="x87">&nbsp;</td>
				<td id="x88">&nbsp;</td>
				<td class="tiet" id="x89">Tiết 9</td>
			</tr>
			<tr>
				<td class="tiet" id="x90">Tiết 10</td>
				<td id="x91">&nbsp;</td>
				<td id="x92">&nbsp;</td>
				<td id="x93">&nbsp;</td>
				<td id="x94">&nbsp;</td>
				<td id="x95">&nbsp;</td>
				<td id="x96">&nbsp;</td>
				<td id="x97">&nbsp;</td>
				<td class="tiet" id="x98">Tiết 10</td>
			</tr>
			<tr>
				<td class="tiet" id="x99">Tiết 11</td>
				<td class="monhoc" rowspan="3"> 
					<i>MH :</i> Ngôn ngữ mô hình hóa UML.. <br/>
					<i>PH :</i> HNBG201  
				</td>
				<td id="x101">&nbsp;</td>
				<td id="x102">&nbsp;</td>
				<td id="x103">&nbsp;</td>
				<td id="x104">&nbsp;</td>
				<td id="x105">&nbsp;</td>
				<td id="x106">&nbsp;</td>
				<td class="tiet" id="x107">Tiết 11</td>
			</tr>
			<tr>
				<td class="tiet" id="x108">Tiết 12</td>
				<td id="x110">&nbsp;</td>
				<td id="x111">&nbsp;</td>
				<td id="x112">&nbsp;</td>
				<td id="x113">&nbsp;</td>
				<td id="x114">&nbsp;</td>
				<td id="x115">&nbsp;</td>
				<td class="tiet" id="x116">Tiết 12</td>
			</tr>
			<tr>
				<td class="tiet" id="x117">Tiết 13</td>
				<td id="x119">&nbsp;</td>
				<td id="x120">&nbsp;</td>
				<td id="x121">&nbsp;</td>
				<td id="x122">&nbsp;</td>
				<td id="x123">&nbsp;</td>
				<td id="x124">&nbsp;</td>
				<td class="tiet" id="x125">Tiết 13</td>
			</tr>
			<tr>
				<td class="none" id="x126">&nbsp;</td>
				<td class="thu" id="x127">Thứ 2</td>
				<td class="thu" id="x128">Thứ 3</td>
				<td class="thu" id="x129">Thứ 4</td>
				<td class="thu" id="x130">Thứ 5</td>
				<td class="thu" id="x131">Thứ 6</td>
				<td class="thu" id="x132">Thứ 7</td>
				<td class="thu" id="x133">Chủ nhật</td>
				<td class="none" id="x134">&nbsp;</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>
