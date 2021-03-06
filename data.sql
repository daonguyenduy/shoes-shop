USE [master]
GO
/****** Object:  Database [PRJ301_SE08D_Assignment_Group2]    Script Date: 11/2/2021 9:30:48 AM ******/
CREATE DATABASE [PRJ301_SE08D_Assignment_Group2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_SE08D_Assignment_Group2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\PRJ301_SE08D_Assignment_Group2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_SE08D_Assignment_Group2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\PRJ301_SE08D_Assignment_Group2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_SE08D_Assignment_Group2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301_SE08D_Assignment_Group2', N'ON'
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET QUERY_STORE = OFF
GO
USE [PRJ301_SE08D_Assignment_Group2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [PRJ301_SE08D_Assignment_Group2]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/2/2021 9:30:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [nvarchar](20) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 11/2/2021 9:30:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[OrderID] [int] NULL,
	[productId] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/2/2021 9:30:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [date] NULL,
	[total] [float] NULL,
	[userId] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/2/2021 9:30:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [nvarchar](20) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[status] [nvarchar](10) NULL,
	[image] [nvarchar](200) NULL,
	[categoryID] [nvarchar](20) NULL,
 CONSTRAINT [PK_Clothes] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/2/2021 9:30:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullName] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (N'1', N'Shoes')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (N'2', N'Clothes')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (N'3', N'Accessories')
GO
SET IDENTITY_INSERT [dbo].[Details] ON 

INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (1, 100, 1, 1, N'123123')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (2, 1400000, 1, 2, N'9')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (3, 1400000, 2, 3, N'9')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (4, 1400000, 2, 4, N'9')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (19, 1400000, 2, 16, N'99')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (5, 1230000, 3, 5, N'123')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (6, 1400000, 1, 6, N'9')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (7, 1000000, 1, 7, N'1')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (8, 1400000, 2, 8, N'9')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (9, 1000000, 1, 9, N'1')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (10, 960000, 2, 9, N'10')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (11, 500000, 1, 10, N'12')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (12, 1200000, 2, 10, N'14')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (13, 1200000, 1, 11, N'14')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (14, 1200000, 1, 12, N'14')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (15, 1200000, 2, 13, N'14')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (16, 1200000, 1, 14, N'14')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (17, 960000, 2, 14, N'10')
INSERT [dbo].[Details] ([detailID], [price], [quantity], [OrderID], [productId]) VALUES (18, 960000, 3, 15, N'10')
SET IDENTITY_INSERT [dbo].[Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (1, CAST(N'2021-07-07' AS Date), 100, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (2, CAST(N'2021-07-20' AS Date), 1400000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (3, CAST(N'2021-07-20' AS Date), 2800000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (4, CAST(N'2021-07-20' AS Date), 2800000, N'user1')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (16, CAST(N'2021-07-21' AS Date), 2800000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (5, CAST(N'2021-07-20' AS Date), 3690000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (6, CAST(N'2021-07-20' AS Date), 1400000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (7, CAST(N'2021-07-20' AS Date), 1000000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (8, CAST(N'2021-07-20' AS Date), 2800000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (9, CAST(N'2021-07-20' AS Date), 2920000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (10, CAST(N'2021-07-20' AS Date), 2900000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (11, CAST(N'2021-07-20' AS Date), 1200000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (12, CAST(N'2021-07-20' AS Date), 1200000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (13, CAST(N'2021-07-20' AS Date), 2400000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (14, CAST(N'2021-07-20' AS Date), 3120000, N'user')
INSERT [dbo].[Orders] ([OrderID], [DateOrder], [total], [userId]) VALUES (15, CAST(N'2021-07-20' AS Date), 2880000, N'user')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'1', N'Shoes Adidas1', N'All the touches of comfort you need with a clean, versatile look: the adidas1  Sneaker.', 1000000, 9, N'Active', N'giayadidas1.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'10', N'Shoes New Balance3', N'Get moving in the  New Balance3  Running Shoe.', 960000, 6, N'Active', N'giaynb3.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'100', N'Clothes new', N'good', 1000000, 8, N'Inactive', N'', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'101', N'Clothes new ', N'asdasd', 1000000, 3, N'Inactive', N'aoadidas4.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'11', N'Shoes Pumma11123', N'Stay bold in the Puma1 Shoe.', 1000004, 8, N'Active', N'giaypuma1.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'12', N'Shoes Adidas8', N'Women''s Sneaker from adidas', 500000, 2, N'Active', N'giayadidas8.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'14', N'Shoes Adidas10', N'The lightweight, breathable Women''s adidas10 Super Sneaker keeps you going all day in comfort and style.', 1200000, 4, N'Active', N'giayadidas10.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'18', N'Shoes New Balance5', N'You’ll feel revitalized as you move out and about in the athletic fashion style of the New Balance5 Sneaker from New Balance.', 890000, 3, N'Active', N'giaynb5.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'19', N'Shoes New Balance6', N'Keep active  going in all-day comfort with the New Balance6 Sneaker.', 1100000, 3, N'Active', N'giaynb6.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'2', N'Shoes Adidas2', N'Foam pods at the heel fill the negative space of the foot, creating a seamless connection between boot and body. The two medial studs use a softer compound, so they bend upon contact for a smooth first touch.', 1200000, 2, N'Active', N'giayadidas2.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'20', N'Shoes New Balance7', N'Get ready for your next workout with the New Balance7 Training Shoe.', 780000, 5, N'Active', N'giaynb7.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'21', N'Shoes Puma2', N'Get comfort while you move in the Puma2 Running Shoe.', 900000, 5, N'Active', N'giaypuma2.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'22', N'Shoes Puma3', N'A shoe to take you anywhere:Puma3 Sneaker.', 1000000, 3, N'Active', N'giaypuma3.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'23', N'Shoes Puma4', N'Get casual comfort in the Puma4
Sneaker.', 1100000, 1, N'Active', N'giaypuma4.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'24', N'Jacket Adidas1', N'It''s not just about getting in the moment. It''s about staying there. Quiet the outside, and inside, noise when you zip into this adidas hoodie. While distractions are inevitable, the comfort of this sweatshirt helps you focus on the game ahead. Soft, slightly-stretchy cotton, moisture-absorbing fabric, pre-shaped sleeves – every part of the design is geared for you to walk on to play feeling cool and ready.

', 150000, 4, N'Active', N'aoadidas1.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'25', N'T-shirt Adidas2', N'No need to overcomplicate things. Keep your adidas look real, real chill when you wear this t-shirt. Contrast details give you understated style to take it from an ordinary tee to an above-average tee. So soft, you may want to wear it all the time.', 200000, 3, N'Active', N'aoadidas2.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'27', N'T-shirt Adidas4', N'Get all-day performance under the sun with this adidas golf polo shirt. Stay dry through warm weather in cool comfort then head to the clubhouse feeling fresh and ready for more', 310000, 1, N'Active', N'aoadidas4.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'28', N'Jacket New Balance1', N'Our Knit Training Jacket features NB DRY technology to wick away moisture during warm-ups, on the way to the game, or in the stands so players and fans alike can stay comfortable. The polyknit material offers a lightweight feel while the zippered hand pockets keep valuables close and secure. Add team names, crests or logos to this men''s jacket for a customized look.', 300000, 4, N'Active', N'aonb1.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'29', N'T-shirt Puma1', N'Make basic look good in this casual tee. Featuring a comfortable, classic fit and standout graphics, you''ll bring an edge to everyday style.', 120000, 2, N'Active', N'aopuma1.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'3', N'Shoes Adidas3', N'Your confidence consumes them. Your vision leaves them with nowhere to hide. Seize your unfair advantage and take control in these adidas Predator Mutator 20.3 football boots. The foot-hugging upper keeps you stable and in charge on artificial turf. The strike zone includes 3D-printed elements designed to up your shooting and passing accuracy.', 1100000, 3, N'Active', N'giayadidas3.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'30', N'Pants Adidas1', N'Wherever you are physically, make sure your mind is there as well. Stay present and focused in these adidas pants. Their comfort makes it easy to settle in, so you can turn your focus inwards and put distractions on hold. Whatever that looks like, these support it with their soft, slightly stretchy build. Moisture-absorbing AEROREADY helps too. Warming up or just nerves, it keeps you feeling cool and dry.', 200000, 3, N'Active', N'quanadidas1.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'32', N'Short Adidas3', N'There are other running shorts in your drawer, but these are the ones you reach for again and again. In fact, you''d rather wear these adidas Saturday Shorts a second day than pick a different pair. Breathable fabric absorbs moisture to keep you feeling dry on sprints and hill runs. So you come back from your run already excited about where you''ll go tomorrow.', 190000, 2, N'Active', N'quanadidas3.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'33', N'Pants New Balance1', N'Whether you are headed to break a sweat or max out with friends, our Tenacity Fleece Pant is the perfect companion. Featuring NB HEAT technology, this pant quickly wicks away sweat and captures warmth without adding bulk to your gym look.', 200000, 3, N'Active', N'quannb1.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'34', N'Short New Balance2', N'The Essentials Stacked Logo Short for men is designed for an athletic fit, which ensures it rises close to your body while skimming your hips and thighs. Along with the draw cord closer, these men''s shorts offer a snug, secure fit without compromising your range of motion. The French Terry knit provides a soft feel against your skin for added comfort.', 210000, 2, N'Active', N'quannb2.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'35', N'Short Puma3', N'Designed for style, engineered for performance and built for your active lifestyle.', 180000, 5, N'Active', N'quanpuma3.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'36', N'Tank New Balance2', N'The NB Ice technology promotes airflow to help keep you cool, while the recycled knit jersey front and knit mesh panel provide a breathable feel. Eye-catching pieced graphics, thoughtful color blocking, and a flattering relaxed fit ensure this tank keeps you running in style.', 310000, 4, N'Active', N'aonb2.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'37', N'Bra New Balance3', N'With stabilized front straps to help minimize vertical movement, the NB Pace Bra 3.0 is perfect for medium impact activities. Pull on this favorite sports bra for cycling, hiking, running or boxing. A supportive bottom band elastic with an eye-catching, refreshed logo design helps to keep everything in place.', 290000, 5, N'Active', N'aonb3.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'39', N'Tee New Balance5', N'Our NB Essentials Embroidered Tee is an instant casual classic. This short sleeve men’s shirt is crafted from soft and durable cotton jersey fabric with a relaxed fit that gives you room to move. An embroidered logo embellishment inspired by NB heritage styling adds a simple and stylish accent for a versatile everyday look you’ll love.', 198000, 4, N'Active', N'aonb5.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'4', N'Shoes Adidas4', N'Walls can''t contain you. Rivals can''t hold you back. On the court, you''re in control. Release your full force of nature in Predator Freak. These adidas turf football boots deliver support with a coated textile upper. 3D-printed Demonscale elements spread further across the foot to help you dominate the ball.', 1500000, 2, N'Active', N'giayadidas4.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'40', N'Tank New Balance6', N'Stay comfortable during your toughest runs with the Printed Accelerate Tank. This lightweight women''s running tank features NB DRY technology to wick away moisture so you stay cool and comfortable as you push past your personal best. It also features a sleek athletic fit and has reflective details to give your athletic wear added visibility with a touch of style.', 200000, 3, N'Active', N'aonb6.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'42', N'Leggings Adidas4', N'It''s not just about the mile count or the muscle tone. Running is about the time you set aside for your mind and body. Commit to yourself with every step in these adidas running leggings. They have a sweat-guard pocket to hold your phone, and they feature moisture-absorbing AEROREADY that keeps you fresh. Now cue up your running playlist and cruise.', 450000, 3, N'Active', N'quanadidas4.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'43', N'Short Adidas5', N'The wide waistband and sweat-wicking AEROREADY dial up the comfort. Integrated tights add coverage so you can slide and stretch with confidence.

This product is made with Primegreen, a series of high-performance recycled materials.', 400000, 2, N'Active', N'quanadidas5.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'44', N'Leggings NB', N'Made from a soft, breathable poly/span material in a high-rise fitted style, these leggings provide comfortable coverage that keeps you feeling secure and confident all day long.', 500000, 3, N'Active', N'quannb3.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'45', N'Pants New Balance4', N'Our Sport Style Optiks Woven Pant is designed for style seekers who demand fashion and function in their everyday wear. The woven fabric has a soft feel while the comfortable relaxed fit and volume leg openings give you room to move. ', 350000, 4, N'Active', N'quannb4.jpg', N'2')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'5', N'Shoes Adidas5', N'The only thing that makes defenders sweat more than seeing you on the pitch? Not seeing you at all. Pull on X Ghosted and discover next-level speed. The stretchy tongue on these adidas football boots means you''ll get into them in record time. Lightweight and semi-translucent, the foot-hugging Speedskin upper doesn''t just look fast, it feels fast. The low-cut silhouette with signature Clawcollar shape locks your foot into the boot for match-long stability and support.', 1300000, 3, N'Active', N'giayadidas5.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'50', N'Training Kit', N'Combo tool training arm and body.', 210000, 4, N'Active', N'dungcutapluyen.jpg', N'3')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'51', N'Wrist Support', N'ROMOTES CIRCULATION & HEALING. – Retains body heat to promote circulation and healing.PROVIDES COMPRESSION & SUPPORT. – Multi-directional stretch provides compression & support.VELCRO FASTENING. – Fully adjustable compression to injured muscles and tendons.', 190000, 7, N'Active', N'hotrocotay.jpg', N'3')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'52', N'Knee Support', N'ADDED PROTECTION & STABILISATION. – Additional neoprene circle pad provides added protection & stabilisation.

-	OVER-STITCHED EDGES.

-	PROMOTES CIRCULATION & HEALING. – Retains body heat to promote circulation and healing.

-	PROVIDES COMPRESSION & SUPPORT. – Multi-directional stretch provides compression & support.

-	VELCRO FASTENING. – Fully adjustable compression to injured muscles and tendons.', 85000, 3, N'Active', N'hotrokhopgoi.jpg', N'3')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'53', N'Elbow Support', N'The Body Sculpture Elbow Support is made of neoprene construction with a terry cloth lining for greater comfort. It has a Velcro closure for compression making it fully adjustable. It is made of breathable fabrica and has over stitched edges.', 100000, 4, N'Active', N'hotrokhuytay.jpg', N'3')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'54', N'Back Support', N'Some body parts require special attention when they are used intensely! Your back is one such organ that requires your extra care and concern! Use this support to deliver unmatched comfort to your affected areas! It is a belt made up of terry cloth and has a compression attached to it which keeps the belt in place and prevents it from slipping up and down the body when one is going about their daily chores or exercising.', 210000, 6, N'Active', N'hotrolung.jpg', N'3')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'55', N'Ankle Support', N'Body Sculpture Specially profiled soft band made of pleasant terry fabric and jersey fabric, between which there is an SBR fabric that provides free breathing of the skin and moisture management. Recommended for diseases of the ankle and as a universal strengthening of the joint.', 69000, 4, N'Active', N'hotromatca.jpg', N'3')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'56', N'Dumbbell 1kg', N'An ideal pick for fitness freaks and beginners, this dumbbell will help you tone your arm muscles during weight training sessions.
', 160000, 2, N'Active', N'ta.jpg', N'3')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'57', N'Yoga Carpet', N'Reduce slipping and injuries - and love your practice!', 200000, 7, N'Active', N'thamtapyoga.jpg', N'3')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'58', N'Crew Socks 3 Pairs', N'The Solid Crew Socks step up comfort with a half-cushioned footbed. Made with slightly stretchy cotton in a variety of colours, these men''s socks have a higher leg plus 3-Stripes and a Trefoil on the ribbed cuffs.', 35000, 5, N'Active', N'vodai.jpg', N'3')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'59', N'Running Socks', N'Balega’s Silver No Show running socks represent the pinnacle in compression and antibacterial running socks.', 25000, 3, N'Active', N'vongan.jpg', N'3')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'6', N'Ubersonic 3 Shoes', N'Play with speed and confidence. Lightweight and built with outstanding abrasion resistance in high drag areas, these adidas tennis shoes hold up to play on any type of court. Cushioning in the midsole gives you comfortable support when you plant your feet and smash a cross-court winner.', 900000, 2, N'Active', N'giayadidas6.jpg', N'1')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'8', N'Jump Rope Tool', N'Excellent all-around fitness and conditioning jump rope, as well as our recommended rope for competitive freestyle jumpers', 150000, 5, N'Active', N'dungcunhayday.jpg', N'3')
INSERT [dbo].[Products] ([productID], [productName], [description], [price], [quantity], [status], [image], [categoryID]) VALUES (N'99', N'Shoes New Balance2', N'For the players unbound by position, no longer defined by 1 through 5, the TWO WXY is built for your style of play. Hyper-engineered for speed and agility at both ends of the court, it’s a performance shoe packed with tech for that explosive moment when you switch from offense to defense to offense again. The TWO WXY specializes in versatility—the playmaker of today’s positionless game.', 1400000, 0, N'Active', N'giaynb2.jpg', N'1')
GO
INSERT [dbo].[Users] ([userID], [password], [fullName], [role], [status], [phone]) VALUES (N'admin', N'123456', N'asdasd', N'0', N'Active', N'0987654321')
INSERT [dbo].[Users] ([userID], [password], [fullName], [role], [status], [phone]) VALUES (N'user', N'123456', N'hai', N'1', N'Active', N'0123456789')
INSERT [dbo].[Users] ([userID], [password], [fullName], [role], [status], [phone]) VALUES (N'user1', N'123456', N'group 2', N'1', N'Active', N'0913428601')
GO
USE [master]
GO
ALTER DATABASE [PRJ301_SE08D_Assignment_Group2] SET  READ_WRITE 
GO
