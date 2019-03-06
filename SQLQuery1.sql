CREATE VIEW tbl_thu AS
select ngaydat,sum(tongtien) as tongtienthu from 
(select id_hoadon,CONVERT(date,(hd_ngaydat)) as ngaydat,(select sum(c.ctdb_dongia*c.ctdb_soluong) 
from ChiTietDatBan c where c.id_hoadon=hd.id_hoadon) as tongtien from HoaDon hd) V_hoadon
group by ngaydat

CREATE VIEW tbl_chi AS
select V_phieu.ngaylap,SUM(V_phieu.tongtien) as tongtiennhap from
(select pn.id_phieu,CONVERT(date,(pnt_ngaylap)) as ngaylap,(select sum(cp.ctp_gia*cp.ctp_soluong) from ChiTietPhieu cp where cp.id_phieu=pn.id_phieu) as tongtien 
from PhieuNhapTra pn where pn.pnt_loaiphieu=N'Nhập') V_phieu
group by V_phieu.ngaylap

create view thu1 as
select * from tbl_thu t left join tbl_chi c on c.ngaylap=t.ngaydat

create view thu2 as
select * from tbl_thu t right join tbl_chi c on c.ngaylap=t.ngaydat

select * from tbl_chi left join tbl_thu on ngaydat=ngaylap
select * from tbl_chi right join tbl_thu on ngaydat=ngaylap

select * from thu1,thu2 where (thu1.tongtiennhap<>NULL and thu1.tongtienthu<>NULL) 
select * from thu1
select * from thu2
select * from thu1 left join thu2 on thu1.ngaydat=thu2.ngaylap

CREATE PROCEDURE tongtien_hoadon @ngaydat date, @tongtien float output
AS
set @tongtien=(select t.tongtienthu from tbl_thu t where CONVERT(date,t.ngaydat)=(CONVERT(date,@ngaydat)))

CREATE PROCEDURE tongtien_phieunhap @ngaylap date, @tongtien float output
AS
set @tongtien=(select t.tongtiennhap from tbl_chi t where CONVERT(date,t.ngaylap)=(CONVERT(date,@ngaylap)))



DECLARE @aaa float
exec tongtien_hoadon '3-4-2019', @aaa output
select @aaa

CREATE PROCEDURE doanh_thu @dateFrom date, @dateTo date
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

exec doanh_thu '3-3-2019','3-4-2019'
select * from tmp_thu_chi

create view view_thongke_soluong as
select ma.id_monan,ma.ma_ten,CONVERT(date,hd.hd_ngaydat) as ngay, sum(ctdb.ctdb_soluong) as soluongban
from (HoaDon hd join ChiTietDatBan ctdb on hd.id_hoadon = ctdb.id_hoadon) join MonAn ma on ma.id_monan = ctdb.id_monan
group by ma.ma_ten,ma.id_monan, CONVERT(date,hd.hd_ngaydat)
order by soluongban desc



CREATE PROCEDURE thong_ke_so_luong_ban @dateFrom date, @dateTo date
as
delete from tmp_so_luong_ban_duoc
insert into tmp_so_luong_ban_duoc
select (CONVERT(nvarchar,v.id_monan)+CONVERT(nvarchar,v.ngay)) as khoa,v.ma_ten as ten_mon,v.ngay,v.soluongban as so_luong from view_thongke_soluong v where v.ngay>=CONVERT(date,@dateFrom) and v.ngay<=CONVERT(date,@dateTo)

exec thong_ke_so_luong_ban '1-1-2019', '3-4-2019'
select * from tmp_so_luong_ban_duoc

select * from PhieuNhapTra
select * from HoaDon
select * from ChiTietDatBan
select * from CongThuc


declare @dateFrom date = '2019-1-1'
declare @dateTo date = '2019-3-4'
declare @soluongnhap float
exec tinh_so_luong_nhap '2019-1-1', '2019-3-4',3, @soluongnhap output
select @soluongnhap

	CREATE PROCEDURE tinh_so_luong_nhap @dateFrom date,@dateTo date, @id_nguyenlieu int, @soluongnhap float output
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


	CREATE PROCEDURE tinh_so_luong_xuat @dateFrom date,@dateTo date, @id_nguyenlieu int,@soluongxuat float output
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


	declare @dateFrom date = '2019-3-3'
	declare @dateTo date = '2019-3-4'
	declare @id_nguyenlieu int=8
	declare @tondau float
	exec tinh_ton_dau '2019-3-3',8,@tondau output
	select @tondau
	--tìm tồn đầu
	CREATE PROCEDURE tinh_ton_dau @dateFrom date, @id_nguyenlieu int, @tondau float output
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

declare @dateFrom date = '2019-3-3'
declare @dateTo date = '2019-3-4'
exec thong_ke_ton_kho @dateFrom,@dateTo
select * from tmp_thong_ke_ton_kho

select * from NguyenLieu

CREATE PROCEDURE thong_ke_ton_kho @dateFrom date,@dateTo date
as
delete from tmp_thong_ke_ton_kho
DECLARE cursorNguyenlieu CURSOR FOR select id_nguyenlieu,nl_ten from NguyenLieu
DECLARE @id_nguyenlieu int
DECLARE @nl_ten nvarchar(100)
declare @tondau float
declare @toncuoi float
declare @soluongnhap float
declare @soluongxuat float
open cursorNguyenlieu
FETCH NEXT FROM cursorNguyenlieu into @id_nguyenlieu,@nl_ten
WHILE @@FETCH_STATUS = 0  
   BEGIN
	exec tinh_so_luong_nhap @dateFrom, @dateTo,@id_nguyenlieu, @soluongnhap output
	exec tinh_so_luong_xuat @dateFrom, @dateTo,@id_nguyenlieu, @soluongxuat output
	exec tinh_ton_dau @dateFrom,@id_nguyenlieu, @tondau output
	set @toncuoi=@tondau+@soluongnhap-@soluongxuat
	insert into tmp_thong_ke_ton_kho values(@id_nguyenlieu,@nl_ten,@tondau,@soluongxuat,@soluongnhap,@toncuoi)
    FETCH NEXT FROM cursorNguyenlieu into @id_nguyenlieu,@nl_ten
   END;  
CLOSE cursorNguyenlieu
DEALLOCATE cursorNguyenlieu