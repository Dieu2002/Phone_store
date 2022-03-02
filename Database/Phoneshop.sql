Create database quanlibandienthoai;
use quanlibandienthoai;
drop database quanlibandienthoai;
Create table LoaiHang(
MaLoai varchar(6) primary key not null,
TenLoai varchar(30));

insert into LoaiHang()
values('LH01','Loai Binh Thuong'),
('LH02','Loai Cao cap'),
('LH03','Loai Sieu Cap');
--------------------------------
Create table SanPham(
MaSP varchar(6) primary key not null,
MaLoai varchar(6),
TenSP varchar(30),
GiaNhap decimal(10,2),
GiaBan decimal(10,2));

Insert into SanPham()
values('SS01','LH01','SamSung','6000000','6500000'),
('OP02','LH02','Oppo','5000000','5500000'),
('VV03','LH03','ViVo','6000000','7000000'),
('VM04','LH01','Vsmart','5000000','6000000');
----------------
Create table NhanVien(
MaNV varchar(6) primary key not null,
TenNV varchar(50),
NgaySinh date,
GioiTinh enum ('nam','nu'),
SDT varchar(20),
DC varchar(50),
ChucVu varchar(20),
Luong decimal(10,2));

insert into NhanVien()
values ('NV01','Nguyen Tran Thai Hoang','2000/02/20','Nam','0973847649','Da Nang','Truong Phong','5000000'),
('NV02','Nguyen Thi Ha Thuong','2001/09/17','Nu','0869567345','Quang Nam','Pho Ban','4500000'),
('NV03','Mai Van Tuan','2000/10/13','Nam','0967534652','Ha Tinh','Nhan vien','4000000'),
('NV04','Nguyen Thi Na','2000/08/30','Nu','0987654532','Quang Binh','Nhan vien','4000000');
-----------------
Create table KhachHang(
MaKH varchar(6) primary key not null,
Tenkh varchar(30),
SDT varchar(20),
ĐC varchar(50),
CMND varchar(30));

insert into KhachHang()
values ('KH01','Nguyen Quoc Toan','0937652458','Da Nang','225478925'),
('KH02','Nguyen Ba Kien','08764532987','Da Nang','323547428'),
('KH03','Tran Thi Nhi','0578568230','Da Nang','345627845'),
('KH04','Hoang Thi Mai','0864674543','Da Nang','387654234');


------------------------
Create table NCC(
MaNCC varchar(6) primary key not null,
MaSP varchar(6),
foreign key( MaSP) references SanPham (MaSP),
TenNCC varchar(30),
SDT varchar(20),
ĐC varchar(50));

insert into NCC()
values ('CC01','SS01','Ho Thi Duyet','0984567542','Quang Tri'),
('CC02','OP02','Ho Thi Phuong','0686789642','Quang Tri'),
('CC03','VV03','Nguyen Thi Ngoc Linh','0986756789','Quang Binh'),
('CC04','VM04','Nguyen Thi Tuyet Giang','0897453241','Quang Nam'),
('CC05','SS01','Tran Thi Lien','0987675673','DaNAng');


----------------
Create table HDN(
MaHDN varchar(6) primary key not null,
MaNCC varchar(6),
MaSP varchar(6),
MaNV varchar(6),
foreign key( MaSP) references SanPham (MaSP),
foreign key( MaNV) references NhanVien (MaNV),
foreign key( MaNCC) references NCC(MaNCC),
NgayNhap Date
);

insert into HDN()
values('HN01','CC01','SS01','NV02','2021/10/12'),
('HN02','CC02','OP02','NV03','2021/10/15'),
('HN03','CC03','VV03','NV04','2021/10/20'),
('HN04','CC04','VM04','NV02','2021/10/25');
-----------------
create table CTHDN (
MaCT varchar(6) primary key not null,
MaSP varchar(6),
foreign key( MaSP) references SanPham (MaSP),
SL int(5),
GiaNhap decimal(12,2));
insert into CTHDN ()
values('CT01','SS01','4','6000000'),
('CT02','OP02','5','5000000'),
('CT03','VV03','6','6000000'),
('CT04','VM04','5','5000000');


Create table HDX(
MaHDX varchar(6),
MaSP varchar(6),
MaKH varchar(6),
MaNV varchar(6),
foreign key( MaSP) references SanPham (MaSP),
foreign key( MaKH) references KhachHang (MaKH),
foreign key( MaNV) references NhanVien(MaNV),
NgayMua date,
DienGiai enum ('Tra du','Tra gop'));

insert into HDX()
values ('DX01','VM04','KH02','NV01','2021/10/26','Tra Gop'),
('DX02','SS01','KH01','NV04','2021/10/28','Tra du'),
('DX03','OP02','KH04','NV03','2021/10/29','Tra du'),
('DX04','VV03','KH03','NV02','2021/10/31','Tra gop'),
('DX05','VM04','KH01','NV03','2021/10/10','Tra du'),
('DX06','SS01','KH02','NV01','2021/10/20','Tra du');

-----------------
CREATE TABLE CTHDX(
MaCTX varchar(6) primary key not null,
MaSP varchar(6),
foreign key( MaSP) references SanPham (MaSP),
SL int(5),
Gia decimal(10,2));

insert into CTHDX()
values('HX01','VM04','3','5500000'),
('HX02','SS01','1','6500000'),
('HX03','OP02','1','5500000'),
('HX04','VV03','1','7000000'),
('HX05','VM04','2','5500000'),
('HX06','SS01','3','6500000');
------------------------
Create table SP_BaoHanh(
MaBH varchar(6),
MaKH Varchar(6),
TenMH varchar(30),
MaSP varchar(6),
foreign key( MaSP) references SanPham (MaSP),
foreign key( MaKH) references KhachHang (MaKH),
NgayMua date,
DienGiai varchar(30));

insert into SP_BaoHanh()
values('BH01','KH01','Sam Sung','SS01','2021/10/28','Bao hanh 12 thang'),
('BH02','KH02','Vsmart','VM04','2021/10/26','Bao Hanh 12 thang'),
('BH03','KH03','ViVo','VV03','2021/10/31','Bao hanh 12 thang'),
('BH04','KH04','Oppo','OP02','2021/10/29','Bao hanh 12 thang'),
('BH05','KH01','Vsmart','VM04','2021/10/10','Bao hanh 12 thang'),
('BH06','KH02','Sam Sung','SS01','2021/10/20','Bao hanh 12 thang');
create table TraGop (
MaTG varchar(6) primary key,
MaNV varchar(6),
Makh varchar(6),
MaBH varchar(6),
foreign key(MaKh) references KhachHang(Makh),
foreign key (Manv) references Nhanvien(MaNV),
NgayTG date);

INSERT INTO TraGop()
values ('TG01','NV01','KH02','BH02','2021/11/01'),
('TG02','NV02','KH03','BH03','2021/11/02');

create table CTTraGop(
MaTG varchar(6),
foreign key (MaTG) references TraGop(MaTG),
MaSP varchar(6),
foreign key (MaSP) references SanPham(MaSP),
SL int(5),
ThanhTien decimal(10,2),
ThoiHanTra varchar(20),
PhanTramTraTruoc decimal(10,2),
TienHangThang decimal(10,2));
INSERT INTO CTTraGop(MaTG ,MaSP,SL,ThoiHanTra,PhanTramTraTruoc)
values('TG01','VM04','3','12 thang',50),
('TG02','VV03','1','12 thang',40);
--------------------------------------------------------------------------------------------------------
Câu view 1:  tạo view cho biết tổng doanh thu của từng mặt hàng tháng 10 

ALTER ALGORITHM = UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cau0` AS SELECT COUNT(`quanlibandienthoai`.`cthdx`.`SL`) AS `DoanhSoXuat`, SUM( `quanlibandienthoai`.`cthdx`.`Gia` * `quanlibandienthoai`.`cthdx`.`SL` ) AS `ToongSoLuongXuat`, `sp`.`TenSP` AS `TenSP`, `sp`.`MaSP` AS `MaSP` FROM ( ( `quanlibandienthoai`.`cthdx` JOIN `quanlibandienthoai`.`hdx` `h` ON ( `h`.`MaSP` = `quanlibandienthoai`.`cthdx`.`MaSP` ) ) JOIN `quanlibandienthoai`.`sanpham` `sp` ON ( `quanlibandienthoai`.`cthdx`.`MaSP` = `sp`.`MaSP` ) ) WHERE MONTH(`h`.`NgayMua`) = 10 GROUP BY `quanlibandienthoai`.`cthdx`.`MaSP`

 Câu view 2: Tạo view cho biết nhà cung cấp chưa cập nhật hàng lần nào.

   ALTER ALGORITHM = UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cau3` AS SELECT `quanlibandienthoai`.`ncc`.`TenNCC` AS `TenNCC`, `quanlibandienthoai`.`ncc`.`MaNCC` AS `MaNCC`, `quanlibandienthoai`.`ncc`.`MaSP` AS `MaSP` FROM ( `quanlibandienthoai`.`ncc` JOIN `quanlibandienthoai`.`hdn` ON ( `quanlibandienthoai`.`hdn`.`MaSP` = `quanlibandienthoai`.`ncc`.`MaSP` ) ) WHERE `quanlibandienthoai`.`ncc`.`MaNCC` <> `quanlibandienthoai`.`hdn`.`MaNCC`                                                                        
Câu view 3: 	Thông tin chi tiết về hóa đơn nhập : ngày nhập , mã sản phẩm số lượng nhập và tổng tiền. 

ALTER ALGORITHM = UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cauu2` AS SELECT `h`.`NgayNhap` AS `NgayNhap`, `ct`.`SL` AS `SoLuongNhap`, `sp`.`MaSP` AS `MaSP`, `sp`.`TenSP` AS `TenSP`, `ct`.`SL` * `ct`.`GiaNhap` AS `TongTien` FROM ( ( `quanlibandienthoai`.`hdn` `h` JOIN `quanlibandienthoai`.`cthdn` `ct` ON (`h`.`MaSP` = `ct`.`MaSP`) ) JOIN `quanlibandienthoai`.`sanpham` `sp` ON (`h`.`MaSP` = `sp`.`MaSP`) ) WHERE MONTH(`h`.`NgayNhap`) = 10 ORDER BY `h`.`NgayNhap`
Câu view 4: Hiển thị thông tin khách hàng và số lượng mua.

ALTER ALGORITHM = UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cauu5` AS SELECT `quanlibandienthoai`.`hdx`.`MaKH` AS `MaKH`, `k`.`Tenkh` AS `TenKH`, COUNT(`quanlibandienthoai`.`hdx`.`MaHDX`) AS `SoLanMua` FROM ( `quanlibandienthoai`.`hdx` JOIN `quanlibandienthoai`.`khachhang` `k` ON ( `k`.`MaKH` = `quanlibandienthoai`.`hdx`.`MaKH` ) ) GROUP BY `quanlibandienthoai`.`hdx`.`MaKH`
Câu view 5: Nhân viên chưa nhập hàng bao giờ

ALTER ALGORITHM = UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nvchuanhaphang_view` AS SELECT `quanlibandienthoai`.`nhanvien`.`MaNV` AS `MaNV`, `quanlibandienthoai`.`nhanvien`.`TenNV` AS `TenNV`, `quanlibandienthoai`.`nhanvien`.`NgaySinh` AS `NgaySinh`, `quanlibandienthoai`.`nhanvien`.`GioiTinh` AS `GioiTinh`, `quanlibandienthoai`.`nhanvien`.`SDT` AS `SDT`, `quanlibandienthoai`.`nhanvien`.`DC` AS `DC`, `quanlibandienthoai`.`nhanvien`.`ChucVu` AS `ChucVu`, `quanlibandienthoai`.`nhanvien`.`Luong` AS `Luong` FROM `quanlibandienthoai`.`nhanvien` WHERE !( `quanlibandienthoai`.`nhanvien`.`MaNV` IN( SELECT `quanlibandienthoai`.`hdn`.`MaNV` FROM `quanlibandienthoai`.`hdn` ) )
Câu view 6: Sản phẩm được mua nhiều nhất

ALTER ALGORITHM = UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sanphammua` AS SELECT `quanlibandienthoai`.`cthdx`.`MaSP` AS `MaSP`, `sp`.`TenSP` AS `TenSP`, COUNT(`quanlibandienthoai`.`cthdx`.`MaCTX`) AS `SLmua` FROM ( ( `quanlibandienthoai`.`cthdx` JOIN `quanlibandienthoai`.`sanpham` `sp` ON ( `quanlibandienthoai`.`cthdx`.`MaSP` = `sp`.`MaSP` ) ) JOIN `quanlibandienthoai`.`hdx` `h` ON ( `quanlibandienthoai`.`cthdx`.`MaSP` = `h`.`MaSP` ) ) WHERE MONTH(`h`.`NgayMua`) = 10 GROUP BY `quanlibandienthoai`.`cthdx`.`MaSP` ORDER BY COUNT(`quanlibandienthoai`.`cthdx`.`MaCTX`) DESC LIMIT 2

Câu view 7: Tổng doanh thu tháng 10 

ALTER ALGORITHM = UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tdt` AS SELECT SUM( `quanlibandienthoai`.`cthdx`.`Gia` * `quanlibandienthoai`.`cthdx`.`SL` ) AS `DoanhThuthang10` FROM ( `quanlibandienthoai`.`cthdx` JOIN `quanlibandienthoai`.`hdx` ON ( `quanlibandienthoai`.`hdx`.`MaSP` = `quanlibandienthoai`.`hdx`.`MaSP` ) ) WHERE MONTH(`quanlibandienthoai`.`hdx`.`NgayMua`) = 10
Câu view 8: Tính tiền trả góp

ALTER ALGORITHM = UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tientragop_view` AS SELECT `t`.`MaTG` AS `MaTG`, `t`.`MaNV` AS `MaNV`, `t`.`Makh` AS `maKH`, `t`.`NgayTG` AS `NgayTG`, `ct`.`MaSP` AS `MaSP`, `ct`.`SL` AS `SL`, `s`.`GiaBan` AS `GiaBan`, `ct`.`SL` * `s`.`GiaBan` *(100 - `ct`.`PhanTramTraTruoc`) / 100 AS `ThanhTien`, `ct`.`ThoiHanTra` AS `ThoiHanTra`, `ct`.`PhanTramTraTruoc` AS `PhanTramTratruoc`, `ct`.`TienHangThang` AS `TienHangThang`, `t`.`MaBH` AS `mabh` FROM ( ( `quanlibandienthoai`.`tragop` `t` JOIN `quanlibandienthoai`.`cttragop` `ct` ON (`t`.`MaTG` = `ct`.`MaTG`) ) JOIN `quanlibandienthoai`.`sanpham` `s` ON (`s`.`MaSP` = `ct`.`MaSP`) )
-------------------------------------------------------------------------------------------------
Các câu tạo procedures 
Câu 1: Tạo procedures tính tiền trả góp 

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TinhTienTG`()
begin 
UPDATE TienTraGop_view 
set tienhangthang=Thanhtien*(100-PhanTramtratruoc)/100/12 + ThanhTien*(100-phantramtratruoc)/100*3.4/100;
end$$
DELIMITER ;

Câu 2: Tìm kiếm sản phẩm theo giá 

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TKSPtheogia`(IN GiaNhapThap DECIMAL(10,2), IN GiaNhapCao DECIMAL(10,2))
begin
SELECT * from sanpham
where sanpham.GiaBan BETWEEN GiaNhapThap and GiaNhapCao;
end$$
DELIMITER ;

Câu 3: Tìm kiếm theo mã sản phẩm

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Timkiem_sp`(IN msp VARCHAR(6))
begin
set @a = (select tensp from sanpham
              where Masp = msp);
if @a is null then 
	signal SQLSTATE '45000'
    set MESSAGE_TEXT = 'Sản phẩm không tồn tại!';
else 
	select @a as Ketqua;
end if;
end$$
DELIMITER ;
Câu 4: Số lượng sản phẩm được xuất ra 

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SLxuat`(IN nhap VARCHAR(6))
SELECT SanPham.Masp,Tensp,

       SUM(CTHDX.SL) AS 'Tong so luong'

       FROM SanPham LEFT JOIN CTHDX
       ON SanPham.Masp=CTHDX.Masp

     WHERE SanPham.Masp= nhap

    GROUP BY SanPham.Masp,Tensp$$
DELIMITER ;

Câu 5: Nhập tháng và năm và in ra thông tin sản phẩm 

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `KiemTraSP`(IN thang INT, IN nam INT)
select year(HDX.NgayMua) as nam ,month(HDX.NgayMua) as thang, CTHDX.MaSP,COUNT(CTHDX.SL) as SoLuongXuat
    from HDX join CTHDX on CTHDX.MaSP=HDX.MaSP
    where month(HDX.NgayMua)= thang and year(HDX.NgayMua)= nam
    group by nam, thang, Masp$$
DELIMITER ;

Câu 6: Cập nhật, thêm, xóa sản phẩm 
Cập nhật sản phẩm 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateSP`(IN SP VARCHAR(6), IN ML VARCHAR(6), IN Ten VARCHAR(30), IN GN DECIMAL(10,2), IN GB DECIMAL(10,2))
BEGIN 
    UPDATE sanpham
    SET MaLoai=ML, TenSP=Ten,GiaNhap=GN,GiaBan=GB
    Where MaSP=SP;
    select * from sanpham;
end$$
DELIMITER ;
Thêm sản phẩm 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_SanPham`(IN MaSP VARCHAR(6), IN MaLoai VARCHAR(6), IN TenSP VARCHAR(30), IN GiaNhap DECIMAL(10,2), IN GiaBan DECIMAL(10,1))
begin
INSERT into SanPham(MaSP,MaLoai,TenSP,GiaNhap,GiaBan)
values(MaSP,MaLoai,TenSP,GiaNhap,GiaBan);
select * from SanPham;
end$$
DELIMITER ;
Xóa sản phẩm 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `XoaSP`(IN Nhap VARCHAR(6))
bEGIN
	set FOREIGN_key_checks =0;
	DELETE from sanpham WHERE MaSP=Nhap;
    set FOREIGN_key_checks =1;
    SELECT*FROM sanpham;
END$$
DELIMITER ;
Câu 7: Thêm nhân viên và xóa nhân viên 
Thêm nhân viên 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Them_NV`(IN `Manv` VARCHAR(6), IN `Tennv` VARCHAR(50), IN `NgaySinh` DATE, IN `gioitinh` ENUM('nam','nu'), IN `sdt` VARCHAR(20), IN `dc` VARCHAR(50), IN `Chucvu` VARCHAR(20), IN `Luong` DECIMAL(10,2))
BEGIN 
INSERT INTO nhanvien (MAnv,tennv,ngaysinh,gioitinh,sdt,dc,chucvu,luong)
VALUES(MAnv,tennv,ngaysinh,gioitinh,sdt,dc,chucvu,luong);
SELECT * FROM nhanvien;
END$$
DELIMITER ;
Xóa nhân viên 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Xoa_NV`(IN `Nhap` VARCHAR(6))
bEGIN
	set FOREIGN_key_checks =0;
	DELETE from nhanvien WHERE MaNV=Nhap;
    set FOREIGN_key_checks =1;
    SELECT*FROM nhanvien;
END$$
DELIMITER ;

Câu 8: Thêm và xóa khách hàng 
Thêm khách hàng 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Them_KhachHang`(IN `MaKH` VARCHAR(6), IN `TenKh` VARCHAR(30), IN `SDT` VARCHAR(20), IN `ĐC` VARCHAR(50), IN `CMND` VARCHAR(30))
BEGIN 
INSERT INTO khachhang (MAKH,TENKH,SDT,ĐC,CMND)
VALUES(MAKH,TENKH,SDT,ĐC,CMND);
SELECT * FROM khachhang;
END$$
DELIMITER ;
Xóa khách hàng 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Xoa_KH`(IN `Nhap` VARCHAR(6))
bEGIN
	set FOREIGN_key_checks =0;
	DELETE from Khachhang WHERE MaKh=Nhap;
    set FOREIGN_key_checks =1;
    SELECT*FROM khachhang;
END$$
DELIMITER ;
-----------------------------------------------------------------------------------------------
Tạo function 
Câu 1: Tạo function tính hàng tồn kho 
	DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `TonKhosp`(Nhap VARCHAR(6)) RETURNS int(11)
BEGIN
DECLARE ton int (11);
set ton=(select CTHDN.SL- CTHDX.SL
       from CTHDN, CTHDX
       where CTHDN.MaSP=cthdx.MaSP and cthdn.MaSP= nhap);
return ton;
END$$
DELIMITER ;
Câu 2: Tạo function đếm nhân viên theo chức vụ.
	DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `TongNV`(`Chucvu` VARCHAR(20)) RETURNS int(11)
BEGIN
	return
    (select count(Chucvu) from 
    NhanVien
    where Chucvu=NhanVien.Chucvu
    group by (chucvu)
    );
END$$
DELIMITER ;
--------------------------------------------------------------------------------------------------------
Tạo trigger 
Câu 1: Kiểm tra ngày nhập trong hóa đơn nhập 
	CREATE TRIGGER `check_date` BEFORE INSERT ON `hdn`
 FOR EACH ROW if new.ngaynhap>now() then 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'nhap ngay qua voi ngay hien tai';
end IF
Câu 2: Kiểm tra ngày mua trong hóa đơn xuất. 
CREATE TRIGGER `Check_day` BEFORE INSERT ON `hdx`
 FOR EACH ROW if new.ngaymua>now() then 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'nhap ngay qua voi ngay hien tai';
end IF
Câu 3: Kiểm tra mã loại 
CREATE TRIGGER `Check_maloai` BEFORE INSERT ON `sanpham`
 FOR EACH ROW if new.maloai not in (SELECT maloai from loaihang)
    THEN SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT='ma loai hang khong ton tai'; 
    END IF
