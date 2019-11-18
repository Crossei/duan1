CREATE database Laptop
go
use Laptop
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
	[manhacungcap] [nvarchar](10) NOT NULL,
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
	[chucvu] [nvarchar](50) NULL,
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
