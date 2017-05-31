create table ChiNhanh (
	maCN varchar2(50) NOT NULL,
	tenCN varchar2(50),
	truongChiNhanh varchar2(50) ,
	CONSTRAINT chinhanh_pk PRIMARY KEY (maCN)
);

create table NhanVien (
	maNV varchar2(50) NOT NULL,
	hoTen varchar2(50) ,
	diaChi varchar2(50) ,
	dienThoai varchar2(50) ,
	email varchar2(50) ,
	maPhong varchar2(50) ,
	chiNhanh varchar2(50),
	luong varchar2(128),
	hashkey varchar2(128),
	kyLuong varchar2(512),
	CONSTRAINT nhanvien_pk PRIMARY KEY (maNV)
);

create table  PhanCong (
	maNV varchar2(50) NOT NULL,
	duAN varchar2(50),
	vaiTro varchar2(50),
	phuCap number(10),
	CONSTRAINT phancong_pk PRIMARY KEY (maNV, duAN)
);

create table ChiTieu (
	maChiTieu varchar2(50) NOT NULL,
	tenChiTieu varchar2(50),
	soTien varchar2(512),
	duAN varchar2(50),
	hashedPrivKey varchar2(512),
	CONSTRAINT chitieu_pk PRIMARY KEY (maChiTieu)
);

create table PhongBan (
	maPhong varchar2(50) NOT NULL,
	tenPhong varchar2(50),
	truongPhong varchar2(50),
	ngayNhanChuc DATE,
	soNhanVien number(5),
	chiNhanh varchar2(50),
	CONSTRAINT phongban_pk PRIMARY KEY (maPhong)
);

create table DuAn(
	maDA varchar2(50) NOT NULL ,
	tenDA varchar2(50),
	kinhPhi number(10),
	phongChuTri varchar2(50),
	truongDA varchar2(50),
	CONSTRAINT duan_pk PRIMARY KEY (maDA)
);

----Add CONSTRAINT
ALTER TABLE ChiNhanh ADD CONSTRAINT fk_chinhanh_nhanvien FOREIGN KEY (truongChiNhanh) REFERENCES NhanVien (maNV);
ALTER TABLE NhanVien ADD CONSTRAINT fk_nhanvien_phongban FOREIGN KEY (maPhong) REFERENCES PhongBan(maPhong);
ALTER TABLE NhanVien ADD CONSTRAINT fk_nhanvien_chinhanh FOREIGN KEY (chiNhanh) REFERENCES ChiNhanh(maCN);
ALTER TABLE PhanCong ADD CONSTRAINT fk_phancong_nhanvien FOREIGN KEY (maNV) REFERENCES NhanVien(maNV);
ALTER TABLE PhanCong ADD CONSTRAINT fk_phancong_duan FOREIGN KEY (duAN) REFERENCES DuAn(maDA);
ALTER TABLE ChiTieu ADD CONSTRAINT fk_chitieu_duan FOREIGN KEY (duAN) REFERENCES DuAn(maDA);
ALTER TABLE PhongBan ADD CONSTRAINT fk_phongban_chinhanh FOREIGN KEY (chiNhanh) REFERENCES ChiNhanh(maCN);
ALTER TABLE DuAn ADD CONSTRAINT fk_duan_phongban FOREIGN KEY (phongChuTri) REFERENCES PhongBan(maPhong);
ALTER TABLE DuAn ADD CONSTRAINT fk_duan_nhanvien FOREIGN KEY (truongDA) REFERENCES NhanVien(maNV);

----Insert data
insert into ChiNhanh (maCN, tenCN, truongChiNhanh) values('CN001', 'Chi nhanh 1', NULL);
insert into ChiNhanh (maCN, tenCN, truongChiNhanh) values('CN002', 'Chi nhanh 2', NULL);
insert into ChiNhanh (maCN, tenCN, truongChiNhanh) values('CN003', 'Chi nhanh 3', NULL);
insert into ChiNhanh (maCN, tenCN, truongChiNhanh) values('CN004', 'Chi nhanh 4', NULL);
insert into ChiNhanh (maCN, tenCN, truongChiNhanh) values('CN005', 'Chi nhanh 5', NULL);

insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV001', 'Nguyen Van A', 'Da Nang', '01234567890', 'nguyenvana@gmai.com', NULL,'NV001', 10000);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV002', 'Nguyen Van B', 'Binh Dinh','01234567891','nguyenvanb@gmai.com', NULL, 'NV001', 12345);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV003', 'Nguyen Van C', 'Hue', '01234567892','nguyenvanc@gmai.com', NULL, 'NV001', 3245);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV004', 'Nguyen Van D', 'Dong Thap', '01234567893','nguyenvand@gmai.com', NULL, 'NV001', 34567);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV005', 'Nguyen Van E', 'Lang Son', '01234567894','nguyenvane@gmai.com', NULL, 'CN002', 34356);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV006', 'Nguyen Van F', 'Binh Phuoc', '01234567895','nguyenvanf@gmai.com', NULL, 'CN002', 34567);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV007', 'Nguyen Van G', 'Dak Nong', '01234567896','nguyenvang@gmai.com', NULL, 'CN002', 5653);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV008', 'Nguyen Van H', 'Binh Thuan', '01234567897','nguyenvanh@gmai.com', NULL, 'CN002', 8764);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV009', 'Nguyen Van I', 'Phan Thiet', '01234567898','nguyenvani@gmai.com', NULL, 'CN003', 3456);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV010', 'Nguyen Van K', 'Dak Lak', '01234567899','nguyenvank@gmai.com',NULL, 'CN003', 6543);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV011', 'Nguyen Van L', 'Lam Dong', '01234567900','nguyenvanl@gmail.com',NULL, 'CN003', 3435);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV012', 'Nguyen Van M', 'Ninh Thuan', '01234567901','nguyenvanm@gmail.com',NULL, 'CN003', 34567);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV013', 'Nguyen Van N', 'Binh Thuan', '01234567902','nguyenvann@gmail.com',NULL, 'CN004', 3456);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV014', 'Nguyen Van O', 'Quang Ngai', '01234567903','nguyenvano@gmail.com',NULL, 'CN004', 3456);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV015', 'Nguyen Van Q', 'Ho Chi Minh '01234567904,'nguyenvanq@gmail.com',NULL, 'CN004', 34567);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV016', 'Nguyen Van P', 'Ho Chi Minh', '01234567905','nguyenvanp@gmail.com',NULL, 'CN004', 45632);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV017', 'Nguyen Van X', 'Binh Duong', '01234567906','nguyenvanx@gmail.com',NULL, 'CN005', 1456);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV018', 'Nguyen Van Y', 'Binh Phuoc', '01234567907','nguyenvany@gmail.com',NULL, 'CN005', 4563);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV019', 'Nguyen Van S', 'Vinh Long', '01234567908','nguyenvans@gmail.com',NULL, 'CN005', 34567);
insert into NhanVien (maNV ,hoTen ,diaChi ,dienThoai ,email ,maPhong, chiNhanh ,luong) values('NV020', 'Nguyen Van Z', 'Can Tho', '01234567909','nguyenvanz@gmail.com',NULL, 'CN005', 2345);

insert into PhongBan (maPhong , tenPhong ,truongPhong ,ngayNhanChuc, soNhanVien,chiNhanh) values('PB001', 'Phong Ban 1', 'NV001', 11/11/2017, 10, 'CN001');
insert into PhongBan (maPhong , tenPhong ,truongPhong ,ngayNhanChuc, soNhanVien,chiNhanh) values('PB002', 'Phong Ban 2', 'NV002', 12/12/2016, 8, 'CN002');
insert into PhongBan (maPhong , tenPhong ,truongPhong ,ngayNhanChuc, soNhanVien,chiNhanh) values('PB003', 'Phong Ban 3', 'NV003',  08/08/2017, 5, 'CN003');
insert into PhongBan (maPhong , tenPhong ,truongPhong ,ngayNhanChuc, soNhanVien,chiNhanh) values('PB004', 'Phong Ban 4', 'NV004', 09/05/2017, 10, 'CN003');
insert into PhongBan (maPhong , tenPhong ,truongPhong ,ngayNhanChuc, soNhanVien,chiNhanh) values('PB005', 'Phong Ban 5', 'NV005', 07/06/2016, 5, 'CN004');
insert into PhongBan (maPhong , tenPhong ,truongPhong ,ngayNhanChuc, soNhanVien,chiNhanh) values('PB006', 'Phong Ban 6', 'NV006', 12/05/2017, 6, 'CN005');

update NhanVien set maPhong = 'PB001' where maNV = 'NV001' or maNV = 'NV002' or maNV='NV003' or maNV='NV004' or maNV='NV005';
update NhanVien set maPhong = 'PB002' where maNV = 'NV006' or maNV = 'NV007' or maNV='NV008' or maNV='NV009';
update NhanVien set maPhong = 'PB003' where maNV = 'NV010' or maNV = 'NV011' or maNV = 'NV012' or maNV='NV013';
update NhanVien set maPhong = 'PB004' where maNV = 'NV014' or maNV = 'NV015' or maNV='NV016';
update NhanVien set maPhong = 'PB005' where maNV = 'NV017' or maNV = 'NV018';
update NhanVien set maPhong = 'PB006' where maNV = 'NV019' or maNV = 'NV020';

insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA001', 'Ten du an 1', 10000, 'PB001', 'NV001');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA002', 'Ten du an 2', 13422, 'PB002', 'NV002');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA003', 'Ten du an 3', 23212, 'PB003', 'NV003');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA004', 'Ten du an 4', 2313, 'PB00', 'NV005');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA005', 'Ten du an 5', 2132, 'PB005', 'NV005');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA006', 'Ten du an 6', 9721, 'PB005', 'NV007');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA007', 'Ten du an 7', 25000, 'PB001', 'NV009');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA008', 'Ten du an 8', 300000, 'PB002', 'NV013');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA009', 'Ten du an 9', 436544, 'PB003', 'NV014');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA010', 'Ten du an 10', 43434, 'PB004', 'NV001');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA011', 'Ten du an 11', 32434, 'PB001', 'NV001');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA012', 'Ten du an 12', 34342, 'PB002', 'NV001');
insert into DuAn (maDA,tenDA ,kinhphi ,phongChuTri,truongDA ) values('DA013', 'Ten du an 13', 9001, 'PB003', 'NV017');

insert into ChiTieu (maChiTieu ,tenChiTieu ,soTien ,duAN) values('CT001', 'Ten chi tieu', 1010, 'DA001');
insert into ChiTieu (maChiTieu ,tenChiTieu ,soTien ,duAN) values('CT002', 'Ten chi tieu', 900, 'DA002');
insert into ChiTieu (maChiTieu ,tenChiTieu ,soTien ,duAN) values('CT003', 'Ten chi tieu', 1294, 'DA003');
insert into ChiTieu (maChiTieu ,tenChiTieu ,soTien ,duAN) values('CT004', 'Ten chi tieu', 1234, 'DA004');
insert into ChiTieu (maChiTieu ,tenChiTieu ,soTien ,duAN) values('CT005', 'Ten chi tieu', 1230, 'DA005');

insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV001', 'DA001', 'Ten vai tro', 2132);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV002', 'DA001', 'Ten vai tro', 3242);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV003', 'DA001', 'Ten vai tro', 5324);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV004', 'DA001', 'Ten vai tro', 6775);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV005', 'DA002', 'Ten vai tro', 8732);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV006', 'DA002', 'Ten vai tro', 1234);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV007', 'DA003', 'Ten vai tro', 4542);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV008', 'DA003', 'Ten vai tro', 213);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV009', 'DA004', 'Ten vai tro', 322);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV001', 'DA004', 'Ten vai tro', 352);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV002', 'DA005', 'Ten vai tro',2313);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV003', 'DA005', 'Ten vai tro', 3543);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV004', 'DA005', 'Ten vai tro', 1743);
insert into PhanCong (maNV , duAN, vaiTro ,phuCap) values('NV005', 'DA005', 'Ten vai tro', 2347);

update ChiNhanh set truongChiNhanh = 'NV001' where maCN = 'CN001';
update ChiNhanh set truongChiNhanh = 'NV005' where maCN = 'CN002';
update ChiNhanh set truongChiNhanh = 'NV009' where maCN = 'CN003';
update ChiNhanh set truongChiNhanh = 'NV013' where maCN = 'CN004';
update ChiNhanh set truongChiNhanh = 'NV017' where maCN = 'CN005';