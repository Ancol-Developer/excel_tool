create database Quan_Ly_Sinh_Vien
go
use Quan_Ly_Sinh_Vien
go
create table Khoa
(
	Ma_Khoa varchar(10) primary key,
	Ten_Khoa nvarchar(100), -- them n de viet duoc unicode
	Nam_Thanh_Lap int
)
go 
create table KhoaHoc
(
	Ma_Khoa_Hoc varchar(10) primary key,
	Nam_Bat_Dau int,
	Nam_Ket_Thuc int
)
create table ChuongTrinhHoc
(
	Ma_Chuong_Trinh varchar(10) primary key,
	Ten_Chuong_Trinh nVarchar(100)
)
create table Lop
(
	Ma_Lop varchar(10) primary key,
	Ma_Khoa varchar(10) not null,
	Ma_Khoa_Hoc varchar(10) not null,
	Ma_Chuong_Trinh varchar(10) not null,
	STT int
	Foreign Key (Ma_Khoa) references Khoa(Ma_Khoa),
	Foreign Key(Ma_Khoa_Hoc) References KhoaHoc(Ma_Khoa_Hoc),
	Foreign Key(Ma_Chuong_Trinh) References ChuongTrinhHoc(Ma_Chuong_Trinh),
)
go
create table SinhVien
(
	Ma_SV varchar(10) primary key,
	Ho_Ten nvarchar(100),
	Nam_Sinh int,
	Dan_Toc nvarchar(20),
	Ma_Lop varchar(10) not null
	Foreign key (Ma_Lop) references Lop(Ma_Lop),
)
go 
create table MonHoc
(
	Ma_MH varchar(10) primary key,
	Ten_Mon_Hoc nvarchar(100),
	Ma_Khoa varchar(10) not null
	foreign key (Ma_Khoa) references Khoa(Ma_Khoa)
)
go
create table KetQua
(
	Ma_SV varchar(10) not null,
	Ma_MH varchar(10) not null,
	Lan_Thi int not null,
	Diem_Thi float,
	primary key (Ma_SV,Ma_MH,Lan_Thi),
	foreign key (Ma_SV) references SinhVien(Ma_SV),
	foreign key (Ma_MH) references MonHoc(Ma_MH)
)
go
create table GiangKhoa
(
	Ma_Chuong_Trinh varchar(10) not null,
	Ma_Khoa varchar(10) not null,
	Ma_MH varchar(10) not null,
	Nam_Hoc int not null,
	Hoc_Ky int, 
	So_Tiet_LT int,
	So_Tiet_TH int,
	So_Tin_Chi int
	primary key (Ma_Chuong_Trinh,Ma_Khoa,Ma_MH,Nam_Hoc),
	foreign key (Ma_Chuong_Trinh) references ChuongTrinhHoc(Ma_Chuong_Trinh),
	foreign key (Ma_Khoa) references Khoa(Ma_Khoa),
	foreign key (Ma_MH) references MonHoc(Ma_MH)
)
go
use Quan_Ly_Sinh_Vien
go
-- nhap lieu cho bang Khóa hoc
Insert into KhoaHoc(Ma_Khoa_Hoc,Nam_Bat_Dau,Nam_Ket_Thuc) values ('K2002',2002,2006)
go
Insert into KhoaHoc values ('K2003',2003,2007) -- dung thu tu
go
Insert into KhoaHoc values ('K2004',2004,2008) -- dung thu tu
go
-- Nhập liệu cho bảng chương trình học
insert into ChuongTrinhHoc values ('CQ',N'Chính Quy ')
go
-- nhap lieu cho bang lop

insert into Lop values ('TH2002/01', 'CNTT','K2002', 'CQ', 1) 
insert into Lop values ('TH2002/02', 'CNTT','K2002', 'CQ', 2)
insert into Lop values ('TH2003/01', 'VL','K2003', 'CQ', 1)
go
-- Nhập liệu cho sinh viên
Insert into SinhVien values('0212001', N'Nguyễn Vĩnh An', 1984, N'Kinh', 'TH2002/01')
go
Insert into SinhVien values('0212002', N'Nguyễn Thanh Bình', 1985, N'Kinh', 'TH2002/01')
go
Insert into SinhVien values('0212003', N'Nguyễn Thanh Cường', 1984, N'Kinh', 'TH2002/02')
go
Insert into SinhVien values('0212004', N'Nguyễn Quốc Duy', 1983, N'Kinh', 'TH2002/02')
go
Insert into SinhVien values('0311001', N'Phan Tuấn Anh', 1985, N'Kinh', 'TH2003/01')
go
Insert into SinhVien values('0311002', N'Huỳnh Thanh Sang', 1984, N'Kinh', 'TH2003/01')
go
-- Nhập liệu cho bảng Môn học
Insert into MonHoc values('THT01', N'Toán cao cấp A1', 'CNTT')
go
Insert into MonHoc values('VLT01', N'Toán cao cấp A1', 'VL')
go
Insert into MonHoc values('THT02', N'Toán rời rạc', 'CNTT')
go
Insert into MonHoc values('THCS01', N'Cấu trúc dữ liệu 1', 'CNTT')
go
Insert into MonHoc values('THCS02', N'Hệ điều hành', 'CNTT')
go
-- Nhập liệu cho bảng Kết quả
Insert into KetQua values('0212001', 'THT01', 1,4)
go
Insert into KetQua values('0212001', 'THT01', 2,7)
go
Insert into KetQua values('0212002', 'THT01', 1,8)
go
Insert into KetQua values('0212003', 'THT01', 1,6)
go
Insert into KetQua values('0212004', 'THT01', 1,9)
go
Insert into KetQua values('0212001', 'THT02', 1,8)
go
Insert into KetQua values('0212002', 'THT02', 1,5.5)
go
Insert into KetQua values('0212003', 'THT02', 1,4)
go
Insert into KetQua values('0212003', 'THT02', 2,6)
go
Insert into KetQua values('0212001', 'THCS01', 1,6.5)
go
Insert into KetQua values('0212002', 'THCS01', 1,4)
go
Insert into KetQua values('0212003', 'THCS01', 1,7)
go
-- Nhập liệu cho bảng Giảng Khoa
Insert into GiangKhoa values('CQ', 'CNTT', 'THT01',2003, 1, 60, 30, 5)
go
Insert into GiangKhoa values('CQ', 'CNTT', 'THT02',2003, 2, 45, 30, 4)
go
Insert into GiangKhoa values('CQ', 'CNTT', 'THCS01',2004, 1, 45, 30, 4)
go
-- truy van du lieu
--Câu 1:Danh sách các sinh viên khoa “Công nghệ Thông tin” khoá 2002-2006
select SinhVien.* from SinhVien
left join Lop on SinhVien.Ma_Lop=Lop.Ma_Lop
left join KhoaHoc on Lop.Ma_Khoa_Hoc=KhoaHoc.Ma_Khoa_Hoc
left join Khoa on Lop.Ma_Khoa=Khoa.Ma_Khoa
where Khoa.Ma_Khoa='CNTT'
AND KhoaHoc.Nam_Bat_Dau=2002
and KhoaHoc.Nam_Ket_Thuc=2006
--Câu 2:Cho biết các thông tin (MSSV, họ tên ,năm sinh) của các sinh viên học sớm hơn tuổi quy định (theo tuổi quy định thi sinh viên đủ 18 tuổi khi bắt đầu khóa học)
select SinhVien.Ma_SV,SinhVien.Ho_Ten,SinhVien.Nam_Sinh from  SinhVien
left join Lop on SinhVien.Ma_Lop=Lop.Ma_Lop
left join KhoaHoc on Lop.Ma_Khoa_Hoc=KhoaHoc.Ma_Khoa_Hoc
where KhoaHoc.Nam_Bat_Dau-SinhVien.Nam_Sinh<18
--Câu 3:Cho biết sinh viên khoa CNTT, khoá 2002-2006 chưa học môn cấu trúc dữ liệu 1
select * from SinhVien
left join Lop on SinhVien.Ma_Lop=Lop.Ma_Lop
left join Khoa on Khoa.Ma_Khoa=Lop.Ma_Khoa
left join KhoaHoc on KhoaHoc.Ma_Khoa_Hoc=Lop.Ma_Khoa_Hoc
left join MonHoc on MonHoc.Ma_Khoa=Khoa.Ma_Khoa
where KhoaHoc.Nam_Bat_Dau=2002
and KhoaHoc.Nam_Ket_Thuc=2006
and MonHoc.Ten_Mon_Hoc != N'Cấu trúc dữ liệu 1'
and Khoa.Ma_Khoa='CNTT'
-- THeo cach truy van long
select SinhVien.* from SinhVien
left join Lop on SinhVien.Ma_Lop=Lop.Ma_Lop
left join Khoa on Khoa.Ma_Khoa=Lop.Ma_Khoa
left join KhoaHoc on KhoaHoc.Ma_Khoa_Hoc=Lop.Ma_Khoa_Hoc
left join MonHoc on MonHoc.Ma_Khoa=Khoa.Ma_Khoa
where Khoa.Ma_Khoa='CNTT'
and SinhVien.Ma_SV not in
(select SinhVien.Ma_SV from SinhVien
left join Lop on SinhVien.Ma_Lop=Lop.Ma_Lop
left join Khoa on Khoa.Ma_Khoa=Lop.Ma_Khoa
left join KhoaHoc on KhoaHoc.Ma_Khoa_Hoc=Lop.Ma_Khoa_Hoc
left join MonHoc on MonHoc.Ma_Khoa=Khoa.Ma_Khoa
where KhoaHoc.Nam_Bat_Dau=2002
and KhoaHoc.Nam_Ket_Thuc=2006
and Khoa.Ma_Khoa='CNTT'
and MonHoc.Ten_Mon_Hoc = N'Cấu trúc dữ liệu 1')

--Câu 4:Cho biết sinh viên thi không đậu (Diem <5) môn cấu trúc dữ liệu 1 nhưng chưa thi lại. 
select *from SinhVien
left join KetQua on SinhVien.Ma_SV=KetQua.Ma_SV
left join MonHoc on KetQua.Ma_MH=MonHoc.Ma_MH
where MonHoc.Ten_Mon_Hoc like N'Cấu trúc dữ liệu 1'
and KetQua.Lan_Thi=1
and KetQua.Diem_Thi<5
and Sinhvien.Ma_SV not in
(select SinhVien.Ma_SV from SinhVien      
left join KetQua on SinhVien.Ma_SV=KetQua.Ma_SV
left join MonHoc on KetQua.Ma_MH=MonHoc.Ma_MH
where MonHoc.Ten_Mon_Hoc like N'Cấu trúc dữ liệu 1'
and KetQua.Lan_Thi>1)
--Câu 5:Với mỗi lớp thuộc khoa CNTT, cho biết mã lớp, mã khóa học, tên chương trình và số sinh viên thuộc lớp đó 
select Lop.Ma_Lop,Lop.Ma_Khoa_Hoc,ChuongTrinhHoc.Ten_Chuong_Trinh,COUNT(SinhVien.Ma_SV)as [Số Sinh Viên] from Lop
left join ChuongTrinhHoc on Lop.Ma_Chuong_Trinh=ChuongTrinhHoc.Ma_Chuong_Trinh
left join SinhVien on SinhVien.Ma_Lop=Lop.Ma_Lop
left join Khoa on Khoa.Ma_Khoa=Lop.Ma_Khoa 
where Khoa.Ma_Khoa='CNTT'
group by Lop.Ma_Lop,Lop.Ma_Khoa_Hoc,ChuongTrinhHoc.Ten_Chuong_Trinh

--Câu 6: Cho biết điểm trung bình của sinh viên có mã số 0212003 (điểm trusng bình chỉ tính trên lần thi sau cùng của sinh viên) 
select avg(KetQua.Diem_Thi) as [Điểm trung bình] from KetQua
left join
(select Ma_MH,max(Lan_Thi) as [Last time] from KetQua
Where KetQua.Ma_SV='0212003'
group by Ma_MH) table2
on KetQua.Ma_MH=table2.Ma_MH 
where Ma_SV='0212003'
and KetQua.Lan_Thi=table2.[Last time]
go
                                              -- Function trong dự án quản lý sinh viên


-- Câu 1: Với 1 mã sinh viên và 1 mã khoa, kiểm tra xem sinh viên có thuộc khoa này không (trả về đúng hoặc sai)
create function UF_Check_SV_IN_KHOA
(
	@maSV varchar(10),
	@maKhoa varchar(10)
	
)
returns varchar(5)
as begin
declare @Ketqua varchar(5)
set @Ketqua ='Flase'
if (exists (select * from SinhVien
			left join Lop on SinhVien.Ma_Lop=Lop.Ma_Lop
			left join Khoa on Khoa.Ma_Khoa=Lop.Ma_Khoa
			where SinhVien.Ma_SV=@maSV
			and Khoa.Ma_Khoa=@maKhoa
			)
	)
	set @Ketqua='True'
else
	set @Ketqua='Flase'
return @Ketqua
end
go
select dbo.UF_Check_SV_IN_KHOA('0212003','CNTT')
go
--Câu 2:Tính điểm thi sau cùng của một sinh viên trong một môn học cụ thể
create function UF_LAST_SCORE_OF_STUDENT
(
	@maSV varchar(10),
	@maMH varchar(10)
)
returns float
as 
begin
	declare @Diem float;
	set @Diem=0;
	select top 1 @Diem= KetQua.Diem_Thi from KetQua
	where @maSV=KetQua.Ma_SV
	and @maMH=KetQua.Ma_MH
	order by KetQua.Lan_thi desc
	return @diem;
end 
go
select dbo.UF_LAST_SCORE_OF_STUDENT('0212001','THT01')
go
--Câu 3:Tính điểm trung bình của một sinh viên (chú ý : điểm trung bình được tính dựa trên lần thi sau cùng), sử dụng function 2 đã viết
create function UF_TINH_DIEM_TB_MON_TU_LAM
(
	@MaSV varchar(10)
)
returns float
as 
begin
	declare @DiemTB float;
	set @DiemTB=0;
	select @DiemTB =avg(KetQua.Diem_Thi) from KetQua
	left join ( select KetQua.Ma_MH,max(Lan_Thi) as [Last_Time] from KetQua
				where KetQua.Ma_SV=@MaSV
				group by KetQua.Ma_MH) table2 on KetQua.Ma_MH=table2.Ma_MH
	where KetQua.Lan_Thi=table2.Last_Time
	and KetQua.Ma_SV=@MaSV
	return @DiemTB;
end 
go
create function UF_TINH_DIEM_TB_MON_HKT
(
	@MaSV varchar(10)
)
returns float
as 
begin 
	declare @Ketqua float 
	set @Ketqua=0;
	select @Ketqua= avg(dbo.UF_LAST_SCORE_OF_STUDENT(@MaSV,KetQua.Ma_MH)) from KetQua
	where KetQua.Ma_SV=@MaSV
	return @Ketqua
end 
go

select dbo.UF_TINH_DIEM_TB_MON_TU_LAM('0212001')
select dbo.UF_TINH_DIEM_TB_MON_HKT('0212001')
-- Câu 4: Nhập vào 1 sinh viên và 1 môn học, trả về các điểm thi của sinh viên này trong các lần thi của môn học đó.
create function UF_DIEM_THI_TRONG_1_LAN_THI
(
	@maSV varchar(10),
	@maMH varchar(10)
)
returns table
return 	select KetQua.Lan_Thi,KetQua.Diem_Thi from KetQua 
	where KetQua.Ma_SV=@maSV
	and KetQua.Ma_MH=@maMH	
go
select * from dbo.UF_DIEM_THI_TRONG_1_LAN_THI('0212002','THCS01')
-- Câu 5: Nhập vào 1 sinh viên, trả về danh sách các môn học mà sinh viên này phải học
create function UF_MON_HOC_SINH_VIEN_CAN_HOC
(
	@maSV varchar(10)
)
returns table
return select MonHoc.* from MonHoc
left join Khoa on MonHoc.Ma_Khoa=Khoa.Ma_Khoa 
left join Lop on Lop.Ma_Khoa=Khoa.Ma_Khoa
left join SinhVien on SinhVien.Ma_Lop=Lop.Ma_Lop
where  SinhVien.Ma_SV=@maSV
go
select * from dbo.UF_MON_HOC_SINH_VIEN_CAN_HOC('0212002')
go

                                   --Stored Proceduced
-- Câu 1:  In danh sách các sinh viên của 1 lớp học
-- Phải có mã lớp 
-- Tìm tất cả các sinh viên dựa theo mã lớp
create proc UF_Proceduced_LIST_SV_FROM_LOP
	@malop varchar(10)
as
begin
--declare @malop varchar(10)
--set @malop='TH2002/01'
select SinhVien.* from SinhVien
left join Lop on SinhVien.Ma_Lop=@malop
end
go
exec UF_Proceduced_LIST_SV_FROM_LOP 'TH2002/01'
--Câu 2: Nhập vào 2 sinh viên, 1 môn học, tìm xem sinh viên nào có điểm thi môn học đó lần đầu tiên là cao hơn.
create function UF_MAX_DIEM_FRIST_TIME
(
	@maSV varchar(10),
	@maMH varchar(10)
)
returns float
as
begin
	declare @ketqua float
	set @ketqua=0;
	select @ketqua=KetQua.Diem_Thi from KetQua
	where KetQua.Ma_SV=@maSV
	and KetQua.Ma_MH=@maMH
	and KetQua.Lan_Thi =1
	return @ketqua
end 
go
--select dbo.UF_MAX_DIEM_FRIST_TIME('0212001','THT01')
create proc UF_MAX_DIEM_SV_FRIST
	@masv1 varchar(10),
	@masv2 varchar(10),
	@maMH varchar(10)
as
begin
	declare @ketqua1 float
	declare @ketqua2 float
	select @ketqua1= dbo.UF_MAX_DIEM_FRIST_TIME(@masv1,@maMH)
	select @ketqua2=dbo.UF_MAX_DIEM_FRIST_TIME(@masv2,@maMH)
	if(@ketqua1>@ketqua2)
		print @masv1
	else
		print @masv2
end 
go
exec dbo.UF_MAX_DIEM_SV_FRIST '0212001','0212002','THT01'
select dbo.UF_MAX_DIEM_FRIST_TIME('0212001','THT01')
select dbo.UF_MAX_DIEM_FRIST_TIME('0212002','THT01')
go
--Câu 3: Nhập vào 1 môn học và 1 mã sv, kiểm tra xem sinh viên có đậu môn này trong lần thi đầu tiên không?
-- nếu đậu thì xuất ra là “Đậu”, không thì xuất ra “Không đậu”
create proc UF_TEST_DAU_OR_KHONGDAU
	@maSV varchar(10),
	@maMH varchar(10)
as
begin
--set @maSV='0212001'
--set @maMH='THT01'
if (exists (select * from KetQua
where KetQua.Ma_SV=@maSV
and KetQua.Ma_MH=@maMH
and KetQua.Lan_Thi=1
and KetQua.Diem_Thi>5))
	print N'Đậu'
else
	print N'Không Đậu'
end
go
exec dbo.UF_TEST_DAU_OR_KHONGDAU '0212002','THT01'
go
--Câu 4: Nhập vào 1 khoa, in danh sách các sinh viên (mã sinh viên, họ tên, ngày sinh) thuộc khoa này.
declare @maSV varchar(10)
declare @maKhoa varchar(10)
set @maSV='0212002'
set @maKhoa='CNTT'
create proc UF_LIST_SINH_VIEN_THUOC_MOT_KHOA
	@maKhoa varchar(10)
as
begin
	select SinhVien.* from SinhVien
	left join Lop on Lop.Ma_Lop=SinhVien.Ma_Lop
	left join Khoa on Lop.Ma_Khoa=Khoa.Ma_Khoa
	where Khoa.Ma_Khoa=@maKhoa
end
go
exec dbo.UF_LIST_SINH_VIEN_THUOC_MOT_KHOA 'CNTT'
-- Câu 5:Nhập vào 1 sinh viên và 1 môn học, in điểm thi của sinh viên này của các lần thi môn học đó.
-- Ví dụ:  Lần 1 : 10 Lần 2: 8
create proc UF_PRINT_SCORE_CAC_LAN_THI
	@maSV varchar(10),
	@maMH varchar(10)
as
begin
--declare @maSV varchar(10)
--declare @maMH varchar(10)
--set @maSV='0212001'
--set @maMH='THT01'
select KetQua.Lan_Thi,KetQua.Diem_Thi from KetQua
--left join SinhVien on KetQua.Ma_SV=SinhVien.Ma_SV
--left join MonHoc on MonHoc.Ma_MH=KetQua.Ma_MH
where KetQua.Ma_MH=@maMH
and KetQua.Ma_SV=@maSV
end
go
exec dbo.UF_PRINT_SCORE_CAC_LAN_THI '0212001','THT01'
go
-- Câu 6: Nhập vào 1 sinh viên, in ra các môn học mà sinh viên này phải học.
select * from dbo.UF_MON_HOC_SINH_VIEN_CAN_HOC('0212001')
create proc KP_list_MH
	@maSV varchar(10)
as
begin
	select * from dbo.UF_MON_HOC_SINH_VIEN_CAN_HOC(@maSV)
end
go
--Câu 7:Nhập vào 1 môn học, in danh sách các sinh viên đậu môn này trong lần thi đầu tiên. 
create function KF_Check_Dau
(
	@maMH varchar(10),
	@maSV varchar(10)
)
returns nvarchar(20)
as
begin
	declare @diem float
	select @diem = KetQua.Diem_Thi from KetQua
	where KetQua.Ma_SV=@maSV
	and KetQua.Ma_MH=@maMH
	and KetQua.Lan_Thi=1
	if(@diem<5)
		return N'Không đậu' 
	else 
		return N'Đậu'
return N'Không đậu'
end
go

create proc KP_Cau_7
	@maMH varchar(10)
as
begin
	select KetQua.Ma_MH,KetQua.Ma_SV, dbo.KF_Check_Dau(Ma_MH,Ma_SV) as [Kết Quả] from KetQua
	where KetQua.Ma_MH=@maMH
	and KetQua.Lan_Thi=1
	group by KetQua.Ma_MH,KetQua.Ma_SV
end
go
exec dbo.KP_Cau_7 'THT02'
go
-- Câu 9:

														-- Ràng buộc trong CSDL Quản lý sinh viên
