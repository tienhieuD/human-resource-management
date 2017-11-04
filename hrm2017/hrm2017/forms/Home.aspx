<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="hrm2017.forms.Home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css" rel="stylesheet" media="screen">
    <link href="../styles/css/stats.css" rel="stylesheet" />
    <style>.panel-title { margin: 25px 0 0 0; }</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <%
        string GetStatsData(string query)
        {
            System.Data.DataTable dataTable = hrm2017.DataMan.GetDataTable(query);
            int length = dataTable.Rows.Count;
            string data = "";
            for (int i = 0; i < length; i++)
            {
                var column = dataTable.Rows[i];
                data += "{";
                data += string.Format(
                    @" device: '{0}', sells: {1} ",
                    column[0].ToString(), column[1].ToString());
                data += "},";
            }
            return data;
        }

        string GetStatsDataLDonut(string query)
        {
            System.Data.DataTable dataTable = hrm2017.DataMan.GetDataTable(query);
            int length = dataTable.Rows.Count;
            string data = "";
            for (int i = 0; i < length; i++)
            {
                var column = dataTable.Rows[i];
                data += "{";
                data += string.Format(
                    @" label: '{0}', value: {1} ",
                    column[0].ToString(), column[1].ToString());
                data += "},";
            }
            return data;
        }
    %>

    <!--Main content-->
    
    <div class="content-box-large">

        <!-- NHÂN VIÊN TRONG PHÒNG BAN -->
        <div class="panel-heading">
            <div class="panel-title">NHÂN VIÊN TRONG PHÒNG BAN</div>
            <div class="panel-options">
                <a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
                <a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
            </div>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-9">
                    <div id="NhanVienPhongBan" style="height: 230px;"></div>
                </div>

                <div class="col-md-3">
                    <div id="tyleNamnu" style="height: 230px;"></div>
                </div>
            </div>

            <hr/>

            <div class="row">
                <div class="col-md-9"style="TEXT-ALIGN: RIGHT; PADDING: 9PX;">
                    CHỌN PHÒNG BAN
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="lstPhongBan" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="lstPhongBan_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <br />
                    <asp:Label ID="lbDsNhanVien" runat ="server" />
                 </div>
            </div>
        </div>

        <!-- NHÂN VIÊN THEO CHỨC VỤ -->
        <div class="panel-heading">
            <div class="panel-title">NHÂN VIÊN THEO CHỨC VỤ</div>
            <div class="panel-options">
                <a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
                <a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
            </div>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6">
                    <div id="NhanVienChucVu" style="height: 280px;"></div>
                </div>

                <div class="col-md-6">
                    <div class="panel-title">NHÂN VIÊN ĐƯỢC KHEN THƯỞNG NHIỀU</div>
                    <div id="NhanVienKhenThuong" style="height: 230px;"></div>
                </div>
            </div>
        </div>

        <!-- TOP NHÂN VIÊN ĐI LÀM CHĂM CHỈ TRONG THÁNG -->
        <div class="panel-heading">
            <div class="panel-title">TOP NHÂN VIÊN ĐI LÀM CHĂM CHỈ TRONG THÁNG</div>
            <div class="panel-options">
                <a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
                <a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
            </div>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div id="NhanVienDiemDanh" style="height: 230px;"></div>
                </div>
            </div>
        </div>



    </div>
    
    <!--End Main content-->
    <script src="../styles/js/stats.js"></script>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script src="../styles/bootstrap/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="../styles/vendors/morris/morris.css">

    <script src="../styles/vendors/jquery.knob.js"></script>
    <script src="../styles/vendors/raphael-min.js"></script>
    <script src="../styles/vendors/morris/morris.min.js"></script>

    <script src="../styles/vendors/flot/jquery.flot.js"></script>
    <script src="../styles/vendors/flot/jquery.flot.categories.js"></script>
    <script src="../styles/vendors/flot/jquery.flot.pie.js"></script>
    <script src="../styles/vendors/flot/jquery.flot.time.js"></script>
    <script src="../styles/vendors/flot/jquery.flot.stack.js"></script>
    <script src="../styles/vendors/flot/jquery.flot.resize.js"></script>

    <script src="../styles/js/custom.js"></script>
    <script src="../styles/js/stats.js"></script>
	
	<script type='text/javascript'>

        Morris.Bar({
            element: 'NhanVienPhongBan',
            data: [
               <% 
                    string sql = @"select TENPB, COUNT(MANV) AS SONV
                                    from tbl_nhanvien as nv
                                    join tbl_phongban as pb on nv.PHONGBAN = pb.MAPB
                                    GROUP BY TENPB";
                    Response.Write(GetStatsData(sql)); 
                %>
            ],
            xkey: 'device',
            ykeys: ['sells'],
            labels: ['Số lượng'],
            barRatio: 0.4,
            xLabelMargin: 10,
            hideHover: 'auto',
            barColors: ["#3d88ba"]
        });

        Morris.Bar({
            element: 'NhanVienChucVu',
            data: [
                <% 
                    string sql_cv = @"select TENCV, COUNT(MANV) AS SONV
                                    from tbl_nhanvien as nv
                                    join tbl_chucvu as pb on nv.CHUCVU = pb.MACV
                                    GROUP BY TENCV";
                    Response.Write(GetStatsData(sql_cv)); 
                %>
            ],
            xkey: 'device',
            ykeys: ['sells'],
            labels: ['Số lượng'],
            barRatio: 0.4,
            xLabelMargin: 10,
            hideHover: 'auto',
            barColors: ["#a94442"]
        });

        Morris.Bar({
            element: 'NhanVienDiemDanh',
            data: [
                <% 
                    string sql_dd = string.Format(
                                    @"select TOP 10 HOTEN, COUNT(pb.MANV) AS SONV
                                    from tbl_nhanvien as nv
                                    join tbl_chamcongngay as pb on nv.MANV = pb.MANV
                                    WHERE month(pb.NGAY) = {0}
                                    AND YEAR(pb.NGAY) = {1}
                                    GROUP BY HOTEN
                                    ORDER BY SONV DESC",DateTime.Now.Month, DateTime.Now.Year);
                    Response.Write(GetStatsData(sql_dd)); 
                %>
            ],
            xkey: 'device',
            ykeys: ['sells'],
            labels: ['Số buổi làm'],
            barRatio: 0.4,
            xLabelMargin: 10,
            hideHover: 'auto',
            barColors: ["#8a6d3b"]
        });


        Morris.Bar({
            element: 'NhanVienKhenThuong',
            data: [
                <% 
                    string sql_kt = string.Format(
                                    @"SELECT TOP 5 HOTEN, COUNT(MANV) 'SL'
                                    from tbl_nhanvien join tbl_khenthuongnhanvien on 
                                    tbl_khenthuongnhanvien.NHANVIENMANV = tbl_nhanvien.MANV
                                    group by HOTEN
                                    order by SL DESC");
                    Response.Write(GetStatsData(sql_kt)); 
                %>
            ],
            xkey: 'device',
            ykeys: ['sells'],
            labels: ['SỐ LẦN KHEN THƯỞNG'],
            barRatio: 0.4,
            xLabelMargin: 10,
            hideHover: 'auto',
            barColors: ["#64b5f6"]
        });



        Morris.Donut({
            element: 'tyleNamnu',
            data: [
                <% 
                    string sql_gt = string.Format(
                                    @"select 
                                    case GIOITINH when 0 then N'Nhân viên nữ' else 'Nhân viên nam' end 'GT'
                                    ,ROUND(cast (count(MANV) as float) / (SELECT COUNT(*) from tbl_nhanvien) * 100,2) 'PT'
                                    from tbl_nhanvien
                                    Group by GIOITINH ");
                    Response.Write(GetStatsDataLDonut(sql_gt)); 
                %>
            ],
            colors: ["#4caf50", "#aed581"],
            formatter: function (y) { return y + "%" }
        });
	</script>
</asp:Content>
