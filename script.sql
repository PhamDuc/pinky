USE [master]
GO
/****** Object:  Database [PinkyDB]    Script Date: 6/16/2015 12:09:58 AM ******/
CREATE DATABASE [PinkyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PinkyDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PinkyDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PinkyDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PinkyDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PinkyDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PinkyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PinkyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PinkyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PinkyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PinkyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PinkyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PinkyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PinkyDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PinkyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PinkyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PinkyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PinkyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PinkyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PinkyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PinkyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PinkyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PinkyDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PinkyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PinkyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PinkyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PinkyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PinkyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PinkyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PinkyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PinkyDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PinkyDB] SET  MULTI_USER 
GO
ALTER DATABASE [PinkyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PinkyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PinkyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PinkyDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PinkyDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/16/2015 12:09:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[Sex] [nvarchar](3) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](12) NULL,
	[Password] [varchar](50) NULL,
	[Level] [int] NULL,
	[Balance] [float] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/16/2015 12:09:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Catalogue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clothes]    Script Date: 6/16/2015 12:09:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clothes](
	[ID] [int] NOT NULL,
	[CatID] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Detail] [nvarchar](max) NULL,
	[DayUpdate] [date] NULL,
 CONSTRAINT [PK_Clothes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color]    Script Date: 6/16/2015 12:09:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ColorCode] [varchar](7) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 6/16/2015 12:09:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[PictureID] [int] NOT NULL,
	[ClothID] [int] NOT NULL,
	[ColorID] [int] NOT NULL,
	[ImageLink] [nvarchar](max) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[PictureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quantity]    Script Date: 6/16/2015 12:09:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quantity](
	[QuantityID] [int] NOT NULL,
	[ClothID] [int] NOT NULL,
	[ColorID] [int] NOT NULL,
	[SizeID] [int] NOT NULL,
	[QuantityOfClothes] [int] NULL,
 CONSTRAINT [PK_Quantity] PRIMARY KEY CLUSTERED 
(
	[QuantityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 6/16/2015 12:09:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartID] [int] NOT NULL,
	[QuantityID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[QuantityOfClothes] [int] NOT NULL,
	[BuyDate] [date] NULL,
	[Done] [int] NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Size]    Script Date: 6/16/2015 12:09:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [int] NOT NULL,
	[SizeDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[view_Quantity]    Script Date: 6/16/2015 12:09:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[view_Quantity] as

Select distinct QuantityID, Clothes.Name, Size.SizeDescription as Size, Color.Name as Color, Quantity.QuantityOfClothes as Quantity
from Quantity, Clothes, Size, Color, Catalogue
where
Quantity.ClothID=Clothes.ID
and Quantity.ColorID=Color.ID
and Size.SizeID=Quantity.SizeID
GO
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1014, N'Phuc', CAST(0x891B0B00 AS Date), N'Nam', N'HN, Vietnam', N'01276406174', N'admin', 1, 99999266)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1015, N'Tuuuu', CAST(0x381C0B00 AS Date), N'Nam', N'NA', N'953887279', N'admin', 1, 100000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1016, N'Elsa Hosk', CAST(0xA21B0B00 AS Date), N'Nu', N'HN', N'996009710', N'admin', 1, 100000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1017, N'Nammm', CAST(0x1C1C0B00 AS Date), N'Nam', N'HN', N'945398510', N'davidoff', 1, 100000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1018, N'Taylor Love Life', CAST(0x071C0B00 AS Date), N'Nam', N'HN', N'919904108', N'12345', 1, 100000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1019, N'Kiara Kabukuru', CAST(0xC7150B00 AS Date), N'Nu', N'NY', N'956130372', N'12345', 0, 100000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1020, N'Angelika Kallio', CAST(0x83070B00 AS Date), N'Nu', N'LA', N'959118331', N'12345', 0, 100000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1021, N'Kang Seung-hyun', CAST(0x30260B00 AS Date), N'Nu', N'TX', N'923562207', N'12345', 0, 100000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1022, N'Carmen Kass', CAST(0x11150B00 AS Date), N'Nu', N'HN', N'964715189', N'12345', 0, 100000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1023, N'Liya Kebede', CAST(0x071C0B00 AS Date), N'Nu', N'NA', N'968273908', N'12345', 0, 100000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1024, N'Miranda Kerr', CAST(0xC7150B00 AS Date), N'Nu', N'HN', N'990251370', N'12345', 0, 100000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1025, N'Abbey Lee Kershaw', CAST(0x83070B00 AS Date), N'Nu', N'HN', N'961444402', N'12345', 0, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1026, N'Jaime King', CAST(0x30260B00 AS Date), N'Nu', N'HN', N'967325076', N'12345', 0, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1027, N'Vendela Kirsebom', CAST(0x11150B00 AS Date), N'Nu', N'NY', N'999681448', N'12345', 0, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1028, N'Karlie Kloss', CAST(0x071C0B00 AS Date), N'Nu', N'LA', N'957066661', N'12345', 0, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1029, N'Heidi Klum', CAST(0xC7150B00 AS Date), N'Nu', N'TX', N'910762288', N'12345', 0, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1030, N'Michaela Kocianova', CAST(0x83070B00 AS Date), N'Nu', N'HN', N'981471359', N'12345', 0, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1031, N'Tatiana Kovylina', CAST(0x30260B00 AS Date), N'Nu', N'NA', N'973787636', N'12345', 0, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1032, N'Doutzen Kroes', CAST(0x11150B00 AS Date), N'Nu', N'HN', N'975039460', N'12345', 0, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1033, N'Karolína Kurková', CAST(0x071C0B00 AS Date), N'Nu', N'HN', N'982996939', N'12345', 0, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1034, N'Olga Kurylenko', CAST(0xC7150B00 AS Date), N'Nu', N'HN', N'931149734', N'12345', 0, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1035, N'Anastasia Kuznetsova', CAST(0x83070B00 AS Date), N'Nu', N'NY', N'943641877', N'12346', 0, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1036, N'3', NULL, N'Nu', N'2', N'4', N'2', 1, 1000000)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1037, N'123', CAST(0xF2390B00 AS Date), N'Nu', N'113', N'123', N'123', 1, 123)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1038, N'23', CAST(0xF2390B00 AS Date), N'Nam', N'333', N'123', N'333', 1, 123)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1039, N'3', CAST(0x85AB0A00 AS Date), N'Nam', N'333', N'123', N'32', 0, 32)
INSERT [dbo].[Account] ([ID], [Name], [DOB], [Sex], [Address], [Phone], [Password], [Level], [Balance]) VALUES (1040, N'33', CAST(0xFC990A00 AS Date), N'Nu', N'333', N'123', N'123', 1, 3123)
INSERT [dbo].[Category] ([ID], [Name]) VALUES (1, N'accessories')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (2, N'dorm')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (3, N'apparel')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (4, N'swim')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (5, N'bra')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (6, N'panties')
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (1, 3, N'LIMITED EDITION BOYFRIEND HALF-ZIP', 50, N'The Half-Zip pullover you love with a mock turtleneck and a slouchier, oversized fit. Fall in love with the Boyfriend update with a longer, tunic length. Must-have sweats by Victoria’s Secret PINK.
Oversized
Print graphics
Mockneck
Soft, light & textured French Terry
Kangaroo pockets
Longer, tunic length
Imported cotton/polyester/viscose', CAST(0x133A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (2, 3, N'LIMITED EDITION COLLEGIATE CREW', 55, N'A lightweight, supersoft pullover in a slouchier, laid-back fit. Meet the cutest new must-have for summer in our fave new prints and colors. Must-have sweats by Victoria’s Secret PINK.
Relaxed, easy fit
Ribbed hem
Soft, light & textured French Terry
Imported cotton/polyester', CAST(0xF9390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (3, 3, N'REVERSIBLE PINK ULTIMATE YOGA LEGGINGS', 55, N'Super slim and fit to flatter with two waistband options when you turn it inside out. In our smoother-than-ever premium yoga fabric. Only from Victoria’s Secret PINK.
28” inseam
Imported nylon/spandex', CAST(0xF9390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (4, 3, N'PINK ULTIMATE YOGA LEGGINGS', 45, N'Super smooth and fit to flatter—our best yoga fabric yet. Now with a sporty contrast waist. Only from Victoria’s Secret PINK.
28" inseam
Sporty pieced detail
Imported polyamide/spandex', CAST(0xF9390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (5, 3, N'OPEN BACK VARSITY CREW TEE', 45, N'Layering just leveled up with this new style—perfect for showing off your cute suits and bras. Plus, the longer length makes it a great cover-up. Only from Victoria’s Secret PINK.
Oversized, tunic length
Open back cutout
Imported cotton/polyester', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (6, 3, N'RINGER TANK', 55, N'A classic racerback with a curved hem and relaxed fit. Only by Victoria’s Secret PINK.
Relaxed, easy fit
Lightweight cotton blend
Curved hem 
Longer, tunic length
Imported cotton/polyester', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (7, 3, N'SLOUCHY CREW', 45, N'Cute slim fit with a slouchy, off-the-shoulder style that’s so perfect for layering. Must-have sweats by Victoria’s Secret PINK.
Print graphics
Ribbed hem
Breezy lightweight fleece
Imported cotton/polyester', CAST(0x103A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (8, 3, N'SKINNY BOYFRIEND PANT', 42, N'The laid-back, customizable, Boyfriend fit you love in a new slimmed-down fit—now without a boxer-style backside.
Relaxed, easy fit
Print graphics
Cozy, supersoft fleece
Drawstring elastic waist
Side pockets
DIY length (cut the raw edge to your perfect length!)
32" inseam
Imported cotton/polyester', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (9, 3, N'PERFECT ZIP HOODIE', 60, N'Perfection in a hoodie: super comfy, must-have length and a cute slim fit. Must-have sweats by Victoria’s Secret PINK.
Slim fit
Print graphics
Cozy,super soft fleece
Imported cotton', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (10, 3, N'PERFECT FULL-ZIP HOODIE', 65, N'Perfection in a hoodie: super comfy, must-have length and a cute slim fit. Must-have sweats by Victoria’s Secret PINK.
Slim fit
Print graphics
Cozy, super soft French terry
Imported cotton', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (11, 3, N'GYM PANT', 25, N'Extra stretchy like leggings but with a soft sweatpant feel—meet the Gym Pant. Must-have sweats by Victoria’s Secret PINK.
Our slimmest fit yet
Exposed logo elastic waistband
Cuffed bottom
Lightweight stretch fleece
29"inseam
Imported cotton/polyester', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (12, 3, N'SKINNY PANT', 32, N'Slimmed way down with a low-rise waist—get ready to fall in love with the Skinny Pant. Must-have sweats by Victoria’s Secret PINK.
Slim fit
Elastic bottom
Cozy, supersoft fleece
27" inseam
Imported cotton/polyester', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (13, 3, N'ANORAK FULL-ZIP', 55, N'A lightweight, easy jacket—perfect to layer or wear alone. Only by Victoria’s Secret PINK.
Slim fit
Printed graphics
Pockets
Imported nylon', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (14, 3, N'LOW BACK TANK', 55, N'This breezy super soft tank has low armholes and a new lower back to really show off your fave layering bra. Only by Victoria’s Secret PINK.
Relaxed, easy fit
Print graphics
Drapey, lightweight jersey blend
Curved hem
Imported cotton/polyester', CAST(0xDB390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (15, 3, N'HIGH-LOW TANK', 55, N'A super slouchy racerback with a high-low colorblocked hem—perfect for showing off your fave layering bra. Only by Victoria’s Secret PINK.
Relaxed, easy fit
Print graphics
Classic cotton blend
Side slits
Curve hem
Imported cotton/polyester', CAST(0xDB390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (16, 3, N'CREWNECK TEE', 23, N'Broken-in softness with a street-sport advantage, this slim-fit top is a must for laid back everyday looks. Only by Victoria’s Secret PINK.
Slim fit
Print graphics
Classic cotton blend
Imported cotton/polyester', CAST(0xDB390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (17, 3, N'CROP MUSCLE TANK', 55, N'Cropped off with a breezy, borrowed-from-the-boys fit, this tank was practically made for fun in the sun. Perfect for layering and showing off a little skin thanks to the low-cut armholes. Must-have tanks and tees only by Victoria’s Secret PINK.
 Relaxed, easy fit
Scoopneck
Low-cut armhole
Slightly cropped, hits at waist
Bling or print graphic on front or back
Imported cotton/polyester', CAST(0xDB390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (18, 3, N'CUTOUT TEE', 25, N'This sunny tee is made for showing off what’s underneath thanks to the back cutout. We suggest wearing this soft scoopneck as a coverup, too! Only by Victoria’s Secret PINK.
Relaxed, easy fit
Scoopneck
Curved hem
Imported cotton/polyester', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (19, 3, N'RACERBACK TANK', 20, N'We dare you not to reach for this classic racerback tank with a slouchy, breezy fit. Only by Victoria’s Secret PINK.
In super soft, slub jersey
Relaxed, easy fit
Curved hem
Imported cotton/polyester', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (20, 3, N'CROP TANK', 20, N'This soft cotton tank is a must-have for summer—with a cute cropped style and oversized fit that’s perfect for layering over a bralette or swimsuit. 
Relaxed, easy fit
Lightweight cotton blend
Curved hem
Cropped
Imported cotton/polyester', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (21, 3, N'SCOOPNECK TEE', 20, N'Our new super soft scoopneck is the perfect thing for your favorite layering bra—throw it on and let those pops of color show. Only by Victoria’s Secret PINK.
Relaxed, easy fit
Lightweight cotton blend
Curved hem
Longer, tunic length
Imported cotton/polyester', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (22, 3, N'ULTIMATE YOGA CROP LEGGINGS', 20, N'Super smooth and fit to flatter—our best yoga fabric yet. Now in a shorter, cropped length! Only by Victoria’s Secret PINK.
Colorblock and logo graphics
19 1/4" inseam
Imported polyamide/spandex', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (23, 3, N'PINK ULTIMATE GYM PANT', 20, N'The slim Gym Pant fit you love now in premium stretch fabric that smooths & flatters! Extra stretchy like leggings with a low rise and cuffed bottoms. Only by Victoria’s Secret PINK.

• Our slimmest fit
• Foldover waistband
• Exposed logo elastic
• Cuffed bottom
• Premium fit-to-flatter fabric
• Low rise
• 32” inseam
• Imported polyamide/spandex, imported polyamide/spandex/polyester for marl colors only', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (24, 3, N'PINK ULTIMATE HALF-ZIP', 20, N'Our most flattering premium stretch fabric now in a half-zip style! Only by Victoria’s Secret PINK.
Slim fit
Print graphics
Premium stretch fabric that smooths and flatters
Thumbholes
Imported micro polyester/spandex', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (25, 3, N'PINK ULTIMATE FULL-ZIP HOODIE', 35, N'The favorite premium stretch fabric in an all-new full-zip style. Featuring our PINK Ultimate fit-to-flatter style and thumbholes for a sporty look. Only by Victoria’s Secret PINK.
 
Slim fit
Print graphics
Thumbholes
Front pocket
Premium stretch fabric that smooths and flatters
Imported nylon/spandex', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (26, 3, N'PINK ULTIMATE YOGA SHORTIE', 60, N'The fave little must-have for working out or wearing out—now in our premium, fit to flatter fabric. Only by Victoria’s Secret PINK.
2 3/4” inseam
Imported polyamide/spandex', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (27, 3, N'SKINNY COLLEGIATE PANT', 65, N'Meet our newest skinny sweat—super slim fit with just a teensy bit of room. Get the sporty look with logo elastic trim details and bold PINK graphics. Must-have sweats by Victoria’s Secret PINK.
Slim, tapered fit
Elastic, drawstring waistband
Cuffed bottom
Lightweight stretch fleece
Imported cotton/polyester/spandex', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (28, 3, N'VARSITY CREW', 55, N'This classic crewneck is super comfy thanks to an oversized fit and tunic length that’s also great for layering. Must-have sweats by Victoria’s Secret PINK. Oversized
Print graphics
Our lightest French Terry
Longer, tunic length
Imported cotton/polyester', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (29, 3, N'BOYFRIEND POCKET TANK', 35, N'This comfy, loose fit tank has a cute front pocket and low-cut sides to show off what’s underneath. Must-have tees only from Victoria’s Secret PINK.
Relaxed, easy fit
Classic cotton jersey blend
Low-cut armholes
Imported cotton/polyester', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (30, 3, N'EXTREME RACERBACK TANK', 60, N'Take on every hot day with this bright, lightweight tank. Breezy and cut a bit more dramatic than our classic racerback—this showy tank is cute on it’s own or as a coverup, too! Only by Victoria’s Secret PINK.
Relaxed, easy fit
Extreme racerback shape
Dropped armholes
Imported cotton/polyester', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (31, 3, N'BOYFRIEND PANT', 45, N'Long straight leg, lots of attitude—let''s hear it for the Boyfriend Pant! Must-have sweats by Victoria’s Secret PINK.
Oversized
Boxer-style rear; raw-edge hem
Breezy, lightweight fleece
Drawstring elastic waist; side pockets
33" inseam
Imported cotton/polyester', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (32, 3, N'PERFECT FULL-ZIP', 10, N'It''s the Perfect Zip Hoodie: super comfy, perfect length, easy everyday style. In our supersoft fleece. Must-have sweats by Victoria’s Secret PINK.
 
In supersoft fleece
Print graphics on front
Drawstring hood
Side pockets
Imported cotton/polyester', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (33, 3, N'CURVED-HEM HALF-ZIP', 60, N'Your favorite slouchy pullover with a new curved edge bottom. Longer, tunic length that’s perfect for layering. Must-have sweats by Victoria’s Secret PINK.
Oversized
Embroidered graphics
Mockneck
Breezy, lightweight fleece
Kangaroo pockets
Longer, tunic length
Imported cotton/polyester', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (34, 3, N'VARSITY HOODIE', 50, N'This classic hoodie is super comfy thanks to an oversized fit and tunic length that’s perfect with leggings. Must-have sweats by Victoria’s Secret PINK.
Oversized
Print graphics
Our lightest French terry
Longer, tunic length
Imported cotton/polyester', CAST(0x6B3A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (35, 3, N'V-NECK TEE', 45, N'The one. The only. The Essential V-Neck Tee! It’s a must-have basic t-shirt to mix, match and layer with all the pieces from our PINK Essentials Collection. Only at Victoria''s Secret PINK.
V-neck
Imported cotton/polyester', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (36, 3, N'BEACH SHORTS', 40, N'Soft and lightweight—these bright shorts are perfect for the beach or pool! Plus, you’ll love the cute, pom pom trim. Only by Victoria’s Secret PINK.
2 1/2” inseam
Imported rayon', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (37, 3, N'DENIM SHORTS', 18, N'Cute jean short shorts are a must-have staple for every PINK girl. Only by Victoria’s Secret PINK.
Raw edge hem
Side pockets
2" inseam
Imported cotton/spandex', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (38, 2, N'BED IN A BAG', 25, N'Move-in day made easy thanks to this all-in-one bed set. Comes with a reversible comforter, sheet set and pillow cases. In cute colors and prints to deck out your dorm room or bedroom. Only from Victoria’s Secret PINK.
Comforter, flat sheet, fitted sheet and pillow cases included in set
Twin/twin XL: 64" x 88"
Twin/twin XL flat: 66" x 100" Fitted: 39" x 75"
Full comforter : 84" x 88"
Full flat: 81" x 96" Fitted: 54" x 75"
Queen comforter: 84" x 88"
Queen flat: 90" x 102" Fitted: 60" x 80"
Imported polyester', CAST(0xDB390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (39, 2, N'REVERSIBLE COMFORTER', 30, N'Sweet dreams are a given with this extra cozy comforter. In brights and prints—throw this blanket on your dorm bed for a pop of color. Only from Victoria’s Secret PINK.
Twin fits standard/twin XL  
Plush and cozy- more fill than ever!
Twin/Twin XL - 88" L x 64" W
Full/Queen - 88" L x 84" W
King - 102" L x 90" W
Imported cotton/polyester', CAST(0xDB390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (40, 2, N'STORAGE BINS', 45, N'Great for organizing in a cute way, store away all your essentials in these bright, colorful storage bins. Only from Victoria’s Secret PINK.
Two-piece set
Collapsible
Reinforced handles
Medium: 13" L x 9 1/2 "W x 8" H; Small: 12"L x 8 3/4"W x 6 1/2"H
Imported cotton', CAST(0xDB390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (41, 2, N'CLOSET ORGANIZER', 35, N'Keep your closet in check with this bright, colorful organizer. Hangs easily so it’s perfect for the dorm-bound PINK girl. Only from Victoria’s Secret PINK.
10L" x 11D" x 50H"
5 shelves
Imported cotton canvas', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (42, 2, N'DORM TRUNK', 15, N'Stow away your keepsakes, off-season clothes or secrets in this fun collapsible storage locker. Great for organizing your dorm while keeping it cute. Only from Victoria’s Secret PINK.
Collapsible
With lid
30" X 18" X 13"
Imported cotton canvas', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (43, 2, N'BATH TOWEL SET', 15, N'Dry off and freshen up with this cute matching towel set. Perfect for the dorm-bound PINK girl.
Two bath towels per set
30" W x 56" L
Imported cotton/polyester', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (44, 2, N'WASHCLOTH SET', 50, N'Freshen up with bright, colorful washcloths. Comes in a set of four towels—perfect for the dorm-bound PINK girl. Only from Victoria’s Secret PINK.
Four washcloths per set
13" W x 13" L
Imported cotton/polyester', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (45, 2, N'MESH LAUNDRY BAG', 25, N'Keep your whites, brights and delicates organized with this airy laundry bag. Durable, with a drawstring closure and shoulder strap. Only from Victoria’s Secret PINK.
Shoulder strap
Drawstring closure
15" D x 26" H
Imported cotton canvas', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (46, 2, N'AREA RUG', 35, N'Deck out your dorm room or brighten up any space with this cute rug. Only from Victoria’s Secret PINK.
3’W x 5’L
Imported polyester', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (47, 2, N'REVERSIBLE DUVET COVER', 15, N'Catch some shut-eye or lounge around with a super cute duvet cover. Perfect for decking out your dorm room or bedroom. Only from Victoria’s Secret PINK.
King - 102” x 90”
Full/Queen - 88” x 84”
Twin - 88” x 64”
Twin fits standard and extra-long mattress
Button closure
Imported cotton', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (48, 2, N'PILLOWCASE SET', 50, N'Best. Bedding. Ever. Deck out your dorm room or bedroom with this bright, bold pillowcase set. Only at Victoria’s Secret PINK.
 
Imported cotton', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (49, 2, N'SHEET SET', 30, N'Brighten up your bedroom or dorm room with our colorful sheet set. A back-to-campus essential for every PINK girl. Only from Victoria’s Secret PINK.
Top sheet and fitted sheet
Twin fits standard/twin XL  
Twin comes with single pillow case
Full, queen and king-size sets come with two pillowcases
Imported cotton', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (50, 2, N'THROW PILLOW', 30, N'Add some PINK décor to your dorm room or bedroom with fun, colorful pillows. Only from Victoria’s Secret PINK. 
18” x 18”
Imported cotton twill', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (51, 2, N'BODY PILLOW', 15, N'Get ready for some serious snuggling—this soft, comfy body pillow is your new bedtime bestie. Bright, bold and perfect for larger-than-life lounging. Only from Victoria’s Secret PINK.
Graphics on front; print on back
45"L x 18"W
Cotton with polyester fill
Imported', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (52, 1, N'FLIP FLOPS', 15, N'Cute, bright flip flops—perfect for the pool, beach, or every day. Only by Victoria’s Secret PINK.
Small fits size 5-6
Medium fits size 7-8
Large fits size 9-10
Imported rubber', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (53, 1, N'BEACH TOWEL', 25, N'Freshen up, keep dry or soak up the sun with this super cute beach towel. Only by Victoria’s Secret PINK.
28"W x 58"L
Imported cotton terry', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (54, 1, N'BEACH TOTE', 20, N'Hold everything you need for a day at the beach—and keep it organized with extra pockets. Only by Victoria’s Secret PINK.
14" x 21"
Snap closure
Two exterior front pockets
Double-lined sides and bottom
Double straps
Imported canvas', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (55, 1, N'KNEE SOCKS', 10, N'Don’t forget to pack these cute, comfy knee-highs—perfect for wearing out or hanging out. Only by Victoria’s Secret PINK.
1 pair
Hits right below knee
Imported cotton', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (56, 1, N'FANNY PACK', 12, N'Your new beach bestie keeps all your essentials close for hands-free partying. Only by Victoria’s Secret PINK.
Imported modal', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (57, 1, N'ANKLE SOCKS SET', 9, N'Super comfy and low-cut for a no-show fit – this 2-piece set will rock your socks off! Only from Victoria’s Secret PINK.
Pack of 2
One size fits all
Imported cotton', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (58, 1, N'CHUG MUG', 10, N'Stay cool and hydrated on the beach with this bright PINK cup. Only by Victoria’s Secret PINK.
Pull top spout
Removable lid
Single handle
24 oz
BPA free
Imported plastic', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (59, 1, N'IPHONE 6 CASE', 9, N'Flaunt your PINK pride and protect your iPhone® day and night with this cute phone case. Only by Victoria’s Secret PINK.
Silicone (soft)
Fits iPhone 6 only – not the plus
Imported silicone', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (60, 1, N'WATER BOTTLE', 15, N'Whether you''re working out or out and about, this bright, bold water bottle holds your beverages in style. Only by Victoria’s Secret PINK.
 
Pull top spout
32 oz.
BPA free
Imported plastic', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (61, 1, N'BACKPACK', 45, N'Lots of pockets and room for all your essentials—this is the perfect accessory for your sunny summer plans. Only by Victoria’s Secret PINK.
Adjustable straps
Front and side zip pockets
Magnetic snap closure with interior drawstring
12"L x 6"W x 17"H
Top hook for hanging
Flap overlay
Drawstring for closure under flap
Imported cotton canvas', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (62, 1, N'DUFFLE BAG', 40, N'This duffle bag is super soft and perfect for the gym, sleepovers or just carrying around your campus essentials. Only by Victoria’s Secret PINK. 
29” x  50” 
Removable adjustable strap
Side mesh pockets
Front Pocket
Imported polyester', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (63, 1, N'CAMPUS BACKPACK', 50, N'The ultimate back to campus essential! Stylish and sturdy with comfy shoulder straps and tons of pockets for your laptop, water bottle and all your other essentials. Only from Victoria’s Secret PINK.
8 interior pockets
Padded laptop sleeve
Water bottle pockets
Comfy shoulder straps
12" x 7.5" x 18"
Side mesh pocket: 7.5" x 8"
Exterior front pocket : 9.5" x 7.25"1 3/4"
Imported polyester', CAST(0x7F390B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (64, 3, N'DEEP V-NECK TANK', 42, N'Take the plunge in this low-cut V-neck tank! Perfect for summer and made to show off what’s underneath. Only by Victoria’s Secret PINK.
Relaxed, easy fit
Deep V-neck
Lightweight cotton blend
Longer, tunic length
Imported cotton/polyester', CAST(0x113A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (65, 3, N'BOYFRIEND TANK', 19, N'Show off! Slouchy, soft and made-for-you. It’s the top you’ve been looking for: the Boyfriend Tank. Made for sun, sand and pretty much everything else! Drapey fit and made-to-layer. It''s a must-have basic to mix, match and layer with all the pieces from our PINK Essentials Collection. Only by PINK.
Super soft slub jersey
Scoopneck
Oversized drop armholes
Drapey slightly slouchy fit
Imported cotton/polyester', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (66, 3, N'COLLEGIATE CREW', 55, N'A lightweight, supersoft pullover in a slouchier, laid-back fit. Meet the cutest new must-have for summer in cool colorblock options. Must-have sweats by Victoria’s Secret PINK.
Relaxed, easy fit
Ribbed hem
Soft, light & textured French Terry
Imported cotton/polyester', CAST(0x123A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (67, 4, N'TRIANGLE BIKINI TOP', 25, N'A must-have in every swim wardrobe: our classic triangle top in bright colors and bold trims. Mix & match all our cute suits—swimwear by Victoria’s Secret PINK. 
Adjustable ties at neck and back
Lightly padded
Fully lined
Imported nylon/spandex', CAST(0x133A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (68, 4, N'PUSH-UP WRAP TRIANGLE TOP', 50, N'Flirt poolside or seaside in this bright wraparound bikini with extra oomph built in. Mix & match all our cute suits—swimwear by Victoria’s Secret PINK. 
Push-up padding
Molded cups
Adjustable back closure and wrap ties
Halter tie at neck
Fully lined
Imported nylon/spandex', CAST(0x133A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (69, 4, N'BODY WRAP BANDEAU TOP', 40, N'Straps or no straps, this wrap-around style gives you the cutest options for fun in the sun. Plus removable halter straps let you skip the tan lines. Mix & match all our cute suits—swimwear by Victoria’s Secret PINK.
Underwire
Built-in push-up padding
Removable halter ties
Adjustable hook on back
Fully lined molded cups
Imported nylon/spandex', CAST(0x133A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (70, 4, N'PUSH-UP FLOUNCE TOP', 45, N'Your fave flounce bikini top with push-up padding and new laser-cut options.  Mix & match all our cute suits—swimwear by Victoria’s Secret PINK.   Halter ties at neck Padded for extra push Underwire for lift Flounce shape only in front Adjustable back closure Fully lined Imported nylon/spandex', CAST(0x133A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (71, 4, N'PLUNGE BIKINI TOP', 33, N'Take the plunge in this flirty scoopneck bikini with cute strappy details on the side. Mix & match all our cute suits—swimwear by Victoria’s Secret PINK.
Low-cut scoopneck
Adjustable halter straps
Adjustable back closure
Removable padding
Fully lined
Imported nylon/spandex', CAST(0x133A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (72, 4, N'SCALLOPED TRIANGLE BIKINI TOP', 27, N'A classic triangle top is a must for the beach or pool—in cute colors, pretty prints and delicate scalloped edges.
Ties at neck and back
Removable pads
Fully lined
Imported nylon/spandex', CAST(0x133A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (73, 4, N'RUCHED BANDEAU', 27, N'Skip the tanlines! This colorful bikini top has flirty ruching and removable halter straps. Mix & match all our cute suits—swimwear by Victoria’s Secret PINK.
Light removable padding
Side boning for support
Removable halter strap
Adjustable back closure
Fully lined
Ruched center and sides
Imported nylon/spandex', CAST(0x133A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (74, 4, N'ZIP HALTER ONE-PIECE', 50, N'Can you say flirty? Show off on the beach or by the pool in this deep V-neck, zip-front one piece. Mix & match all our cute suits—swimwear by Victoria’s Secret PINK.
Plunging V-neck
Zip front
Halter ties at neck
Light removable padding
Fully lined
Minimal Coverage
Imported nylon/spandex', CAST(0x133A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (75, 4, N'STRAPPY-BACK ONE-PIECE', 50, N'More is more! Switch it up from your basic bikinis with this strappy one-piece. Mix & match all our cute suits—swimwear by Victoria’s Secret PINK.
Pulls on
Removable padding
Low back
Fully lined
Minimal coverage
Imported nylon/spandex', CAST(0x133A0B00 AS Date))
INSERT [dbo].[Clothes] ([ID], [CatID], [Name], [Price], [Detail], [DayUpdate]) VALUES (76, 4, N'BODY WRAP TOP', 40, N'A crossover front and halter ties make this bikini top an all-around fave. Mix & match all our cute suits—swimwear by Victoria’s Secret PINK.
Light removable padding
Side boning for support
Ties at neck
Adjustable back closure
Fully lined
Removable padding
Imported nylon/spandex', CAST(0x133A0B00 AS Date))
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (0, N'Pink', N'#F50057')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (1, N'White', N'#FFFFFF')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (2, N'Navy', N'#1A237E')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (3, N'Black', N'#000000')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (4, N'Blue', N'#1976D2')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (5, N'Purple', N'#7B1FA2')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (6, N'Cyan', N'#18FFFF')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (7, N'Orange', N'#FF9800')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (8, N'Lime', N'#76FF03')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (9, N'Aquamarine', N'#1DE9B6')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (10, N'Gray', N'#BDBDBD')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (11, N'Yellow', N'#FFFF00')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (12, N'Silver', N'#90A4AE')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (13, N'RubyWine', N'#C2185B')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (14, N'NeonRed', N'#D50000')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (15, N'Teal', N'#009688')
INSERT [dbo].[Color] ([ID], [Name], [ColorCode]) VALUES (16, N'Brown', N'#6D4C41')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (0, 52, 0, N'FLIP FLOPS_PINK_0.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (1, 1, 8, N'LIMITED EDITION BOYFRIEND HALF-ZIP_LIME_1.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (2, 1, 3, N'LIMITED EDITION BOYFRIEND HALF-ZIP_BLACK_2.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (3, 1, 0, N'LIMITED EDITION BOYFRIEND HALF-ZIP_PINK_3.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (4, 52, 4, N'FLIP FLOPS_BLUE_4.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (5, 2, 9, N'LIMITED EDITION COLLEGIATE CREW_AQUAMARINE_5.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (6, 2, 1, N'LIMITED EDITION COLLEGIATE CREW_WHITE_6.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (7, 3, 2, N'REVERSIBLE PINK ULTIMATE YOGA LEGGINGS_NAVY_7.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (8, 3, 1, N'REVERSIBLE PINK ULTIMATE YOGA LEGGINGS_WHITE_8.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (9, 4, 3, N'PINK ULTIMATE YOGA LEGGINGS_BLACK_9.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (10, 4, 8, N'PINK ULTIMATE YOGA LEGGINGS_LIME_10.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (11, 5, 3, N'OPEN BACK VARSITY CREW TEE_BLACK_11.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (12, 5, 1, N'OPEN BACK VARSITY CREW TEE_WHITE_12.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (13, 6, 1, N'RINGER TANK_WHITE_13.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (14, 6, 9, N'RINGER TANK_AQUAMARINE_14.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (15, 6, 6, N'RINGER TANK_CYAN_15.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (16, 7, 0, N'SLOUCHY CREW_PINK_16.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (17, 7, 4, N'SLOUCHY CREW_BLUE_17.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (18, 7, 10, N'SLOUCHY CREW_GRAY_18.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (19, 8, 4, N'SKINNY BOYFRIEND PANT_BLUE_19.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (20, 8, 3, N'SKINNY BOYFRIEND PANT_BLACK_20.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (21, 9, 0, N'PERFECT ZIP HOODIE_PINK_21.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (22, 9, 9, N'PERFECT ZIP HOODIE_AQUAMARINE_22.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (23, 10, 3, N'PERFECT FULL-ZIP HOODIE_BLACK_23.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (24, 10, 9, N'PERFECT FULL-ZIP HOODIE_AQUAMARINE_24.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (25, 11, 0, N'GYM PANT_PINK_25.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (26, 11, 10, N'GYM PANT_GRAY_26.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (27, 12, 3, N'SKINNY PANT_BLACK_27.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (28, 12, 8, N'SKINNY PANT_LIME_28.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (29, 12, 10, N'SKINNY PANT_GRAY_29.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (30, 13, 11, N'ANORAK FULL-ZIP_YELLOW_30.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (31, 14, 0, N'LOW BACK TANK_PINK_31.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (32, 16, 7, N'CREWNECK TEE_ORANGE_32.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (33, 17, 0, N'CROP MUSCLE TANK_PINK_33.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (34, 18, 8, N'CUTOUT TEE_LIME_34.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (35, 19, 8, N'RACERBACK TANK_LIME_35.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (36, 20, 0, N'CROP TANK_PINK_36.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (37, 15, 0, N'HIGH-LOW TANK_PINK_37.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (38, 15, 6, N'HIGH-LOW TANK_CYAN_38.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (39, 15, 8, N'HIGH-LOW TANK_LIME_39.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (40, 15, 10, N'HIGH-LOW TANK_GRAY_40.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (41, 21, 10, N'SCOOPNECK TEE_GRAY_41.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (42, 22, 8, N'ULTIMATE YOGA CROP LEGGINGS_LIME_42.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (43, 23, 0, N'PINK ULTIMATE GYM PANT_PINK_43.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (44, 24, 4, N'PINK ULTIMATE HALF-ZIP_BLUE_44.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (45, 25, 1, N'PINK ULTIMATE FULL-ZIP HOODIE_WHITE_45.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (46, 26, 3, N'PINK ULTIMATE YOGA SHORTIE_BLACK_46.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (47, 27, 3, N'SKINNY COLLEGIATE PANT_BLACK_47.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (48, 28, 15, N'VARSITY CREW_TEAL_48.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (49, 30, 1, N'ULTIMATE HALF-ZIP_WHITE_49.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (50, 29, 0, N'BOYFRIEND POCKET TANK_PINK_50.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (51, 31, 3, N'BOYFRIEND PANT_BLACK_51.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (52, 32, 12, N'PERFECT FULL-ZIP_SILVER_52.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (53, 33, 1, N'ATHLETIC TEE_WHITE_53.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (54, 34, 9, N'VARSITY HOODIE_AQUAMARINE_54.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (55, 35, 3, N'V-NECK TEE_BLACK_55.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (56, 36, 2, N'BEACH SHORTS_NAVY_56.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (57, 37, 3, N'DENIM SHORTS_BLACK_57.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (58, 38, 0, N'BED IN A BAG_PINK_58.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (59, 38, 6, N'BED IN A BAG_CYAN_59.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (60, 38, 3, N'BED IN A BAG_BLACK_60.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (61, 39, 0, N'REVERSIBLE COMFORTER_PINK_61.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (62, 39, 6, N'REVERSIBLE COMFORTER_CYAN_62.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (63, 40, 3, N'STORAGE BINS_BLACK_63.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (64, 40, 4, N'STORAGE BINS_BLUE_64.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (65, 41, 3, N'CLOSET ORGANIZER_BLACK_65.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (66, 42, 2, N'DORM TRUNK_NAVY_66.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (67, 43, 6, N'BATH TOWEL SET_CYAN_67.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (68, 44, 3, N'WASHCLOTH SET_BLACK_68.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (69, 45, 6, N'MESH LAUNDRY BAG_CYAN_69.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (70, 46, 10, N'AREA RUG_GRAY_70.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (71, 47, 3, N'REVERSIBLE DUVET COVER_BLACK_71.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (72, 48, 2, N'PILLOWCASE SET_NAVY_72.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (73, 49, 1, N'SHEET SET_WHITE_73.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (74, 50, 12, N'THROW PILLOW_SILVER_74.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (75, 51, 0, N'BODY PILLOW_PINK_75.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (76, 53, 0, N'BEACH TOWEL_PINK_76.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (77, 54, 7, N'BEACH TOTE_ORANGE_77.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (78, 55, 6, N'KNEE SOCKS_CYAN_78.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (79, 56, 3, N'FANNY PACK_BLACK_79.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (80, 57, 4, N'ANKLE SOCKS SET_BLUE_80.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (81, 58, 0, N'CHUG MUG_PINK_81.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (82, 59, 8, N'IPHONE 6 CASE_LIME_82.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (83, 60, 6, N'WATER BOTTLE_CYAN_83.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (84, 61, 0, N'BACKPACK_PINK_84.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (85, 61, 3, N'BACKPACK_BLACK_85.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (86, 61, 7, N'BACKPACK_ORANGE_86.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (87, 61, 6, N'BACKPACK_CYAN_87.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (88, 62, 0, N'DUFFLE BAG_PINK_88.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (89, 62, 3, N'DUFFLE BAG_BLACK_89.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (90, 62, 9, N'DUFFLE BAG_AQUAMARINE_90.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (91, 62, 10, N'DUFFLE BAG_GRAY_91.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (92, 63, 0, N'CAMPUS BACKPACK_PINK_92.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (93, 63, 1, N'CAMPUS BACKPACK_WHITE_93.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (94, 1, 8, N'LIMITED EDITION BOYFRIEND HALF-ZIP_LIME_94.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (95, 1, 3, N'LIMITED EDITION BOYFRIEND HALF-ZIP_BLACK_95.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (96, 2, 1, N'LIMITED EDITION COLLEGIATE CREW_WHITE_96.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (97, 4, 3, N'PINK ULTIMATE YOGA LEGGINGS_BLACK_97.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (98, 6, 9, N'RINGER TANK_AQUAMARINE_98.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (99, 7, 3, N'SLOUCHY CREW_BLACK_99.jpg')
GO
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (100, 7, 11, N'SLOUCHY CREW_YELLOW_100.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (101, 8, 10, N'SKINNY BOYFRIEND PANT_GRAY_101.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (102, 8, 0, N'SKINNY BOYFRIEND PANT_PINK_102.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (103, 8, 10, N'SKINNY BOYFRIEND PANT_GRAY_103.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (104, 8, 13, N'SKINNY BOYFRIEND PANT_RUBY WINE_104.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (105, 9, 0, N'PERFECT ZIP HOODIE_PINK_105.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (106, 10, 9, N'PERFECT FULL-ZIP HOODIE_AQUAMARINE_106.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (107, 11, 10, N'GYM PANT_GRAY_107.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (108, 13, 8, N'ANORAK FULL-ZIP_LIME_108.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (109, 14, 0, N'LOW BACK TANK_PINK_109.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (110, 14, 11, N'LOW BACK TANK_YELLOW_110.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (111, 14, 6, N'LOW BACK TANK_CYAN_111.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (112, 14, 6, N'LOW BACK TANK_CYAN_112.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (113, 15, 0, N'HIGH-LOW TANK_PINK_113.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (114, 15, 6, N'HIGH-LOW TANK_CYAN_114.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (115, 15, 8, N'HIGH-LOW TANK_LIME_115.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (116, 16, 6, N'CREWNECK TEE_CYAN_116.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (117, 17, 0, N'CROP MUSCLE TANK_PINK_117.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (118, 19, 10, N'RACERBACK TANK_GRAY_118.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (119, 17, 11, N'CROP MUSCLE TANK_YELLOW_119.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (120, 17, 1, N'CROP MUSCLE TANK_WHITE_120.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (121, 17, 1, N'CROP MUSCLE TANK_WHITE_121.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (122, 17, 4, N'CROP MUSCLE TANK_BLUE_122.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (123, 18, 0, N'CUTOUT TEE_PINK_123.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (124, 18, 0, N'CUTOUT TEE_PINK_124.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (125, 20, 6, N'CROP TANK_CYAN_125.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (126, 20, 6, N'CROP TANK_CYAN_126.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (127, 20, 3, N'CROP TANK_BLACK_127.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (128, 20, 3, N'CROP TANK_BLACK_128.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (129, 20, 0, N'CROP TANK_PINK_129.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (130, 5, 1, N'OPEN BACK VARSITY CREW TEE_WHITE_130.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (131, 5, 0, N'OPEN BACK VARSITY CREW TEE_PINK_131.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (132, 6, 1, N'RINGER TANK_WHITE_132.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (133, 7, 0, N'SLOUCHY CREW_PINK_133.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (134, 7, 10, N'SLOUCHY CREW_GRAY_134.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (135, 7, 11, N'SLOUCHY CREW_YELLOW_135.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (136, 64, 14, N'DEEP V-NECK TANK_NEONRED_136.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (137, 64, 14, N'DEEP V-NECK TANK_NEONRED_137.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (138, 64, 0, N'DEEP V-NECK TANK_PINK_138.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (139, 64, 2, N'DEEP V-NECK TANK_NAVY_139.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (140, 64, 3, N'DEEP V-NECK TANK_BLACK_140.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (141, 64, 8, N'DEEP V-NECK TANK_LIME_141.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (142, 19, 10, N'RACERBACK TANK_GRAY_142.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (143, 19, 3, N'RACERBACK TANK_BLACK_143.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (144, 19, 0, N'RACERBACK TANK_PINK_144.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (145, 18, 2, N'CUTOUT TEE_NAVY_145.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (146, 18, 15, N'CUTOUT TEE_TEAL_146.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (147, 21, 8, N'SCOOPNECK TEE_LIME_147.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (148, 21, 0, N'SCOOPNECK TEE_PINK_148.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (149, 23, 3, N'PINK ULTIMATE GYM PANT_BLACK_149.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (150, 23, 12, N'PINK ULTIMATE GYM PANT_SILVER_150.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (151, 23, 10, N'PINK ULTIMATE GYM PANT_GRAY_151.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (152, 23, 10, N'PINK ULTIMATE GYM PANT_GRAY_152.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (153, 24, 11, N'PINK ULTIMATE HALF-ZIP_YELLOW_153.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (154, 24, 11, N'PINK ULTIMATE HALF-ZIP_YELLOW_154.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (155, 25, 8, N'PINK ULTIMATE FULL-ZIP HOODIE_LIME_155.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (156, 25, 11, N'PINK ULTIMATE FULL-ZIP HOODIE_YELLOW_156.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (157, 25, 11, N'PINK ULTIMATE FULL-ZIP HOODIE_YELLOW_157.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (158, 26, 0, N'PINK ULTIMATE YOGA SHORTIE_PINK_158.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (159, 26, 11, N'PINK ULTIMATE YOGA SHORTIE_YELLOW_159.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (160, 26, 11, N'PINK ULTIMATE YOGA SHORTIE_YELLOW_160.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (161, 26, 0, N'PINK ULTIMATE YOGA SHORTIE_PINK_161.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (162, 27, 10, N'SKINNY COLLEGIATE PANT_GRAY_162.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (163, 27, 10, N'SKINNY COLLEGIATE PANT_GRAY_163.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (164, 28, 15, N'VARSITY CREW_TEAL_164.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (165, 28, 15, N'VARSITY CREW_TEAL_165.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (166, 28, 8, N'VARSITY CREW_LIME_166.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (167, 28, 8, N'VARSITY CREW_LIME_167.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (168, 28, 10, N'VARSITY CREW_GRAY_168.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (169, 28, 10, N'VARSITY CREW_GRAY_169.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (170, 28, 10, N'VARSITY CREW_GRAY_170.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (171, 28, 0, N'VARSITY CREW_PINK_171.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (172, 28, 0, N'VARSITY CREW_PINK_172.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (173, 28, 13, N'VARSITY CREW_RUBYWINE_173.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (174, 28, 13, N'VARSITY CREW_RUBYWINE_174.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (175, 28, 1, N'VARSITY CREW_WHITE_175.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (176, 29, 0, N'BOYFRIEND POCKET TANK_PINK_176.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (177, 29, 7, N'BOYFRIEND POCKET TANK_ORANGE_177.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (178, 30, 1, N'ULTIMATE HALF-ZIP_WHITE_178.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (179, 30, 8, N'ULTIMATE HALF-ZIP_LIME_179.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (180, 30, 8, N'ULTIMATE HALF-ZIP_LIME_180.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (181, 30, 10, N'ULTIMATE HALF-ZIP_GRAY_181.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (182, 30, 10, N'ULTIMATE HALF-ZIP_GRAY_182.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (183, 30, 15, N'ULTIMATE HALF-ZIP_TEAL_183.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (184, 30, 0, N'ULTIMATE HALF-ZIP_PINK_184.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (185, 30, 0, N'ULTIMATE HALF-ZIP_PINK_185.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (186, 31, 3, N'BOYFRIEND PANT_BLACK_186.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (187, 31, 0, N'BOYFRIEND PANT_PINK_187.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (188, 31, 0, N'BOYFRIEND PANT_PINK_188.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (189, 31, 1, N'BOYFRIEND PANT_WHITE_189.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (190, 31, 1, N'BOYFRIEND PANT_WHITE_190.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (191, 31, 4, N'BOYFRIEND PANT_BLUE_191.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (192, 31, 4, N'BOYFRIEND PANT_BLUE_192.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (193, 31, 10, N'BOYFRIEND PANT_GRAY_193.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (194, 31, 10, N'BOYFRIEND PANT_GRAY_194.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (195, 10, 3, N'PERFECT FULL-ZIP HOODIE_BLACK_195.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (196, 10, 8, N'PERFECT FULL-ZIP HOODIE_LIME_196.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (197, 10, 8, N'PERFECT FULL-ZIP HOODIE_LIME_197.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (198, 10, 14, N'PERFECT FULL-ZIP HOODIE_NEONRED_198.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (199, 10, 14, N'PERFECT FULL-ZIP HOODIE_NEONRED_199.jpg')
GO
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (200, 32, 1, N'PERFECT FULL-ZIP_WHITE_200.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (201, 33, 10, N'ATHLETIC TEE_GRAY_201.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (202, 33, 10, N'ATHLETIC TEE_GRAY_202.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (203, 33, 0, N'ATHLETIC TEE_PINK_203.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (204, 35, 3, N'V-NECK TEE_BLACK_204.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (205, 35, 0, N'V-NECK TEE_PINK_205.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (206, 35, 0, N'V-NECK TEE_PINK_206.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (207, 35, 1, N'V-NECK TEE_WHITE_207.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (208, 35, 10, N'V-NECK TEE_GRAY_208.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (209, 36, 3, N'BEACH SHORTS_BLACK_209.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (210, 36, 3, N'BEACH SHORTS_BLACK_210.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (211, 37, 3, N'DENIM SHORTS_BLACK_211.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (212, 37, 10, N'DENIM SHORTS_GRAY_212.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (213, 65, 7, N'BOYFRIEND TANK_ORANGE_213.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (214, 65, 7, N'BOYFRIEND TANK_ORANGE_214.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (215, 65, 6, N'BOYFRIEND TANK_CYAN_215.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (216, 65, 6, N'BOYFRIEND TANK_CYAN_216.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (217, 65, 0, N'BOYFRIEND TANK_PINK_217.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (218, 41, 4, N'CLOSET ORGANIZER_BLUE_218.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (219, 41, 4, N'CLOSET ORGANIZER_BLUE_219.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (220, 41, 16, N'CLOSET ORGANIZER_BROWN_220.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (221, 43, 12, N'BATH TOWEL SET_SILVER_221.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (222, 43, 12, N'BATH TOWEL SET_SILVER_222.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (223, 43, 3, N'BATH TOWEL SET_BLACK_223.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (224, 66, 0, N'COLLEGIATE CREW_PINK_224.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (225, 66, 0, N'COLLEGIATE CREW_PINK_225.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (226, 66, 4, N'COLLEGIATE CREW_BLUE_226.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (227, 66, 11, N'COLLEGIATE CREW_YELLOW_227.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (228, 66, 11, N'COLLEGIATE CREW_YELLOW_228.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (229, 66, 10, N'COLLEGIATE CREW_GRAY_229.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (230, 67, 0, N'TRIANGLE BIKINI TOP_PINK_230.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (231, 67, 0, N'TRIANGLE BIKINI TOP_PINK_231.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (232, 67, 3, N'TRIANGLE BIKINI TOP_BLACK_232.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (233, 67, 3, N'TRIANGLE BIKINI TOP_BLACK_233.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (234, 67, 4, N'TRIANGLE BIKINI TOP_BLUE_234.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (235, 67, 4, N'TRIANGLE BIKINI TOP_BLUE_235.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (236, 67, 5, N'TRIANGLE BIKINI TOP_PURPLE_236.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (237, 67, 11, N'TRIANGLE BIKINI TOP_YELLOW_237.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (238, 67, 10, N'TRIANGLE BIKINI TOP_GRAY_238.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (239, 67, 7, N'TRIANGLE BIKINI TOP_ORANGE_239.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (240, 67, 7, N'TRIANGLE BIKINI TOP_ORANGE_240.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (241, 67, 6, N'TRIANGLE BIKINI TOP_CYAN_241.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (242, 67, 6, N'TRIANGLE BIKINI TOP_CYAN_242.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (243, 67, 1, N'TRIANGLE BIKINI TOP_WHITE_243.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (244, 67, 4, N'TRIANGLE BIKINI TOP_BLUE_244.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (245, 67, 8, N'TRIANGLE BIKINI TOP_LIME_245.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (246, 67, 8, N'TRIANGLE BIKINI TOP_LIME_246.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (247, 67, 14, N'TRIANGLE BIKINI TOP_NEONRED_247.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (248, 67, 14, N'TRIANGLE BIKINI TOP_NEONRED_248.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (249, 68, 0, N'PUSH-UP WRAP TRIANGLE TOP_PINK_249.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (250, 68, 0, N'PUSH-UP WRAP TRIANGLE TOP_PINK_250.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (251, 68, 0, N'PUSH-UP WRAP TRIANGLE TOP_PINK_251.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (252, 68, 1, N'PUSH-UP WRAP TRIANGLE TOP_WHITE_252.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (253, 68, 1, N'PUSH-UP WRAP TRIANGLE TOP_WHITE_253.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (254, 68, 8, N'PUSH-UP WRAP TRIANGLE TOP_LIME_254.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (255, 68, 8, N'PUSH-UP WRAP TRIANGLE TOP_LIME_255.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (256, 68, 9, N'PUSH-UP WRAP TRIANGLE TOP_AQUAMARINE_256.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (257, 68, 9, N'PUSH-UP WRAP TRIANGLE TOP_AQUAMARINE_257.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (258, 68, 11, N'PUSH-UP WRAP TRIANGLE TOP_YELLOW_258.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (259, 68, 13, N'PUSH-UP WRAP TRIANGLE TOP_RUBYWINE_259.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (260, 68, 13, N'PUSH-UP WRAP TRIANGLE TOP_RUBYWINE_260.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (261, 68, 3, N'PUSH-UP WRAP TRIANGLE TOP_BLACK_261.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (262, 68, 3, N'PUSH-UP WRAP TRIANGLE TOP_BLACK_262.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (263, 69, 16, N'BODY WRAP BANDEAU TOP_BROWN_263.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (264, 69, 1, N'BODY WRAP BANDEAU TOP_WHITE_264.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (265, 69, 1, N'BODY WRAP BANDEAU TOP_WHITE_265.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (266, 69, 8, N'BODY WRAP BANDEAU TOP_LIME_266.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (267, 69, 8, N'BODY WRAP BANDEAU TOP_LIME_267.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (268, 69, 3, N'BODY WRAP BANDEAU TOP_BLACK_268.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (269, 69, 3, N'BODY WRAP BANDEAU TOP_BLACK_269.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (270, 69, 4, N'BODY WRAP BANDEAU TOP_BLUE_270.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (271, 69, 4, N'BODY WRAP BANDEAU TOP_BLUE_271.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (272, 70, 4, N'PUSH-UP FLOUNCE TOP_BLUE_272.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (273, 70, 4, N'PUSH-UP FLOUNCE TOP_BLUE_273.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (274, 70, 6, N'PUSH-UP FLOUNCE TOP_CYAN_274.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (275, 70, 6, N'PUSH-UP FLOUNCE TOP_CYAN_275.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (276, 71, 11, N'PLUNGE BIKINI TOP_YELLOW_276.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (277, 71, 11, N'PLUNGE BIKINI TOP_YELLOW_277.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (278, 71, 14, N'PLUNGE BIKINI TOP_NEONRED_278.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (279, 71, 14, N'PLUNGE BIKINI TOP_NEONRED_279.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (280, 72, 3, N'SCALLOPED TRIANGLE BIKINI TOP_BLACK_280.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (281, 73, 5, N'RUCHED BANDEAU_PURPLE_281.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (282, 73, 5, N'RUCHED BANDEAU_PURPLE_282.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (283, 73, 5, N'RUCHED BANDEAU_PURPLE_283.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (284, 74, 3, N'ZIP HALTER ONE-PIECE_BLACK_284.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (285, 74, 3, N'ZIP HALTER ONE-PIECE_BLACK_285.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (286, 75, 3, N'STRAPPY-BACK ONE-PIECE_BLACK_286.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (287, 75, 3, N'STRAPPY-BACK ONE-PIECE_BLACK_287.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (288, 76, 1, N'BODY WRAP TOP_WHITE_288.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (289, 76, 1, N'BODY WRAP TOP_WHITE_289.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (290, 76, 7, N'BODY WRAP TOP_ORANGE_290.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (291, 76, 7, N'BODY WRAP TOP_ORANGE_291.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (292, 76, 3, N'BODY WRAP TOP_BLACK_292.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (293, 76, 3, N'BODY WRAP TOP_BLACK_293.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (294, 76, 8, N'BODY WRAP TOP_LIME_294.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (295, 76, 8, N'BODY WRAP TOP_LIME_295.jpg')
INSERT [dbo].[Picture] ([PictureID], [ClothID], [ColorID], [ImageLink]) VALUES (296, 76, 0, N'')
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (1, 1, 8, 1, 100)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (2, 1, 3, 1, 32)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (3, 2, 9, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (4, 2, 1, 3, 1999)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (5, 3, 1, 2, 31)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (6, 3, 2, 3, 40)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (7, 4, 3, 2, 999)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (8, 4, 8, 1, 996)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (9, 5, 3, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (10, 5, 1, 3, 998)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (11, 6, 1, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (12, 6, 9, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (13, 7, 0, 3, 23)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (14, 7, 4, 2, 44)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (15, 8, 4, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (16, 8, 3, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (17, 9, 0, 4, 500)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (18, 9, 9, 3, 500)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (19, 10, 3, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (20, 10, 9, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (21, 50, 12, 3, 21)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (22, 52, 0, 0, 10)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (23, 1, 0, 2, 200)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (24, 52, 4, 0, 10)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (25, 6, 6, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (26, 7, 10, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (27, 11, 0, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (28, 11, 10, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (29, 12, 3, 3, 999)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (30, 12, 8, 3, 99)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (31, 12, 10, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (32, 13, 11, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (33, 14, 0, 3, 999)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (34, 16, 7, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (35, 17, 0, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (36, 18, 8, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (37, 19, 8, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (38, 20, 6, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (39, 15, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (40, 15, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (41, 15, 8, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (42, 15, 10, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (43, 21, 10, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (44, 22, 8, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (45, 23, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (46, 24, 4, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (47, 25, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (48, 26, 3, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (49, 27, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (50, 28, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (51, 30, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (52, 29, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (53, 31, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (54, 32, 12, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (55, 33, 10, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (56, 34, 9, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (57, 35, 0, 0, 2000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (58, 36, 2, 0, 2000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (59, 37, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (60, 38, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (61, 38, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (62, 38, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (63, 39, 0, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (64, 39, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (65, 40, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (66, 40, 4, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (67, 41, 4, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (68, 42, 2, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (69, 43, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (70, 44, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (71, 45, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (72, 46, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (73, 47, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (74, 48, 2, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (75, 49, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (76, 51, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (77, 53, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (78, 54, 7, 0, 999)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (79, 55, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (80, 56, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (81, 57, 4, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (82, 58, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (83, 59, 8, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (84, 60, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (85, 61, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (86, 61, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (87, 61, 7, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (88, 61, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (89, 62, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (90, 62, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (91, 62, 9, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (92, 62, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (93, 63, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (94, 63, 1, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (95, 7, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (96, 7, 11, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (97, 8, 10, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (98, 8, 13, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (99, 13, 8, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (100, 14, 11, 2, 1000)
GO
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (101, 14, 6, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (102, 14, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (103, 16, 6, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (104, 17, 11, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (105, 17, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (106, 17, 4, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (107, 18, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (108, 20, 3, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (109, 20, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (110, 11, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (111, 11, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (112, 11, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (113, 12, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (114, 12, 8, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (115, 5, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (116, 5, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (117, 5, 0, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (118, 5, 3, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (119, 5, 3, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (120, 6, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (121, 6, 6, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (122, 64, 14, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (123, 64, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (124, 64, 8, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (125, 64, 2, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (126, 64, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (127, 64, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (128, 64, 2, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (129, 19, 8, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (130, 19, 8, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (131, 19, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (132, 19, 3, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (133, 19, 3, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (134, 19, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (135, 19, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (136, 19, 0, 3, 2000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (137, 19, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (138, 19, 10, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (139, 19, 10, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (140, 64, 0, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (141, 64, 0, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (142, 64, 0, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (143, 64, 3, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (144, 20, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (145, 20, 0, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (146, 18, 15, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (147, 18, 15, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (148, 18, 2, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (149, 21, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (150, 21, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (151, 21, 8, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (152, 21, 0, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (153, 23, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (154, 23, 3, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (155, 23, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (156, 23, 10, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (157, 23, 12, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (158, 23, 12, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (159, 24, 11, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (160, 24, 11, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (161, 24, 11, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (162, 25, 8, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (163, 25, 8, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (164, 25, 8, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (165, 25, 11, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (166, 25, 11, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (167, 26, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (168, 26, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (169, 26, 0, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (170, 26, 0, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (171, 26, 11, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (172, 26, 11, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (173, 26, 11, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (174, 27, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (175, 27, 10, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (176, 27, 10, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (177, 28, 15, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (178, 28, 15, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (179, 28, 15, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (180, 28, 13, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (181, 28, 13, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (182, 28, 8, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (183, 28, 8, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (184, 28, 8, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (185, 28, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (186, 28, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (187, 28, 10, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (188, 29, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (189, 29, 7, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (190, 29, 7, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (191, 30, 1, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (192, 30, 0, 0, 999)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (193, 30, 0, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (194, 30, 8, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (195, 30, 8, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (196, 30, 15, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (197, 30, 15, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (198, 30, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (199, 30, 10, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (200, 31, 0, 1, 1000)
GO
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (201, 31, 0, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (202, 31, 0, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (203, 31, 0, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (204, 31, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (205, 31, 1, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (206, 31, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (207, 31, 1, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (208, 31, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (209, 31, 3, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (210, 31, 4, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (211, 31, 4, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (212, 31, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (213, 31, 10, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (214, 1, 0, 1, 900)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (215, 1, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (216, 10, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (217, 10, 3, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (218, 10, 14, 0, 2000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (219, 10, 14, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (220, 10, 8, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (221, 10, 8, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (222, 9, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (223, 9, 0, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (224, 9, 9, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (225, 13, 11, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (226, 13, 8, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (227, 32, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (228, 32, 1, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (229, 32, 1, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (230, 33, 0, 0, 2000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (231, 33, 10, 0, 2000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (232, 33, 10, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (233, 35, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (234, 35, 0, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (235, 35, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (236, 35, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (237, 35, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (238, 35, 3, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (239, 36, 3, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (240, 36, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (241, 37, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (242, 37, 10, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (243, 37, 3, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (244, 37, 3, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (245, 65, 0, 0, 2000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (246, 65, 7, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (247, 65, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (248, 65, 7, 0, 1001)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (249, 65, 7, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (250, 41, 16, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (251, 41, 4, 0, 2000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (252, 43, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (253, 43, 12, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (254, 66, 0, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (255, 66, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (256, 66, 0, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (257, 66, 0, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (258, 66, 0, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (259, 66, 11, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (260, 66, 11, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (261, 66, 11, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (262, 66, 11, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (263, 66, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (264, 66, 10, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (265, 66, 4, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (266, 67, 0, 0, 2000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (267, 67, 0, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (268, 67, 0, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (269, 67, 0, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (270, 67, 0, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (271, 67, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (272, 67, 3, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (273, 67, 3, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (274, 67, 3, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (275, 67, 3, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (276, 67, 4, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (277, 67, 4, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (278, 67, 4, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (279, 67, 4, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (280, 67, 4, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (281, 67, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (282, 67, 6, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (283, 67, 6, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (284, 67, 6, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (285, 67, 6, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (286, 67, 7, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (287, 67, 7, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (288, 67, 7, 3, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (289, 67, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (290, 67, 1, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (291, 67, 11, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (292, 67, 11, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (293, 67, 10, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (294, 67, 10, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (295, 67, 5, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (296, 67, 5, 2, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (297, 67, 8, 1, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (298, 67, 14, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (299, 68, 13, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (300, 68, 0, 0, 1000)
GO
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (301, 68, 11, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (302, 68, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (303, 68, 8, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (304, 68, 9, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (305, 68, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (306, 69, 16, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (307, 69, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (308, 69, 8, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (309, 69, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (310, 69, 4, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (311, 70, 4, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (312, 70, 6, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (313, 71, 13, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (314, 71, 11, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (315, 72, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (316, 73, 5, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (317, 74, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (318, 74, 3, 4, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (319, 75, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (320, 76, 1, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (321, 76, 7, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (322, 76, 3, 0, 1000)
INSERT [dbo].[Quantity] ([QuantityID], [ClothID], [ColorID], [SizeID], [QuantityOfClothes]) VALUES (323, 76, 8, 0, 1000)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (1, 2, 1014, 1, CAST(0xEA390B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (2, 3, 1014, 5, CAST(0x113A0B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (3, 3, 1020, 2, NULL, 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (4, 2, 1015, 1, CAST(0x12380B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (5, 3, 1022, 2, CAST(0x39390B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (6, 4, 1018, 3, CAST(0x462F0B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (7, 2, 1015, 4, CAST(0xD6370B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (8, 1, 1019, 5, CAST(0x4F370B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (9, 2, 1022, 3, CAST(0x9B360B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (10, 2, 1018, 1, CAST(0x3C390B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (11, 4, 1020, 2, CAST(0x3C390B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (12, 2, 1022, 3, CAST(0xAE370B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (13, 3, 1014, 3, CAST(0x133A0B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (14, 2, 1016, 3, CAST(0x25380B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (15, 1, 1014, 5, CAST(0x133A0B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (16, 2, 1014, 4, CAST(0x133A0B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (17, 3, 1014, 4, CAST(0x48390B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (18, 4, 1017, 3, CAST(0x50390B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (19, 2, 1015, 5, CAST(0x50390B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (20, 3, 1016, 6, CAST(0x50390B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (21, 4, 1014, 6, CAST(0x51390B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (22, 5, 1018, 4, CAST(0x51390B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (23, 6, 1020, 6, CAST(0x51390B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (24, 7, 1022, 3, CAST(0xC7370B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (25, 8, 1014, 4, CAST(0x272D0B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (26, 4, 1016, 3, CAST(0xAA2E0B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (27, 5, 1014, 1, CAST(0x39390B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (28, 3, 1014, 1, CAST(0x13380B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (29, 2, 1014, 4, CAST(0xFF390B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (30, 10, 1014, 2, CAST(0x113A0B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (31, 56, 1014, 4, CAST(0x133A0B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (32, 30, 1014, 1, CAST(0xFA390B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (33, 33, 1014, 1, CAST(0xFA390B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (34, 26, 1014, 2, CAST(0xFA390B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (35, 4, 1014, 1, CAST(0xFA390B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (36, 35, 1014, 4, CAST(0x103A0B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (37, 29, 1014, 1, CAST(0x103A0B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (38, 18, 1014, 2, CAST(0x113A0B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (39, 5, 1014, 3, CAST(0x133A0B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (40, 7, 1014, 1, CAST(0x113A0B00 AS Date), 1)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (41, 78, 1014, 2, CAST(0x133A0B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (42, 192, 1014, 1, CAST(0x133A0B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (43, 63, 1014, 1, CAST(0x133A0B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (44, 57, 1014, 1, CAST(0x133A0B00 AS Date), 0)
INSERT [dbo].[ShoppingCart] ([CartID], [QuantityID], [UserID], [QuantityOfClothes], [BuyDate], [Done]) VALUES (45, 271, 1014, 1, CAST(0x133A0B00 AS Date), 0)
INSERT [dbo].[Size] ([SizeID], [SizeDescription]) VALUES (0, N'S')
INSERT [dbo].[Size] ([SizeID], [SizeDescription]) VALUES (1, N'M')
INSERT [dbo].[Size] ([SizeID], [SizeDescription]) VALUES (2, N'L')
INSERT [dbo].[Size] ([SizeID], [SizeDescription]) VALUES (3, N'XL')
INSERT [dbo].[Size] ([SizeID], [SizeDescription]) VALUES (4, N'XXL')
SET ANSI_PADDING ON

GO
/****** Object:  Index [clothes_name_unq]    Script Date: 6/16/2015 12:09:59 AM ******/
ALTER TABLE [dbo].[Clothes] ADD  CONSTRAINT [clothes_name_unq] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clothes]  WITH CHECK ADD  CONSTRAINT [FK_Clothes_Catalogue] FOREIGN KEY([CatID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Clothes] CHECK CONSTRAINT [FK_Clothes_Catalogue]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Clothes] FOREIGN KEY([ClothID])
REFERENCES [dbo].[Clothes] ([ID])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_Clothes]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Color] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Color] ([ID])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_Color]
GO
ALTER TABLE [dbo].[Quantity]  WITH CHECK ADD  CONSTRAINT [FK_Quantity_Cloth] FOREIGN KEY([ClothID])
REFERENCES [dbo].[Clothes] ([ID])
GO
ALTER TABLE [dbo].[Quantity] CHECK CONSTRAINT [FK_Quantity_Cloth]
GO
ALTER TABLE [dbo].[Quantity]  WITH CHECK ADD  CONSTRAINT [FK_Quantity_Color] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Color] ([ID])
GO
ALTER TABLE [dbo].[Quantity] CHECK CONSTRAINT [FK_Quantity_Color]
GO
ALTER TABLE [dbo].[Quantity]  WITH CHECK ADD  CONSTRAINT [FK_Quantity_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[Quantity] CHECK CONSTRAINT [FK_Quantity_Size]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Quantity1] FOREIGN KEY([QuantityID])
REFERENCES [dbo].[Quantity] ([QuantityID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_Sale_Quantity1]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_Sale_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_Sale_User]
GO
USE [master]
GO
ALTER DATABASE [PinkyDB] SET  READ_WRITE 
GO
