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