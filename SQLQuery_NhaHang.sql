create database QUAN_LY_NHA_HANG

GO
use QUAN_LY_NHA_HANG

go
set dateFormat dmy

go
create table NhaCungCap(
 id_nhacungcap int not null identity primary key,
 ncc_ten nvarchar(50),
 ncc_email varchar(50),
 ncc_dienthoai varchar(10),
 ncc_diachi nvarchar(100)
)

go
create table NhanVien(
 id_nhanvien int not null identity primary key,
 nv_ho nvarchar(50),
 nv_ten nvarchar(50),
 nv_email varchar(50),
 nv_password nvarchar(20),
 nv_diachi nvarchar(100),
 nv_trangthai bit
)

go
create table PhieuNhapTra(
 id_phieu int not null identity primary key,
 pnt_ngaylap date,
 pnt_loaiphieu nvarchar(50)
)

go
create table ChiTietPhieu(
 ctp_soluong int,
 ctn_gia int
)

go
create table NguyenLieu(
 id_nguyenlieu int not null identity primary key,
 nl_ten nvarchar(50),
 nl_donvitinh nvarchar(20),
 nl_soluong float
)

go
create table CongThuc(
 ct_soluong float
)

go
create table MonAn(
 id_monan int not null identity primary key,
 ma_ten nvarchar(50),
 ma_dongia float,
 ma_hinh nvarchar(50),
 ma_trangthai bit,
 ma_noidung nvarchar(100)
)

go
create table LoaiMonAn(
 id_loaimonan int not null identity primary key,
 lma_ten nvarchar(50),
 lma_mota nvarchar(50)
)

go
create table HoaDon(
 id_hoadon int not null identity primary key,
 hd_ngaydat date,
 hd_trangthai bit,
 hd_ghichu nvarchar(50)
)

go
create table ChiTietDatBan(
 cthd_soluong int,
 cthd_dongia float
)

go
create table Ban(
 id_ban int not null identity primary key,
 b_soban int,
 b_trangthai bit,
 b_hoadon_phucvu int
)

go 
create table KhachHang(
 id_khachhang int not null primary key,
 kh_ho nvarchar(50),
 kh_ten nvarchar(10),
 kh_emali nvarchar(50),
 kh_diachi nvarchar(100),
 kh_dienthoai varchar(10),
 kh_ghichu nvarchar(50)
)
go
alter table PhieuNhapTra
 add constraint fk_PhieuNhapTra_NhaCungCap  foreign key(id_nhacungcung) references NhaCungCap(id_nhacungcap),
 constraint fk_PhieuNhapTra_NhanVien foreign key(id_nhanvien) references NhanVien(id_nhanvien)

go

      
