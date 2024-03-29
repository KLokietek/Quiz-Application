USE [master]
GO
/****** Object:  Database [QuizDB]    Script Date: 20.01.2024 10:44:54 ******/
CREATE DATABASE [QuizDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuizDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuizDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QuizDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuizDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuizDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuizDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [QuizDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizDB] SET  MULTI_USER 
GO
ALTER DATABASE [QuizDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuizDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuizDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuizDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuizDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuizDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20.01.2024 10:44:54 ******/
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
/****** Object:  Table [dbo].[Answers]    Script Date: 20.01.2024 10:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AnswerText] [nvarchar](max) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
	[QuestionId] [int] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 20.01.2024 10:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[QuizId] [int] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quizzes]    Script Date: 20.01.2024 10:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quizzes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Quizzes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240104113053_Initialize', N'6.0.0')
GO
SET IDENTITY_INSERT [dbo].[Answers] ON 

INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (18, N'Toyota', 0, 9)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (19, N'Ford', 1, 9)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (20, N'Honda', 0, 9)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (21, N'Sportowy Udoskonalony Van', 0, 10)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (22, N'Samochód Uniwersalny', 0, 10)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (23, N'Sportowy Użytkowy Pojazd', 1, 10)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (24, N'Skrzynia biegów', 0, 11)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (25, N'Zawieszenie', 0, 11)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (26, N'Amortyzator', 1, 11)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (27, N'Porsche', 1, 12)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (28, N'Ferrari', 0, 12)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (29, N'Lamborghini', 0, 12)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (30, N'Barcelona', 0, 13)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (31, N'Rzym', 0, 13)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (32, N'Paryż', 1, 13)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (33, N'Petersburg', 0, 14)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (34, N'Moskwa', 1, 14)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (35, N'Kijów', 0, 14)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (36, N'Argentyny', 1, 15)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (37, N'Brazylii', 0, 15)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (38, N'Chile', 0, 15)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (39, N'FC Barcelona', 0, 16)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (40, N'Real Madryt', 1, 16)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (41, N'Juventus', 0, 16)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (42, N'Manchester City', 0, 17)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (43, N'Manchester United', 1, 17)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (44, N'Arsenal', 0, 17)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (45, N'10', 0, 18)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (46, N'14', 1, 18)
INSERT [dbo].[Answers] ([Id], [AnswerText], [IsCorrect], [QuestionId]) VALUES (47, N'12', 0, 18)
SET IDENTITY_INSERT [dbo].[Answers] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([Id], [QuestionText], [QuizId]) VALUES (9, N'Która firma samochodowa jest znana z modelu "Mustang"?', 8)
INSERT [dbo].[Questions] ([Id], [QuestionText], [QuizId]) VALUES (10, N'Co oznacza skrót "SUV" w kontekście samochodów?', 8)
INSERT [dbo].[Questions] ([Id], [QuestionText], [QuizId]) VALUES (11, N' Który komponent samochodu jest odpowiedzialny za zmniejszanie wibracji silnika?', 8)
INSERT [dbo].[Questions] ([Id], [QuestionText], [QuizId]) VALUES (12, N'Która marka samochodu jest odpowiedzialna za model "911"?', 8)
INSERT [dbo].[Questions] ([Id], [QuestionText], [QuizId]) VALUES (13, N'Jaka jest stolica Francji?', 9)
INSERT [dbo].[Questions] ([Id], [QuestionText], [QuizId]) VALUES (14, N'Które miasto jest stolicą Rosji?', 9)
INSERT [dbo].[Questions] ([Id], [QuestionText], [QuizId]) VALUES (15, N'Jaką stolicą jest Buenos Aires?', 9)
INSERT [dbo].[Questions] ([Id], [QuestionText], [QuizId]) VALUES (16, N'Który z tych klubów jest znany jako "Królewski Klub"?', 10)
INSERT [dbo].[Questions] ([Id], [QuestionText], [QuizId]) VALUES (17, N'Który klub jest znany ze swojego kultowego stadionu "Old Trafford"?', 10)
INSERT [dbo].[Questions] ([Id], [QuestionText], [QuizId]) VALUES (18, N'Ile razy Real Madryt zwyciężył Lige Mistrzów?', 10)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Quizzes] ON 

INSERT [dbo].[Quizzes] ([Id], [Name]) VALUES (8, N'Quiz o Samochodach')
INSERT [dbo].[Quizzes] ([Id], [Name]) VALUES (9, N'Quiz o Stolicach Państw')
INSERT [dbo].[Quizzes] ([Id], [Name]) VALUES (10, N'Quiz o Klubach Piłkarskich')
SET IDENTITY_INSERT [dbo].[Quizzes] OFF
GO
/****** Object:  Index [IX_Answers_QuestionId]    Script Date: 20.01.2024 10:44:54 ******/
CREATE NONCLUSTERED INDEX [IX_Answers_QuestionId] ON [dbo].[Answers]
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Questions_QuizId]    Script Date: 20.01.2024 10:44:54 ******/
CREATE NONCLUSTERED INDEX [IX_Questions_QuizId] ON [dbo].[Questions]
(
	[QuizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions_QuestionId]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Quizzes_QuizId] FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizzes] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Quizzes_QuizId]
GO
USE [master]
GO
ALTER DATABASE [QuizDB] SET  READ_WRITE 
GO
