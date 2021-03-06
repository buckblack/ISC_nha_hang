USE [master]
GO
/****** Object:  Database [QUAN_LY_NHA_HANG]    Script Date: 3/8/2019 8:49:27 AM ******/
CREATE DATABASE [QUAN_LY_NHA_HANG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QUAN_LY_NHA_HANG', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QUAN_LY_NHA_HANG.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QUAN_LY_NHA_HANG_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QUAN_LY_NHA_HANG_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QUAN_LY_NHA_HANG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET ARITHABORT OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET  MULTI_USER 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QUAN_LY_NHA_HANG]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[id_ban] [int] IDENTITY(1,1) NOT NULL,
	[b_soban] [int] NULL,
	[b_trangthai] [bit] NULL,
	[b_hoadon_phucvu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDatBan]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDatBan](
	[id_ctdatban] [int] IDENTITY(1,1) NOT NULL,
	[ctdb_soluong] [int] NULL,
	[ctdb_dongia] [float] NULL,
	[id_monan] [int] NOT NULL,
	[id_hoadon] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietDatBan_1] PRIMARY KEY CLUSTERED 
(
	[id_ctdatban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhieu]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieu](
	[id_ctphieu] [int] IDENTITY(1,1) NOT NULL,
	[ctp_soluong] [int] NULL,
	[ctp_gia] [int] NULL,
	[id_phieu] [int] NOT NULL,
	[id_nguyenlieu] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietPhieu_1] PRIMARY KEY CLUSTERED 
(
	[id_ctphieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CongThuc]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongThuc](
	[id_congthuc] [int] IDENTITY(1,1) NOT NULL,
	[ct_soluong] [float] NULL,
	[id_nguyenlieu] [int] NOT NULL,
	[id_monan] [int] NOT NULL,
 CONSTRAINT [PK_CongThuc_1] PRIMARY KEY CLUSTERED 
(
	[id_congthuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[id_hoadon] [int] IDENTITY(1,1) NOT NULL,
	[hd_ngaydat] [datetime] NULL,
	[hd_trangthai] [bit] NULL,
	[hd_ghichu] [nvarchar](50) NULL,
	[id_nhanvien] [int] NULL,
	[id_ban] [int] NULL,
	[id_khachhang] [int] NULL,
 CONSTRAINT [PK__HoaDon__F9F513318F259825] PRIMARY KEY CLUSTERED 
(
	[id_hoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[id_khachhang] [int] IDENTITY(1,1) NOT NULL,
	[kh_ho] [nvarchar](50) NULL,
	[kh_ten] [nvarchar](10) NULL,
	[kh_email] [nvarchar](50) NULL,
	[kh_diachi] [nvarchar](100) NULL,
	[kh_dienthoai] [varchar](10) NULL,
	[kh_ghichu] [nvarchar](50) NULL,
 CONSTRAINT [PK__KhachHan__63966DBDE7ED9771] PRIMARY KEY CLUSTERED 
(
	[id_khachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiMonAn]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMonAn](
	[id_loaimonan] [int] IDENTITY(1,1) NOT NULL,
	[lma_ten] [nvarchar](100) NULL,
	[lma_mota] [nvarchar](max) NULL,
 CONSTRAINT [PK__LoaiMonA__4E1B54D65CC13AFF] PRIMARY KEY CLUSTERED 
(
	[id_loaimonan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonAn]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonAn](
	[id_monan] [int] IDENTITY(1,1) NOT NULL,
	[ma_ten] [nvarchar](50) NULL,
	[ma_dongia] [float] NULL,
	[ma_hinh] [nvarchar](50) NULL,
	[ma_trangthai] [nvarchar](50) NULL,
	[ma_noidung] [nvarchar](max) NULL,
	[id_loaimonan] [int] NULL,
 CONSTRAINT [PK__MonAn__F9E0C3F82BE7A1E1] PRIMARY KEY CLUSTERED 
(
	[id_monan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguyenLieu]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieu](
	[id_nguyenlieu] [int] IDENTITY(1,1) NOT NULL,
	[nl_ten] [nvarchar](50) NULL,
	[nl_donvitinh] [nvarchar](20) NULL,
	[nl_soluong] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_nguyenlieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[id_nhacungcap] [int] IDENTITY(1,1) NOT NULL,
	[ncc_ten] [nvarchar](50) NULL,
	[ncc_email] [varchar](100) NULL,
	[ncc_dienthoai] [varchar](10) NULL,
	[ncc_diachi] [nvarchar](100) NULL,
 CONSTRAINT [PK__NhaCungC__C34B24EB6C0F6914] PRIMARY KEY CLUSTERED 
(
	[id_nhacungcap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[id_nhanvien] [int] IDENTITY(1,1) NOT NULL,
	[nv_ho] [nvarchar](50) NULL,
	[nv_ten] [nvarchar](50) NULL,
	[nv_email] [varchar](50) NULL,
	[nv_password] [nvarchar](20) NULL,
	[nv_diachi] [nvarchar](100) NULL,
	[nv_trangthai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_nhanvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuNhapTra]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapTra](
	[id_phieu] [int] IDENTITY(1,1) NOT NULL,
	[pnt_ngaylap] [date] NULL,
	[pnt_loaiphieu] [nvarchar](50) NULL,
	[id_nhanvien] [int] NULL,
	[id_nhacungcap] [int] NULL,
 CONSTRAINT [PK__PhieuNha__5B0F708317DC4D3A] PRIMARY KEY CLUSTERED 
(
	[id_phieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmp_so_luong_ban_duoc]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_so_luong_ban_duoc](
	[khoa] [nvarchar](100) NOT NULL,
	[ten_mon] [nvarchar](250) NULL,
	[ngay] [date] NULL,
	[so_luong] [int] NULL,
 CONSTRAINT [PK_tmp_so_luong_ban_duoc] PRIMARY KEY CLUSTERED 
(
	[khoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmp_thong_ke_ton_kho]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_thong_ke_ton_kho](
	[id_nguyenlieu] [int] NOT NULL,
	[tennguyenlieu] [nvarchar](100) NULL,
	[dvt] [nvarchar](50) NULL,
	[tondau] [float] NULL,
	[xuat] [float] NULL,
	[nhap] [float] NULL,
	[toncuoi] [float] NULL,
 CONSTRAINT [PK_tmp_thong_ke_ton_kho] PRIMARY KEY CLUSTERED 
(
	[id_nguyenlieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmp_thu_chi]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_thu_chi](
	[ngay] [date] NOT NULL,
	[thu] [float] NULL,
	[chi] [float] NULL,
 CONSTRAINT [PK_tmp_thu_chi] PRIMARY KEY CLUSTERED 
(
	[ngay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[tbl_chi]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbl_chi] AS
select V_phieu.ngaylap,SUM(V_phieu.tongtien) as tongtiennhap from
(select pn.id_phieu,CONVERT(date,(pnt_ngaylap)) as ngaylap,(select sum(cp.ctp_gia*cp.ctp_soluong) from ChiTietPhieu cp where cp.id_phieu=pn.id_phieu) as tongtien 
from PhieuNhapTra pn where pn.pnt_loaiphieu=N'Nhập') V_phieu
group by V_phieu.ngaylap


GO
/****** Object:  View [dbo].[tbl_thu]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbl_thu] AS
select ngaydat,sum(tongtien) as tongtienthu from 
(select id_hoadon,CONVERT(date,(hd_ngaydat)) as ngaydat,(select sum(c.ctdb_dongia*c.ctdb_soluong) 
from ChiTietDatBan c where c.id_hoadon=hd.id_hoadon) as tongtien from HoaDon hd) V_hoadon
group by ngaydat


GO
/****** Object:  View [dbo].[thu1]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[thu1] as
select * from tbl_thu t left join tbl_chi c on c.ngaylap=t.ngaydat


GO
/****** Object:  View [dbo].[thu2]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[thu2] as
select * from tbl_thu t right join tbl_chi c on c.ngaylap=t.ngaydat


GO
/****** Object:  View [dbo].[view_thongke_soluong]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_thongke_soluong] as
select ma.id_monan,ma.ma_ten,CONVERT(date,hd.hd_ngaydat) as ngay, sum(ctdb.ctdb_soluong) as soluongban
from (HoaDon hd join ChiTietDatBan ctdb on hd.id_hoadon = ctdb.id_hoadon) join MonAn ma on ma.id_monan = ctdb.id_monan
group by ma.ma_ten,ma.id_monan, CONVERT(date,hd.hd_ngaydat)


GO
SET IDENTITY_INSERT [dbo].[Ban] ON 

INSERT [dbo].[Ban] ([id_ban], [b_soban], [b_trangthai], [b_hoadon_phucvu]) VALUES (1, 1, 1, 8)
INSERT [dbo].[Ban] ([id_ban], [b_soban], [b_trangthai], [b_hoadon_phucvu]) VALUES (2, 2, 0, NULL)
INSERT [dbo].[Ban] ([id_ban], [b_soban], [b_trangthai], [b_hoadon_phucvu]) VALUES (3, 3, 1, 3)
INSERT [dbo].[Ban] ([id_ban], [b_soban], [b_trangthai], [b_hoadon_phucvu]) VALUES (4, 4, 0, NULL)
INSERT [dbo].[Ban] ([id_ban], [b_soban], [b_trangthai], [b_hoadon_phucvu]) VALUES (5, 5, 0, NULL)
INSERT [dbo].[Ban] ([id_ban], [b_soban], [b_trangthai], [b_hoadon_phucvu]) VALUES (6, 6, 1, 7)
INSERT [dbo].[Ban] ([id_ban], [b_soban], [b_trangthai], [b_hoadon_phucvu]) VALUES (7, 7, 0, NULL)
INSERT [dbo].[Ban] ([id_ban], [b_soban], [b_trangthai], [b_hoadon_phucvu]) VALUES (8, 8, 0, NULL)
INSERT [dbo].[Ban] ([id_ban], [b_soban], [b_trangthai], [b_hoadon_phucvu]) VALUES (9, 9, 0, NULL)
INSERT [dbo].[Ban] ([id_ban], [b_soban], [b_trangthai], [b_hoadon_phucvu]) VALUES (10, 10, 1, 21)
SET IDENTITY_INSERT [dbo].[Ban] OFF
SET IDENTITY_INSERT [dbo].[ChiTietDatBan] ON 

INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (1, 2, 10000, 1, 1)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (2, 3, 5000, 2, 1)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (4, 1, 35000, 2, 3)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (6, 2, 25000, 7, 2)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (7, 1, 15000, 12, 2)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (8, 1, 15000, 11, 4)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (9, 4, 35000, 1, 4)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (10, 1, 25000, 6, 5)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (11, 2, 25000, 7, 5)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (12, 1, 25000, 8, 5)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (13, 1, 25000, 8, 3)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (14, 2, 25000, 6, 6)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (16, 1, 25000, 6, 7)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (17, 1, 35000, 2, 2)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (18, 6, 25000, 8, 2)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (19, 1, 35000, 1, 8)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (20, 3, 25000, 6, 9)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (21, 1, 25000, 8, 9)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (22, 1, 10000, 13, 9)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (23, 3, 15000, 12, 9)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (24, 1, 25000, 8, 4)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (25, 1, 15000, 12, 4)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (26, 2, 25000, 7, 10)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (27, 2, 25000, 8, 11)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (28, 2, 5000, 14, 11)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (29, 2, 25000, 7, 12)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (30, 3, 25000, 8, 13)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (31, 2, 25000, 8, 14)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (32, 1, 15000, 11, 14)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (33, 1, 25000, 7, 14)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (34, 1, 25000, 8, 15)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (35, 3, 25000, 8, 16)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (36, 2, 25000, 8, 17)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (37, 2, 25000, 8, 18)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (38, 2, 25000, 8, 19)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (39, 1, 25000, 8, 20)
INSERT [dbo].[ChiTietDatBan] ([id_ctdatban], [ctdb_soluong], [ctdb_dongia], [id_monan], [id_hoadon]) VALUES (40, 2, 25000, 8, 21)
SET IDENTITY_INSERT [dbo].[ChiTietDatBan] OFF
SET IDENTITY_INSERT [dbo].[ChiTietPhieu] ON 

INSERT [dbo].[ChiTietPhieu] ([id_ctphieu], [ctp_soluong], [ctp_gia], [id_phieu], [id_nguyenlieu]) VALUES (2, 2, 10000, 1, 1)
INSERT [dbo].[ChiTietPhieu] ([id_ctphieu], [ctp_soluong], [ctp_gia], [id_phieu], [id_nguyenlieu]) VALUES (3, 1, 25000, 3, 2)
INSERT [dbo].[ChiTietPhieu] ([id_ctphieu], [ctp_soluong], [ctp_gia], [id_phieu], [id_nguyenlieu]) VALUES (4, 5, 15000, 4, 3)
INSERT [dbo].[ChiTietPhieu] ([id_ctphieu], [ctp_soluong], [ctp_gia], [id_phieu], [id_nguyenlieu]) VALUES (5, 4, 10000, 5, 1)
INSERT [dbo].[ChiTietPhieu] ([id_ctphieu], [ctp_soluong], [ctp_gia], [id_phieu], [id_nguyenlieu]) VALUES (6, 8, 40000, 8, 4)
SET IDENTITY_INSERT [dbo].[ChiTietPhieu] OFF
SET IDENTITY_INSERT [dbo].[CongThuc] ON 

INSERT [dbo].[CongThuc] ([id_congthuc], [ct_soluong], [id_nguyenlieu], [id_monan]) VALUES (1, 0.05, 15, 10)
INSERT [dbo].[CongThuc] ([id_congthuc], [ct_soluong], [id_nguyenlieu], [id_monan]) VALUES (2, 0.05, 14, 10)
INSERT [dbo].[CongThuc] ([id_congthuc], [ct_soluong], [id_nguyenlieu], [id_monan]) VALUES (4, 0.1, 11, 10)
INSERT [dbo].[CongThuc] ([id_congthuc], [ct_soluong], [id_nguyenlieu], [id_monan]) VALUES (5, 0.001, 8, 10)
INSERT [dbo].[CongThuc] ([id_congthuc], [ct_soluong], [id_nguyenlieu], [id_monan]) VALUES (6, 0.05, 1, 1)
INSERT [dbo].[CongThuc] ([id_congthuc], [ct_soluong], [id_nguyenlieu], [id_monan]) VALUES (7, 0.001, 8, 1)
INSERT [dbo].[CongThuc] ([id_congthuc], [ct_soluong], [id_nguyenlieu], [id_monan]) VALUES (8, 0.1, 23, 1)
INSERT [dbo].[CongThuc] ([id_congthuc], [ct_soluong], [id_nguyenlieu], [id_monan]) VALUES (9, 1, 24, 11)
INSERT [dbo].[CongThuc] ([id_congthuc], [ct_soluong], [id_nguyenlieu], [id_monan]) VALUES (10, 0.1, 25, 8)
SET IDENTITY_INSERT [dbo].[CongThuc] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (1, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (2, CAST(N'2019-02-25 00:00:00.000' AS DateTime), 1, N'', 5, 2, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (3, CAST(N'2019-02-25 00:00:00.000' AS DateTime), 1, NULL, 1, 3, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (4, CAST(N'2019-02-25 00:00:00.000' AS DateTime), 1, N'', 5, 10, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (5, CAST(N'2019-02-25 00:00:00.000' AS DateTime), 1, N'', 5, 4, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (6, CAST(N'2019-02-26 00:00:00.000' AS DateTime), 1, NULL, 1, 5, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (7, CAST(N'2019-02-26 02:55:52.273' AS DateTime), 1, NULL, 1, 6, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (8, CAST(N'2019-02-26 06:49:52.747' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (9, CAST(N'2019-02-26 07:58:29.590' AS DateTime), 1, N'', 5, 8, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (10, CAST(N'2019-03-04 08:18:31.630' AS DateTime), 1, N'', 5, 9, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (11, CAST(N'2019-03-04 08:19:19.180' AS DateTime), 1, N'', 5, 9, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (12, CAST(N'2019-03-04 08:24:45.143' AS DateTime), 1, N'', 5, 8, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (13, CAST(N'2019-03-04 08:26:25.860' AS DateTime), 1, N'', 5, 8, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (14, CAST(N'2019-03-04 08:27:21.757' AS DateTime), 1, N'', 5, 9, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (15, CAST(N'2019-03-04 08:29:22.310' AS DateTime), 1, N'', 5, 9, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (16, CAST(N'2019-03-04 08:35:05.370' AS DateTime), 1, N'', 5, 10, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (17, CAST(N'2019-03-04 08:36:14.487' AS DateTime), 1, N'', 5, 10, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (18, CAST(N'2019-03-04 08:37:21.500' AS DateTime), 1, N'', 5, 10, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (19, CAST(N'2019-03-04 08:39:32.053' AS DateTime), 1, N'', 5, 10, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (20, CAST(N'2019-03-04 08:40:53.320' AS DateTime), 1, N'', 5, 10, 1)
INSERT [dbo].[HoaDon] ([id_hoadon], [hd_ngaydat], [hd_trangthai], [hd_ghichu], [id_nhanvien], [id_ban], [id_khachhang]) VALUES (21, CAST(N'2019-03-04 08:41:43.367' AS DateTime), 0, NULL, 5, 10, 1)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([id_khachhang], [kh_ho], [kh_ten], [kh_email], [kh_diachi], [kh_dienthoai], [kh_ghichu]) VALUES (1, N'Hoàng', N'Minh', N'minh@gmail.com', N'Quận 12', N'012365496', N'khách hàng vui tính')
INSERT [dbo].[KhachHang] ([id_khachhang], [kh_ho], [kh_ten], [kh_email], [kh_diachi], [kh_dienthoai], [kh_ghichu]) VALUES (2, N'Trương Ánh', N'Dương', N'duong@gmail.com', N'Quận 7', N'056878965', N'khách hàng khó tính')
INSERT [dbo].[KhachHang] ([id_khachhang], [kh_ho], [kh_ten], [kh_email], [kh_diachi], [kh_dienthoai], [kh_ghichu]) VALUES (4, N'Nguyễn ', N'Hoa Mai', N'hoamai@gmail.com', N'Quận 8', N'0356897545', N'thích ăn phở')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiMonAn] ON 

INSERT [dbo].[LoaiMonAn] ([id_loaimonan], [lma_ten], [lma_mota]) VALUES (2, N'Cơm', N'Cơm bình dân với nhiều món ăn đa dạng, phong phú. ')
INSERT [dbo].[LoaiMonAn] ([id_loaimonan], [lma_ten], [lma_mota]) VALUES (3, N'Món nước', N'Gồm các món như: bún, mì, miến, phở ')
INSERT [dbo].[LoaiMonAn] ([id_loaimonan], [lma_ten], [lma_mota]) VALUES (4, N'Nước giải khát', N'Các loại nước giải khát như nước có gas, nước mía, nước sâm,...')
SET IDENTITY_INSERT [dbo].[LoaiMonAn] OFF
SET IDENTITY_INSERT [dbo].[MonAn] ON 

INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (1, N'Phở bò', 35000, N'phobo.jpg', N'đang kinh doanh', N'phở thơm ngon, bánh phở mềm dai, bò tươi mới', 3)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (2, N'Hủ tiếu', 35000, N'hutieu.jpg', N'đang kinh doanh', N'hủ tiếu nam vang, hương vị quê hương ', 3)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (6, N'Cơm bò xào', 25000, N'comboxao.jpg', N'ngừng kinh doanh', N'cơm bò xào với hạt cơm dẻo, bò tươi kết hợp với các loại rau củ ', 2)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (7, N'Cơm tấm', 25000, N'comtam.jpg', N'tạm ngừng kinh doanh', N'cơm với hạt gạo dẻo thơm, sườn nướng đậm đà', 2)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (8, N'Cơm chiên dương châu', 25000, N'comchienduongchau.jpg', N'đang kinh doanh', N'cơm được chiên với rau củ, thịt heo xá xíu', 2)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (9, N'Bánh canh cua', 35000, N'banhcanhcua.jpg', N'đang kinh doanh', N'bánh canh được nấu chung với cua biển, chả cua', 3)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (10, N'Bún bò ', 35000, N'bunbo.jpg', N'đang kinh doanh', N'bún bò hương vị Huế đặc sắc', 3)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (11, N'7up', 15000, N'7up.jpg', N'đang kinh doanh', N'nước có gas được giới trẻ yêu thích', 4)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (12, N'Coca Cola', 15000, N'coca.jpg', N'đang kinh doanh', N'nước có gas được giới trẻ yêu thích', 4)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (13, N'Nước mía', 10000, N'nuocmia.jpg', N'đang kinh doanh', N'loại nước mát được nhiều người ưa chuộng', 4)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (14, N'Trà đá', 5000, N'trada.jpg', N'đang kinh doanh', N'<b>loại nước được nhiều người uống nhất</b>', 4)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (17, N'Bánh', 25000, N'ql_ban_hang.sql', N'xóa', N'<p><span style="font-size:26px">Ngon</span></p>
', 3)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (21, N'bán', 10000, N'ql_ban_hang.sql', N'xóa', N'<p style="text-align:center"><span style="font-size:48px"><span style="color:#e67e22">Ngon</span></span></p>
', 3)
INSERT [dbo].[MonAn] ([id_monan], [ma_ten], [ma_dongia], [ma_hinh], [ma_trangthai], [ma_noidung], [id_loaimonan]) VALUES (26, N'Gỏi cuốn', 5000, N'26_phobo.jpg', N'đang kinh doanh', N'<p style="text-align:center"><span style="color:#c0392b"><strong><span style="font-size:16px">Mon ngon</span></strong></span></p>
', 3)
SET IDENTITY_INSERT [dbo].[MonAn] OFF
SET IDENTITY_INSERT [dbo].[NguyenLieu] ON 

INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (1, N'thịt bò', N'kg', 50)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (2, N'thịt heo', N'kg', 50)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (3, N'thịt càng cua ', N'kg', 40)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (4, N'tôm sú ', N'kg', 15)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (5, N'rau húng quế', N'kg', 5)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (6, N'rau om', N'kg', 5)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (7, N'gừng', N'kg', 5)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (8, N'hành lá', N'kg', 7)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (9, N'giá sống', N'kg', 4)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (10, N'tần ô', N'kg', 3)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (11, N'bún', N'kg', 15)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (12, N'sả', N'kg', 5)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (13, N'trứng cút', N'quả', 150)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (14, N'gân bò', N'kg', 10)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (15, N'bắp bò', N'kg', 15)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (16, N'thảo quả', N'kg', 5)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (17, N'hoa hồi ', N'kg', 5)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (18, N'quế', N'kg', 5)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (19, N'gạo', N'kg', 50)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (20, N'cốt lết heo', N'kg', 60)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (21, N'dưa leo', N'kg', 5)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (22, N'cà chua', N'kg', 9)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (23, N'bánh phở', N'kg', 15)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (24, N'7up', N'chai', 100)
INSERT [dbo].[NguyenLieu] ([id_nguyenlieu], [nl_ten], [nl_donvitinh], [nl_soluong]) VALUES (25, N'lạp xưởng', N'kg', 0.1)
SET IDENTITY_INSERT [dbo].[NguyenLieu] OFF
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([id_nhacungcap], [ncc_ten], [ncc_email], [ncc_dienthoai], [ncc_diachi]) VALUES (1, N'Công ty Nông Sản ABC', N'nongsanABC@gmail.com', N'0123656589', N'Quận 7, TP HCM')
INSERT [dbo].[NhaCungCap] ([id_nhacungcap], [ncc_ten], [ncc_email], [ncc_dienthoai], [ncc_diachi]) VALUES (2, N'Công ty Thực Phẩm tổng hợp BoHeo', N'thucphamboheo@gmail.com', N'0185456323', N'Quận Tân Bình, TP HCM')
INSERT [dbo].[NhaCungCap] ([id_nhacungcap], [ncc_ten], [ncc_email], [ncc_dienthoai], [ncc_diachi]) VALUES (3, N'Công ty Hải Sản Nam Bộ HS', N'haisanhs@gmail.com', N'0236564578', N'Huyện Cần Giờ, TP HCM')
INSERT [dbo].[NhaCungCap] ([id_nhacungcap], [ncc_ten], [ncc_email], [ncc_dienthoai], [ncc_diachi]) VALUES (4, N'Công ty Chế Phẩm Rice', N'rice@gmail.com', N'0258746589', N'Huyện Hóc Môn, TP HCM')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([id_nhanvien], [nv_ho], [nv_ten], [nv_email], [nv_password], [nv_diachi], [nv_trangthai]) VALUES (1, N'Nguyễn ', N'Hồng', N'hong@gmail.com', N'123456', N'quận 2', 1)
INSERT [dbo].[NhanVien] ([id_nhanvien], [nv_ho], [nv_ten], [nv_email], [nv_password], [nv_diachi], [nv_trangthai]) VALUES (2, N'Mai', N'Lan', N'lan@gmail.com', N'456789', N'quận 3', 1)
INSERT [dbo].[NhanVien] ([id_nhanvien], [nv_ho], [nv_ten], [nv_email], [nv_password], [nv_diachi], [nv_trangthai]) VALUES (3, N'Vũ Ngọc', N'Trúc', N'truc@gmail.com', N'123789', N'quận 1', 0)
INSERT [dbo].[NhanVien] ([id_nhanvien], [nv_ho], [nv_ten], [nv_email], [nv_password], [nv_diachi], [nv_trangthai]) VALUES (4, N'Nguyễn Minh', N'Hoàng', N'hoang@gmail.com', N'321654', N'quận 1', 1)
INSERT [dbo].[NhanVien] ([id_nhanvien], [nv_ho], [nv_ten], [nv_email], [nv_password], [nv_diachi], [nv_trangthai]) VALUES (5, N'Hồ', N'Tiến', N'a@gmail.com', N'1', NULL, 1)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhieuNhapTra] ON 

INSERT [dbo].[PhieuNhapTra] ([id_phieu], [pnt_ngaylap], [pnt_loaiphieu], [id_nhanvien], [id_nhacungcap]) VALUES (1, CAST(N'2019-02-01' AS Date), N'Nhập', 1, 2)
INSERT [dbo].[PhieuNhapTra] ([id_phieu], [pnt_ngaylap], [pnt_loaiphieu], [id_nhanvien], [id_nhacungcap]) VALUES (2, CAST(N'2019-02-01' AS Date), N'Xuất', 1, 2)
INSERT [dbo].[PhieuNhapTra] ([id_phieu], [pnt_ngaylap], [pnt_loaiphieu], [id_nhanvien], [id_nhacungcap]) VALUES (3, CAST(N'2019-02-02' AS Date), N'Nhập', 2, 1)
INSERT [dbo].[PhieuNhapTra] ([id_phieu], [pnt_ngaylap], [pnt_loaiphieu], [id_nhanvien], [id_nhacungcap]) VALUES (4, CAST(N'2019-02-03' AS Date), N'Nhập', 2, 3)
INSERT [dbo].[PhieuNhapTra] ([id_phieu], [pnt_ngaylap], [pnt_loaiphieu], [id_nhanvien], [id_nhacungcap]) VALUES (5, CAST(N'2019-02-04' AS Date), N'Nhập', 4, 4)
INSERT [dbo].[PhieuNhapTra] ([id_phieu], [pnt_ngaylap], [pnt_loaiphieu], [id_nhanvien], [id_nhacungcap]) VALUES (6, CAST(N'2019-02-04' AS Date), N'Xuất', 4, 1)
INSERT [dbo].[PhieuNhapTra] ([id_phieu], [pnt_ngaylap], [pnt_loaiphieu], [id_nhanvien], [id_nhacungcap]) VALUES (7, CAST(N'2019-02-05' AS Date), N'Xuất', 2, 2)
INSERT [dbo].[PhieuNhapTra] ([id_phieu], [pnt_ngaylap], [pnt_loaiphieu], [id_nhanvien], [id_nhacungcap]) VALUES (8, CAST(N'2019-02-25' AS Date), N'Nhập', 1, 1)
SET IDENTITY_INSERT [dbo].[PhieuNhapTra] OFF
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'112019-02-25', N'7up', CAST(N'2019-02-25' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'112019-03-04', N'7up', CAST(N'2019-03-04' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'12019-01-01', N'Phở bò', CAST(N'2019-01-01' AS Date), 2)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'12019-02-25', N'Phở bò', CAST(N'2019-02-25' AS Date), 4)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'12019-02-26', N'Phở bò', CAST(N'2019-02-26' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'122019-02-25', N'Coca Cola', CAST(N'2019-02-25' AS Date), 2)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'122019-02-26', N'Coca Cola', CAST(N'2019-02-26' AS Date), 3)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'132019-02-26', N'Nước mía', CAST(N'2019-02-26' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'142019-03-04', N'Trà đá', CAST(N'2019-03-04' AS Date), 2)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'22019-01-01', N'Hủ tiếu', CAST(N'2019-01-01' AS Date), 3)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'22019-02-25', N'Hủ tiếu', CAST(N'2019-02-25' AS Date), 2)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'62019-02-25', N'Cơm bò xào', CAST(N'2019-02-25' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'62019-02-26', N'Cơm bò xào', CAST(N'2019-02-26' AS Date), 6)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'72019-02-25', N'Cơm tấm', CAST(N'2019-02-25' AS Date), 4)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'72019-03-04', N'Cơm tấm', CAST(N'2019-03-04' AS Date), 5)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'82019-02-25', N'Cơm chiên dương châu', CAST(N'2019-02-25' AS Date), 9)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'82019-02-26', N'Cơm chiên dương châu', CAST(N'2019-02-26' AS Date), 1)
INSERT [dbo].[tmp_so_luong_ban_duoc] ([khoa], [ten_mon], [ngay], [so_luong]) VALUES (N'82019-03-04', N'Cơm chiên dương châu', CAST(N'2019-03-04' AS Date), 20)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (1, N'thịt bò', N'kg', 5.65, 0, 0, 5.65)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (2, N'thịt heo', N'kg', 1, 0, 0, 1)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (3, N'thịt càng cua ', N'kg', 5, 0, 0, 5)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (4, N'tôm sú ', N'kg', 8, 0, 0, 8)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (5, N'rau húng quế', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (6, N'rau om', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (7, N'gừng', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (8, N'hành lá', N'kg', -0.007, 0, 0, -0.007)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (9, N'giá sống', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (10, N'tần ô', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (11, N'bún', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (12, N'sả', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (13, N'trứng cút', N'quả', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (14, N'gân bò', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (15, N'bắp bò', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (16, N'thảo quả', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (17, N'hoa hồi ', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (18, N'quế', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (19, N'gạo', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (20, N'cốt lết heo', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (21, N'dưa leo', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (22, N'cà chua', N'kg', 0, 0, 0, 0)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (23, N'bánh phở', N'kg', -0.70000000000000007, 0, 0, -0.70000000000000007)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (24, N'7up', N'chai', -1, 1, 0, -2)
INSERT [dbo].[tmp_thong_ke_ton_kho] ([id_nguyenlieu], [tennguyenlieu], [dvt], [tondau], [xuat], [nhap], [toncuoi]) VALUES (25, N'lạp xưởng', N'kg', -1, 2, 0, -3)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-02-26' AS Date), 265000, NULL)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-02-27' AS Date), NULL, NULL)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-02-28' AS Date), NULL, NULL)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-03-01' AS Date), NULL, NULL)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-03-02' AS Date), NULL, NULL)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-03-03' AS Date), NULL, NULL)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-03-04' AS Date), 650000, NULL)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-03-05' AS Date), NULL, NULL)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-03-06' AS Date), NULL, NULL)
INSERT [dbo].[tmp_thu_chi] ([ngay], [thu], [chi]) VALUES (CAST(N'2019-03-07' AS Date), NULL, NULL)
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_NhanVien_Email]    Script Date: 3/8/2019 8:49:27 AM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [Uni_NhanVien_Email] UNIQUE NONCLUSTERED 
(
	[nv_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietDatBan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDatBan_HoaDon] FOREIGN KEY([id_hoadon])
REFERENCES [dbo].[HoaDon] ([id_hoadon])
GO
ALTER TABLE [dbo].[ChiTietDatBan] CHECK CONSTRAINT [FK_ChiTietDatBan_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietDatBan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDatBan_MonAn1] FOREIGN KEY([id_monan])
REFERENCES [dbo].[MonAn] ([id_monan])
GO
ALTER TABLE [dbo].[ChiTietDatBan] CHECK CONSTRAINT [FK_ChiTietDatBan_MonAn1]
GO
ALTER TABLE [dbo].[ChiTietPhieu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieu_NguyenLieu] FOREIGN KEY([id_nguyenlieu])
REFERENCES [dbo].[NguyenLieu] ([id_nguyenlieu])
GO
ALTER TABLE [dbo].[ChiTietPhieu] CHECK CONSTRAINT [FK_ChiTietPhieu_NguyenLieu]
GO
ALTER TABLE [dbo].[ChiTietPhieu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieu_PhieuNhapTra] FOREIGN KEY([id_phieu])
REFERENCES [dbo].[PhieuNhapTra] ([id_phieu])
GO
ALTER TABLE [dbo].[ChiTietPhieu] CHECK CONSTRAINT [FK_ChiTietPhieu_PhieuNhapTra]
GO
ALTER TABLE [dbo].[CongThuc]  WITH CHECK ADD  CONSTRAINT [FK_CongThuc_MonAn] FOREIGN KEY([id_monan])
REFERENCES [dbo].[MonAn] ([id_monan])
GO
ALTER TABLE [dbo].[CongThuc] CHECK CONSTRAINT [FK_CongThuc_MonAn]
GO
ALTER TABLE [dbo].[CongThuc]  WITH CHECK ADD  CONSTRAINT [FK_CongThuc_NguyenLieu] FOREIGN KEY([id_nguyenlieu])
REFERENCES [dbo].[NguyenLieu] ([id_nguyenlieu])
GO
ALTER TABLE [dbo].[CongThuc] CHECK CONSTRAINT [FK_CongThuc_NguyenLieu]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Ban] FOREIGN KEY([id_ban])
REFERENCES [dbo].[Ban] ([id_ban])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Ban]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([id_khachhang])
REFERENCES [dbo].[KhachHang] ([id_khachhang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([id_nhanvien])
REFERENCES [dbo].[NhanVien] ([id_nhanvien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[MonAn]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_LoaiMonAn] FOREIGN KEY([id_loaimonan])
REFERENCES [dbo].[LoaiMonAn] ([id_loaimonan])
GO
ALTER TABLE [dbo].[MonAn] CHECK CONSTRAINT [FK_MonAn_LoaiMonAn]
GO
ALTER TABLE [dbo].[PhieuNhapTra]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapTra_NhaCungCap] FOREIGN KEY([id_nhacungcap])
REFERENCES [dbo].[NhaCungCap] ([id_nhacungcap])
GO
ALTER TABLE [dbo].[PhieuNhapTra] CHECK CONSTRAINT [FK_PhieuNhapTra_NhaCungCap]
GO
ALTER TABLE [dbo].[PhieuNhapTra]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapTra_NhanVien] FOREIGN KEY([id_nhanvien])
REFERENCES [dbo].[NhanVien] ([id_nhanvien])
GO
ALTER TABLE [dbo].[PhieuNhapTra] CHECK CONSTRAINT [FK_PhieuNhapTra_NhanVien]
GO
/****** Object:  StoredProcedure [dbo].[doanh_thu]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[doanh_thu] @dateFrom date, @dateTo date
as
delete from tmp_thu_chi
WHILE CONVERT(date,@dateFrom)<=CONVERT(date,@dateTo)
BEGIN
	DECLARE @thu float
	DECLARE @chi float
	exec tongtien_hoadon @dateFrom, @thu output
	exec tongtien_phieunhap @dateFrom, @chi output
	insert into tmp_thu_chi values(@dateFrom, @thu, @chi)
	set @dateFrom=DATEADD(DAY,1,@dateFrom)
END


GO
/****** Object:  StoredProcedure [dbo].[thong_ke_so_luong_ban]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thong_ke_so_luong_ban] @dateFrom date, @dateTo date
as
delete from tmp_so_luong_ban_duoc
insert into tmp_so_luong_ban_duoc
select (CONVERT(nvarchar,v.id_monan)+CONVERT(nvarchar,v.ngay)) as khoa,v.ma_ten as ten_mon,v.ngay,v.soluongban as so_luong from view_thongke_soluong v where v.ngay>=CONVERT(date,@dateFrom) and v.ngay<=CONVERT(date,@dateTo)



GO
/****** Object:  StoredProcedure [dbo].[thong_ke_ton_kho]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thong_ke_ton_kho] @dateFrom date,@dateTo date
as
delete from tmp_thong_ke_ton_kho
DECLARE cursorNguyenlieu CURSOR FOR select id_nguyenlieu,nl_ten,nl_donvitinh from NguyenLieu
DECLARE @id_nguyenlieu int
DECLARE @nl_ten nvarchar(100)
DECLARE @nl_donvitinh nvarchar(50)
declare @tondau float
declare @toncuoi float
declare @soluongnhap float
declare @soluongxuat float
open cursorNguyenlieu
FETCH NEXT FROM cursorNguyenlieu into @id_nguyenlieu,@nl_ten,@nl_donvitinh
WHILE @@FETCH_STATUS = 0  
   BEGIN
	exec tinh_so_luong_nhap @dateFrom, @dateTo,@id_nguyenlieu, @soluongnhap output
	exec tinh_so_luong_xuat @dateFrom, @dateTo,@id_nguyenlieu, @soluongxuat output
	exec tinh_ton_dau @dateFrom,@id_nguyenlieu, @tondau output
	if(@soluongnhap is NULL)
		set @soluongnhap=0; 
	if(@soluongxuat is NULL)
		set @soluongxuat=0; 
	if(@tondau is NULL)
		set @tondau=0; 
	set @toncuoi=@tondau+@soluongnhap-@soluongxuat
	insert into tmp_thong_ke_ton_kho values(@id_nguyenlieu,@nl_ten,@nl_donvitinh,@tondau,@soluongxuat,@soluongnhap,@toncuoi)
    FETCH NEXT FROM cursorNguyenlieu into @id_nguyenlieu,@nl_ten,@nl_donvitinh
   END;  
CLOSE cursorNguyenlieu
DEALLOCATE cursorNguyenlieu
GO
/****** Object:  StoredProcedure [dbo].[tinh_so_luong_nhap]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[tinh_so_luong_nhap] @dateFrom date,@dateTo date, @id_nguyenlieu int, @soluongnhap float output
	as
	set @soluongnhap=(select (CASE WHEN soluongnhap is NULL THEN 0 ELSE soluongnhap END) as soluongnhap from 
	--xuất nguyên liệu
	(select ct.id_nguyenlieu as nguyenlieuxuat,sum(ct.ct_soluong*ctdb.ctdb_soluong) as soluongxuat from CongThuc ct,ChiTietDatBan ctdb,HoaDon hd
	where ct.id_monan=ctdb.id_monan and hd.id_hoadon=ctdb.id_hoadon and (CONVERT(date,hd.hd_ngaydat)>=CONVERT(date,@dateFrom) and CONVERT(date,hd.hd_ngaydat)<=CONVERT(date,@dateTo))
	group by ct.id_nguyenlieu) view1 full outer join
	--nhập nguyên liệu
	(select ctp.id_nguyenlieu as nguyenlieunhap,sum(ctp.ctp_soluong) as soluongnhap from PhieuNhapTra pn, ChiTietPhieu ctp
	where pn.id_phieu=ctp.id_phieu
	and (CONVERT(date,pn.pnt_ngaylap)>=CONVERT(date,@dateFrom) and CONVERT(date,pn.pnt_ngaylap)<=CONVERT(date,@dateTo))
	group by ctp.id_nguyenlieu) view2 on view1.nguyenlieuxuat=view2.nguyenlieunhap
	where view1.nguyenlieuxuat=@id_nguyenlieu or view2.nguyenlieunhap=@id_nguyenlieu)

GO
/****** Object:  StoredProcedure [dbo].[tinh_so_luong_xuat]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[tinh_so_luong_xuat] @dateFrom date,@dateTo date, @id_nguyenlieu int,@soluongxuat float output
	as
	set @soluongxuat=(select (CASE WHEN soluongxuat is NULL THEN 0 ELSE soluongxuat END) as soluongxuat from 
	--xuất nguyên liệu
	(select ct.id_nguyenlieu as nguyenlieuxuat,sum(ct.ct_soluong*ctdb.ctdb_soluong) as soluongxuat from CongThuc ct,ChiTietDatBan ctdb,HoaDon hd
	where ct.id_monan=ctdb.id_monan and hd.id_hoadon=ctdb.id_hoadon and (CONVERT(date,hd.hd_ngaydat)>=CONVERT(date,@dateFrom) and CONVERT(date,hd.hd_ngaydat)<=CONVERT(date,@dateTo))
	group by ct.id_nguyenlieu) view1 full outer join
	--nhập nguyên liệu
	(select ctp.id_nguyenlieu as nguyenlieunhap,sum(ctp.ctp_soluong) as soluongnhap from PhieuNhapTra pn, ChiTietPhieu ctp
	where pn.id_phieu=ctp.id_phieu
	and (CONVERT(date,pn.pnt_ngaylap)>=CONVERT(date,@dateFrom) and CONVERT(date,pn.pnt_ngaylap)<=CONVERT(date,@dateTo))
	group by ctp.id_nguyenlieu) view2 on view1.nguyenlieuxuat=view2.nguyenlieunhap
	where view1.nguyenlieuxuat=@id_nguyenlieu or view2.nguyenlieunhap=@id_nguyenlieu)

GO
/****** Object:  StoredProcedure [dbo].[tinh_ton_dau]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[tinh_ton_dau] @dateFrom date, @id_nguyenlieu int, @tondau float output
	as
	set @tondau=(select ((CASE WHEN soluongnhap is NULL THEN 0 ELSE soluongnhap END)- (CASE WHEN soluongxuat is NULL THEN 0 ELSE soluongxuat END))from 
	--xuất nguyên liệu
	(select ct.id_nguyenlieu as nguyenlieuxuat,sum(ct.ct_soluong*ctdb.ctdb_soluong) as soluongxuat from CongThuc ct,ChiTietDatBan ctdb,HoaDon hd
	where ct.id_monan=ctdb.id_monan and hd.id_hoadon=ctdb.id_hoadon and CONVERT(date,hd.hd_ngaydat)<CONVERT(date,@dateFrom)
	group by ct.id_nguyenlieu) view1 full outer join
	--nhập nguyên liệu
	(select ctp.id_nguyenlieu as nguyenlieunhap,sum(ctp.ctp_soluong) as soluongnhap from PhieuNhapTra pn, ChiTietPhieu ctp
	where pn.id_phieu=ctp.id_phieu
	and CONVERT(date,pn.pnt_ngaylap)<CONVERT(date,@dateFrom)
	group by ctp.id_nguyenlieu) view2 on view1.nguyenlieuxuat=view2.nguyenlieunhap
	where view1.nguyenlieuxuat=@id_nguyenlieu or view2.nguyenlieunhap=@id_nguyenlieu)

GO
/****** Object:  StoredProcedure [dbo].[tongtien_hoadon]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tongtien_hoadon] @ngaydat date, @tongtien float output
AS
set @tongtien=(select t.tongtienthu from tbl_thu t where CONVERT(date,t.ngaydat)=(CONVERT(date,@ngaydat)))


GO
/****** Object:  StoredProcedure [dbo].[tongtien_phieunhap]    Script Date: 3/8/2019 8:49:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tongtien_phieunhap] @ngaylap date, @tongtien float output
AS
set @tongtien=(select t.tongtiennhap from tbl_chi t where CONVERT(date,t.ngaylap)=(CONVERT(date,@ngaylap)))


GO
USE [master]
GO
ALTER DATABASE [QUAN_LY_NHA_HANG] SET  READ_WRITE 
GO
