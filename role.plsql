create role truongchinhanh;
create role truongphong;
create role truongduan;
create role nhanvien;
create role giamdoc;

-- nhanvien
GRANT SELECT on HR.CHINHANH to NHANVIEN;
GRANT SELECT on HR.PHONGBAN to NHANVIEN;
GRANT SELECT,update on HR.NHANVIEN to NHANVIEN;
GRANT SELECT ON HR.DUAN TO NHANVIEN;
GRANT SELECT ON HR.PHANCONG TO NHANVIEN;

-- truongphong
GRANT INSERT,UPDATE ON HR.PHANCONG TO TRUONGPHONG;
GRANT SELECT ON HR.CHITIEU TO TRUONGPHONG;

-- truong du an
GRANT SELECT, INSERT, UPDATE ON HR.CHITIEU TO TRUONGDUAN;

-- truong chi nhanh
GRANT SELECT, INSERT, UPDATE ON HR.CHITIEU TO truongchinhanh;
GRANT INSERT,UPDATE ON HR.PHANCONG TO truongchinhanh;

-- grant quyen nay
GRANT create session TO "NV001", "NV002", "NV003", "NV004", "NV005", "NV006", "NV007", "NV008", "NV009", "NV010", "NV011","NV012", "NV013", "NV014", "NV015", "NV016", "NV017" ,"NV018", "NV019", "NV020";
GRANT NHANVIEN TO "NV003", "NV004", "NV007", "NV008", "NV010", "NV011", "NV012", "NV015", "NV016", "NV019", "NV020";
GRANT TRUONGDUAN TO "NV001", "NV005", "NV009", "NV013", "NV017";
GRANT TRUONGPHONG TO "NV001" , "NV005", "NV009", "NV013", "NV017";
GRANT truongchinhanh TO "NV002", "NV006", "NV010", "NV014", "NV018";

create view DUAN_CN as
select maDA, tenDA, kinhPhi, tenPhong, tenCN, hoTen, sum(soTien) as Tongchi
from DuAn a, PhongBan b, ChiNhanh c, NhanVien d, ChiTieu e
where a.phongChuTri = b.maPhong
and b.chiNhanh = c.maCN
and a.truongDA = d.maNV
and a.maDA = e.duAn
group by maDA, tenDA, kinhPhi, tenPhong, tenCN, hoTen

grant select on DUAN_CN to GIAMDOC;
grant GIAMDOC on "NV001";