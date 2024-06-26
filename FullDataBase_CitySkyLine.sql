USE [master]
GO
/****** Object:  Database [CitySkyLine]    Script Date: 10.06.2024 19:37:53 ******/
CREATE DATABASE [CitySkyLine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CitySkyLine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CitySkyLine.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CitySkyLine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CitySkyLine_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CitySkyLine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CitySkyLine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CitySkyLine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CitySkyLine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CitySkyLine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CitySkyLine] SET ARITHABORT OFF 
GO
ALTER DATABASE [CitySkyLine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CitySkyLine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CitySkyLine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CitySkyLine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CitySkyLine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CitySkyLine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CitySkyLine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CitySkyLine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CitySkyLine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CitySkyLine] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CitySkyLine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CitySkyLine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CitySkyLine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CitySkyLine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CitySkyLine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CitySkyLine] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CitySkyLine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CitySkyLine] SET RECOVERY FULL 
GO
ALTER DATABASE [CitySkyLine] SET  MULTI_USER 
GO
ALTER DATABASE [CitySkyLine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CitySkyLine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CitySkyLine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CitySkyLine] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CitySkyLine] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CitySkyLine] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CitySkyLine', N'ON'
GO
ALTER DATABASE [CitySkyLine] SET QUERY_STORE = ON
GO
ALTER DATABASE [CitySkyLine] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CitySkyLine]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abilities]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[AboutId] [int] NOT NULL,
 CONSTRAINT [PK_Abilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](400) NOT NULL,
	[SubDescription] [nvarchar](400) NOT NULL,
	[Image1] [nvarchar](600) NOT NULL,
	[Image2] [nvarchar](600) NOT NULL,
 CONSTRAINT [PK_Abouts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](300) NOT NULL,
	[Image] [nvarchar](600) NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[Description1] [nvarchar](600) NOT NULL,
	[Description2] [nvarchar](600) NULL,
	[Description3] [nvarchar](600) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carousels]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carousels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Icon] [nvarchar](300) NOT NULL,
	[Image] [nvarchar](600) NOT NULL,
 CONSTRAINT [PK_Carousels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Image] [nvarchar](600) NOT NULL,
	[Description] [nvarchar](600) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[BlogId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mails]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](300) NOT NULL,
	[Subject] [nvarchar](200) NOT NULL,
	[Message] [nvarchar](900) NOT NULL,
	[Read] [bit] NOT NULL,
 CONSTRAINT [PK_Mails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](300) NOT NULL,
	[Image] [nvarchar](600) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[DistrictId] [int] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Icon] [nvarchar](300) NOT NULL,
	[Image] [nvarchar](600) NOT NULL,
	[Description] [nvarchar](600) NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Image] [nvarchar](300) NOT NULL,
	[TwitterURL] [nvarchar](300) NOT NULL,
	[FacebookURL] [nvarchar](300) NOT NULL,
	[LinkedinURL] [nvarchar](300) NOT NULL,
	[InstagramURL] [nvarchar](300) NOT NULL,
	[YoutubeURL] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Testimonials]    Script Date: 10.06.2024 19:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Testimonials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Image] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](600) NOT NULL,
 CONSTRAINT [PK_Testimonials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240520104417_CreateDatabase', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240601093539_CreateDataBase', N'8.0.4')
GO
SET IDENTITY_INSERT [dbo].[Abilities] ON 

INSERT [dbo].[Abilities] ([Id], [Name], [AboutId]) VALUES (1, N'Mükemmel Planlama', 1)
INSERT [dbo].[Abilities] ([Id], [Name], [AboutId]) VALUES (2, N'Profesyonel İşçiler', 1)
INSERT [dbo].[Abilities] ([Id], [Name], [AboutId]) VALUES (3, N'İlk Çalışma Süreci', 1)
INSERT [dbo].[Abilities] ([Id], [Name], [AboutId]) VALUES (4, N'Verimli İnşaat Süreci', 1)
INSERT [dbo].[Abilities] ([Id], [Name], [AboutId]) VALUES (5, N'Uzman Proje Yönetimi', 1)
INSERT [dbo].[Abilities] ([Id], [Name], [AboutId]) VALUES (6, N'Kaliteli Malzeme Seçimi', 1)
SET IDENTITY_INSERT [dbo].[Abilities] OFF
GO
SET IDENTITY_INSERT [dbo].[Abouts] ON 

INSERT [dbo].[Abouts] ([Id], [Title], [Description], [SubDescription], [Image1], [Image2]) VALUES (1, N'MİSYONUMUZ', N'Müşterilerimize güvenilir, kaliteli ve sürdürülebilir inşaat çözümleri sunarak, onların beklentilerini aşmayı hedefliyoruz.', N'Her projede çevreye duyarlı yaklaşımımızı koruyarak, topluma katkı sağlayan, güvenilir inşaat projeleri geliştirmek için çalışıyoruz.', N'about.jpg', N'signature.jpg')
SET IDENTITY_INSERT [dbo].[Abouts] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [Title], [Image], [UserName], [DateTime], [Description1], [Description2], [Description3], [CategoryId]) VALUES (1, N'2024 İnşaat Sektöründeki Yeni Trendler ve Teknolojiler', N'blog-1.jpg', N'Recep Usta', CAST(N'2024-05-20T13:44:59.8133333' AS DateTime2), N'2024 inşaat sektörü, yenilikçi teknolojiler ve sürdürülebilirlik odaklı trendlerle şekilleniyor. Yapay zeka (AI) ve makine öğrenimi, proje yönetiminde ve planlamada devrim yaratarak verimliliği artırıyor. Drone kullanımı, şantiye izleme ve haritalama süreçlerini hızlandırarak daha güvenli ve doğru sonuçlar elde edilmesini sağlıyor.', N'Modüler ve prefabrik yapılar, inşaat süresini kısaltarak maliyetleri düşürüyor ve çevresel etkileri azaltıyor. Bu yöntemler, binaların hızla ve yüksek kalitede inşa edilmesine olanak tanıyor. Ayrıca, geri dönüştürülebilir malzemelerin kullanımı yaygınlaşıyor, bu da sektördeki çevre bilincinin arttığını gösteriyor.', N'Sürdürülebilirlik ve enerji verimliliği de 2024 önemli trendlerinden. Yeşil bina sertifikaları ve enerji tasarruflu sistemler, yapıların çevresel ayak izini azaltmada kritik rol oynuyor. Akıllı binalar, IoT cihazlarıyla enerji tüketimini optimize ederek hem maliyetleri düşürüyor hem de konfor seviyesini artırıyor. Bu yenilikler, sektörü geleceğe taşıyor.', 2)
INSERT [dbo].[Blogs] ([Id], [Title], [Image], [UserName], [DateTime], [Description1], [Description2], [Description3], [CategoryId]) VALUES (2, N'Enerji Verimliliği: Yeşil Binaların Geleceği', N'blog-2.jpg', N'Rıfkı Sarsılmaz', CAST(N'2024-05-20T13:44:59.8133333' AS DateTime2), N'Enerji verimliliği, inşaat sektöründe yeşil binaların yükselmesinde kilit bir rol oynuyor. Bu binalar, enerji tüketimini minimize eden yenilikçi tasarımlar ve teknolojilerle donatılıyor. Yalıtım malzemeleri, enerji tasarruflu pencereler ve güneş panelleri gibi uygulamalar, enerji tüketimini azaltarak hem maliyetleri düşürüyor hem de çevresel etkileri en aza indiriyor.', N'Yeşil binalar, sürdürülebilirlik ilkelerine bağlı kalarak doğal kaynakları korumayı hedefliyor. Yağmur suyu toplama sistemleri ve gri su geri dönüşümü gibi su tasarrufu sağlayan çözümler, bu yapıların ekolojik ayak izini küçültüyor. Ayrıca, düşük emisyonlu malzemeler kullanarak hava kalitesini iyileştiriyor ve sağlıklı yaşam alanları oluşturuyorlar.', N'Akıllı bina teknolojileri, yeşil binaların enerji verimliliğini artırıyor. IoT cihazları ve enerji yönetim sistemleri, bina içindeki enerji tüketimini sürekli izleyerek optimize ediyor. Bu sayede, aydınlatma, ısıtma ve soğutma sistemleri otomatik olarak ayarlanarak enerji tasarrufu sağlanıyor. Bu teknolojiler, hem çevreye duyarlı hem de ekonomik açıdan avantajlı çözümler sunuyor.', 5)
INSERT [dbo].[Blogs] ([Id], [Title], [Image], [UserName], [DateTime], [Description1], [Description2], [Description3], [CategoryId]) VALUES (3, N'Şantiye Güvenliği: İş Kazalarını Önlemek İçin Alınacak Önlemler', N'blog-3.jpg', N'Satılmış Maltaş', CAST(N'2024-05-20T13:44:59.8133333' AS DateTime2), N'Şantiye güvenliği, iş kazalarını önlemede hayati önem taşır. İlk adım, çalışanlara düzenli eğitimler vermektir. Bu eğitimler, güvenlik ekipmanlarının doğru kullanımı, acil durum prosedürleri ve riskli bölgelerin farkındalığını kapsar. Eğitimli çalışanlar, tehlikeleri daha hızlı tanır ve uygun önlemleri alarak kazaları minimize eder.', N'Kişisel koruyucu ekipmanların (KKE) kullanımı, şantiyelerde güvenliği artırmanın temel yollarından biridir. Baret, eldiven, güvenlik kemeri ve gözlük gibi KKE ler, işçilerin yaralanma riskini önemli ölçüde azaltır. Ayrıca, ekipmanların düzenli olarak kontrol edilmesi ve bakımlarının yapılması, koruma düzeyinin sürekli yüksek olmasını sağlar.', N'Teknolojik yenilikler de şantiye güvenliğinde devrim yaratmaktadır. Dronelar ve IoT cihazları, şantiyelerin anlık olarak izlenmesine imkan tanır. Bu cihazlar, potansiyel tehlikeleri tespit ederek müdahale edilmesini sağlar. Ayrıca, yapay zeka destekli sistemler, güvenlik ihlallerini otomatik olarak algılar ve ilgili kişileri uyararak proaktif önlemler alınmasını sağlar.', 4)
INSERT [dbo].[Blogs] ([Id], [Title], [Image], [UserName], [DateTime], [Description1], [Description2], [Description3], [CategoryId]) VALUES (4, N'Mimari Tasarımda Yenilikçi Yaklaşımlar ve Uygulamalar', N'blog-2.jpg', N'Obayana', CAST(N'2024-05-20T13:44:59.8133333' AS DateTime2), N'Mimari tasarımda yenilikçi yaklaşımlar, sürdürülebilirlik ve estetiği bir araya getiriyor. Biyomimikri, doğadan ilham alarak yapıların enerji verimliliğini artırıyor. Örneğin, termit yuvalarından esinlenerek tasarlanan binalar, doğal havalandırma sistemleri sayesinde enerji tasarrufu sağlıyor. Bu yaklaşım, doğayla uyumlu ve çevre dostu yapılar oluşturuyor.', N'Akıllı malzemeler ve teknoloji, mimaride devrim yaratıyor. Kendini onaran beton, bina ömrünü uzatarak bakım maliyetlerini düşürüyor. Ayrıca, dinamik cam sistemleri, güneş ışığını optimize ederek iç mekan konforunu artırıyor. Bu tür yenilikçi malzemeler, binaların işlevselliğini ve dayanıklılığını artırırken, estetik değerlerini de koruyor.', N'Dijital tasarım ve üretim teknikleri, mimaride sınırları zorluyor. 3D baskı teknolojisi, karmaşık geometrilere sahip yapıların hızlı ve ekonomik şekilde inşa edilmesine olanak tanıyor. Parametrik tasarım araçları ise, veri analitiği kullanarak performans odaklı çözümler üretiyor. Bu yenilikler, mimarların hayal gücünü gerçeğe dönüştürerek, daha yaratıcı ve verimli yapılar ortaya koymalarını sağlıyor.', 1)
INSERT [dbo].[Blogs] ([Id], [Title], [Image], [UserName], [DateTime], [Description1], [Description2], [Description3], [CategoryId]) VALUES (5, N'Kentsel Dönüşüm: Modern Şehirlerin İnşası', N'blog-1.jpg', N'Garavel Usta', CAST(N'2024-05-20T13:44:59.8133333' AS DateTime2), N'Kentsel dönüşüm, modern şehirlerin inşasında kilit rol oynuyor. Eski ve kullanışsız yapıların yerine, daha dayanıklı ve çevre dostu binalar inşa ediliyor. Bu süreçte, enerji verimliliği yüksek, yenilenebilir enerji kaynaklarını kullanan yapılar ön plana çıkıyor. Böylece şehirler, hem sürdürülebilir hem de yaşanabilir hale geliyor.', N'Sosyal altyapının iyileştirilmesi, kentsel dönüşüm projelerinin önemli bir parçasıdır. Yeni parklar, yeşil alanlar, bisiklet yolları ve toplu taşıma sistemleri, şehirde yaşam kalitesini artırır. Bu yenilikler, şehir sakinlerine daha sağlıklı ve aktif bir yaşam tarzı sunar. Ayrıca, toplu taşıma sistemlerinin geliştirilmesi, trafik sıkışıklığını ve hava kirliliğini azaltarak çevreye katkı sağlar.', N'Kentsel dönüşümde topluluk katılımı da büyük önem taşır. Halkın projelere dahil edilmesi, onların ihtiyaç ve beklentilerinin karşılanmasını sağlar. Katılımcı planlama süreçleri, daha kapsayıcı ve demokratik şehirler oluşturur. Bu yaklaşımlar, şehirlerin sadece fiziksel olarak değil, sosyal ve kültürel açıdan da gelişmesine olanak tanır, böylece daha bütüncül bir kentsel dönüşüm sağlanır.', 5)
INSERT [dbo].[Blogs] ([Id], [Title], [Image], [UserName], [DateTime], [Description1], [Description2], [Description3], [CategoryId]) VALUES (6, N'İnşaat Projelerinde Maliyet Yönetimi ve Tasarruf İpuçları', N'blog-3.jpg', N'Himura Kenshin', CAST(N'2024-05-20T13:44:59.8133333' AS DateTime2), N'İnşaat projelerinde maliyet yönetimi, projenin başarısı için kritik öneme sahiptir. Etkin bir maliyet yönetimi, projenin bütçesinin doğru belirlenmesi ve sürekli izlenmesiyle başlar. Proje başlangıcında detaylı bir bütçe planı oluşturmak, beklenmedik harcamaların önüne geçer. Ayrıca, maliyet kontrol yazılımları kullanarak harcamaları izlemek ve analiz etmek, bütçe aşımını engeller.', N'Malzeme ve işçilik maliyetlerinde tasarruf sağlamak için stratejik tedarik yöntemleri kullanılabilir. Toplu alımlar ve uzun vadeli tedarikçi anlaşmaları, maliyetleri düşürür. Ayrıca, yerel ve geri dönüştürülebilir malzemelerin kullanımı, hem maliyetleri azaltır hem de sürdürülebilirliği artırır. İşçilik maliyetlerini yönetmek için ise iş gücünün verimliliğini artıracak eğitim ve süreç iyileştirmeleri yapılmalıdır.', N'Verimlilik ve zaman yönetimi, maliyet tasarrufu için önemli faktörlerdir. Proje yönetim yazılımları kullanarak iş akışını optimize etmek, gecikmeleri ve ekstra maliyetleri önler. Ayrıca, iyi planlanmış bir lojistik ve tedarik zinciri yönetimi, malzemelerin zamanında ve doğru şekilde şantiyeye ulaşmasını sağlar. Bu önlemler, projeyi zamanında ve bütçe dahilinde tamamlamaya yardımcı olur.', 3)
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Carousels] ON 

INSERT [dbo].[Carousels] ([Id], [Title], [Icon], [Image]) VALUES (1, N'HAYALLERİNİZDEKİ EVİ BİZİMLE İNŞA EDİN', N'fa fa-home', N'carousel-1.jpg')
INSERT [dbo].[Carousels] ([Id], [Title], [Icon], [Image]) VALUES (2, N'PROJENİZ İÇİN BİZE GÜVENEBİLİRSİNİZ', N'fa fa-tools', N'carousel-2.jpg')
SET IDENTITY_INSERT [dbo].[Carousels] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Title]) VALUES (1, N'Yapı Malzemeleri')
INSERT [dbo].[Categories] ([Id], [Title]) VALUES (2, N'İnşaat Teknolojileri')
INSERT [dbo].[Categories] ([Id], [Title]) VALUES (3, N'Proje Yönetimi')
INSERT [dbo].[Categories] ([Id], [Title]) VALUES (4, N'İnşaat Güvenliği')
INSERT [dbo].[Categories] ([Id], [Title]) VALUES (5, N'Çevre Düzenlemesi')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (1, N'ADANA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (2, N'ADIYAMAN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (3, N'AFYON', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (4, N'AĞRI', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (5, N'AMASYA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (6, N'ANKARA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (7, N'ANTALYA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (8, N'ARTVİN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (9, N'AYDIN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (10, N'BALIKESİR', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (11, N'BİLECİK', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (12, N'BİNGÖL', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (13, N'BİTLİS', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (14, N'BOLU', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (15, N'BURDUR', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (16, N'BURSA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (17, N'ÇANAKKALE', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (18, N'ÇANKIRI', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (19, N'ÇORUM', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (20, N'DENİZLİ', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (21, N'DİYARBAKIR', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (22, N'EDİRNE', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (23, N'ELAZIĞ', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (24, N'ERZİNCAN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (25, N'ERZURUM', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (26, N'ESKİŞEHİR', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (27, N'GAZİANTEP', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (28, N'GİRESUN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (29, N'GÜMÜŞHANE', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (30, N'HAKKARİ', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (31, N'HATAY', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (32, N'ISPARTA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (33, N'İÇEL', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (34, N'İSTANBUL', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (35, N'İZMİR', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (36, N'KARS', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (37, N'KASTAMONU', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (38, N'KAYSERİ', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (39, N'KIRKLARELİ', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (40, N'KIRŞEHİR', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (41, N'KOCAELİ', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (42, N'KONYA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (43, N'KÜTAHYA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (44, N'MALATYA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (45, N'MANİSA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (46, N'KAHRAMANMARAŞ', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (47, N'MARDİN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (48, N'MUĞLA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (49, N'MUŞ', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (50, N'NEVŞEHİR', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (51, N'NİĞDE', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (52, N'ORDU', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (53, N'RİZE', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (54, N'SAKARYA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (55, N'SAMSUN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (56, N'SİİRT', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (57, N'SİNOP', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (58, N'SİVAS', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (59, N'TEKİRDAĞ', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (60, N'TOKAT', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (61, N'TRABZON', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (62, N'TUNCELİ', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (63, N'ŞANLIURFA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (64, N'UŞAK', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (65, N'VAN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (66, N'YOZGAT', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (67, N'ZONGULDAK', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (68, N'AKSARAY', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (69, N'BAYBURT', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (70, N'KARAMAN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (71, N'KIRIKKALE', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (72, N'BATMAN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (73, N'ŞIRNAK', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (74, N'BARTIN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (75, N'ARDAHAN', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (76, N'IĞDIR', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (77, N'YALOVA', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (78, N'KARABÜK', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (79, N'KİLİS', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (80, N'OSMANİYE', 10)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (81, N'DÜZCE', 10)
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (1, N'Uğur Sevilgen', N'user.jpg', N'CitySkyLine Firmasına Güvenim Tam', CAST(N'2024-05-20T13:45:12.5566667' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (2, N'Seda Sayan', N'user.jpg', N'10 Tane Villa Yaptırıyorum', CAST(N'2024-05-20T13:45:12.5566667' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (3, N'Acun Ilıcalı', N'user.jpg', N'Havalimanı İnşaatı Çok İşime Yaradı', CAST(N'2024-05-20T13:45:12.5566667' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (5, N'Sercihan Esad Usta', N'user.jpg', N'Çok Güzel', CAST(N'2024-06-10T17:45:24.4408313' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (6, N'Bilge Khan', N'user.jpg', N'Bu Firma Harika', CAST(N'2024-06-10T17:46:08.9035045' AS DateTime2), 3)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (7, N'Bilge KhanFan', N'user.jpg', N'Bu Firma Harika', CAST(N'2024-06-10T17:47:27.2510758' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (8, N'Ali', N'user.jpg', N'Yeşil binalar, enerji verimliliği ile geleceğin sürdürülebilir yaşam alanlarını oluşturuyor. Bu yaklaşım, hem çevreyi korurken hem de maliyet tasarrufu sağlayarak inşaat sektöründe önemli bir dönüşüm sağlıyor.', CAST(N'2024-06-10T17:48:16.1770395' AS DateTime2), 2)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (9, N'Veli', N'user.jpg', N'Çok Bilgilendirici', CAST(N'2024-06-10T17:48:42.3407521' AS DateTime2), 2)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (10, N'Ayşe', N'user.jpg', N'Ben Beğeniyorum', CAST(N'2024-06-10T17:49:16.8983530' AS DateTime2), 2)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (11, N'Fatma', N'user.jpg', N'Fiyatıda Uygun', CAST(N'2024-06-10T17:50:40.0461462' AS DateTime2), 2)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (12, N'Onur', N'user.jpg', N'Harika', CAST(N'2024-06-10T18:52:32.4297957' AS DateTime2), 2)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (13, N'Şeref', N'user.jpg', N'Kentsel Dönüşüm', CAST(N'2024-06-10T18:53:16.9413651' AS DateTime2), 2)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (14, N'Erkut', N'user.jpg', N'Süper!!!', CAST(N'2024-06-10T18:54:40.4170705' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (15, N'Altan Emre', N'user.jpg', N'Bu Firmanın Sahibi Benim Öğrencim', CAST(N'2024-06-10T18:55:49.2453338' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Image], [Description], [DateTime], [BlogId]) VALUES (16, N'ChoosenOne', N'user.jpg', N'2024 inşaat sektöründe sürdürülebilirlik, dijitalleşme ve yenilikçi teknolojiler öne çıkıyor. Yeşil binalar, BIM, dronelar, artırılmış gerçeklik, modüler yapılar ve yapay zeka gibi gelişmeler, projelerin daha verimli, çevre dostu ve güvenli olmasını sağlıyor. Bu trendler, sektörde devrim niteliğinde değişimlere yol açacak.', CAST(N'2024-06-10T18:56:27.9529693' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name]) VALUES (1, N'ABD')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (2, N'BREZİLYA')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (3, N'ÇİN')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (4, N'FRANSA')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (5, N'HOLLANDA')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (6, N'İSPANYA')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (7, N'İTALYA')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (8, N'PORTEKİZ')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (9, N'RUSYA')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (10, N'TÜRKİYE')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Districts] ON 

INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (1, N'Aladağ', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (2, N'Ceyhan', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (3, N'Çukurova', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (4, N'Feke', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (5, N'İmamoğlu', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (6, N'Karaisalı', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (7, N'Karataş', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (8, N'Kozan', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (9, N'Pozantı', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (10, N'Saimbeyli', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (11, N'Sarıçam', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (12, N'Seyhan', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (13, N'Tufanbeyli', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (14, N'Yumurtalık', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (15, N'Yüreğir', 1)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (16, N'Besni', 2)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (17, N'Çelikhan', 2)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (18, N'Gerger', 2)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (19, N'Gölbaşı', 2)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (20, N'Kahta', 2)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (21, N'Merkez', 2)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (22, N'Samsat', 2)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (23, N'Sincik', 2)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (24, N'Tut', 2)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (25, N'Başmakçı', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (26, N'Bayat', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (27, N'Bolvadin', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (28, N'Çay', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (29, N'Çobanlar', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (30, N'Dazkırı', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (31, N'Dinar', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (32, N'Emirdağ', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (33, N'Evciler', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (34, N'Hocalar', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (35, N'İhsaniye', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (36, N'İscehisar', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (37, N'Kızılören', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (38, N'Merkez', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (39, N'Sandıklı', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (40, N'Sinanpaşa', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (41, N'Sultandağı', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (42, N'Şuhut', 3)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (43, N'Diyadin', 4)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (44, N'Doğubayazıt', 4)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (45, N'Eleşkirt', 4)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (46, N'Hamur', 4)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (47, N'Merkez', 4)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (48, N'Patnos', 4)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (49, N'Taşlıçay', 4)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (50, N'Tutak', 4)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (51, N'Ağaçören', 68)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (52, N'Eskil', 68)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (53, N'Gülağaç', 68)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (54, N'Güzelyurt', 68)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (55, N'Merkez', 68)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (56, N'Ortaköy', 68)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (57, N'Sarıyahşi', 68)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (58, N'Sultanhanı', 68)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (59, N'Göynücek', 5)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (60, N'Gümüşhacıköy', 5)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (61, N'Hamamözü', 5)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (62, N'Merkez', 5)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (63, N'Merzifon', 5)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (64, N'Suluova', 5)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (65, N'Taşova', 5)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (66, N'Akyurt', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (67, N'Altındağ', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (68, N'Ayaş', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (69, N'Bala', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (70, N'Beypazarı', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (71, N'Çamlıdere', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (72, N'Çankaya', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (73, N'Çubuk', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (74, N'Elmadağ', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (75, N'Etimesgut', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (76, N'Evren', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (77, N'Gölbaşı', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (78, N'Güdül', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (79, N'Haymana', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (80, N'Kahramankazan', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (81, N'Kalecik', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (82, N'Keçiören', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (83, N'Kızılcahamam', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (84, N'Mamak', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (85, N'Nallıhan', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (86, N'Polatlı', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (87, N'Pursaklar', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (88, N'Sincan', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (89, N'Şereflikoçhisar', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (90, N'Yenimahalle', 6)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (91, N'Akseki', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (92, N'Aksu', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (93, N'Alanya', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (94, N'Demre', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (95, N'Döşemealtı', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (96, N'Elmalı', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (97, N'Finike', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (98, N'Gazipaşa', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (99, N'Gündoğmuş', 7)
GO
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (100, N'İbradı', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (101, N'Kaş', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (102, N'Kemer', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (103, N'Kepez', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (104, N'Konyaaltı', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (105, N'Korkuteli', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (106, N'Kumluca', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (107, N'Manavgat', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (108, N'Muratpaşa', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (109, N'Serik', 7)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (110, N'Çıldır', 75)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (111, N'Damal', 75)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (112, N'Göle', 75)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (113, N'Hanak', 75)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (114, N'Merkez', 75)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (115, N'Posof', 75)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (116, N'Ardanuç', 8)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (117, N'Arhavi', 8)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (118, N'Borçka', 8)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (119, N'Hopa', 8)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (120, N'Kemalpaşa', 8)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (121, N'Merkez', 8)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (122, N'Murgul', 8)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (123, N'Şavşat', 8)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (124, N'Yusufeli', 8)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (125, N'Bozdoğan', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (126, N'Buharkent', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (127, N'Çine', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (128, N'Didim', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (129, N'Efeler', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (130, N'Germencik', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (131, N'İncirliova', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (132, N'Karacasu', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (133, N'Karpuzlu', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (134, N'Koçarlı', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (135, N'Köşk', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (136, N'Kuşadası', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (137, N'Kuyucak', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (138, N'Nazilli', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (139, N'Söke', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (140, N'Sultanhisar', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (141, N'Yenipazar', 9)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (142, N'Altıeylül', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (143, N'Ayvalık', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (144, N'Balya', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (145, N'Bandırma', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (146, N'Bigadiç', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (147, N'Burhaniye', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (148, N'Dursunbey', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (149, N'Edremit', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (150, N'Erdek', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (151, N'Gömeç', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (152, N'Gönen', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (153, N'Havran', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (154, N'İvrindi', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (155, N'Karesi', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (156, N'Kepsut', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (157, N'Manyas', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (158, N'Marmara', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (159, N'Savaştepe', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (160, N'Sındırgı', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (161, N'Susurluk', 10)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (162, N'Amasra', 74)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (163, N'Kurucaşile', 74)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (164, N'Merkez', 74)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (165, N'Ulus', 74)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (166, N'Beşiri', 72)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (167, N'Gercüş', 72)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (168, N'Hasankeyf', 72)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (169, N'Kozluk', 72)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (170, N'Merkez', 72)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (171, N'Sason', 72)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (172, N'Aydıntepe', 69)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (173, N'Demirözü', 69)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (174, N'Merkez', 69)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (175, N'Bozüyük', 11)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (176, N'Gölpazarı', 11)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (177, N'İnhisar', 11)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (178, N'Merkez', 11)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (179, N'Osmaneli', 11)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (180, N'Pazaryeri', 11)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (181, N'Söğüt', 11)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (182, N'Yenipazar', 11)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (183, N'Adaklı', 12)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (184, N'Genç', 12)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (185, N'Karlıova', 12)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (186, N'Kiğı', 12)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (187, N'Merkez', 12)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (188, N'Solhan', 12)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (189, N'Yayladere', 12)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (190, N'Yedisu', 12)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (191, N'Adilcevaz', 13)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (192, N'Ahlat', 13)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (193, N'Güroymak', 13)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (194, N'Hizan', 13)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (195, N'Merkez', 13)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (196, N'Mutki', 13)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (197, N'Tatvan', 13)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (198, N'Dörtdivan', 14)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (199, N'Gerede', 14)
GO
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (200, N'Göynük', 14)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (201, N'Kıbrıscık', 14)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (202, N'Mengen', 14)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (203, N'Merkez', 14)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (204, N'Mudurnu', 14)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (205, N'Seben', 14)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (206, N'Yeniçağa', 14)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (207, N'Ağlasun', 15)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (208, N'Altınyayla', 15)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (209, N'Bucak', 15)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (210, N'Çavdır', 15)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (211, N'Çeltikçi', 15)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (212, N'Gölhisar', 15)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (213, N'Karamanlı', 15)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (214, N'Kemer', 15)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (215, N'Merkez', 15)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (216, N'Tefenni', 15)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (217, N'Yeşilova', 15)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (218, N'Büyükorhan', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (219, N'Gemlik', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (220, N'Gürsu', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (221, N'Harmancık', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (222, N'İnegöl', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (223, N'İznik', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (224, N'Karacabey', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (225, N'Keles', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (226, N'Kestel', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (227, N'Mudanya', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (228, N'Mustafakemalpaşa', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (229, N'Nilüfer', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (230, N'Orhaneli', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (231, N'Orhangazi', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (232, N'Osmangazi', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (233, N'Yenişehir', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (234, N'Yıldırım', 16)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (235, N'Ayvacık', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (236, N'Bayramiç', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (237, N'Biga', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (238, N'Bozcaada', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (239, N'Çan', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (240, N'Eceabat', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (241, N'Ezine', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (242, N'Gelibolu', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (243, N'Gökçeada', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (244, N'Lapseki', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (245, N'Merkez', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (246, N'Yenice', 17)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (247, N'Atkaracalar', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (248, N'Bayramören', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (249, N'Çerkeş', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (250, N'Eldivan', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (251, N'Ilgaz', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (252, N'Kızılırmak', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (253, N'Korgun', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (254, N'Kurşunlu', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (255, N'Merkez', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (256, N'Orta', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (257, N'Şabanözü', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (258, N'Yapraklı', 18)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (259, N'Alaca', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (260, N'Bayat', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (261, N'Boğazkale', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (262, N'Dodurga', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (263, N'İskilip', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (264, N'Kargı', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (265, N'Laçin', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (266, N'Mecitözü', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (267, N'Merkez', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (268, N'Oğuzlar', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (269, N'Ortaköy', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (270, N'Osmancık', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (271, N'Sungurlu', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (272, N'Uğurludağ', 19)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (273, N'Acıpayam', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (274, N'Babadağ', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (275, N'Baklan', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (276, N'Bekilli', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (277, N'Beyağaç', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (278, N'Bozkurt', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (279, N'Buldan', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (280, N'Çal', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (281, N'Çameli', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (282, N'Çardak', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (283, N'Çivril', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (284, N'Güney', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (285, N'Honaz', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (286, N'Kale', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (287, N'Merkezefendi', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (288, N'Pamukkale', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (289, N'Sarayköy', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (290, N'Serinhisar', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (291, N'Tavas', 20)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (292, N'Bağlar', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (293, N'Bismil', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (294, N'Çermik', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (295, N'Çınar', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (296, N'Çüngüş', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (297, N'Dicle', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (298, N'Eğil', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (299, N'Ergani', 21)
GO
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (300, N'Hani', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (301, N'Hazro', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (302, N'Kayapınar', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (303, N'Kocaköy', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (304, N'Kulp', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (305, N'Lice', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (306, N'Silvan', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (307, N'Sur', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (308, N'Yenişehir', 21)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (309, N'Akçakoca', 81)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (310, N'Cumayeri', 81)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (311, N'Çilimli', 81)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (312, N'Gölyaka', 81)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (313, N'Gümüşova', 81)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (314, N'Kaynaşlı', 81)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (315, N'Merkez', 81)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (316, N'Yığılca', 81)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (317, N'Enez', 22)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (318, N'Havsa', 22)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (319, N'İpsala', 22)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (320, N'Keşan', 22)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (321, N'Lalapaşa', 22)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (322, N'Meriç', 22)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (323, N'Merkez', 22)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (324, N'Süloğlu', 22)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (325, N'Uzunköprü', 22)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (326, N'Ağın', 23)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (327, N'Alacakaya', 23)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (328, N'Arıcak', 23)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (329, N'Baskil', 23)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (330, N'Karakoçan', 23)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (331, N'Keban', 23)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (332, N'Kovancılar', 23)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (333, N'Maden', 23)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (334, N'Merkez', 23)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (335, N'Palu', 23)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (336, N'Sivrice', 23)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (337, N'Çayırlı', 24)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (338, N'İliç', 24)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (339, N'Kemah', 24)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (340, N'Kemaliye', 24)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (341, N'Merkez', 24)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (342, N'Otlukbeli', 24)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (343, N'Refahiye', 24)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (344, N'Tercan', 24)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (345, N'Üzümlü', 24)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (346, N'Aşkale', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (347, N'Aziziye', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (348, N'Çat', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (349, N'Hınıs', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (350, N'Horasan', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (351, N'İspir', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (352, N'Karaçoban', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (353, N'Karayazı', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (354, N'Köprüköy', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (355, N'Narman', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (356, N'Oltu', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (357, N'Olur', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (358, N'Palandöken', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (359, N'Pasinler', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (360, N'Pazaryolu', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (361, N'Şenkaya', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (362, N'Tekman', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (363, N'Tortum', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (364, N'Uzundere', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (365, N'Yakutiye', 25)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (366, N'Alpu', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (367, N'Beylikova', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (368, N'Çifteler', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (369, N'Günyüzü', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (370, N'Han', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (371, N'İnönü', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (372, N'Mahmudiye', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (373, N'Mihalgazi', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (374, N'Mihalıççık', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (375, N'Odunpazarı', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (376, N'Sarıcakaya', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (377, N'Seyitgazi', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (378, N'Sivrihisar', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (379, N'Tepebaşı', 26)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (380, N'Araban', 27)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (381, N'İslahiye', 27)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (382, N'Karkamış', 27)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (383, N'Nizip', 27)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (384, N'Nurdağı', 27)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (385, N'Oğuzeli', 27)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (386, N'Şahinbey', 27)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (387, N'Şehitkamil', 27)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (388, N'Yavuzeli', 27)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (389, N'Alucra', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (390, N'Bulancak', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (391, N'Çamoluk', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (392, N'Çanakçı', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (393, N'Dereli', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (394, N'Doğankent', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (395, N'Espiye', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (396, N'Eynesil', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (397, N'Görele', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (398, N'Güce', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (399, N'Keşap', 28)
GO
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (400, N'Merkez', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (401, N'Piraziz', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (402, N'Şebinkarahisar', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (403, N'Tirebolu', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (404, N'Yağlıdere', 28)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (405, N'Kelkit', 29)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (406, N'Köse', 29)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (407, N'Kürtün', 29)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (408, N'Merkez', 29)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (409, N'Şiran', 29)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (410, N'Torul', 29)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (411, N'Çukurca', 30)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (412, N'Derecik', 30)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (413, N'Merkez', 30)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (414, N'Şemdinli', 30)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (415, N'Yüksekova', 30)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (416, N'Altınözü', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (417, N'Antakya', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (418, N'Arsuz', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (419, N'Belen', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (420, N'Defne', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (421, N'Dörtyol', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (422, N'Erzin', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (423, N'Hassa', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (424, N'İskenderun', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (425, N'Kırıkhan', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (426, N'Kumlu', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (427, N'Payas', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (428, N'Reyhanlı', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (429, N'Samandağ', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (430, N'Yayladağı', 31)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (431, N'Aralık', 76)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (432, N'Karakoyunlu', 76)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (433, N'Merkez', 76)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (434, N'Tuzluca', 76)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (435, N'Aksu', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (436, N'Atabey', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (437, N'Eğirdir', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (438, N'Gelendost', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (439, N'Gönen', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (440, N'Keçiborlu', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (441, N'Merkez', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (442, N'Senirkent', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (443, N'Sütçüler', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (444, N'Şarkikaraağaç', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (445, N'Uluborlu', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (446, N'Yalvaç', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (447, N'Yenişarbademli', 32)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (448, N'Adalar', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (449, N'Arnavutköy', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (450, N'Ataşehir', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (451, N'Avcılar', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (452, N'Bağcılar', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (453, N'Bahçelievler', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (454, N'Bakırköy', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (455, N'Başakşehir', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (456, N'Bayrampaşa', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (457, N'Beşiktaş', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (458, N'Beykoz', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (459, N'Beylikdüzü', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (460, N'Beyoğlu', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (461, N'Büyükçekmece', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (462, N'Çatalca', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (463, N'Çekmeköy', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (464, N'Esenler', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (465, N'Esenyurt', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (466, N'Eyüpsultan', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (467, N'Fatih', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (468, N'Gaziosmanpaşa', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (469, N'Güngören', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (470, N'Kadıköy', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (471, N'Kağıthane', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (472, N'Kartal', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (473, N'Küçükçekmece', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (474, N'Maltepe', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (475, N'Pendik', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (476, N'Sancaktepe', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (477, N'Sarıyer', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (478, N'Silivri', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (479, N'Sultanbeyli', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (480, N'Sultangazi', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (481, N'Şile', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (482, N'Şişli', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (483, N'Tuzla', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (484, N'Ümraniye', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (485, N'Üsküdar', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (486, N'Zeytinburnu', 34)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (487, N'Aliağa', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (488, N'Balçova', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (489, N'Bayındır', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (490, N'Bayraklı', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (491, N'Bergama', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (492, N'Beydağ', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (493, N'Bornova', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (494, N'Buca', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (495, N'Çeşme', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (496, N'Çiğli', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (497, N'Dikili', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (498, N'Foça', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (499, N'Gaziemir', 35)
GO
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (500, N'Güzelbahçe', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (501, N'Karabağlar', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (502, N'Karaburun', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (503, N'Karşıyaka', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (504, N'Kemalpaşa', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (505, N'Kınık', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (506, N'Kiraz', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (507, N'Konak', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (508, N'Menderes', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (509, N'Menemen', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (510, N'Narlıdere', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (511, N'Ödemiş', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (512, N'Seferihisar', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (513, N'Selçuk', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (514, N'Tire', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (515, N'Torbalı', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (516, N'Urla', 35)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (517, N'Afşin', 46)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (518, N'Andırın', 46)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (519, N'Çağlayancerit', 46)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (520, N'Dulkadiroğlu', 46)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (521, N'Ekinözü', 46)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (522, N'Elbistan', 46)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (523, N'Göksun', 46)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (524, N'Nurhak', 46)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (525, N'Onikişubat', 46)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (526, N'Pazarcık', 46)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (527, N'Türkoğlu', 46)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (528, N'Eflani', 78)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (529, N'Eskipazar', 78)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (530, N'Merkez', 78)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (531, N'Ovacık', 78)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (532, N'Safranbolu', 78)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (533, N'Yenice', 78)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (534, N'Ayrancı', 70)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (535, N'Başyayla', 70)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (536, N'Ermenek', 70)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (537, N'Kazımkarabekir', 70)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (538, N'Merkez', 70)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (539, N'Sarıveliler', 70)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (540, N'Akyaka', 36)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (541, N'Arpaçay', 36)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (542, N'Digor', 36)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (543, N'Kağızman', 36)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (544, N'Merkez', 36)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (545, N'Sarıkamış', 36)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (546, N'Selim', 36)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (547, N'Susuz', 36)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (548, N'Abana', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (549, N'Ağlı', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (550, N'Araç', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (551, N'Azdavay', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (552, N'Bozkurt', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (553, N'Cide', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (554, N'Çatalzeytin', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (555, N'Daday', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (556, N'Devrekani', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (557, N'Doğanyurt', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (558, N'Hanönü', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (559, N'İhsangazi', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (560, N'İnebolu', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (561, N'Küre', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (562, N'Merkez', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (563, N'Pınarbaşı', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (564, N'Seydiler', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (565, N'Şenpazar', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (566, N'Taşköprü', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (567, N'Tosya', 37)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (568, N'Akkışla', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (569, N'Bünyan', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (570, N'Develi', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (571, N'Felahiye', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (572, N'Hacılar', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (573, N'İncesu', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (574, N'Kocasinan', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (575, N'Melikgazi', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (576, N'Özvatan', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (577, N'Pınarbaşı', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (578, N'Sarıoğlan', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (579, N'Sarız', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (580, N'Talas', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (581, N'Tomarza', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (582, N'Yahyalı', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (583, N'Yeşilhisar', 38)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (584, N'Bahşılı', 71)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (585, N'Balışeyh', 71)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (586, N'Çelebi', 71)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (587, N'Delice', 71)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (588, N'Karakeçili', 71)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (589, N'Keskin', 71)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (590, N'Merkez', 71)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (591, N'Sulakyurt', 71)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (592, N'Yahşihan', 71)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (593, N'Babaeski', 39)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (594, N'Demirköy', 39)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (595, N'Kofçaz', 39)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (596, N'Lüleburgaz', 39)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (597, N'Merkez', 39)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (598, N'Pehlivanköy', 39)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (599, N'Pınarhisar', 39)
GO
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (600, N'Vize', 39)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (601, N'Akçakent', 40)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (602, N'Akpınar', 40)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (603, N'Boztepe', 40)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (604, N'Çiçekdağı', 40)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (605, N'Kaman', 40)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (606, N'Merkez', 40)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (607, N'Mucur', 40)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (608, N'Elbeyli', 79)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (609, N'Merkez', 79)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (610, N'Musabeyli', 79)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (611, N'Polateli', 79)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (612, N'Başiskele', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (613, N'Çayırova', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (614, N'Darıca', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (615, N'Derince', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (616, N'Dilovası', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (617, N'Gebze', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (618, N'Gölcük', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (619, N'İzmit', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (620, N'Kandıra', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (621, N'Karamürsel', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (622, N'Kartepe', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (623, N'Körfez', 41)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (624, N'Ahırlı', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (625, N'Akören', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (626, N'Akşehir', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (627, N'Altınekin', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (628, N'Beyşehir', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (629, N'Bozkır', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (630, N'Cihanbeyli', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (631, N'Çeltik', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (632, N'Çumra', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (633, N'Derbent', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (634, N'Derebucak', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (635, N'Doğanhisar', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (636, N'Emirgazi', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (637, N'Ereğli', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (638, N'Güneysınır', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (639, N'Hadim', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (640, N'Halkapınar', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (641, N'Hüyük', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (642, N'Ilgın', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (643, N'Kadınhanı', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (644, N'Karapınar', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (645, N'Karatay', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (646, N'Kulu', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (647, N'Meram', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (648, N'Sarayönü', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (649, N'Selçuklu', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (650, N'Seydişehir', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (651, N'Taşkent', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (652, N'Tuzlukçu', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (653, N'Yalıhüyük', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (654, N'Yunak', 42)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (655, N'Altıntaş', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (656, N'Aslanapa', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (657, N'Çavdarhisar', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (658, N'Domaniç', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (659, N'Dumlupınar', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (660, N'Emet', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (661, N'Gediz', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (662, N'Hisarcık', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (663, N'Merkez', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (664, N'Pazarlar', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (665, N'Simav', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (666, N'Şaphane', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (667, N'Tavşanlı', 43)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (668, N'Akçadağ', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (669, N'Arapgir', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (670, N'Arguvan', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (671, N'Battalgazi', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (672, N'Darende', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (673, N'Doğanşehir', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (674, N'Doğanyol', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (675, N'Hekimhan', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (676, N'Kale', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (677, N'Kuluncak', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (678, N'Pütürge', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (679, N'Yazıhan', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (680, N'Yeşilyurt', 44)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (681, N'Ahmetli', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (682, N'Akhisar', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (683, N'Alaşehir', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (684, N'Demirci', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (685, N'Gölmarmara', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (686, N'Gördes', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (687, N'Kırkağaç', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (688, N'Köprübaşı', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (689, N'Kula', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (690, N'Salihli', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (691, N'Sarıgöl', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (692, N'Saruhanlı', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (693, N'Selendi', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (694, N'Soma', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (695, N'Şehzadeler', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (696, N'Turgutlu', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (697, N'Yunusemre', 45)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (698, N'Artuklu', 47)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (699, N'Dargeçit', 47)
GO
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (700, N'Derik', 47)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (701, N'Kızıltepe', 47)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (702, N'Mazıdağı', 47)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (703, N'Midyat', 47)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (704, N'Nusaybin', 47)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (705, N'Ömerli', 47)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (706, N'Savur', 47)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (707, N'Yeşilli', 47)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (708, N'Akdeniz', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (709, N'Anamur', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (710, N'Aydıncık', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (711, N'Bozyazı', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (712, N'Çamlıyayla', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (713, N'Erdemli', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (714, N'Gülnar', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (715, N'Mezitli', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (716, N'Mut', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (717, N'Silifke', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (718, N'Tarsus', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (719, N'Toroslar', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (720, N'Yenişehir', 33)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (721, N'Bodrum', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (722, N'Dalaman', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (723, N'Datça', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (724, N'Fethiye', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (725, N'Kavaklıdere', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (726, N'Köyceğiz', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (727, N'Marmaris', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (728, N'Menteşe', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (729, N'Milas', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (730, N'Ortaca', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (731, N'Seydikemer', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (732, N'Ula', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (733, N'Yatağan', 48)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (734, N'Bulanık', 49)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (735, N'Hasköy', 49)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (736, N'Korkut', 49)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (737, N'Malazgirt', 49)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (738, N'Merkez', 49)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (739, N'Varto', 49)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (740, N'Acıgöl', 50)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (741, N'Avanos', 50)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (742, N'Derinkuyu', 50)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (743, N'Gülşehir', 50)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (744, N'Hacıbektaş', 50)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (745, N'Kozaklı', 50)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (746, N'Merkez', 50)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (747, N'Ürgüp', 50)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (748, N'Altunhisar', 51)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (749, N'Bor', 51)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (750, N'Çamardı', 51)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (751, N'Çiftlik', 51)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (752, N'Merkez', 51)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (753, N'Ulukışla', 51)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (754, N'Akkuş', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (755, N'Altınordu', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (756, N'Aybastı', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (757, N'Çamaş', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (758, N'Çatalpınar', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (759, N'Çaybaşı', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (760, N'Fatsa', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (761, N'Gölköy', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (762, N'Gülyalı', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (763, N'Gürgentepe', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (764, N'İkizce', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (765, N'Kabadüz', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (766, N'Kabataş', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (767, N'Korgan', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (768, N'Kumru', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (769, N'Mesudiye', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (770, N'Perşembe', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (771, N'Ulubey', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (772, N'Ünye', 52)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (773, N'Bahçe', 80)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (774, N'Düziçi', 80)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (775, N'Hasanbeyli', 80)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (776, N'Kadirli', 80)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (777, N'Merkez', 80)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (778, N'Sumbas', 80)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (779, N'Toprakkale', 80)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (780, N'Ardeşen', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (781, N'Çamlıhemşin', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (782, N'Çayeli', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (783, N'Derepazarı', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (784, N'Fındıklı', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (785, N'Güneysu', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (786, N'Hemşin', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (787, N'İkizdere', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (788, N'İyidere', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (789, N'Kalkandere', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (790, N'Merkez', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (791, N'Pazar', 53)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (792, N'Adapazarı', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (793, N'Akyazı', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (794, N'Arifiye', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (795, N'Erenler', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (796, N'Ferizli', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (797, N'Geyve', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (798, N'Hendek', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (799, N'Karapürçek', 54)
GO
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (800, N'Karasu', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (801, N'Kaynarca', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (802, N'Kocaali', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (803, N'Pamukova', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (804, N'Sapanca', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (805, N'Serdivan', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (806, N'Söğütlü', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (807, N'Taraklı', 54)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (808, N'19 mayıs', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (809, N'Alaçam', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (810, N'Asarcık', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (811, N'Atakum', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (812, N'Ayvacık', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (813, N'Bafra', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (814, N'Canik', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (815, N'Çarşamba', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (816, N'Havza', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (817, N'İlkadım', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (818, N'Kavak', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (819, N'Ladik', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (820, N'Salıpazarı', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (821, N'Tekkeköy', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (822, N'Terme', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (823, N'Vezirköprü', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (824, N'Yakakent', 55)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (825, N'Baykan', 56)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (826, N'Eruh', 56)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (827, N'Kurtalan', 56)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (828, N'Merkez', 56)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (829, N'Pervari', 56)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (830, N'Şirvan', 56)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (831, N'Tillo', 56)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (832, N'Ayancık', 57)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (833, N'Boyabat', 57)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (834, N'Dikmen', 57)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (835, N'Durağan', 57)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (836, N'Erfelek', 57)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (837, N'Gerze', 57)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (838, N'Merkez', 57)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (839, N'Saraydüzü', 57)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (840, N'Türkeli', 57)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (841, N'Akıncılar', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (842, N'Altınyayla', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (843, N'Divriği', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (844, N'Doğanşar', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (845, N'Gemerek', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (846, N'Gölova', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (847, N'Gürün', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (848, N'Hafik', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (849, N'İmranlı', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (850, N'Kangal', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (851, N'Koyulhisar', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (852, N'Merkez', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (853, N'Suşehri', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (854, N'Şarkışla', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (855, N'Ulaş', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (856, N'Yıldızeli', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (857, N'Zara', 58)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (858, N'Akçakale', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (859, N'Birecik', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (860, N'Bozova', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (861, N'Ceylanpınar', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (862, N'Eyyübiye', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (863, N'Halfeti', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (864, N'Haliliye', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (865, N'Harran', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (866, N'Hilvan', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (867, N'Karaköprü', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (868, N'Siverek', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (869, N'Suruç', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (870, N'Viranşehir', 63)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (871, N'Beytüşşebap', 73)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (872, N'Cizre', 73)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (873, N'Güçlükonak', 73)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (874, N'İdil', 73)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (875, N'Merkez', 73)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (876, N'Silopi', 73)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (877, N'Uludere', 73)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (878, N'Çerkezköy', 59)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (879, N'Çorlu', 59)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (880, N'Ergene', 59)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (881, N'Hayrabolu', 59)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (882, N'Kapaklı', 59)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (883, N'Malkara', 59)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (884, N'Marmaraereğlisi', 59)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (885, N'Muratlı', 59)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (886, N'Saray', 59)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (887, N'Süleymanpaşa', 59)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (888, N'Şarköy', 59)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (889, N'Almus', 60)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (890, N'Artova', 60)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (891, N'Başçiftlik', 60)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (892, N'Erbaa', 60)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (893, N'Merkez', 60)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (894, N'Niksar', 60)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (895, N'Pazar', 60)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (896, N'Reşadiye', 60)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (897, N'Sulusaray', 60)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (898, N'Turhal', 60)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (899, N'Yeşilyurt', 60)
GO
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (900, N'Zile', 60)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (901, N'Akçaabat', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (902, N'Araklı', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (903, N'Arsin', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (904, N'Beşikdüzü', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (905, N'Çarşıbaşı', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (906, N'Çaykara', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (907, N'Dernekpazarı', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (908, N'Düzköy', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (909, N'Hayrat', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (910, N'Köprübaşı', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (911, N'Maçka', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (912, N'Of', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (913, N'Ortahisar', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (914, N'Sürmene', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (915, N'Şalpazarı', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (916, N'Tonya', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (917, N'Vakfıkebir', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (918, N'Yomra', 61)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (919, N'Çemişgezek', 62)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (920, N'Hozat', 62)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (921, N'Mazgirt', 62)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (922, N'Merkez', 62)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (923, N'Nazımiye', 62)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (924, N'Ovacık', 62)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (925, N'Pertek', 62)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (926, N'Pülümür', 62)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (927, N'Banaz', 64)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (928, N'Eşme', 64)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (929, N'Karahallı', 64)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (930, N'Merkez', 64)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (931, N'Sivaslı', 64)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (932, N'Ulubey', 64)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (933, N'Bahçesaray', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (934, N'Başkale', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (935, N'Çaldıran', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (936, N'Çatak', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (937, N'Edremit', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (938, N'Erciş', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (939, N'Gevaş', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (940, N'Gürpınar', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (941, N'İpekyolu', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (942, N'Muradiye', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (943, N'Özalp', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (944, N'Saray', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (945, N'Tuşba', 65)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (946, N'Altınova', 77)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (947, N'Armutlu', 77)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (948, N'Çınarcık', 77)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (949, N'Çiftlikköy', 77)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (950, N'Merkez', 77)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (951, N'Termal', 77)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (952, N'Akdağmadeni', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (953, N'Aydıncık', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (954, N'Boğazlıyan', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (955, N'Çandır', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (956, N'Çayıralan', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (957, N'Çekerek', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (958, N'Kadışehri', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (959, N'Merkez', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (960, N'Saraykent', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (961, N'Sarıkaya', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (962, N'Sorgun', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (963, N'Şefaatli', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (964, N'Yenifakılı', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (965, N'Yerköy', 66)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (966, N'Alaplı', 67)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (967, N'Çaycuma', 67)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (968, N'Devrek', 67)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (969, N'Ereğli', 67)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (970, N'Gökçebey', 67)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (971, N'Kilimli', 67)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (972, N'Kozlu', 67)
INSERT [dbo].[Districts] ([Id], [Name], [CityId]) VALUES (973, N'Merkez', 67)
SET IDENTITY_INSERT [dbo].[Districts] OFF
GO
SET IDENTITY_INSERT [dbo].[Mails] ON 

INSERT [dbo].[Mails] ([Id], [Name], [Email], [Subject], [Message], [Read]) VALUES (2, N'Ahmet Yılmaz', N'ahmet.yilmaz@xyzinşaat.com', N'Yeni Proje Teklifi Hakkında', N'Sayın ABC İnşaat Yetkilisi,

XYZ İnşaat olarak, inşaat sektöründe ortaya koyduğunuz başarılı projeleri ve yenilikçi yaklaşımlarınızı büyük bir takdirle takip ediyoruz. Bu bağlamda, "Yeşil Vadi Konutları" isimli yeni projemiz için sizinle iş birliği yapmak arzusundayız.

Projemiz hakkında detaylı bilgi vermek ve olası iş birliği koşullarını görüşmek üzere uygun olduğunuz bir tarihte sizinle bir toplantı gerçekleştirmek isteriz. Proje dokümanlarını ve diğer gerekli bilgileri ekli dosyada bulabilirsiniz.

İlginiz ve değerli zamanınız için şimdiden teşekkür eder, olumlu geri dönüşünüzü sabırsızlıkla bekleriz.

Saygılarımızla', 0)
INSERT [dbo].[Mails] ([Id], [Name], [Email], [Subject], [Message], [Read]) VALUES (3, N'Murat Demir', N'murat.demir@betayapi.com', N'Ortak Proje Görüşmesi Talebi', N'Beta Yapı olarak, sektörümüzdeki üstün başarılarınızı ve yenilikçi projelerinizi büyük bir hayranlıkla izliyoruz. Bu doğrultuda, "Modern Kent Yaşamı" isimli yeni projemiz için sizinle iş birliği yapmayı arzu ediyoruz.

Projemizle ilgili ayrıntılı bilgi paylaşmak ve olası iş birliği fırsatlarını değerlendirmek amacıyla sizinle bir görüşme planlamak istiyoruz. Ekli dosyada projemizle ilgili detayları bulabilirsiniz.

İlginiz ve zamanınız için şimdiden teşekkür eder, olumlu geri dönüşünüzü bekleriz.

Saygılarımızla', 0)
INSERT [dbo].[Mails] ([Id], [Name], [Email], [Subject], [Message], [Read]) VALUES (4, N'Ayşe Kaya', N'ayse.kaya@alfainsaat.com', N'İş Birliği İçin Toplantı Talebi', N'Sayın Gamma İnşaat Yöneticisi,

Alfa İnşaat olarak, sektördeki başarılı projelerinizi ve yenilikçi yaklaşımlarınızı takdirle takip ediyoruz. Bu kapsamda, "Geleceğin Yaşam Alanları" projesi için sizinle bir iş birliği fırsatını değerlendirmek istiyoruz.

Proje detayları ve iş birliği olanaklarını görüşmek üzere uygun bir zamanda bir araya gelmeyi umuyoruz. İlgili belgeleri ekte bulabilirsiniz.

İlginiz ve zamanınız için şimdiden teşekkür eder, olumlu yanıtınızı bekleriz.

Saygılarımla', 1)
INSERT [dbo].[Mails] ([Id], [Name], [Email], [Subject], [Message], [Read]) VALUES (5, N'Fatma Yılmaz', N'fatma.yilmaz@xinşaat.com', N'İş Birliği Teklifi ve Toplantı Talebi', N'Sayın Z İnşaat Yöneticisi,

Sizinle, sektördeki başarılı projelerinizi ve etkileyici yaklaşımlarınızı takip etmekten büyük memnuniyet duyuyoruz. Bu çerçevede, "Yenilikçi Konut Kompleksi" adlı projemiz için iş birliği fırsatını görüşmek istiyoruz.

Detayları paylaşmak ve karşılıklı fayda sağlayacak bir iş birliği için bir araya gelmeyi arzuluyoruz. Projemize dair bilgileri ekte bulabilirsiniz.

İlginiz ve vakit ayırmanız için teşekkür eder, olumlu bir geri dönüş almayı umarız.

Saygılarımla', 1)
SET IDENTITY_INSERT [dbo].[Mails] OFF
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([Id], [Title], [Image], [Type], [DistrictId]) VALUES (1, N'ÇAMOLUK OTOMOTİV İŞ HANI', N'portfolio-1.jpg', N'Restorasyon', 452)
INSERT [dbo].[Projects] ([Id], [Title], [Image], [Type], [DistrictId]) VALUES (2, N'İSTANBUL HAVALİMANI', N'portfolio-2.jpg', N'Insaat', 449)
INSERT [dbo].[Projects] ([Id], [Title], [Image], [Type], [DistrictId]) VALUES (3, N'VAKIF GUREBA HASTANE', N'portfolio-3.jpg', N'Restorasyon', 467)
INSERT [dbo].[Projects] ([Id], [Title], [Image], [Type], [DistrictId]) VALUES (4, N'YOL YAPIMI', N'portfolio-4.jpg', N'Insaat', 97)
INSERT [dbo].[Projects] ([Id], [Title], [Image], [Type], [DistrictId]) VALUES (5, N'ÜÇÜNCÜ BİN YIL AKADEMİ', N'portfolio-5.jpg', N'Restorasyon', 470)
INSERT [dbo].[Projects] ([Id], [Title], [Image], [Type], [DistrictId]) VALUES (6, N'PREFABRİK', N'portfolio-6.jpg', N'Insaat', 75)
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([Id], [Title], [Icon], [Image], [Description]) VALUES (1, N'BİNA İNŞAATI', N'fa fa-3x fa-building', N'service-1.jpg', N'Bina inşaatı, bir yapının temelinden çatısına kadar tüm bileşenlerinin planlanması, tasarımı ve inşa edilmesi sürecidir.')
INSERT [dbo].[Services] ([Id], [Title], [Icon], [Image], [Description]) VALUES (2, N'EV YENİLEME', N'fa fa-3x fa-home', N'service-2.jpg', N'Ev tadilatı, mevcut bir yapının estetik ve işlevselliğini iyileştirmek amacıyla yapılan onarım, yenileme ve modernizasyon çalışmalarını kapsar.')
INSERT [dbo].[Services] ([Id], [Title], [Icon], [Image], [Description]) VALUES (3, N'MİMARİ TASARIM', N'fa fa-3x fa-drafting-compass', N'service-3.jpg', N'Mimari tasarım, estetik ve işlevselliği bir araya getirerek yapıların formunu, düzenini ve kullanım amacını belirleyen yaratıcı bir süreçtir.')
INSERT [dbo].[Services] ([Id], [Title], [Icon], [Image], [Description]) VALUES (4, N'İÇ DİZAYN', N'fa fa-3x fa-palette', N'service-4.jpg', N'İç tasarım, bir iç mekanın estetik ve işlevsel gereksinimlerini karşılamak amacıyla düzenlenmesi, mobilya seçimi ve dekorasyon unsurlarının bir araya getirilmesi sürecidir.')
INSERT [dbo].[Services] ([Id], [Title], [Icon], [Image], [Description]) VALUES (5, N'ONARIM VE DESTEK', N'fa fa-3x fa-tools', N'service-5.jpg', N'Onarım ve destek, mevcut yapıların veya sistemlerin fonksiyonlarını sürdürebilmesi ve güvenli bir şekilde çalışabilmesi için yapılan bakım, tamir ve güçlendirme işlemlerini kapsar.')
INSERT [dbo].[Services] ([Id], [Title], [Icon], [Image], [Description]) VALUES (6, N'BOYAMA', N'fa fa-3x fa-paint-brush', N'service-6.jpg', N'Boya işi, yüzeylerin estetik görünümünü ve korunmasını sağlamak amacıyla yapılan, renk ve doku uygulamalarını içeren bir dekorasyon ve bakım işlemidir.')
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [Name], [Title], [Image], [TwitterURL], [FacebookURL], [LinkedinURL], [InstagramURL], [YoutubeURL]) VALUES (1, N'Ahmet Yılmaz', N'Proje Müdürü', N'team-1.jpg', N'https://twitter.com/', N'https://facebook.com/', N'https://Linkedin.com/', N'https://instagram.com/', N'https://youtube.com/')
INSERT [dbo].[Teams] ([Id], [Name], [Title], [Image], [TwitterURL], [FacebookURL], [LinkedinURL], [InstagramURL], [YoutubeURL]) VALUES (2, N'Zeynep Demir', N'İnşaat Mühendisi', N'team-5.jpg', N'https://twitter.com/', N'https://facebook.com/', N'https://Linkedin.com/', N'https://instagram.com/', N'https://youtube.com/')
INSERT [dbo].[Teams] ([Id], [Name], [Title], [Image], [TwitterURL], [FacebookURL], [LinkedinURL], [InstagramURL], [YoutubeURL]) VALUES (3, N'Mehmet Kaya', N'Şantiye Şefi', N'team-3.jpg', N'https://twitter.com/', N'https://facebook.com/', N'https://Linkedin.com/', N'https://instagram.com/', N'https://youtube.com/')
INSERT [dbo].[Teams] ([Id], [Name], [Title], [Image], [TwitterURL], [FacebookURL], [LinkedinURL], [InstagramURL], [YoutubeURL]) VALUES (4, N'Ayşe Karaca', N'Mimari Tasarım Uzmanı', N'team-6.jpg', N'https://twitter.com/', N'https://facebook.com/', N'https://Linkedin.com/', N'https://instagram.com/', N'https://youtube.com/')
INSERT [dbo].[Teams] ([Id], [Name], [Title], [Image], [TwitterURL], [FacebookURL], [LinkedinURL], [InstagramURL], [YoutubeURL]) VALUES (5, N'Emre Aydın', N'Yapı Denetim Uzmanı', N'team-2.jpg', N'https://twitter.com/', N'https://facebook.com/', N'https://Linkedin.com/', N'https://instagram.com/', N'https://youtube.com/')
INSERT [dbo].[Teams] ([Id], [Name], [Title], [Image], [TwitterURL], [FacebookURL], [LinkedinURL], [InstagramURL], [YoutubeURL]) VALUES (6, N'Elif Şahin', N'Çevre Mühendisi', N'team-6.jpg', N'https://twitter.com/', N'https://facebook.com/', N'https://Linkedin.com/', N'https://instagram.com/', N'https://youtube.com/')
INSERT [dbo].[Teams] ([Id], [Name], [Title], [Image], [TwitterURL], [FacebookURL], [LinkedinURL], [InstagramURL], [YoutubeURL]) VALUES (7, N'Fatih Özkan', N'Saha Mühendisi', N'team-4.jpg', N'https://twitter.com/', N'https://facebook.com/', N'https://Linkedin.com/', N'https://instagram.com/', N'https://youtube.com/')
INSERT [dbo].[Teams] ([Id], [Name], [Title], [Image], [TwitterURL], [FacebookURL], [LinkedinURL], [InstagramURL], [YoutubeURL]) VALUES (8, N'Merve Arslan', N'Statik Mühendisi', N'team-5.jpg', N'https://twitter.com/', N'https://facebook.com/', N'https://Linkedin.com/', N'https://instagram.com/', N'https://youtube.com/')
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
SET IDENTITY_INSERT [dbo].[Testimonials] ON 

INSERT [dbo].[Testimonials] ([Id], [Name], [Title], [Image], [Description]) VALUES (1, N'Ekrem Kurum', N'TOKİ Genel Müdürü', N'testimonial-1.jpg', N'TOKİ bile bu kadar kaliteli inşaat yapamıyor.')
INSERT [dbo].[Testimonials] ([Id], [Name], [Title], [Image], [Description]) VALUES (2, N'Deniz Derin', N'Profesyonel', N'testimonial-2.jpg', N'CitySkyLine firmasının yaptığı evde oturuyorum. Yıllardır hiçbir sıkıntı yaşamadım, Tesisatından ses yalıtımına, ısı yalıtımına kadar her şey olması gerektiği gibi başarılı.')
SET IDENTITY_INSERT [dbo].[Testimonials] OFF
GO
/****** Object:  Index [IX_Abilities_AboutId]    Script Date: 10.06.2024 19:37:54 ******/
CREATE NONCLUSTERED INDEX [IX_Abilities_AboutId] ON [dbo].[Abilities]
(
	[AboutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Blogs_CategoryId]    Script Date: 10.06.2024 19:37:54 ******/
CREATE NONCLUSTERED INDEX [IX_Blogs_CategoryId] ON [dbo].[Blogs]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cities_CountryId]    Script Date: 10.06.2024 19:37:54 ******/
CREATE NONCLUSTERED INDEX [IX_Cities_CountryId] ON [dbo].[Cities]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_BlogId]    Script Date: 10.06.2024 19:37:54 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_BlogId] ON [dbo].[Comments]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Districts_CityId]    Script Date: 10.06.2024 19:37:54 ******/
CREATE NONCLUSTERED INDEX [IX_Districts_CityId] ON [dbo].[Districts]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Projects_DistrictId]    Script Date: 10.06.2024 19:37:54 ******/
CREATE NONCLUSTERED INDEX [IX_Projects_DistrictId] ON [dbo].[Projects]
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Abilities]  WITH CHECK ADD  CONSTRAINT [FK_Abilities_Abouts_AboutId] FOREIGN KEY([AboutId])
REFERENCES [dbo].[Abouts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Abilities] CHECK CONSTRAINT [FK_Abilities_Abouts_AboutId]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries_CountryId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Blogs_BlogId]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Cities_CityId]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Districts_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Districts_DistrictId]
GO
USE [master]
GO
ALTER DATABASE [CitySkyLine] SET  READ_WRITE 
GO
