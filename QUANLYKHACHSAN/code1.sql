CREATE SCHEMA IF NOT EXISTS `qlkhachsan` DEFAULT CHARACTER SET utf8 ;
USE `qlkhachsan` ;

-- -----------------------------------------------------
-- Table `qlkhachsan`.`Loai_Phong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlkhachsan`.`Loai_Phong` (
  `Ma_LoaiPhong` VARCHAR(45) NOT NULL,
  `Loai_Phong` VARCHAR(45) NULL DEFAULT NULL,
  `Gia_LoaiPhong` FLOAT NULL,
   `Mo_Ta` VARCHAR(255) NULL,
  PRIMARY KEY (`Ma_LoaiPhong`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

 drop table Loai_Phong;

INSERT INTO Loai_Phong (Ma_LoaiPhong,Loai_Phong,Gia_LoaiPhong,Mo_Ta)
values	('VP','VIP',1000000,'Dien tich 40-50m2, canh bien,2 ban cong,2 phong khach,day du tien nghi'),
		('NM','NorMal',500000,'Dien tich, 30-35m2, canh thanh pho,1 phong khach, tivi, tu lanh');
        
select * from Loai_Phong;
-- -----------------------------------------------------
-- Table `qlkhachsan`.`Phong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlkhachsan`.`Phong` (
  `Ma_Phong` VARCHAR(45) NOT NULL,
  `Ma_LoaiPhong` VARCHAR(45) NULL,
  `Trang_Thai` VARCHAR(45) NULL,
 
  PRIMARY KEY (`Ma_Phong`),
  INDEX `fk_Phong_Loai_Phong1_idx` (`Ma_LoaiPhong` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


Insert into Phong(Ma_Phong,Ma_LoaiPhong,Trang_Thai)
Values 	('LX101','NM','Trong'),
		('LX102','NM','Da dat'),
		('LX103','NM','Trong'),
		('LX104','NM','Da dat'),
		('LX105','NM','Trong'),
		('LX201','VP','Da dat'),
		('LX202','VP','Trong'),
		('LX203','VP','Da dat'),
		('LX204','VP','Trong'),
		('LX205','VP','Trong'),
		('LX301','NM','Trong'),
		('LX302','NM','Trong'),
		('LX303','NM','Trong'),
		('LX304','VP','Trong'),
		('LX305','VP','Da dat'),
        ('LX401','VP','Trong'),
        ('LX402','VP','Trong'),
        ('LX403','NM','Trong'),
        ('LX404','NM','Trong'),
        ('LX405','NM','Trong');
		

select * from Phong;


-- -----------------------------------------------------
-- Table `qlkhachsan`.`Khach_Hang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlkhachsan`.`Khach_Hang` (
  `Ma_KH` VARCHAR(45) NOT NULL,
  `Ten_KH` VARCHAR(100) NULL DEFAULT NULL,
  `Ngay_Sinh` DATE NULL DEFAULT NULL,
  `Dia_Chi` VARCHAR(45) NULL DEFAULT NULL,
  `CMND` VARCHAR(45) NOT NULL,
  `SDT` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Ma_KH`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

drop table Khach_Hang;

INSERT INTO Khach_Hang(Ma_KH,Ten_KH,Ngay_Sinh,Dia_Chi,CMND,SDT)
Values 	('KH01','Le Quang Ha','1989-09-19','02-Thanh Son',194612550,'0965584055'),
		('KH02','Nguyen Ngoc Da','1897-08-18','02-Thanh Son',123858454,'010284324823'),
		('KH03','Truong Nguyen  Thien An','1994-05-15','03-Le Duan',192394834,'0964937432'),
		('KH04','A Not','1989-12-09','01-Bach Dang',194372343,'1238434853'),
		('KH05','Dinh Thanh Ha','1992-10-30','06-Phan Chau Trinh',194612356,'01294838433'),
		('KH06','Nguyen Van Dung','1991-11-01','02- Ly Tu Trong',45466412,'0965382648'),
		('KH07','Le Thi Thanh Kim','1967-08-18','78-Dinh Cong Trang',194638237,'01214966713'),
		('KH08','Truong Thi Lai','1992-10-31','34-Dong Da',658740236,'0905604432'),
		('KH09','Tran Van An','1990-11-03','K2-Ong Ich Khiem',202475987,'01202381887'),
		('KH10','Tran Van An','1896-11-10','11-Le Duan',301597564,'0935740789');
        
select *from Khach_Hang;



-- -----------------------------------------------------
-- Table `qlkhachsan`.`Chuc_Vu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlkhachsan`.`Chuc_Vu` (
  `Ma_ChucVu` INT(11) NOT NULL,
  `Ten_ChucVu` VARCHAR(45) NULL,
  PRIMARY KEY (`Ma_ChucVu`))
ENGINE = InnoDB;
drop table Chuc_Vu;

INSERT INTO Chuc_vu(Ma_ChucVu,Ten_ChucVu)
Values  ('1','Bao Ve'),
		('2','Ke Toan'),
        ('3','Phuc Vu'),
        ('4','Quan Ly');

select *from Chuc_Vu;
-- -----------------------------------------------------
-- Table `qlkhachsan`.`Nhan_Vien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlkhachsan`.`Nhan_Vien` (
  `Ma_NV` VARCHAR(45) NOT NULL,
  `Ten_NV` VARCHAR(100) NOT NULL,
  `Ma_ChucVu` VARCHAR(45) NULL,
  `Ngay_Sinh` DATE NULL DEFAULT NULL,
  `Gioi_Tinh` VARCHAR(10) NULL DEFAULT NULL,
  `Dia_Chi` VARCHAR(45) NULL DEFAULT NULL,
  `SDT` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Ma_NV`),
  INDEX `fk_Nhan_Vien_Chuc_Vu1_idx` (`Ma_ChucVu` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

drop table Nhan_Vien;

INSERT INTO Nhan_Vien(Ma_NV,Ten_NV,Ma_ChucVu,Ngay_Sinh,Gioi_Tinh,Dia_Chi,SDT)
Values  ('NV01','Le Ba Hiep',4,'1998-1-10','Nam','Tam Ky','0123849246'),
		('NV02','Ho Van Thu',3,'1998-08-09','Nam','05-Thanh Son','0194628347'),
		('NV03','Ngo Dinh Trong',3,'1997-02-04','Nam','02-Thanh Son','0965583034'),
		('NV04','Ho Thi Khanh Ly ',2,'1989-10-15','Nu','05-Le Duan','0918364129'),
		('NV05','Le Thi My Linh',3,'1987-10-10','Nu','Hoi An','0124385458'),
		('NV06','Le Thi Ut',4,'1987-12-12','Nu','05-Le Duan','0234792734'),
		('NV07','Le Van Tuan',1,'1993-02-02','Nam','12-Thanh Son','0915488329'),
		('NV08','Tran Xuan Cuong',1,'1994-10-18','Nam','11-Phan Boi Chau','01653674789'),
		('NV09','Tran Minh Sang',3,'1991-08-27','Nam','05-Nguyen Chi Thanh','0964382943'),
		('NV10','Nguyen Cong Trang',2,'1997-09-18','Nam','05-Nguyen Chi Thanh','098765346');

select *from Nhan_Vien;
-- -----------------------------------------------------
-- Table `qlkhachsan`.`Dich_Vu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlkhachsan`.`Dich_Vu` (
  `Ma_DV` VARCHAR(45) NOT NULL,
  `Ten_DV` VARCHAR(45) NULL DEFAULT NULL,
  `Gia_DV` FLOAT NULL DEFAULT NULL,
  `Mo_Ta` VARCHAR (50) DEFAULT NULL,
  PRIMARY KEY (`Ma_DV`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
drop table Dich_Vu;


INSERT INTO Dich_Vu(Ma_DV,Ten_DV,Gia_DV,Mo_Ta)
Values ('DVAU','Dich vu an uong',300000,'An sang,trua,toi;Uong cafe,nuoc giai khat...'),
('DVGT','Dich vu giai tri',500000,' golf mini,tennis,bong chuyen...'),
('DVTG','Dich vu thu gian',200000,'spa, massage, gym, yoga...'),
('DVTKP','Dich vu thue khan phong',1000000,'To chuc su kien');

select *from Dich_Vu;

-- -----------------------------------------------------
-- Table `qlkhachsan`.`Thue_Phong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlkhachsan`.`Thue_Phong` (
  `Ma_ThuePhong` VARCHAR(45) NOT NULL,
  `Ma_Phong` VARCHAR(45) NULL,
  `Ma_KH` VARCHAR(45) NULL,
  `Ma_NV` VARCHAR(45) NULL,
  `Ngay_Den` DATE NULL,
  `Ngay_Tra` DATE NULL DEFAULT NULL,
  `Tien_dat` FLOAT NULL,
  PRIMARY KEY (`Ma_ThuePhong`),
  INDEX `fk_Thue_Phong_Khach_Hang1_idx` (`Ma_KH` ASC),
  INDEX `fk_Thue_Phong_Phong1_idx` (`Ma_Phong` ASC),
  INDEX `fk_Thue_Phong_Nhan_Vien1_idx` (`Ma_NV` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

drop table Thue_Phong;

INSERT INTO Thue_Phong(Ma_ThuePhong,Ma_Phong,Ma_KH,Ma_NV,Ngay_Den,Ngay_Tra,Tien_dat)
Values	('TP01','LX101','KH01','NV02','2016-09-18','2016-09-25',500000),
		('TP02','LX205','KH03','NV03','2016-10-10','2016-10-20',500000),
		('TP03','LX303','KH07','NV05','2016-08-12','2016-08-30',700000),
		('TP04','LX305','KH04','NV09','2016-10-13','2016-10-25',800000);

select *from  Thue_Phong;
-- -----------------------------------------------------
-- Table `qlkhachsan`.`SuDung_DichVu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlkhachsan`.`SuDung_DichVu` (
  `Ma_SuDung` VARCHAR(45) NOT NULL,
  `Ma_ThuePhong` VARCHAR(45) NULL,
  `Ma_DV` VARCHAR(45) NULL,
  `So_Lan` INT NULL,
  PRIMARY KEY (`Ma_SuDung`,`Ma_ThuePhong`),
  INDEX `fk_SuDung_DichVu_Dich_Vu1_idx` (`Ma_DV` ASC),
  INDEX `fk_SuDung_DichVu_Thue_Phong1_idx` (`Ma_ThuePhong` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO SuDung_DichVu(Ma_SuDung,Ma_ThuePhong,Ma_DV,So_Lan)
VALUES	('SD01','TP01','DVAU',3),
		('SD02','TP01','DVTG',2),
		('SD03','TP03','DVAU',5),
		('SD04','TP04','DVGT',3),
        ('SD05','TP04','DVTG',4);
		

select *from  SuDung_DichVu;
-- -----------------------------------------------------
-- Table `qlkhachsan`.`Dat_Phong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qlkhachsan`.`Dat_Phong` (
  `Ma_DatPhong` VARCHAR(45) NOT NULL,
  `Ma_Phong` VARCHAR(45) NULL,
  `Ngay_Den` DATE NULL,
  `Hinh_Thuc` VARCHAR(105) NULL,
  `Noi_Dung` VARCHAR(255) NULL,
  PRIMARY KEY (`Ma_DatPhong`),
  INDEX `fk_Dat_Phong_Phong1_idx` (`Ma_Phong` ASC))
ENGINE = InnoDB;

drop table Dat_Phong;

INSERT INTO Dat_Phong(Ma_DatPhong,Ma_Phong,Ngay_Den,Hinh_Thuc,Noi_Dung)
Values	('DP01','LX102','2016-11-11','Online','Phong thue hai nguoi o, giuong don'),
		('DP02','LX104','2016-12-3','Dien thoai','Phong huong ra bien, mot nguoi o'),
		('DP03','LX201','2016-10-30','Truc tiep','Phong mot nguoi o, khong dung dieu hoa'),
		('DP04','LX203','2016-12-11','Online','Phong thue mot nguoi o'),
		('DP05','LX302','2016-10-18','Dien thoai','Phong thue hai nguoi o');
        
Select * from Dat_Phong;
-- -----------------------------------------------------
/*tao procedure cho bang dich vu*/
use qlkhachsan;
DELIMITER $$;
CREATE PROCEDURE Check_dichvu(
	IN dichvu_code varchar(50),
    OUT dichvu_name varchar(100)
)
BEGIN  
	Select*from Dich_Vu
    WHERE Ma_DV = dichvu_code;
    
    CASE dichvu_code
		WHEN dichvu_code='DVAU' THEN
			SET dichvu_name = 'DICH VU AN UONG';
		WHEN dichvu_code='DVTG' THEN
			SET dichvu_name = 'DICH VU THU GIAN';
		WHEN dichvu_code='DVGT' THEN
			SET dichvu_name = 'DICH VU GIAI TRI';
		WHEN dichvu_code='DVTKP' THEN
			SET dichvu_name = 'DICH VU THUE KHAN PHONG';
		END CASE;
        SELECT dichvu_name;
END $$;
DELIMITER ;
Call Check_dichvu('DVTG', @dichvu_name);
        select @dichvu_name;
 DROP PROCEDURE Check_dichvu;
 
-- -----------------------------------------------------
 
 /*tao function cho bang Loai_Phong */
DELIMITER $$
	CREATE FUNCTION CheckLoginWithFunc(
	id VARCHAR(11)
)RETURNS VARCHAR(255)
	Deterministic

BEGIN
	DECLARE result VARCHAR(500);
	SELECT Mo_Ta INTO result
	FROM Loai_Phong WHERE Ma_LoaiPhong = id;
	RETURN(result);
    END $$
DELIMITER ;
DROP FUNCTION CheckLoginWithFunc;

SELECT CheckLoginWithFunc('VP') AS result;


/* Viết trigger ngăn chặn nhập vào số điện thoại không đúng */
DELIMITER $$
	CREATE TRIGGER before_update_khach_hang_SDT
    BEFORE UPDATE ON Khach_Hang
    FOR EACH ROW
    BEGIN
    IF(CHAR_LENGTH(NEW.SDT) < 10 OR CHAR_LENGTH(NEW.SDT) > 12)then 
    signal sqlstate '45000'
	set message_text='Ban nhap so dien thoai khong chinh xac!';
    end if;
    end $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_insert_khach_hang_SDT
BEFORE INSERT ON Khach_Hang
FOR EACH ROW
 BEGIN
  IF(CHAR_LENGTH(NEW.SDT) < 10 OR CHAR_LENGTH(NEW.SDT) > 12 )then 
 signal sqlstate '45000'
 set message_text='Ban nhap so dien thoai khong chinh xac!';
end if;
end $$
DELIMITER ;
drop TRIGGER before_update_khach_hang_SDT;
drop TRIGGER before_insert_khach_hang_SDT;

insert into Khach_Hang (Ma_KH, SDT)
values ('KH11', '0167481552');

insert into Khach_Hang (Ma_KH, SDT)
values ('KH15', '0167454353');

update Khach_Hang
set SDT= '0167481553'
where Ma_KH='KH02';
SELECT * FROM Khach_Hang;

/* dung con tro cap nhap luong cho nhan vien trong khach san */

DELIMITER $$
CREATE PROCEDURE Capnhatluong()
BEGIN
	DECLARE ma_cv int DEFAULT 0;
    DECLARE Luong float;
    DECLARE finished INT DEFAULT 0;
    DECLARE v_ma_nv VARCHAR(45);
    
	declare cur_luong Cursor for 
    SELECT ma_nv, Ma_ChucVu FROM Nhan_Vien;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND set finished =1 ;
    
	OPEN cur_luong;
    
    FETCH cur_luong INTO v_ma_nv,ma_cv;
    WHILE (finished !=1) DO
		BEGIN
			CASE ma_cv 
            WHEN 3 THEN
				UPDATE nhan_vien SET luong = 30000 WHERE ma_nv = v_ma_nv; 
            WHEN 2 THEN 
				UPDATE nhan_vien SET luong = 20000 WHERE ma_nv = v_ma_nv; 
            WHEN 4 THEN 
				UPDATE nhan_vien SET luong = 40000 WHERE ma_nv = v_ma_nv; 
            WHEN 1 THEN 
				UPDATE nhan_vien SET luong = 10000 WHERE ma_nv = v_ma_nv; 
            end case;
				 FETCH cur_luong INTO v_ma_nv,ma_cv;
		END;
	END WHILE;
    CLOSE cur_luong;

END $$ 
DELIMITER ;


call Capnhatluong();
drop procedure Capnhatluong;

ALTER TABLE nhan_vien ADD luong FLOAT;

Select * from Nhan_Vien;
