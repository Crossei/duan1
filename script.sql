create database QLLT
go
use QLLT
go
CREATE TABLE [dbo].[dangnhap](
	[username] [nvarchar](50) NOT NULL,
	[passwords] [nvarchar](200) NULL,
	[chucvu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[hanglaptop]    Script Date: 11/17/2019 5:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hanglaptop](
	[mahang] [nvarchar](10) NOT NULL,
	[tenhang] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[mahang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[hoadon]    Script Date: 11/17/2019 5:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[mahd]int identity NOT NULL PRIMARY KEY ,
	[makh] [nvarchar](10) NOT NULL,
	[manv] [nvarchar](50) NOT NULL,
	[trangthai] [nvarchar](50) NULL,
)

GO

/****** Object:  Table [dbo].[hoadonchitiet]    Script Date: 11/17/2019 5:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadonchitiet](
	[mahdct] int identity NOT NULL PRIMARY KEY ,
	[mahd] int  NOT NULL,
	[malaptop] [nvarchar](10) NOT NULL,
	[soluong] [int] NULL,
)


GO

/****** Object:  Table [dbo].[khachhang]    Script Date: 11/17/2019 5:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[makh] [nvarchar](10) NOT NULL,
	[tenkh] [nvarchar](50) NULL,
	[dienthoai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[laptop]    Script Date: 11/17/2019 5:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[laptop](
	[malaptop] [nvarchar](10) NOT NULL,
	[tenlaptop] [nvarchar](50) NULL,
	[manhacungcap] [nvarchar](10) NOT NULL,
	[mahang] [nvarchar](10) NOT NULL,
	[soluong] [int] NULL,
	[ngaynhap] [date] NULL,
	[giatien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[malaptop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[nhacungcap]    Script Date: 11/17/2019 5:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhacungcap](
	[manhacungcap] [nvarchar](10) NOT NULL,
	[tennhacungcap] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
	[dienthoai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[manhacungcap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[nhanvien]    Script Date: 11/17/2019 5:55:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[manv] [nvarchar](50) NOT NULL,
	[tennv] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[sodienthoai] [int] NULL,
	[luong] [int] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[dangnhap]  WITH CHECK ADD  CONSTRAINT [FK_dangnhap_nhanvien] FOREIGN KEY([username])
REFERENCES [dbo].[nhanvien] ([manv])
GO
ALTER TABLE [dbo].[dangnhap] CHECK CONSTRAINT [FK_dangnhap_nhanvien]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_khachhang] FOREIGN KEY([makh])
REFERENCES [dbo].[khachhang] ([makh])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_khachhang]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_nhanvien] FOREIGN KEY([manv])
REFERENCES [dbo].[nhanvien] ([manv])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_nhanvien]
GO
ALTER TABLE [dbo].[hoadonchitiet]  WITH CHECK ADD  CONSTRAINT [FK_hoadonchitiet_hoadon] FOREIGN KEY([mahd])
REFERENCES [dbo].[hoadon] ([mahd])
GO
ALTER TABLE [dbo].[hoadonchitiet] CHECK CONSTRAINT [FK_hoadonchitiet_hoadon]
GO
ALTER TABLE [dbo].[hoadonchitiet]  WITH CHECK ADD  CONSTRAINT [FK_hoadonchitiet_laptop] FOREIGN KEY([malaptop])
REFERENCES [dbo].[laptop] ([malaptop])
GO
ALTER TABLE [dbo].[hoadonchitiet] CHECK CONSTRAINT [FK_hoadonchitiet_laptop]
GO
ALTER TABLE [dbo].[laptop]  WITH CHECK ADD  CONSTRAINT [FK_laptop_hanglaptop] FOREIGN KEY([mahang])
REFERENCES [dbo].[hanglaptop] ([mahang])
GO
ALTER TABLE [dbo].[laptop] CHECK CONSTRAINT [FK_laptop_hanglaptop]
GO
ALTER TABLE [dbo].[laptop]  WITH CHECK ADD  CONSTRAINT [FK_laptop_nhacungcap] FOREIGN KEY([manhacungcap])
REFERENCES [dbo].[nhacungcap] ([manhacungcap])
GO
ALTER TABLE [dbo].[laptop] CHECK CONSTRAINT [FK_laptop_nhacungcap]
GO

insert into nhanvien values ('ql',N'nguyễn văn a','08-08-1987','098723453','15000000',N'hà nội',N'Nam')
insert into nhanvien values ('nv1',N'lê văn b','11-11-1999','012387652','10000000',N'hà nội',N'Nam')
insert into nhanvien values ('nv2',N'ntạ văn c','12-12-1999','096743274','10000000',N'hà nội',N'Nữ')

insert into dangnhap values ('ql','123',N'quản lý')
insert into dangnhap values ('nv1','123',N'nhân viên')
insert into dangnhap values ('nv2','123',N'nhân viên')

insert into khachhang values ('kh1',N'vũ đức binh',0123456789)
insert into khachhang values ('kh2',N'đào trung chiến',0162123123)
insert into khachhang values ('kh3',N'nguyễn văn điển',0989898989)

insert into hanglaptop values('h1','dell')
insert into hanglaptop values('h2','hp')
insert into hanglaptop values('h3','asus')

insert into nhacungcap values('n1','fpt shop',N'hà nội',0123123123)
insert into nhacungcap values('n2',N'thế giới di động',N'hà nội',0987987987)
insert into nhacungcap values('n3',N'gia huy',N'hà nội',0945645666)


insert into laptop values ('lap1','Dell Precision','n1','h1',2,'09-09-2019',15000000) 
insert into laptop values ('lap2','HP Pavilion','n1','h2',3,'09-09-2019',13000000) 
insert into laptop values ('lap3','Asus X509FJ-EJ133T','n1','h3',4,'09-09-2019',18000000) 

insert into hoadon values('kh1','nv1',N'đã bán')
insert into hoadon values('kh2','nv2',N'chưa bán')
insert into hoadon values('kh3','nv1',N'đã bán')

insert into hoadonchitiet values (1,'lap1',2)
insert into hoadonchitiet values (2,'lap2',1)
insert into hoadonchitiet values (2,'lap3',3)




