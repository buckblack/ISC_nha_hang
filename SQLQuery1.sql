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
