/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1601)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2008 R2
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [QLNS]
GO
/****** Object:  Table [dbo].[login]    Script Date: 10/23/2017 11:01:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](32) NOT NULL,
	[pwd] [varchar](32) NOT NULL,
	[role] [int] NOT NULL,
	[note] [text] NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_bangdanhgia]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bangdanhgia](
	[TIEUCHIMATIEUCHI] [int] NOT NULL,
	[PHIENPHONGVANMAPHIEN] [int] NOT NULL,
	[ĐIEMANHGIA] [float] NULL,
	[GHICHU] [nvarchar](255) NULL,
 CONSTRAINT [PK_tbl_bangdanhgia] PRIMARY KEY CLUSTERED 
(
	[TIEUCHIMATIEUCHI] ASC,
	[PHIENPHONGVANMAPHIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_bangluong]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bangluong](
	[MABANGLUONG] [int] NOT NULL,
	[NV] [int] NULL,
	[THANG] [date] NULL,
	[NAM] [date] NULL,
	[SOCONGNGAY] [int] NULL,
	[SOCONGDA] [int] NULL,
	[TAMUNG] [int] NULL,
	[PHUCAP] [int] NULL,
	[KHAUTRU] [int] NULL,
	[KHENTHUONG] [int] NULL,
	[KYLUAT] [int] NULL,
	[TONGLUONG] [float] NULL,
	[THUCLINH] [float] NULL,
	[NGAYLINH] [date] NULL,
	[GHICHU] [nvarchar](255) NULL,
 CONSTRAINT [PK_tbl_bangluong] PRIMARY KEY CLUSTERED 
(
	[MABANGLUONG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_chamcongduan]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_chamcongduan](
	[ID] [int] NOT NULL,
	[MANV] [int] NULL,
	[MADA] [int] NULL,
	[CHECKINDA] [datetime] NOT NULL,
	[CHECKOUTDA] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_chamcongduan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_chamcongngay]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_chamcongngay](
	[ID] [int] NOT NULL,
	[MANV] [int] NULL,
	[CHECKIN] [datetime] NOT NULL,
	[CHECKOUT] [datetime] NOT NULL,
	[NGAY] [date] NOT NULL,
 CONSTRAINT [PK_tbl_chamcongngay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_chucvu]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_chucvu](
	[MACV] [int] NOT NULL,
	[TENCV] [nvarchar](255) NULL,
 CONSTRAINT [PK_tbl_chucvu] PRIMARY KEY CLUSTERED 
(
	[MACV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_chuyencongtac]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_chuyencongtac](
	[MADC] [int] NOT NULL,
	[MANV] [int] NULL,
	[NGAYCHUYEN] [date] NULL,
	[LYDO] [nvarchar](255) NULL,
	[MAPBMOI] [int] NULL,
	[MACVMOI] [int] NULL,
	[GHICHU] [nvarchar](255) NULL,
 CONSTRAINT [PK_tbl_chuyencongtac] PRIMARY KEY CLUSTERED 
(
	[MADC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_duan]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_duan](
	[MADA] [int] NOT NULL,
	[TENDA] [nvarchar](255) NULL,
	[GHICHU] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tbl_duan] PRIMARY KEY CLUSTERED 
(
	[MADA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_duannhanvien]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_duannhanvien](
	[DUANMADA] [int] NOT NULL,
	[NHANVIENMANV] [int] NOT NULL,
	[SOGIO] [int] NULL,
 CONSTRAINT [PK_tbl_duannhanvien] PRIMARY KEY CLUSTERED 
(
	[DUANMADA] ASC,
	[NHANVIENMANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_giaidoan]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_giaidoan](
	[MAGIAIDOAN] [int] NOT NULL,
	[TENGIAIDOAN] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_giaidoan] PRIMARY KEY CLUSTERED 
(
	[MAGIAIDOAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_giayhen]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_giayhen](
	[MAGIAYHEN] [int] NOT NULL,
	[TENGIAYHEN] [int] NULL,
	[MAUNGVIEN] [int] NULL,
	[YEUCAUKHAC] [nvarchar](255) NOT NULL,
	[NGAYHEN] [date] NULL,
	[GHICHU] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tbl_giayhen] PRIMARY KEY CLUSTERED 
(
	[MAGIAYHEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_giayhenphienphongvan]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_giayhenphienphongvan](
	[GIAYHENMAGIAYHEN] [int] NOT NULL,
	[PHIENPHONGVANMAPHIEN] [int] NOT NULL,
 CONSTRAINT [PK_tbl_giayhenphienphongvan] PRIMARY KEY CLUSTERED 
(
	[GIAYHENMAGIAYHEN] ASC,
	[PHIENPHONGVANMAPHIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_hopdong]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_hopdong](
	[MAHD] [int] NOT NULL,
	[TENHD] [nvarchar](50) NULL,
	[THAMCHIEU] [nvarchar](50) NULL,
	[MAUNGVIEN] [int] NULL,
	[LUONGCOBAN] [float] NULL,
	[NGAYKY] [date] NULL,
	[NGAYHETHAN] [date] NULL,
	[LOAIHOPDONG] [int] NULL,
	[THOATHUANKHAC] [nvarchar](100) NULL,
	[GHICHU] [nvarchar](255) NULL,
	[TRANGTHAI] [int] NULL,
 CONSTRAINT [PK_tbl_hopdong] PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_khautru]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_khautru](
	[MAKT] [int] NOT NULL,
	[TENKT] [nvarchar](50) NULL,
	[KHAUTRU] [float] NULL,
 CONSTRAINT [PK_tbl_khautru] PRIMARY KEY CLUSTERED 
(
	[MAKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_khenthuong]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_khenthuong](
	[MAKHENTHUONG] [int] NOT NULL,
	[TENKHENTHUONG] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_khenthuong] PRIMARY KEY CLUSTERED 
(
	[MAKHENTHUONG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_khenthuongnhanvien]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_khenthuongnhanvien](
	[KHENTHUONGMAKT] [int] NOT NULL,
	[NHANVIENMANV] [int] NOT NULL,
	[NGAYKHENTHUONG] [date] NULL,
	[SOTIEN] [float] NULL,
	[DANHAN] [bit] NULL,
 CONSTRAINT [PK_tbl_khenthuongnhanvien] PRIMARY KEY CLUSTERED 
(
	[KHENTHUONGMAKT] ASC,
	[NHANVIENMANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_kyluat]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_kyluat](
	[MAKYLUAT] [int] NOT NULL,
	[TENKYLUAT] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_kyluat] PRIMARY KEY CLUSTERED 
(
	[MAKYLUAT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_kyluatnhanvien]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_kyluatnhanvien](
	[KYLUATMAKL] [int] NOT NULL,
	[NHANVIEN] [int] NOT NULL,
	[NGAYKYLUAT] [date] NULL,
	[SOTIEN] [float] NULL,
	[DANHAN] [bit] NULL,
 CONSTRAINT [PK_tbl_kyluatnhanvien] PRIMARY KEY CLUSTERED 
(
	[KYLUATMAKL] ASC,
	[NHANVIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_loaihopdong]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_loaihopdong](
	[MALOAIHD] [int] NOT NULL,
	[TENLOAIHD] [nvarchar](50) NULL,
	[THOIHAN] [date] NULL,
 CONSTRAINT [PK_tbl_loaihopdong] PRIMARY KEY CLUSTERED 
(
	[MALOAIHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_loainghi]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_loainghi](
	[MALOAINGHI] [int] NOT NULL,
	[LOAINGHI] [nvarchar](255) NULL,
	[PHUCAP] [float] NULL,
 CONSTRAINT [PK_tbl_loainghi] PRIMARY KEY CLUSTERED 
(
	[MALOAINGHI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ngaynghi]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ngaynghi](
	[NGAYNGHI] [date] NOT NULL,
	[LOAINGHI] [int] NULL,
	[GHICHU] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tbl_ngaynghi] PRIMARY KEY CLUSTERED 
(
	[NGAYNGHI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_nhanvien]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_nhanvien](
	[MANV] [int] IDENTITY(1,1) NOT NULL,
	[HOTEN] [nvarchar](50) NULL,
	[GIOITINH] [bit] NULL,
	[NGAYSINH] [date] NULL,
	[NOISINH] [nvarchar](255) NULL,
	[DIACHI] [nvarchar](255) NULL,
	[QUEQUAN] [nvarchar](255) NULL,
	[SODIENTHOAI] [numeric](18, 0) NULL,
	[DANTOC] [nvarchar](25) NULL,
	[TONGIAO] [nvarchar](25) NULL,
	[SOCMT] [numeric](18, 0) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[CHUCVU] [int] NULL,
	[PHONGBAN] [int] NULL,
	[GHICHU] [nvarchar](255) NULL,
	[ACTIVE] [bit] NULL,
 CONSTRAINT [PK_TBL_NH] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_nhanvientrinhdohocvan]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_nhanvientrinhdohocvan](
	[NHANVIENMANV] [int] NOT NULL,
	[TDHVMATD] [int] NOT NULL,
 CONSTRAINT [PK_tbl_nhanvientrinhdohocvan] PRIMARY KEY CLUSTERED 
(
	[NHANVIENMANV] ASC,
	[TDHVMATD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_nhanvientrinhdongoaingu]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_nhanvientrinhdongoaingu](
	[NHANVIENMANV] [int] NOT NULL,
	[TDNNMATDNN] [int] NOT NULL,
 CONSTRAINT [PK_tbl_nhanvientrinhdongoaingu] PRIMARY KEY CLUSTERED 
(
	[NHANVIENMANV] ASC,
	[TDNNMATDNN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_phienphongvan]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_phienphongvan](
	[MAPHIEN] [int] NOT NULL,
	[TENPHIEN] [nvarchar](50) NULL,
	[NGAYPV] [date] NULL,
	[GIAIDOAN] [int] NULL,
	[MAGIAYHEN] [int] NULL,
 CONSTRAINT [PK_tbl_phienphongvan] PRIMARY KEY CLUSTERED 
(
	[MAPHIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_phongban]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_phongban](
	[MAPB] [int] NOT NULL,
	[TENPB] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_phongban] PRIMARY KEY CLUSTERED 
(
	[MAPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_phucap]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_phucap](
	[MAPC] [int] NOT NULL,
	[TENPC] [nvarchar](50) NULL,
	[SOTIEN] [float] NULL,
 CONSTRAINT [PK_tbl_phucap] PRIMARY KEY CLUSTERED 
(
	[MAPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_phucapchucvu]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_phucapchucvu](
	[PHUCAPMAPC] [int] NOT NULL,
	[CHUCVUMACV] [int] NOT NULL,
	[KHOANPHUCAP] [float] NULL,
 CONSTRAINT [PK_tbl_phucapchucvu] PRIMARY KEY CLUSTERED 
(
	[PHUCAPMAPC] ASC,
	[CHUCVUMACV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tamung]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tamung](
	[MATU] [int] NOT NULL,
	[MANV] [int] NULL,
	[SOTIEN] [float] NULL,
	[NGAYTU] [date] NULL,
 CONSTRAINT [PK_tbl_tamung] PRIMARY KEY CLUSTERED 
(
	[MATU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tieuchi]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tieuchi](
	[MATIEUCHI] [int] NOT NULL,
	[TENTIEUCHI] [nvarchar](255) NULL,
	[GHICHU] [nvarchar](255) NULL,
 CONSTRAINT [PK_tbl_tieuchi] PRIMARY KEY CLUSTERED 
(
	[MATIEUCHI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tintuyendung]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tintuyendung](
	[MATIN] [int] NOT NULL,
	[TENTIN] [nvarchar](30) NULL,
	[NOIDUNG] [nvarchar](255) NULL,
	[NGAYDANG] [date] NULL,
	[NGAYHETHAN] [date] NULL,
	[NGUOIDANG] [int] NULL,
	[CHUCVU] [int] NULL,
	[PHONGBAN] [int] NULL,
	[SOLUONGTUYEN] [int] NULL,
	[YEUCAUTRINHDO] [nvarchar](50) NOT NULL,
	[MUCLUONG] [float] NULL,
	[MOTA] [nvarchar](255) NOT NULL,
	[GHICHU] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tbl_tintuyendung] PRIMARY KEY CLUSTERED 
(
	[MATIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_trangthai]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_trangthai](
	[MATRANGTHAI] [int] NOT NULL,
	[TENTRANGTHAI] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_trangthai] PRIMARY KEY CLUSTERED 
(
	[MATRANGTHAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_trinhdohocvan]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_trinhdohocvan](
	[MATD] [int] NOT NULL,
	[TENTRINHDO] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_trinhdohocvan] PRIMARY KEY CLUSTERED 
(
	[MATD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_trinhdongoaingu]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_trinhdongoaingu](
	[MATRNN] [int] NOT NULL,
	[TENTRINHDONN] [nvarchar](50) NULL,
	[CAPTRINHDO] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_trinhdongoaingu] PRIMARY KEY CLUSTERED 
(
	[MATRNN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ungvien]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ungvien](
	[MAUNGVIEN] [int] NOT NULL,
	[TENUNGVIEN] [nvarchar](50) NULL,
	[GIOITINH] [bit] NULL,
	[NGÁYINH] [date] NULL,
	[SODIENTHOAI] [numeric](18, 0) NULL,
	[DIACHI] [nvarchar](255) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[HOSOUNGVIEN] [varbinary](2000) NULL,
 CONSTRAINT [PK_tbl_ungvien] PRIMARY KEY CLUSTERED 
(
	[MAUNGVIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_xinnghi]    Script Date: 10/23/2017 11:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_xinnghi](
	[MADON] [int] NOT NULL,
	[MANV] [int] NULL,
	[NGAYNGHI] [int] NULL,
	[LOAINGHI] [int] NULL,
 CONSTRAINT [PK_tbl_xinnghi] PRIMARY KEY CLUSTERED 
(
	[MADON] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[login] ON 

INSERT [dbo].[login] ([id], [login], [pwd], [role], [note]) VALUES (1, N'admin', N'1', 0, NULL)
INSERT [dbo].[login] ([id], [login], [pwd], [role], [note]) VALUES (3, N'user', N'1', 2, NULL)
INSERT [dbo].[login] ([id], [login], [pwd], [role], [note]) VALUES (5, N'manager', N'1', 1, NULL)
SET IDENTITY_INSERT [dbo].[login] OFF
INSERT [dbo].[tbl_chucvu] ([MACV], [TENCV]) VALUES (1, N'Giám đốc')
INSERT [dbo].[tbl_chucvu] ([MACV], [TENCV]) VALUES (2, N'Trưởng phòng')
INSERT [dbo].[tbl_chucvu] ([MACV], [TENCV]) VALUES (3, N'Phó phòng')
INSERT [dbo].[tbl_chucvu] ([MACV], [TENCV]) VALUES (4, N'Nhân viên')
INSERT [dbo].[tbl_chucvu] ([MACV], [TENCV]) VALUES (5, N'Phó giám đốc')
SET IDENTITY_INSERT [dbo].[tbl_nhanvien] ON 

INSERT [dbo].[tbl_nhanvien] ([MANV], [HOTEN], [GIOITINH], [NGAYSINH], [NOISINH], [DIACHI], [QUEQUAN], [SODIENTHOAI], [DANTOC], [TONGIAO], [SOCMT], [EMAIL], [CHUCVU], [PHONGBAN], [GHICHU], [ACTIVE]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_nhanvien] OFF
INSERT [dbo].[tbl_phongban] ([MAPB], [TENPB]) VALUES (1, N'Kế toán')
INSERT [dbo].[tbl_phongban] ([MAPB], [TENPB]) VALUES (2, N'Nhân sự')
ALTER TABLE [dbo].[tbl_bangdanhgia]  WITH CHECK ADD  CONSTRAINT [FK_tbl_bangdanhgia_tbl_phienphongvan] FOREIGN KEY([PHIENPHONGVANMAPHIEN])
REFERENCES [dbo].[tbl_phienphongvan] ([MAPHIEN])
GO
ALTER TABLE [dbo].[tbl_bangdanhgia] CHECK CONSTRAINT [FK_tbl_bangdanhgia_tbl_phienphongvan]
GO
ALTER TABLE [dbo].[tbl_bangdanhgia]  WITH CHECK ADD  CONSTRAINT [FK_tbl_bangdanhgia_tbl_tieuchi] FOREIGN KEY([TIEUCHIMATIEUCHI])
REFERENCES [dbo].[tbl_tieuchi] ([MATIEUCHI])
GO
ALTER TABLE [dbo].[tbl_bangdanhgia] CHECK CONSTRAINT [FK_tbl_bangdanhgia_tbl_tieuchi]
GO
ALTER TABLE [dbo].[tbl_bangluong]  WITH CHECK ADD  CONSTRAINT [FK_tbl_bangluong_tbl_khautru] FOREIGN KEY([KHAUTRU])
REFERENCES [dbo].[tbl_khautru] ([MAKT])
GO
ALTER TABLE [dbo].[tbl_bangluong] CHECK CONSTRAINT [FK_tbl_bangluong_tbl_khautru]
GO
ALTER TABLE [dbo].[tbl_bangluong]  WITH CHECK ADD  CONSTRAINT [FK_tbl_bangluong_tbl_nhanvien] FOREIGN KEY([NV])
REFERENCES [dbo].[tbl_nhanvien] ([MANV])
GO
ALTER TABLE [dbo].[tbl_bangluong] CHECK CONSTRAINT [FK_tbl_bangluong_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_chamcongduan]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chamcongduan_tbl_duan] FOREIGN KEY([MADA])
REFERENCES [dbo].[tbl_duan] ([MADA])
GO
ALTER TABLE [dbo].[tbl_chamcongduan] CHECK CONSTRAINT [FK_tbl_chamcongduan_tbl_duan]
GO
ALTER TABLE [dbo].[tbl_chamcongduan]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chamcongduan_tbl_nhanvien] FOREIGN KEY([MANV])
REFERENCES [dbo].[tbl_nhanvien] ([MANV])
GO
ALTER TABLE [dbo].[tbl_chamcongduan] CHECK CONSTRAINT [FK_tbl_chamcongduan_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_chamcongngay]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chamcongngay_tbl_nhanvien] FOREIGN KEY([MANV])
REFERENCES [dbo].[tbl_nhanvien] ([MANV])
GO
ALTER TABLE [dbo].[tbl_chamcongngay] CHECK CONSTRAINT [FK_tbl_chamcongngay_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_chuyencongtac]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chuyencongtac_tbl_chucvu] FOREIGN KEY([MACVMOI])
REFERENCES [dbo].[tbl_chucvu] ([MACV])
GO
ALTER TABLE [dbo].[tbl_chuyencongtac] CHECK CONSTRAINT [FK_tbl_chuyencongtac_tbl_chucvu]
GO
ALTER TABLE [dbo].[tbl_chuyencongtac]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chuyencongtac_tbl_phongban] FOREIGN KEY([MAPBMOI])
REFERENCES [dbo].[tbl_phongban] ([MAPB])
GO
ALTER TABLE [dbo].[tbl_chuyencongtac] CHECK CONSTRAINT [FK_tbl_chuyencongtac_tbl_phongban]
GO
ALTER TABLE [dbo].[tbl_duannhanvien]  WITH CHECK ADD  CONSTRAINT [FK_tbl_duannhanvien_tbl_duan] FOREIGN KEY([DUANMADA])
REFERENCES [dbo].[tbl_duan] ([MADA])
GO
ALTER TABLE [dbo].[tbl_duannhanvien] CHECK CONSTRAINT [FK_tbl_duannhanvien_tbl_duan]
GO
ALTER TABLE [dbo].[tbl_duannhanvien]  WITH CHECK ADD  CONSTRAINT [FK_tbl_duannhanvien_tbl_nhanvien] FOREIGN KEY([NHANVIENMANV])
REFERENCES [dbo].[tbl_nhanvien] ([MANV])
GO
ALTER TABLE [dbo].[tbl_duannhanvien] CHECK CONSTRAINT [FK_tbl_duannhanvien_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_giayhen]  WITH CHECK ADD  CONSTRAINT [FK_tbl_giayhen_tbl_ungvien] FOREIGN KEY([MAUNGVIEN])
REFERENCES [dbo].[tbl_ungvien] ([MAUNGVIEN])
GO
ALTER TABLE [dbo].[tbl_giayhen] CHECK CONSTRAINT [FK_tbl_giayhen_tbl_ungvien]
GO
ALTER TABLE [dbo].[tbl_giayhenphienphongvan]  WITH CHECK ADD  CONSTRAINT [FK_tbl_giayhenphienphongvan_tbl_giayhen] FOREIGN KEY([GIAYHENMAGIAYHEN])
REFERENCES [dbo].[tbl_giayhen] ([MAGIAYHEN])
GO
ALTER TABLE [dbo].[tbl_giayhenphienphongvan] CHECK CONSTRAINT [FK_tbl_giayhenphienphongvan_tbl_giayhen]
GO
ALTER TABLE [dbo].[tbl_giayhenphienphongvan]  WITH CHECK ADD  CONSTRAINT [FK_tbl_giayhenphienphongvan_tbl_phienphongvan] FOREIGN KEY([PHIENPHONGVANMAPHIEN])
REFERENCES [dbo].[tbl_phienphongvan] ([MAPHIEN])
GO
ALTER TABLE [dbo].[tbl_giayhenphienphongvan] CHECK CONSTRAINT [FK_tbl_giayhenphienphongvan_tbl_phienphongvan]
GO
ALTER TABLE [dbo].[tbl_hopdong]  WITH CHECK ADD  CONSTRAINT [FK_tbl_hopdong_tbl_loaihopdong] FOREIGN KEY([LOAIHOPDONG])
REFERENCES [dbo].[tbl_loaihopdong] ([MALOAIHD])
GO
ALTER TABLE [dbo].[tbl_hopdong] CHECK CONSTRAINT [FK_tbl_hopdong_tbl_loaihopdong]
GO
ALTER TABLE [dbo].[tbl_hopdong]  WITH CHECK ADD  CONSTRAINT [FK_tbl_hopdong_tbl_trangthai] FOREIGN KEY([TRANGTHAI])
REFERENCES [dbo].[tbl_trangthai] ([MATRANGTHAI])
GO
ALTER TABLE [dbo].[tbl_hopdong] CHECK CONSTRAINT [FK_tbl_hopdong_tbl_trangthai]
GO
ALTER TABLE [dbo].[tbl_hopdong]  WITH CHECK ADD  CONSTRAINT [FK_tbl_hopdong_tbl_ungvien] FOREIGN KEY([MAUNGVIEN])
REFERENCES [dbo].[tbl_ungvien] ([MAUNGVIEN])
GO
ALTER TABLE [dbo].[tbl_hopdong] CHECK CONSTRAINT [FK_tbl_hopdong_tbl_ungvien]
GO
ALTER TABLE [dbo].[tbl_khenthuongnhanvien]  WITH CHECK ADD  CONSTRAINT [FK_tbl_khenthuongnhanvien_tbl_khenthuong] FOREIGN KEY([KHENTHUONGMAKT])
REFERENCES [dbo].[tbl_khenthuong] ([MAKHENTHUONG])
GO
ALTER TABLE [dbo].[tbl_khenthuongnhanvien] CHECK CONSTRAINT [FK_tbl_khenthuongnhanvien_tbl_khenthuong]
GO
ALTER TABLE [dbo].[tbl_khenthuongnhanvien]  WITH CHECK ADD  CONSTRAINT [FK_tbl_khenthuongnhanvien_tbl_nhanvien] FOREIGN KEY([NHANVIENMANV])
REFERENCES [dbo].[tbl_nhanvien] ([MANV])
GO
ALTER TABLE [dbo].[tbl_khenthuongnhanvien] CHECK CONSTRAINT [FK_tbl_khenthuongnhanvien_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_kyluatnhanvien]  WITH CHECK ADD  CONSTRAINT [FK_tbl_kyluatnhanvien_tbl_kyluat] FOREIGN KEY([KYLUATMAKL])
REFERENCES [dbo].[tbl_kyluat] ([MAKYLUAT])
GO
ALTER TABLE [dbo].[tbl_kyluatnhanvien] CHECK CONSTRAINT [FK_tbl_kyluatnhanvien_tbl_kyluat]
GO
ALTER TABLE [dbo].[tbl_kyluatnhanvien]  WITH CHECK ADD  CONSTRAINT [FK_tbl_kyluatnhanvien_tbl_nhanvien] FOREIGN KEY([NHANVIEN])
REFERENCES [dbo].[tbl_nhanvien] ([MANV])
GO
ALTER TABLE [dbo].[tbl_kyluatnhanvien] CHECK CONSTRAINT [FK_tbl_kyluatnhanvien_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_ngaynghi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ngaynghi_tbl_loainghi] FOREIGN KEY([LOAINGHI])
REFERENCES [dbo].[tbl_loainghi] ([MALOAINGHI])
GO
ALTER TABLE [dbo].[tbl_ngaynghi] CHECK CONSTRAINT [FK_tbl_ngaynghi_tbl_loainghi]
GO
ALTER TABLE [dbo].[tbl_nhanvien]  WITH CHECK ADD  CONSTRAINT [FK_tbl_nhanvien_tbl_chucvu] FOREIGN KEY([CHUCVU])
REFERENCES [dbo].[tbl_chucvu] ([MACV])
GO
ALTER TABLE [dbo].[tbl_nhanvien] CHECK CONSTRAINT [FK_tbl_nhanvien_tbl_chucvu]
GO
ALTER TABLE [dbo].[tbl_nhanvien]  WITH CHECK ADD  CONSTRAINT [FK_tbl_nhanvien_tbl_phongban] FOREIGN KEY([PHONGBAN])
REFERENCES [dbo].[tbl_phongban] ([MAPB])
GO
ALTER TABLE [dbo].[tbl_nhanvien] CHECK CONSTRAINT [FK_tbl_nhanvien_tbl_phongban]
GO
ALTER TABLE [dbo].[tbl_nhanvientrinhdohocvan]  WITH CHECK ADD  CONSTRAINT [FK_tbl_nhanvientrinhdohocvan_tbl_nhanvien] FOREIGN KEY([NHANVIENMANV])
REFERENCES [dbo].[tbl_nhanvien] ([MANV])
GO
ALTER TABLE [dbo].[tbl_nhanvientrinhdohocvan] CHECK CONSTRAINT [FK_tbl_nhanvientrinhdohocvan_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_nhanvientrinhdohocvan]  WITH CHECK ADD  CONSTRAINT [FK_tbl_nhanvientrinhdohocvan_tbl_trinhdohocvan] FOREIGN KEY([NHANVIENMANV])
REFERENCES [dbo].[tbl_trinhdohocvan] ([MATD])
GO
ALTER TABLE [dbo].[tbl_nhanvientrinhdohocvan] CHECK CONSTRAINT [FK_tbl_nhanvientrinhdohocvan_tbl_trinhdohocvan]
GO
ALTER TABLE [dbo].[tbl_nhanvientrinhdongoaingu]  WITH CHECK ADD  CONSTRAINT [FK_tbl_nhanvientrinhdongoaingu_tbl_nhanvien] FOREIGN KEY([NHANVIENMANV])
REFERENCES [dbo].[tbl_nhanvien] ([MANV])
GO
ALTER TABLE [dbo].[tbl_nhanvientrinhdongoaingu] CHECK CONSTRAINT [FK_tbl_nhanvientrinhdongoaingu_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_nhanvientrinhdongoaingu]  WITH CHECK ADD  CONSTRAINT [FK_tbl_nhanvientrinhdongoaingu_tbl_trinhdongoaingu] FOREIGN KEY([TDNNMATDNN])
REFERENCES [dbo].[tbl_trinhdongoaingu] ([MATRNN])
GO
ALTER TABLE [dbo].[tbl_nhanvientrinhdongoaingu] CHECK CONSTRAINT [FK_tbl_nhanvientrinhdongoaingu_tbl_trinhdongoaingu]
GO
ALTER TABLE [dbo].[tbl_phienphongvan]  WITH CHECK ADD  CONSTRAINT [FK_tbl_phienphongvan_tbl_giaidoan] FOREIGN KEY([GIAIDOAN])
REFERENCES [dbo].[tbl_giaidoan] ([MAGIAIDOAN])
GO
ALTER TABLE [dbo].[tbl_phienphongvan] CHECK CONSTRAINT [FK_tbl_phienphongvan_tbl_giaidoan]
GO
ALTER TABLE [dbo].[tbl_phucapchucvu]  WITH CHECK ADD  CONSTRAINT [FK_tbl_phucapchucvu_tbl_chucvu] FOREIGN KEY([CHUCVUMACV])
REFERENCES [dbo].[tbl_chucvu] ([MACV])
GO
ALTER TABLE [dbo].[tbl_phucapchucvu] CHECK CONSTRAINT [FK_tbl_phucapchucvu_tbl_chucvu]
GO
ALTER TABLE [dbo].[tbl_phucapchucvu]  WITH CHECK ADD  CONSTRAINT [FK_tbl_phucapchucvu_tbl_phucap] FOREIGN KEY([PHUCAPMAPC])
REFERENCES [dbo].[tbl_phucap] ([MAPC])
GO
ALTER TABLE [dbo].[tbl_phucapchucvu] CHECK CONSTRAINT [FK_tbl_phucapchucvu_tbl_phucap]
GO
ALTER TABLE [dbo].[tbl_tamung]  WITH CHECK ADD  CONSTRAINT [FK_tbl_tamung_tbl_nhanvien] FOREIGN KEY([MANV])
REFERENCES [dbo].[tbl_nhanvien] ([MANV])
GO
ALTER TABLE [dbo].[tbl_tamung] CHECK CONSTRAINT [FK_tbl_tamung_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_tintuyendung]  WITH CHECK ADD  CONSTRAINT [FK_tbl_tintuyendung_tbl_nhanvien] FOREIGN KEY([NGUOIDANG])
REFERENCES [dbo].[tbl_nhanvien] ([MANV])
GO
ALTER TABLE [dbo].[tbl_tintuyendung] CHECK CONSTRAINT [FK_tbl_tintuyendung_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_xinnghi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_xinnghi_tbl_loainghi] FOREIGN KEY([LOAINGHI])
REFERENCES [dbo].[tbl_loainghi] ([MALOAINGHI])
GO
ALTER TABLE [dbo].[tbl_xinnghi] CHECK CONSTRAINT [FK_tbl_xinnghi_tbl_loainghi]
GO
ALTER TABLE [dbo].[tbl_xinnghi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_xinnghi_tbl_nhanvien] FOREIGN KEY([MANV])
REFERENCES [dbo].[tbl_nhanvien] ([MANV])
GO
ALTER TABLE [dbo].[tbl_xinnghi] CHECK CONSTRAINT [FK_tbl_xinnghi_tbl_nhanvien]
GO
