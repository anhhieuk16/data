USE [DoNoiThat]
GO
/****** Object:  StoredProcedure [dbo].[_GetIDHD]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[_GetIDHD]
 (
@MaHD int
 )
as
begin
SELECT* FROM Table_HoaDon WHERE Table_HoaDon.MaHD=@MaHD
end
GO
/****** Object:  StoredProcedure [dbo].[_GetIDNV]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[_GetIDNV]
(
@IDNhanVien int
)
AS
BEGIN
 SELECT*From Table_NhanVien 
      WHERE Table_NhanVien.IDNhanVien=@IDNhanVien
END
GO
/****** Object:  StoredProcedure [dbo].[_GetIDSP]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[_GetIDSP]
(
@MaSP int
)
AS
BEGIN
/*
SELECT MaSP,TenSP,SoLuong,GiaBan,GiaVon,MoTaSP,Table_DanhMucSP.DanhMucSP,Table_TinhTrangSP.TrinhTrangSP,Table_NhaCungCap.NhaCungCap,Table_SanPham.HinhAnh
FROM Table_SanPham,Table_DanhMucSP,Table_TinhTrangSP,Table_NhaCungCap
where Table_SanPham.IDDanhMuc=Table_DanhMucSP.MaDanhMuc and Table_SanPham.IDNhaCungCap=Table_NhaCungCap.IDNhaCungCap and Table_SanPham.IDTinhTrang=Table_TinhTrangSP.IDTinhTrangSP and Table_SanPham.MaSP=@MaSP
*/
SELECT*From Table_SanPham where MaSP=@MaSP
END
GO
/****** Object:  StoredProcedure [dbo].[_hienthiHD]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[_hienthiHD]
as
begin
select MaHD,SLsp,NoiNhan,Table_HinhThucTT.HinhThuc,Table_KkachHang.HoTen,Table_SanPham.TenSP,Table_Trangthai.TenTrangThai,Table_SanPham.GiaBan
from Table_HoaDon,Table_HinhThucTT,Table_KkachHang,Table_SanPham,Table_Trangthai where Table_HoaDon.IDHinhThucTT=Table_HinhThucTT.MaThanhtoan and Table_HoaDon.UseName=Table_KkachHang.UseName and Table_HoaDon.MaSP=Table_SanPham.MaSP and Table_HoaDon.TrangThai=Table_Trangthai.MaTrangThai

end
GO
/****** Object:  StoredProcedure [dbo].[_hienthiKhachHang]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[_hienthiKhachHang]
AS
begin
SELECT UseName,Pass,HoTen,Table_GioiTinh.GioiTinh,SDT,Table_DiaChi.NoiSinh,NgaySinh,SoCMND,Table_NoiCapCMND.TenNoiCap,Table_ChucVu.TenChucVu
From Table_KkachHang,Table_NoiCapCMND,Table_DiaChi,Table_GioiTinh ,Table_ChucVu
where Table_KkachHang.DiaChi=Table_DiaChi.MaNoiSinh and Table_KkachHang.NoiCap=Table_NoiCapCMND.MaNoiCapCMND and Table_KkachHang.GioiTinh=Table_GioiTinh.MaGioiTinh and Table_KkachHang.Chucvu=Table_ChucVu.MaChucVu
end
GO
/****** Object:  StoredProcedure [dbo].[_hienthiNhanVien]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[_hienthiNhanVien]
AS
begin
SELECT IDNhanVien
      ,Table_BangCap.TenBangCap
      ,Table_HonNhan.TinhTranghonNhan
      ,Table_ChucVu.TenChucVu
      ,HoTen
      ,HinhAnh
      ,SoCMND
      ,SDT
      ,Table_GioiTinh.GioiTinh
  FROM Table_NhanVien,Table_HonNhan,Table_ChucVu,Table_BangCap,Table_GioiTinh 
  where Table_NhanVien.BangCap=Table_BangCap.IDBangCap and Table_NhanVien.ChucVu=Table_ChucVu.MaChucVu and Table_NhanVien.TinhTrangHN=Table_HonNhan.IDHonNhan and Table_NhanVien.GioiTinh=Table_GioiTinh.MaGioiTinh

  end
GO
/****** Object:  StoredProcedure [dbo].[_hienthiSP]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[_hienthiSP]

AS
BEGIN

SELECT MaSP,TenSP,SoLuong,Table_TinhTrangSP.TrinhTrangSP,GiaBan,GiaVon,MoTaSP,Table_DanhMucSP.DanhMucSP,Table_NhaCungCap.NhaCungCap,Table_SanPham.HinhAnh,Table_SanPham.IDDanhMuc
FROM Table_SanPham,Table_DanhMucSP,Table_TinhTrangSP,Table_NhaCungCap
where Table_SanPham.IDDanhMuc=Table_DanhMucSP.MaDanhMuc and Table_SanPham.IDNhaCungCap=Table_NhaCungCap.IDNhaCungCap and Table_SanPham.IDTinhTrang=Table_TinhTrangSP.IDTinhTrangSP

END
GO
/****** Object:  StoredProcedure [dbo].[_layIDKhachHang]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[_layIDKhachHang]
(
@UseName nvarchar(50)
)
AS
begin
/*
SELECT UseName,Pass,HoTen,HinhAnh,Table_GioiTinh.GioiTinh,SDT,Table_DiaChi.NoiSinh,NgaySinh,SoCMND,NgayCap,Table_NoiCapCMND.TenNoiCap
From Table_KkachHang,Table_NoiCapCMND,Table_DiaChi,Table_GioiTinh 
where Table_KkachHang.DiaChi=Table_DiaChi.MaNoiSinh and Table_KkachHang.NoiCap=Table_NoiCapCMND.MaNoiCapCMND and Table_KkachHang.GioiTinh=Table_GioiTinh.MaGioiTinh
and UseName=@UseName
*/
SELECT * from Table_KkachHang where UseName=@UseName

end
GO
/****** Object:  StoredProcedure [dbo].[_SuaHD]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[_SuaHD]
 (
@MaHD int,
@MaSP int,
@IDHinhThucTT nvarchar(50),
@UseName nvarchar(50),
@TrangThai nvarchar(50),
@NoiNhan nvarchar(MAX),
@SLsp int
 )
as
begin
UPDATE Table_HoaDon SET MaSP=@MaSP ,IDHinhThucTT=@IDHinhThucTT,UseName=@UseName,TrangThai=@TrangThai,NoiNhan=@NoiNhan,SLsp=@SLsp
WHERE Table_HoaDon.MaHD=@MaHD
end
GO
/****** Object:  StoredProcedure [dbo].[_SuaKH]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[_SuaKH]
(
@UseName nvarchar(50),
@Pass nvarchar(50),

@HoTen nvarchar(50),
@GioiTinh nvarchar(50),
@SDT int,
@DiaChi nvarchar(50),
@NgaySinh date,
@SoCMND int,
@Chucvu nvarchar(50),

@NoiCap nvarchar(50)
)
AS
begin
UPDATE Table_KkachHang SET Pass=@Pass,HoTen=@HoTen,NgaySinh=@NgaySinh,GioiTinh=@GioiTinh,SDT=@SDT,DiaChi=@DiaChi,SoCMND=@SoCMND,NoiCap=@NoiCap,Chucvu=@Chucvu
 where UseName=@UseName

end
GO
/****** Object:  StoredProcedure [dbo].[_SuaNV]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[_SuaNV]
(
		@IDNhanVien int,
		@BangCap nvarchar(50),
      @TinhTrangHN nvarchar(50),
      @ChucVu nvarchar(50),
      @HoTen nvarchar(50),
      @HinhAnh nvarchar(MAX),
      @SoCMND int,
      @SDT int,
      @GioiTinh nvarchar(50)
	  )
AS
BEGIN
UPDATE Table_NhanVien SET BangCap=@BangCap ,TinhTrangHN=@TinhTrangHN ,ChucVu=@ChucVu,HoTen=@HoTen ,HinhAnh=@HinhAnh,SoCMND=@SoCMND ,SDT=@SDT ,GioiTinh=@GioiTinh
      WHERE Table_NhanVien.IDNhanVien=@IDNhanVien
END
GO
/****** Object:  StoredProcedure [dbo].[_SuaSP]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[_SuaSP]
(
@MaSP int,
@TenSP nvarchar(50),
@SoLuong int,
@IDTinhTrang nvarchar(50),
@IDDanhMuc nvarchar(50),
@IDNhaCungCap nvarchar(50),
@GiaBan int,
@GiaVon int,
@MoTaSP nvarchar(Max),
@HinhAnh nvarchar(Max)

)
AS
BEGIN

UPDATE Table_SanPham SET TenSP=@TenSP,SoLuong=@SoLuong,IDTinhTrang=@IDTinhTrang,IDDanhMuc=@IDNhaCungCap,IDNhaCungCap=@IDDanhMuc,GiaBan=@GiaBan,GiaVon=@GiaVon,MoTaSP=@MoTaSP,HinhAnh=@HinhAnh WHERE MaSP=@MaSP

END
GO
/****** Object:  StoredProcedure [dbo].[_ThemHD]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[_ThemHD]
 (

@MaSP int,
@IDHinhThucTT nvarchar(50),
@UseName nvarchar(50),
@TrangThai nvarchar(50),
@NoiNhan nvarchar(MAX),
@SLsp int

 )
as
begin
INSERT INTO  Table_HoaDon(MaSP,IDHinhThucTT,UseName,TrangThai,NoiNhan,SLsp)
VALUES (@MaSP,@IDHinhThucTT, @UseName,@TrangThai , @NoiNhan,@SLsp)
end
GO
/****** Object:  StoredProcedure [dbo].[_ThemKH]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[_ThemKH]
(
@UseName nvarchar(50),
@Pass nvarchar(50),

@HoTen nvarchar(50),
@GioiTinh nvarchar(50),
@SDT int,
@DiaChi nvarchar(50),
@NgaySinh date,
@SoCMND int,
@Chucvu nvarchar(50),
@NoiCap nvarchar(50)
)
AS
begin
INSERT INTO Table_KkachHang(UseName,Pass,HoTen,NgaySinh,GioiTinh,SDT,DiaChi,SoCMND,NoiCap,Chucvu)
VALUES(@UseName,@Pass,@HoTen,@NgaySinh,@GioiTinh,@SDT,@DiaChi,@SoCMND,@NoiCap,@Chucvu)

end
GO
/****** Object:  StoredProcedure [dbo].[_ThemNV]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[_ThemNV]
(
		
		@BangCap nvarchar(50),
      @TinhTrangHN nvarchar(50),
      @ChucVu nvarchar(50),
      @HoTen nvarchar(50),
      @HinhAnh nvarchar(MAX),
      @SoCMND int,
      @SDT int,
      @GioiTinh nvarchar(50)
	  )
AS
BEGIN
INSERT INTO  Table_NhanVien ( BangCap,TinhTrangHN,ChucVu,HoTen ,HinhAnh,SoCMND ,SDT ,GioiTinh)
      VALUES ( @BangCap,@TinhTrangHN ,@ChucVu ,@HoTen , @HinhAnh,@SoCMND,@SDT , @GioiTinh )
END
GO
/****** Object:  StoredProcedure [dbo].[_ThemSP]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[_ThemSP]
(

@TenSP nvarchar(50),
@SoLuong int,
@IDTinhTrang nvarchar(50),
@IDDanhMuc nvarchar(50),
@IDNhaCungCap nvarchar(50),
@GiaBan int,
@GiaVon int,
@MoTaSP nvarchar(Max),
@HinhAnh nvarchar(Max)

)
AS
BEGIN

INSERT INTO Table_SanPham (TenSP,SoLuong,IDTinhTrang,IDDanhMuc,IDNhaCungCap,GiaBan,GiaVon,MoTaSP,HinhAnh) 
VALUES(@TenSP,@SoLuong,@IDTinhTrang,@IDDanhMuc,@IDNhaCungCap,@GiaBan,@GiaVon,@MoTaSP,@HinhAnh)

END
GO
/****** Object:  StoredProcedure [dbo].[_XoaHD]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[_XoaHD]
 (
@MaHD int
 )
as
begin
DELETE FROM Table_HoaDon WHERE Table_HoaDon.MaHD=@MaHD
end
GO
/****** Object:  StoredProcedure [dbo].[_XoaKH]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[_XoaKH]
(
@UseName nvarchar(50)
)
AS
begin
DELETE FROM Table_KkachHang where Table_KkachHang.UseName=@UseName
end
GO
/****** Object:  StoredProcedure [dbo].[_XoaNV]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[_XoaNV]
(
@IDNhanVien int
)
AS
BEGIN
 DELETE FROM Table_NhanVien
      WHERE Table_NhanVien.IDNhanVien=@IDNhanVien
END
GO
/****** Object:  StoredProcedure [dbo].[_XoaSP]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[_XoaSP]
(
@MaSP int

)
AS
BEGIN

DELETE FROM Table_SanPham WHERE Table_SanPham.MaSP=@MaSP

END
GO
/****** Object:  Table [dbo].[Table_BangCap]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_BangCap](
	[IDBangCap] [nvarchar](50) NOT NULL,
	[TenBangCap] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_BangCap] PRIMARY KEY CLUSTERED 
(
	[IDBangCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_ChucVu]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_ChucVu](
	[MaChucVu] [nvarchar](50) NOT NULL,
	[TenChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_DanhMucSP]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_DanhMucSP](
	[MaDanhMuc] [nvarchar](50) NOT NULL,
	[DanhMucSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_DanhMucSP] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_DiaChi]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_DiaChi](
	[MaNoiSinh] [nvarchar](50) NOT NULL,
	[NoiSinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_NoiSinh] PRIMARY KEY CLUSTERED 
(
	[MaNoiSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_GioiTinh]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_GioiTinh](
	[MaGioiTinh] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_GioiTinh] PRIMARY KEY CLUSTERED 
(
	[MaGioiTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_HinhThucTT]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_HinhThucTT](
	[MaThanhtoan] [nvarchar](50) NOT NULL,
	[HinhThuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_HinhThucTT] PRIMARY KEY CLUSTERED 
(
	[MaThanhtoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_HoaDon]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[IDHinhThucTT] [nvarchar](50) NULL,
	[UseName] [nvarchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL,
	[NoiNhan] [nvarchar](max) NULL,
	[SLsp] [int] NULL,
 CONSTRAINT [PK_Table_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_HonNhan]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_HonNhan](
	[IDHonNhan] [nvarchar](50) NOT NULL,
	[TinhTranghonNhan] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_HonNhan] PRIMARY KEY CLUSTERED 
(
	[IDHonNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_KkachHang]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_KkachHang](
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[SDT] [int] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoCMND] [int] NULL,
	[NoiCap] [nvarchar](50) NULL,
	[UseName] [nvarchar](50) NOT NULL,
	[Pass] [nvarchar](50) NULL,
	[Chucvu] [nvarchar](50) NULL,
 CONSTRAINT [Table_Nguoi] PRIMARY KEY CLUSTERED 
(
	[UseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_NoiCapCMND]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_NoiCapCMND](
	[MaNoiCapCMND] [nvarchar](50) NOT NULL,
	[TenNoiCap] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_NoiCapCMND] PRIMARY KEY CLUSTERED 
(
	[MaNoiCapCMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_NhaCungCap]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_NhaCungCap](
	[IDNhaCungCap] [nvarchar](50) NOT NULL,
	[NhaCungCap] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Table_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[IDNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_NhanVien]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_NhanVien](
	[IDNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[BangCap] [nvarchar](50) NULL,
	[TinhTrangHN] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[SoCMND] [int] NULL,
	[SDT] [int] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](max) NULL,
 CONSTRAINT [PK_Table_NhanVien] PRIMARY KEY CLUSTERED 
(
	[IDNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_SanPham]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[SoLuong] [int] NULL,
	[IDTinhTrang] [nvarchar](50) NULL,
	[IDDanhMuc] [nvarchar](50) NULL,
	[IDNhaCungCap] [nvarchar](50) NULL,
	[GiaBan] [int] NULL,
	[GiaVon] [int] NULL,
	[MoTaSP] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[TenSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_TinhTrangSP]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_TinhTrangSP](
	[IDTinhTrangSP] [nvarchar](50) NOT NULL,
	[TrinhTrangSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_TinhTrangSP] PRIMARY KEY CLUSTERED 
(
	[IDTinhTrangSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_Trangthai]    Script Date: 2/13/2022 9:26:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Trangthai](
	[MaTrangThai] [nvarchar](50) NOT NULL,
	[TenTrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_Trangthai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Table_BangCap] ([IDBangCap], [TenBangCap]) VALUES (N'1', N'Đại học')
INSERT [dbo].[Table_BangCap] ([IDBangCap], [TenBangCap]) VALUES (N'2', N'Cao đẳng')
INSERT [dbo].[Table_BangCap] ([IDBangCap], [TenBangCap]) VALUES (N'3', N'Trung cấp')
INSERT [dbo].[Table_ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'1', N'Nhân viên')
INSERT [dbo].[Table_ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'2', N'Quản lý')
INSERT [dbo].[Table_ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'3', N'Khách hàng')
INSERT [dbo].[Table_DanhMucSP] ([MaDanhMuc], [DanhMucSP]) VALUES (N'1', N'Bàn học')
INSERT [dbo].[Table_DanhMucSP] ([MaDanhMuc], [DanhMucSP]) VALUES (N'2', N'Ghế')
INSERT [dbo].[Table_DanhMucSP] ([MaDanhMuc], [DanhMucSP]) VALUES (N'3', N'Giá đỡ')
INSERT [dbo].[Table_DanhMucSP] ([MaDanhMuc], [DanhMucSP]) VALUES (N'4', N'Bàn trang điểm')
INSERT [dbo].[Table_DanhMucSP] ([MaDanhMuc], [DanhMucSP]) VALUES (N'5', N'Giường ngủ')
INSERT [dbo].[Table_DanhMucSP] ([MaDanhMuc], [DanhMucSP]) VALUES (N'6', N'Tủ ')
INSERT [dbo].[Table_DanhMucSP] ([MaDanhMuc], [DanhMucSP]) VALUES (N'7', N'Bàn thông minh')
INSERT [dbo].[Table_DanhMucSP] ([MaDanhMuc], [DanhMucSP]) VALUES (N'8', N'Bàn ăn')
INSERT [dbo].[Table_DiaChi] ([MaNoiSinh], [NoiSinh]) VALUES (N'1', N'Bắc giang')
INSERT [dbo].[Table_DiaChi] ([MaNoiSinh], [NoiSinh]) VALUES (N'2', N'Hà Nội')
INSERT [dbo].[Table_DiaChi] ([MaNoiSinh], [NoiSinh]) VALUES (N'3', N'Bắc ninh')
INSERT [dbo].[Table_DiaChi] ([MaNoiSinh], [NoiSinh]) VALUES (N'4', N'Hải phòng')
INSERT [dbo].[Table_DiaChi] ([MaNoiSinh], [NoiSinh]) VALUES (N'5', N'Thái nguyên')
INSERT [dbo].[Table_GioiTinh] ([MaGioiTinh], [GioiTinh]) VALUES (N'1', N'Nữ')
INSERT [dbo].[Table_GioiTinh] ([MaGioiTinh], [GioiTinh]) VALUES (N'2', N'Nam')
INSERT [dbo].[Table_HinhThucTT] ([MaThanhtoan], [HinhThuc]) VALUES (N'1', N'Trực tiếp')
SET IDENTITY_INSERT [dbo].[Table_HoaDon] ON 

INSERT [dbo].[Table_HoaDon] ([MaHD], [MaSP], [IDHinhThucTT], [UseName], [TrangThai], [NoiNhan], [SLsp]) VALUES (1010, 10, N'1', N'anh', N'3', N'Tù hựu- Bn-BG-Hà nội21', 0)
INSERT [dbo].[Table_HoaDon] ([MaHD], [MaSP], [IDHinhThucTT], [UseName], [TrangThai], [NoiNhan], [SLsp]) VALUES (2009, 10, N'2', N'anh', N'1', N'Tù hựu- Bn-BG-Hà nội', 1)
INSERT [dbo].[Table_HoaDon] ([MaHD], [MaSP], [IDHinhThucTT], [UseName], [TrangThai], [NoiNhan], [SLsp]) VALUES (2011, 13, N'1', N'Admin', N'2', N'Trù hựu- Bn-BG-Hà nội', 0)
INSERT [dbo].[Table_HoaDon] ([MaHD], [MaSP], [IDHinhThucTT], [UseName], [TrangThai], [NoiNhan], [SLsp]) VALUES (2012, 13, N'1', N'Admin', N'3', N'Hà nội', 0)
INSERT [dbo].[Table_HoaDon] ([MaHD], [MaSP], [IDHinhThucTT], [UseName], [TrangThai], [NoiNhan], [SLsp]) VALUES (2013, 10, N'1', N'Admin', N'2', N'Hà nội22', 0)
INSERT [dbo].[Table_HoaDon] ([MaHD], [MaSP], [IDHinhThucTT], [UseName], [TrangThai], [NoiNhan], [SLsp]) VALUES (2014, 15, N'1', N'Admin', N'1', N'Bn-BG-Hà nội', 1)
SET IDENTITY_INSERT [dbo].[Table_HoaDon] OFF
INSERT [dbo].[Table_HonNhan] ([IDHonNhan], [TinhTranghonNhan]) VALUES (N'1', N'Đã kết hôn')
INSERT [dbo].[Table_HonNhan] ([IDHonNhan], [TinhTranghonNhan]) VALUES (N'2', N'Đã ly hôn')
INSERT [dbo].[Table_HonNhan] ([IDHonNhan], [TinhTranghonNhan]) VALUES (N'3', N'Đang độc thân')
INSERT [dbo].[Table_KkachHang] ([HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [SoCMND], [NoiCap], [UseName], [Pass], [Chucvu]) VALUES (N'phạm anh hiếu', CAST(N'2021-08-14' AS Date), N'2', 4564564, N'1', 4045645, N'2', N'Admin', N'123456', N'2')
INSERT [dbo].[Table_KkachHang] ([HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [SoCMND], [NoiCap], [UseName], [Pass], [Chucvu]) VALUES (N'phạm anh hiếu', CAST(N'2021-10-09' AS Date), N'2', 1231, N'2', 2131, N'2', N'anh', N'123456', N'1')
INSERT [dbo].[Table_KkachHang] ([HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [SoCMND], [NoiCap], [UseName], [Pass], [Chucvu]) VALUES (N'anhhiei', CAST(N'2021-12-25' AS Date), N'1', 857290966, N'2', 123213, N'2', N'anh123', N'123456', N'1')
INSERT [dbo].[Table_KkachHang] ([HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [SoCMND], [NoiCap], [UseName], [Pass], [Chucvu]) VALUES (N'hieu', CAST(N'2021-12-15' AS Date), N'2', 857290966, N'4', 122357972, N'2', N'anhgiaia', N'123456', N'3')
INSERT [dbo].[Table_KkachHang] ([HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [SoCMND], [NoiCap], [UseName], [Pass], [Chucvu]) VALUES (N'phạm anh hiếu', CAST(N'2021-08-17' AS Date), N'2', 857290966, N'1', 1254859, N'1', N'anhhieu9', N'123456', N'3')
INSERT [dbo].[Table_KkachHang] ([HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [SoCMND], [NoiCap], [UseName], [Pass], [Chucvu]) VALUES (N'anh hiếu', CAST(N'2021-09-20' AS Date), N'2', 123452, N'2', 45242452, N'2', N'anhhieu9911', N'123456', N'3')
INSERT [dbo].[Table_KkachHang] ([HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [SoCMND], [NoiCap], [UseName], [Pass], [Chucvu]) VALUES (N'1213131213', CAST(N'2021-12-01' AS Date), N'2', 857290966, N'1', 122357972, N'2', N'anhhieudaica', N'123456', N'3')
INSERT [dbo].[Table_KkachHang] ([HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [SoCMND], [NoiCap], [UseName], [Pass], [Chucvu]) VALUES (N'kkk', CAST(N'2021-08-28' AS Date), N'2', 1231, N'1', 14867, N'1', N'hieu19991', N'123456', N'3')
INSERT [dbo].[Table_KkachHang] ([HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [SoCMND], [NoiCap], [UseName], [Pass], [Chucvu]) VALUES (N'hiếu', CAST(N'1999-02-18' AS Date), N'2', 857290966, N'1', 122357972, N'2', N'hieuk51', N'123456', N'3')
INSERT [dbo].[Table_KkachHang] ([HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [SoCMND], [NoiCap], [UseName], [Pass], [Chucvu]) VALUES (N'anh hieu', CAST(N'1999-12-02' AS Date), N'2', 857290966, N'1', 122357972, N'2', N'hieuk52', N'123456', N'3')
INSERT [dbo].[Table_NoiCapCMND] ([MaNoiCapCMND], [TenNoiCap]) VALUES (N'1', N'Hà nội')
INSERT [dbo].[Table_NoiCapCMND] ([MaNoiCapCMND], [TenNoiCap]) VALUES (N'2', N'Bắc giang')
INSERT [dbo].[Table_NoiCapCMND] ([MaNoiCapCMND], [TenNoiCap]) VALUES (N'3', N'Thái nguyên')
INSERT [dbo].[Table_NoiCapCMND] ([MaNoiCapCMND], [TenNoiCap]) VALUES (N'4', N' Băc ninh')
INSERT [dbo].[Table_NoiCapCMND] ([MaNoiCapCMND], [TenNoiCap]) VALUES (N'5', N'Hải phòng')
INSERT [dbo].[Table_NhaCungCap] ([IDNhaCungCap], [NhaCungCap]) VALUES (N'1', N'VNPT')
INSERT [dbo].[Table_NhaCungCap] ([IDNhaCungCap], [NhaCungCap]) VALUES (N'2', N'Anh Hiếu')
INSERT [dbo].[Table_NhaCungCap] ([IDNhaCungCap], [NhaCungCap]) VALUES (N'3', N'HOME DECOR - NHÀ SÀNH')
INSERT [dbo].[Table_NhaCungCap] ([IDNhaCungCap], [NhaCungCap]) VALUES (N'4', N'MAKE MYHOMES')
SET IDENTITY_INSERT [dbo].[Table_NhanVien] ON 

INSERT [dbo].[Table_NhanVien] ([IDNhanVien], [BangCap], [TinhTrangHN], [ChucVu], [HoTen], [SoCMND], [SDT], [GioiTinh], [HinhAnh]) VALUES (14, N'2', N'2', N'2', N'anh hiếu1', 6595, 11212223, N'2', N'/uploadedImages/avta1.jpg')
INSERT [dbo].[Table_NhanVien] ([IDNhanVien], [BangCap], [TinhTrangHN], [ChucVu], [HoTen], [SoCMND], [SDT], [GioiTinh], [HinhAnh]) VALUES (15, N'1', N'2', N'2', N'nha', 2649, 9999, N'1', N'/uploadedImages/avatga2.jpg')
INSERT [dbo].[Table_NhanVien] ([IDNhanVien], [BangCap], [TinhTrangHN], [ChucVu], [HoTen], [SoCMND], [SDT], [GioiTinh], [HinhAnh]) VALUES (16, N'2', N'3', N'2', N'phạm anh hiếu99', 132132, 9564165, N'2', N'/uploadedImages/avta1.jpg')
INSERT [dbo].[Table_NhanVien] ([IDNhanVien], [BangCap], [TinhTrangHN], [ChucVu], [HoTen], [SoCMND], [SDT], [GioiTinh], [HinhAnh]) VALUES (18, N'2', N'3', N'1', N'nguyên công minh', 23156135, 213135454, N'1', N'/uploadedImages/avata2.jpg')
SET IDENTITY_INSERT [dbo].[Table_NhanVien] OFF
SET IDENTITY_INSERT [dbo].[Table_SanPham] ON 

INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (9, 100, N'1', N'1', N'5', 8900000, 6230000, N'Màu sắc: Xám

Chất liệu: Gỗ thông đỏ, vải polyester

Kích thước : Size 1m6*2m: D214 x R172 x C115 cm', N'/img-sanpham/lullaby_876c0899045e4b78a614498af2cc5021_master.jpg', N'Giường 1m6')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (10, 1000, N'2', N'5', N'2', 380000, 200000, N'Chất liệu: Gỗ Công Nghiệp MDF/MFC Cao Cấp.
Tình trạng: Hàng mới 100%', N'/img-sanpham/giuong-ngu-khach-san-dep-gia-re-2.jpg', N'Giường ngủ khách sạn')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (11, 1000, N'2', N'5', N'2', 6500000, 5000000, N'Chất liệu: Gỗ Công Nghiệp MDF/MFC Cao Cấp.
Tình trạng: Hàng mới 100%', N'/img-sanpham/giuong-ngu-kieu-nhat-mau-trang-hien-dai-dep-gia-re.jpg', N'Giường Ngủ Kiểu Nhật Màu Trắng')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (12, 100, N'1', N'2', N'5', 5000000, 300000, N'Chất liệu: Gỗ Công Nghiệp MDF/MFC Cao Cấp.
Tình trạng: Hàng mới 100%', N'/img-sanpham/giuong-ngu-hien-dai-mau-kem-soc-xam-dep-gia-re.jpg', N'Giường Ngủ Hiện Đại Màu Kem Sọc Xám Đẹp')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (13, 1000, N'2', N'4', N'2', 6800000, 5800000, N'Luôn được coi là một món quà đặc biệt dành riêng cho một nửa của thế giới, Bộ bàn gương trang điểm hiện đại cao cấp 1971 mang đến một sự lựa chọn hoàn mỹ cả về kiểu dáng và chất lượng. Xứng đáng trở thành một "người bạn" đồng hành trong việc làm đẹp mỗi ngày của hội chi em, giúp mang lại sự tự tin trong mỗi bước chân xuống phố. Vậy còn chần chừ gì nữa mà không cùng chúng tôi khám phá về mẫu gương trang điểm hiện đại đang siêu HOT trên thị trường cả nước này.', N'/img-sanpham/bantrangdiem1.jpg', N'Bàn phấn nhập khẩu cao cấp 1971')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (14, 100, N'2', N'6', N'2', 30580000, 20580000, N'So với những mẫu nội thất phòng ngủ được sản xuất trong nước thì nội thất phòng ngủ nhập khẩu luôn được người tiêu dùng nước ta đánh giá cao hơn rất nhiều dựa trên các tiêu chí về kiểu dáng cũng như chất lượng. Vậy nên, ngay từ những ngày đầu tiên được tung ra thị trường mẫu Tủ quần áo tám cánh Tân cổ điển H-1728#YG đã hoàn toàn tạo nên một "cơn sốt" với sự thu hút đông đảo của khách hàng trên cả nước. Vậy tại sao mẫu sản phẩm này lại hot đến vậy? Hãy cùng chúng tôi tìm hiểu ngay lúc này nhé.

Thiết kế Tủ quần áo tám cánh Tân cổ điển H-1728#YG lần này không chỉ được áp dụng công nghệ sản xuất mới nhất, tiên tiến nhất của thương hiệu Jovani mà còn được gia công hoàn toàn từ gỗ cao cấp đã được xử lý chống cong vênh, co ngót, mốt mọi. Vì thế mà vô cùng thích hợp sử dụng trong điều kiện thời tiết ở Việt Nam giúp quý khách hoàn toàn có thể yên tâm với một chất lượng sử dụng lâu dài và bền bỉ. Hơn thế công năng sử dụng của mẫu sản phẩm này còn được đánh giá rất cao với thiết kế tủ năm cánh, không gian lưu trữ đồ đạc rộng rãi.', N'/img-sanpham/tu1.jpg', N'TỦ QUẦN ÁO TÁM CÁNH TÂN CỔ ĐIỂN NHẬP KHẨU H-1728')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (15, 500, N'2', N'2', N'2', 30360000, 20360000, N'Sản phẩm độc đáo sofa da công nghệ 2122 đã thu hút sự quan tâm và chú ý của rất nhiều quý khách hàng hiện đại. Đây là một sự kết hợp mang lại nhiều ưu điểm, lợi ích và sự tiện lời cho con người trong quá trình sử dụng vậy nên nó nhận được rất nhiều sự yêu thích từ phía người tiêu dùng hiện đại.

Nếu bạn đang có nhu cầu mua sắm bộ ghế sofa phòng khách gia đình hay muốn đổi mẫu mới thì bạn không nên bỏ qua mẫu sản phẩm tuyệt vời này.

Chất liệu: da pha nỉ, có được cả ưu điểm của sofa da mang lại sự sang trọng và ưu điểm của sofa nỉ bền đẹp, ấm áp, giúp phòng khách của bạn tuyệt vời hơn bao giờ hết.

Kích thước :Văng 2880, ghế đơn 1130, đôn 800*820.

Phù hợp với phòng khách từ 25-30m2, gia đình trẻ, có thiết kế nội thất theo phong cách hiện đại.

Hãy đến TOKA để được cảm nhận và trải nghiệm thực tế nhé!', N'/img-sanpham/ghe1.jpg', N'SOFA DA CÔNG NGHỆ 2122')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (16, 100, N'2', N'1', N'2', 8500000, 6500000, N'Phòng giám đốc có ý nghĩa rất quan trọng, không những thể hiện đẳng cấp, quyền uy kinh nghiệm, phong cách của giám đốc mà còn là bộ mặt công ty, sự uy tín của doanh nghiệp đó trong mắt đối tác và khách hàng. 

Khi thiết kế nội thất phòng giám đốc, cần phải đảm bảo các yếu tố về thẩm mỹ cũng như tối ưu một cách tối đa nhất công năng và mục đích sử dụng của các thiết bị nội thất phòng để mang lại đẳng cấp, sự sang trọng, nét riêng biệt, một không gian thể hiện quyền lực cho giám đốc, bên cạnh đó cũng phải mang lại một không gian làm việc thoải mái, thư giãn, dễ chịu, giảm bớt căng thẳng mệt mỏi cho giám đốc trong suốt quá trình làm việc.', N'/img-sanpham/ban-giam-doc-a-nham.jpg', N'Bàn giám đốc gỗ An Cường')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (18, 123, N'1', N'3', N'6', 20000, 20000, N'0000', N'/img-sanpham/tu1.jpg', N'Giường ngủ khách sạn')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (1017, 100, N'2', N'5', N'3', 13515000, 13000000, N'Giường hộc kéo Iris 1m6 với thiết kế đóng nút đầu giường, điểm đặc biệt là bốn ngăn chứa đồ rộng thuận tiện cất những vật dụng trong phòng ngủ như gối, mền, drap hết sức gọn gàng. Chắc chắn sẽ là sự lựa chọn tối ưu cho không gian phòng ngủ hiện đại. Giường hộc kéo Iris có 2 kích thước 1m6 và 1m8, đa dạng màu sắc.', N'/img-sanpham/giuong_iris_1m6_stone.jpg', N'Giường hộc kéo Iris 1m8 Stone')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (1018, 1000, N'2', N'5', N'4', 34500000, 34000000, N'Giường ngủ gỗ Maxine 1m8 với đường nét thiết kế đến điểm nhấn đều hài hòa và đều rất giá trị. Sản phẩm sử dụng khung gỗ hoàn thiện mdf veneer và kim loại đồng làm chân và điểm nhấn. Giường Maxine giúp cho không gian phòng ngủ trở nên độc đáo, đậm chất thư giãn và sang trọng. Giường Maxine có 2 kích thước 1m6 và 1m8.', N'/img-sanpham/phong-ngu-maxine-.jpg', N'Giường ngủ gỗ Maxine 1m8')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (1019, 0, N'1', N'3', N'6', 21165000, 21000000, N'Mẫu tủ áo hiện đại của Nhà Xinh với thiết kế giản đơn, tối đa tiện ích bằng nhiều ngăn kéo và khoảng trống để cất trữ quần áo và đồ đạc.', N'/img-sanpham/tu-ao-hien-dai-5-500.jpg', N'Tủ áo hiện đại')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (1020, 500, N'1', N'3', N'6', 10965000, 10900000, N'Là sự kết hợp của màu trắng tinh khôi với màu gỗ ấm áp trên nền những đường nét thiết kế hiện đại, trang nhã. Harmony được đánh giá rất cao cả về kiểu dáng và công năng, đó sẽ là niềm tự hào của gia chủ khi khách đến thăm nhà.', N'/img-sanpham/tu-ao-harmony-4-3-600x400.jpg', N'Tủ áo Harmony')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (1021, 1000, N'2', N'7', N'3', 48110000, 48000000, N'Được nhập khẩu từ Ý, bàn nước Dakota với thiết kế bề mặt đơn giản nhưng sắc nét đến từng chi tiết, kết hợp cùng chân kim loại dáng mảnh tạo sự thanh thoát sẽ thích hợp với nhiều kiểu không gian phòng khách.', N'/img-sanpham/77778-1000x666-1-600x400.jpg', N'Bàn nước mở rộng Dakota')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (1022, 200, N'2', N'8', N'3', 22270000, 22000000, N'Bàn nước Bridge được thiết kế độc đáo với chất liệu hoàn toàn là gỗ sồi đặc. Kết cấu vững chắc và được kết nối thành một khối hình trọn vẹn, khéo léo mà không cần đến phụ kiện nào. Từng đường nét được xử lý tinh xảo kết hợp với màu sắc tự nhiên của gỗ sồi mang đến vẻ đẹp mộc mạc, gần gũi cho không gian phòng khách. Bridge – Tình yêu thiên nhiên và sức quyến rũ của gỗ. Bộ sưu tập Bridge mang hơi thở Scandinavian là sự kết hợp hoàn hảo của nhà thiết kế nổi tiếng Đan Mạch Hans Sandgren Jakobsen cùng công nghệ sản xuất thủ công của Nhật Bản. Mang thiết kế vượt thời gian, sử dụng chất liệu gỗ sồi và da bò tự nhiên, Bridge mang đến cảm giác sang trọng, gần gũi và thoải mái cho gia chủ. Điểm nổi bật của Bridge là sự tinh xảo trong hoàn thiện, từng chi tiết, những đường cong, bề mặt gỗ sồi được thực hiện và chọn lựa vô cùng kỹ càng, để tạo ra một Bridge hoàn hảo, chạm đến tâm hồn đầy cảm xúc và yêu quý những giá trị lâu bền của gia chủ Việt.', N'/img-sanpham/ban_nuoc_bridge-500.jpg', N'Bàn nước Bridge Gỗ màu Tự nhiên')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (1023, 1000, N'1', N'5', N'3', 4800000, 3000000, N'Hoàn thiện từ gỗ sồi Nga nhập khẩu giúp cho mẫu giường ngủ gỗ tự nhiên tuyệt vời này có được độ bền chắc tốt. Với việc tiết kiệm tối đa các chi tiết thừa và chi phí trong sản xuất giúp hạ giá thành sản phẩm đi rất nhiều. Nhờ đó khách hàng chỉ cần đầu tư một khoản chi phí rất nhỏ để nhận về một món đồ nội thất có chất lượng tuyệt vời cho phòng ngủ của mình. Vậy liệu bạn có nên chọn mua mẫu giường ngủ giá rẻ này hay không? Hãy cùng phân tích và đánh giá lợi hại nhé.', N'/img-sanpham/giuong-ngu-go-soi-nga-tu-nhien-dep-gia-re-5.jpg', N'Giường Ngủ Gỗ Sồi Nga')
INSERT [dbo].[Table_SanPham] ([MaSP], [SoLuong], [IDTinhTrang], [IDDanhMuc], [IDNhaCungCap], [GiaBan], [GiaVon], [MoTaSP], [HinhAnh], [TenSP]) VALUES (1024, 100, N'1', N'5', N'4', 4000000, 3000000, N'mẫu giường gỗ tự nhiên có giá trị sử dụng lên tới >20 năm. Bạn sẽ chỉ cần bỏ ra số tiền cực thấp để nhận lại giá trị lâu dài cho cuộc sống của mình.
Kích thước của giường gồm 2 loại có sẵn để bạn chọn mua ngay là 160 x 200cm, 180 x 200cm. Đây là 2 kích thước thông dụng nhất trên thị trường hiện nay, phù hợp với 90% diện tích phòng ngủ của tất cả mọi người.', N'/img-sanpham/giuong-ngu-hien-dai-mau-kem-soc-xam-dep-gia-re.jpg', N'Tủ áo hiện đại')
SET IDENTITY_INSERT [dbo].[Table_SanPham] OFF
INSERT [dbo].[Table_TinhTrangSP] ([IDTinhTrangSP], [TrinhTrangSP]) VALUES (N'1', N'Hết hàng')
INSERT [dbo].[Table_TinhTrangSP] ([IDTinhTrangSP], [TrinhTrangSP]) VALUES (N'2', N'Còn hàng')
INSERT [dbo].[Table_Trangthai] ([MaTrangThai], [TenTrangThai]) VALUES (N'1', N'Đang chờ xử lý')
INSERT [dbo].[Table_Trangthai] ([MaTrangThai], [TenTrangThai]) VALUES (N'2', N'Đang giao hàng')
INSERT [dbo].[Table_Trangthai] ([MaTrangThai], [TenTrangThai]) VALUES (N'3', N'Đã xử lý ')
