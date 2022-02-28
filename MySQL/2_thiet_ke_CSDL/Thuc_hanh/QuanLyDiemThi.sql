create database QuanLyDiemThi;
use QuanLyDiemThi;
create table HocSinh(
MaHS varchar(50) not null primary key,
TenHS varchar(50) not null,
NgaySinh date,
Lop varchar(50),
GT varchar(20)
);
create table MonHoc(
MaMH varchar(50) not null primary key,
TenMH varchar(50) not null
);
create table BangDiem(
MaHS varchar(50),
MaMH varchar(50),
TenMH varchar(50),
DiemThi int,
NgayKT date,
primary key(MaHS, TenMH),
foreign key(MaHS) references HocSinh(MaHS),
foreign key(MaMH) references MonHoc(MaMH)
);
create table GiaoVien(
MaGV varchar(50) not null primary key,
TenGV varchar(50),
SDT varchar(20)
);
alter table MonHoc add MaGV varchar(20);
alter table MonHoc add constraint FK_MaGV foreign key(MaGV) references GiaoVien(MaGV);
