USE [master]
GO
/****** Object:  Database [school]    Script Date: 10/27/2013 17:25:00 ******/
CREATE DATABASE [school] ON  PRIMARY 
( NAME = N'school', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\school.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'school_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\school_log.ldf' , SIZE = 9216KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [school] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [school].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [school] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [school] SET ANSI_NULLS OFF
GO
ALTER DATABASE [school] SET ANSI_PADDING OFF
GO
ALTER DATABASE [school] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [school] SET ARITHABORT OFF
GO
ALTER DATABASE [school] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [school] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [school] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [school] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [school] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [school] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [school] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [school] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [school] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [school] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [school] SET  DISABLE_BROKER
GO
ALTER DATABASE [school] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [school] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [school] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [school] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [school] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [school] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [school] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [school] SET  READ_WRITE
GO
ALTER DATABASE [school] SET RECOVERY FULL
GO
ALTER DATABASE [school] SET  MULTI_USER
GO
ALTER DATABASE [school] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [school] SET DB_CHAINING OFF
GO
USE [school]
GO
/****** Object:  Table [dbo].[ProgressMethod]    Script Date: 10/27/2013 17:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgressMethod](
	[progressId] [int] IDENTITY(1,1) NOT NULL,
	[partition] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProgressMethod] PRIMARY KEY CLUSTERED 
(
	[progressId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 10/27/2013 17:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[classId] [nvarchar](50) NOT NULL,
	[className] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[classId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamType]    Script Date: 10/27/2013 17:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamType](
	[examTypeId] [nvarchar](10) NOT NULL,
	[examType] [nvarchar](50) NULL,
 CONSTRAINT [PK_ExamType] PRIMARY KEY CLUSTERED 
(
	[examTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 10/27/2013 17:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[subjectId] [nvarchar](50) NOT NULL,
	[subjectName] [nvarchar](50) NULL,
 CONSTRAINT [PK_subjects] PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyQuestions]    Script Date: 10/27/2013 17:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyQuestions](
	[surveyId] [int] NOT NULL,
	[questionId] [int] NOT NULL,
	[question] [nvarchar](max) NULL,
 CONSTRAINT [PK_SurveyQuestions] PRIMARY KEY CLUSTERED 
(
	[surveyId] ASC,
	[questionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 10/27/2013 17:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[userType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[userType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZipCodes]    Script Date: 10/27/2013 17:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipCodes](
	[zipCode] [int] NOT NULL,
	[cityName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ZipCodes] PRIMARY KEY CLUSTERED 
(
	[zipCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spSurveyReply]    Script Date: 10/27/2013 17:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSurveyReply]
	-- Add the parameters for the stored procedure here
	@surveyId int,
	@questionId int,
	@answer nvarchar(max),
	@repliedBy int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into dbo.SurveyReply (surveyId,questionId,answer,repliedBy)
	values
	(@surveyId,@questionId,@answer,@repliedBy);
END
GO
/****** Object:  Table [dbo].[Section]    Script Date: 10/27/2013 17:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[sectionId] [int] IDENTITY(1,1) NOT NULL,
	[sectionName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[sectionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Institute]    Script Date: 10/27/2013 17:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institute](
	[instituteName] [nvarchar](50) NOT NULL,
	[establishDate] [date] NULL,
	[missionStatement] [nvarchar](100) NULL,
	[website] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAddSubject]    Script Date: 10/27/2013 17:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddSubject] 
	-- Add the parameters for the stored procedure here
	@subjectId nvarchar(50),
	@subjectName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into [dbo].[Subjects](
    subjectId,subjectName)
    values(
    @subjectId,@subjectName);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertSectionName]    Script Date: 10/27/2013 17:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertSectionName]
	@sectionName nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into dbo.Section (sectionName)values (@sectionName);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertExamType]    Script Date: 10/27/2013 17:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertExamType] 
		@examTypeId nvarchar(10),
	@examType nvarchar(50)
AS
BEGIN
	
SET NOCOUNT ON;

    INSERT iNTO dbo.ExamType (examTypeId,examType)
    VALUES (@examTypeId, @examType)
END
GO
/****** Object:  StoredProcedure [dbo].[spAddSurveyQuestions]    Script Date: 10/27/2013 17:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddSurveyQuestions]
	-- Add the parameters for the stored procedure here
	@surveyId int,
	@questionId int,
	@question nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into dbo.SurveyQuestions (surveyId,questionId,question)
    values
    (@surveyId,@questionId,@question)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertClass]    Script Date: 10/27/2013 17:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertClass] 
	-- Add the parameters for the stored procedure here
	@classId nvarchar(50),
	@className nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into dbo.Class (classId,className)
	values 
	(@classId,@className);
END
GO
/****** Object:  Table [dbo].[Campus]    Script Date: 10/27/2013 17:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[campusId] [int] IDENTITY(1,1) NOT NULL,
	[campusName] [nvarchar](50) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[zipCode] [int] NOT NULL,
	[phone1] [nvarchar](50) NULL,
	[phone2] [nvarchar](50) NULL,
	[phone3] [nvarchar](50) NULL,
	[principal] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Campus] PRIMARY KEY CLUSTERED 
(
	[campusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Campus] ON [dbo].[Campus] 
(
	[zipCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampusClassSection]    Script Date: 10/27/2013 17:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampusClassSection](
	[campusId] [int] NOT NULL,
	[classId] [nvarchar](50) NOT NULL,
	[sectionId] [int] NOT NULL,
	[CCSec] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CampusClassSection_1] PRIMARY KEY CLUSTERED 
(
	[CCSec] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalInfo]    Script Date: 10/27/2013 17:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonalInfo](
	[pKId] [nvarchar](10) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[middleName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[campusId] [int] NULL,
	[phone] [nvarchar](50) NULL,
	[emergencyContact] [nvarchar](50) NOT NULL,
	[cellNo] [nvarchar](50) NOT NULL,
	[eMail] [nvarchar](50) NULL,
	[enrollmentDate] [date] NOT NULL,
	[dOB] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[userType] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[isNew] [bit] NULL,
	[passCode] [nvarchar](50) NOT NULL,
	[address1] [nvarchar](50) NULL,
	[address2] [nvarchar](50) NULL,
	[address3] [nvarchar](50) NULL,
	[fileName] [nvarchar](50) NULL,
	[recordFile] [varbinary](max) NULL,
 CONSTRAINT [PK_PersonalInfo] PRIMARY KEY CLUSTERED 
(
	[pKId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vwTry]    Script Date: 10/27/2013 17:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwTry]
as
SELECT [campusName],[address],[Campus].[zipCode],[ZipCodes].[cityName] from [school].[dbo].[Campus]
join ZipCodes
on
Campus.zipCode=ZipCodes.zipCode;
GO
/****** Object:  StoredProcedure [dbo].[spInsertBranch]    Script Date: 10/27/2013 17:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hamza Sarwar>
-- Create date: <9/22/2013>
-- Description:	<add new branch>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertBranch] 
	-- Add the parameters for the stored procedure here
	
	@campusName nvarchar(50),
	@address nvarchar(50),
	@zipCode int ,
	@phone1 nvarchar(50)=null,
	@phone2 nvarchar(50)=null,
	@phone3 nvarchar(50)=null,
	@principal nvarchar(50)=null,
	@cityName nvarchar(50),
	@email nvarchar(50)=null,
	@isActive bit=true
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Begin transaction ;
    if not exists (select zipcode from dbo.ZipCodes 
   where @zipCode = ZipCodes.zipCode)
   begin  
   
		--exec spInsertZipCodes @zipcode,@cityName
		insert into dbo.zipcodes (zipcode,cityname)
		values
		(@zipcode,@cityname)
	end
	
	
    
    insert into [dbo].[Campus](
    campusName,address,zipCode,phone1,phone2,phone3,principal,email,isActive)
    values(
  @campusName,@address,@zipcode,@phone1,@phone2,@phone3,@principal,@email,@isActive);
   
   
   commit transaction;
   
   
   
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectCampus]    Script Date: 10/27/2013 17:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectCampus]
	@campusId int =null,
	@campusName nvarchar(50)=null,
	@address nvarchar(max)=null,
	@zipCode int = null,
	@city nvarchar(50)=null,
	@email nvarchar(50)=null,
	@isActive bit = null
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	select * from [dbo].[Campus]
	join [dbo].[ZipCodes]
	on [dbo].[Campus].[zipCode]=[dbo].[ZipCodes].[zipCode]
	where(
	(@campusId is null or campusId = @campusId)
	and
	(@campusName is null or campusName =@campusName )
	and
	(@address is null or address like '%'+@address+'%')
	and
	(@zipCode is null or Campus.zipCode =@zipCode)
	and
	(@city is null or cityName =@city)
	and
	(@campusName is null or campusName =@campusName)  
	and
	(@email is null or email=@email)
	and
	(@isActive is null or isActive=@isActive)
	);


END
GO
/****** Object:  Table [dbo].[recommendation]    Script Date: 10/27/2013 17:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recommendation](
	[studentId] [nvarchar](10) NOT NULL,
	[teacher] [nvarchar](10) NOT NULL,
	[date] [date] NOT NULL,
	[appitude] [nvarchar](max) NULL,
	[attitude] [nvarchar](max) NULL,
	[recommendation] [nvarchar](max) NULL,
 CONSTRAINT [PK_recommendation] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC,
	[teacher] ASC,
	[date] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectionSubject]    Script Date: 10/27/2013 17:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionSubject](
	[CCSec] [int] NOT NULL,
	[subjectId] [nvarchar](50) NOT NULL,
	[teacher] [nvarchar](10) NULL,
 CONSTRAINT [PK_SectionSubject] PRIMARY KEY CLUSTERED 
(
	[CCSec] ASC,
	[subjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[insertPersonalInfo]    Script Date: 10/27/2013 17:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertPersonalInfo] 
	-- Add the parameters for the stored procedure here
	@pKId nvarchar(10),
	@firstName nvarchar(50),
	@middleName nvarchar(50)='',
	@lastName nvarchar(50),
	@campusId int=null,
	@phone nvarchar(50)=null,
	@cellNo nvarchar(50),
	@emergencyContact nvarchar(50),
	@email nvarchar(50)=null,
	@dOB date,
	@enrollmentdate date,
	@gender int,
	@userType nvarchar(50), 
	@isActive bit=null,
	@isNew bit=null,
	@passCode nvarchar(50)='12345',
	@address1 nvarchar(50)=null,
	@address2 nvarchar(50)=null,
	@address3 nvarchar(50)=null,
	@filename nvarchar(50)=null,
	@recordfile varbinary(max)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
insert into [dbo].[personalInfo]
(pKId,firstName, middleName,lastName,campusId,
phone,cellNo,emergencyContact,eMail,dOB,enrollmentDate,
gender,userType,isActive,isNew,passCode,
address1,address2,address3,fileName,recordFile)
values
(@pKId,@firstName, @middleName,@lastName,@campusId,
@phone,@cellNo,@emergencyContact,@eMail,@dOB,@enrollmentDate,
cast(@gender as bit),@userType,@isActive,@isNew,@passCode,
@address1,@address2,@address3,@fileName,@recordFile)

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertSectionClass]    Script Date: 10/27/2013 17:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertSectionClass]
	@pkid varchar(10),
	@classId nvarchar(50),
	@sectionId	int
	
	
AS
BEGIN
declare @campusId as int;

	SET NOCOUNT ON;
begin transaction ;
	select @campusId=campusId from dbo.personalInfo where dbo.personalInfo.pKId=@pkid;
	Commit transaction;
    insert into dbo.CampusClassSection
    (classId,campusId,sectionId)
    values
    (@classId,@campusId,@sectionId);
END
GO
/****** Object:  StoredProcedure [dbo].[spSlectCampusTeachers]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamza Sarwar
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSlectCampusTeachers] 
	@pKId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select pKId,[firstName]+ ' ' +[lastName]as [name] FROM dbo.personalInfo
	where (campusId=(select campusId from dbo.PersonalInfo where pKId=@pkid)) 
	AND	(userType='teacher')
	AND (isActive='true')
END
GO
/****** Object:  Table [dbo].[SubjectNotes]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubjectNotes](
	[CCSec] [int] NOT NULL,
	[subjectId] [nvarchar](50) NOT NULL,
	[date] [nchar](10) NOT NULL,
	[number] [int] IDENTITY(1,1) NOT NULL,
	[fileName] [nvarchar](50) NULL,
	[dataFile] [varbinary](max) NULL,
	[teacher] [nvarchar](10) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_SubjectNotes] PRIMARY KEY CLUSTERED 
(
	[CCSec] ASC,
	[subjectId] ASC,
	[date] ASC,
	[number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentSubject]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSubject](
	[CCSec] [int] NULL,
	[pKId] [nvarchar](10) NOT NULL,
	[subjectId] [nvarchar](50) NOT NULL,
	[grade] [nvarchar](10) NULL,
 CONSTRAINT [PK_StudentSubject] PRIMARY KEY CLUSTERED 
(
	[pKId] ASC,
	[subjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[surveyId] [int] NOT NULL,
	[surveyName] [nvarchar](50) NOT NULL,
	[surveyDate] [date] NOT NULL,
	[surveyGeneratedBy] [nvarchar](10) NOT NULL,
	[surveyGeneratedFor] [nvarchar](50) NOT NULL,
	[type] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED 
(
	[surveyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyRepy]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyRepy](
	[surveyId] [int] NOT NULL,
	[questionId] [int] NOT NULL,
	[answer] [nvarchar](max) NULL,
	[repliedBy] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_SurveyRepy] PRIMARY KEY CLUSTERED 
(
	[surveyId] ASC,
	[questionId] ASC,
	[repliedBy] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAttendance]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAttendance](
	[pKId] [nvarchar](10) NOT NULL,
	[subjectId] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[attendance] [bit] NULL,
	[smilies] [bit] NULL,
 CONSTRAINT [PK_StudentAttendance] PRIMARY KEY CLUSTERED 
(
	[pKId] ASC,
	[subjectId] ASC,
	[date] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spSelectCampusDetails]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hamza Sarwar>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectCampusDetails] 
	@pKId  nvarchar(10)=null/*,
	@campusId int=0,
	@sectionId int = 0,
	@classId nvarchar(50) = null */
	
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT        dbo.Campus.campusName, dbo.Class.className, dbo.Section.sectionName,CampusClassSection.CCSec
	FROM          CampusClassSection 
	INNER JOIN
                  Campus ON CampusClassSection.campusId = Campus.campusId 
    INNER JOIN
                  PersonalInfo ON Campus.campusId = PersonalInfo.campusId
    INNER JOIN
				  Class ON CampusClassSection.classId = dbo.Class.classId
	INNER JOIN
				  Section ON CampusClassSection.sectionId = dbo.Section.sectionId          
 where 
	(@pKId=dbo.personalInfo.pKId )/*or @pKId is null) and
	(@campusId=dbo.CampusClassSection.campusId OR @campusId =0 )AND
	(@sectionId=dbo.CampusClassSection.sectionId OR @sectionId =0) AND
	(@classId=dbo.CampusClassSection.classId or @classId is null);*/
	
	
	
END
GO
/****** Object:  Table [dbo].[note]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[note](
	[createdBy] [nvarchar](10) NOT NULL,
	[noteId] [nvarchar](50) NOT NULL,
	[note] [nvarchar](500) NULL,
 CONSTRAINT [PK_note] PRIMARY KEY CLUSTERED 
(
	[noteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[issue]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[issue](
	[issueId] [int] IDENTITY(1,1) NOT NULL,
	[generatedBy] [nvarchar](10) NOT NULL,
	[generatedFor] [nvarchar](10) NOT NULL,
	[issue] [nvarchar](500) NOT NULL,
	[linkedWith] [int] NULL,
	[status] [bit] NULL,
	[issueDate] [date] NULL,
	[isNew] [bit] NOT NULL,
 CONSTRAINT [PK_issue] PRIMARY KEY CLUSTERED 
(
	[issueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[pKId] [nvarchar](10) NOT NULL,
	[date] [date] NOT NULL,
	[attendance] [bit] NULL,
 CONSTRAINT [PK_Attandus] PRIMARY KEY CLUSTERED 
(
	[pKId] ASC,
	[date] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[CCSec] [int] NULL,
	[SubjectId] [nvarchar](50) NOT NULL,
	[examTypeId] [nvarchar](10) NULL,
	[examDate] [date] NOT NULL,
	[totalMarks] [int] NULL,
 CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC,
	[examDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coursePlan]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coursePlan](
	[progressId] [int] NOT NULL,
	[CCSec] [int] NOT NULL,
	[subjectId] [nvarchar](50) NOT NULL,
	[Goal] [nvarchar](max) NULL,
	[achieved] [nvarchar](max) NULL,
	[year] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_coursePlan] PRIMARY KEY CLUSTERED 
(
	[progressId] ASC,
	[CCSec] ASC,
	[subjectId] ASC,
	[year] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Assignments](
	[fileName] [nvarchar](50) NULL,
	[hometask] [varbinary](max) NULL,
	[student] [nvarchar](10) NOT NULL,
	[CCsec] [int] NOT NULL,
	[subjectId] [nvarchar](50) NOT NULL,
	[number] [int] NOT NULL,
	[assignmentDate] [date] NOT NULL,
	[ismarked] [bit] NOT NULL,
	[marks] [real] NULL,
	[comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_Assignments] PRIMARY KEY CLUSTERED 
(
	[student] ASC,
	[CCsec] ASC,
	[subjectId] ASC,
	[number] ASC,
	[assignmentDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SurveyResponse]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyResponse](
	[surveyId] [int] NOT NULL,
	[repliedBy] [nvarchar](10) NOT NULL,
	[repliedDate] [date] NOT NULL,
 CONSTRAINT [PK_SurveyResponse] PRIMARY KEY CLUSTERED 
(
	[surveyId] ASC,
	[repliedBy] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAddNotes]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamza Sarwar
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddNotes]
	@subjectName  nvarchar(50),
	@sectionName nvarchar(50),
	@className nvarchar(50),
	@teacher nvarchar(10),
	@assignDate date,
	@fileName nvarchar(50)=null,
	@dataFile varbinary(max)=null,
	@description nvarchar(max)
	
AS
BEGIN
	declare @secid  int;
	declare @subId  nvarchar(50);
	declare @clsId nvarchar(50);
	declare @temp int ;
	declare @campusId int;
	SET NOCOUNT ON;

    select @secId=sectionId from dbo.Section where sectionName=@sectionName;
	select @campusId=campusId from dbo.PersonalInfo where @teacher=pKId;
	select @subId=subjectId from dbo.Subjects where subjectName=@subjectName;
	select @clsId=classId from dbo.class where @className=className;
	select @temp=CCSec from dbo.CampusClassSection where 
	(@secId=sectionId)AND(@campusId=campusId)AND(@clsId=classId);
	
	insert into dbo.SubjectNotes(CCSec,subjectId,date,fileName,dataFile,teacher,description)
	values (@temp,@subId,@assignDate,@fileName,@dataFile,@teacher,@description);
END
GO
/****** Object:  Table [dbo].[StudentExam]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExam](
	[subjectId] [nvarchar](50) NOT NULL,
	[examDate] [date] NOT NULL,
	[obtainedMarks] [real] NULL,
	[ispresent] [bit] NULL,
	[pKId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_StudentExam] PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC,
	[examDate] ASC,
	[pKId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAssignTeacher]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamza Sarwar
-- Create date: eid ke chutyea :'(
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAssignTeacher] 
	@subjectName  nvarchar(50),
	@sectionName nvarchar(50),
	@className nvarchar(50),
	@pKId nvarchar(10),
	@iAm nvarchar(10)
	
AS
BEGIN
	declare @secid  int;
	declare @subId  nvarchar(50);
	declare @clsId nvarchar(50);
	declare @temp int ;
	declare @campusId int;
	SET NOCOUNT ON;
select @secId=sectionId from dbo.Section where sectionName=@sectionName;
select @campusId=campusId from dbo.PersonalInfo where @iAm=pKId;
select @subId=subjectId from dbo.Subjects where subjectName=@subjectName;
select @clsId=classId from dbo.class where @className=className;
select @temp=CCSec from dbo.CampusClassSection where 
(@secId=sectionId)AND(@campusId=campusId)AND(@clsId=classId);
Insert into dbo.SectionSubject (CCSec,SubjectId,teacher) 
values (@temp,@subId,@pKId);

END
GO
/****** Object:  StoredProcedure [dbo].[spAssignClassSection]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamza
-- Create date: during paperz
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAssignClassSection]
	@studentId nvarchar(10),
	@iAm nvarchar(10),
	@className nvarchar(50),
	@sectionName nvarchar(50)
AS
BEGIN
	DECLARE @classId nvarchar(50);
	DECLARE @sectionId int;
	DECLARE @campusId int;
	DECLARE @temp int;
	DECLARE @tab Table (id int IDENTITY(1,1) ,subjectId nvarchar(50));
	Declare @subject nvarchar(50);
	
SET NOCOUNT ON;
	
	SELECT @classId=classId FROM dbo.Class WHERE @className=classNAme;
	SELECT @campusId=campusId FROM dbo.PersonalInfo WHERE @iAm=pKId;
	SELECT @sectionId=sectionId FROM dbo.Section WHERE @sectionName=sectionName;
	SELECT @temp =CCSec FROM dbo.CampusClassSection 
	Where  (@sectionId=sectionId)
	AND	   (@classId=classId)
	AND    (@campusId=campusId);
	--SELECT @subjectId FROM dbo.SectionSubject WHERE CCSec=@temp;
	--print(@subjectId);
	--VALUES (@temp,@studentId,@subjectId);
	
	INSERT INTO @tab (subjectId) select subjectId FROM dbo.SectionSubject WHERE CCSec=@temp;
	
	DECLARE @i int = 0;
	DECLARE @j int ;
	select @j=max(id) from @tab;
	WHILE @i <@j   
	BEGIN
		SET @i = @i + 1;
		select @subject = subjectId from @tab where @i=id;
		INSERT INTO dbo.StudentSubject (CCSec,pKId,subjectId) 
		VALUES (@temp,@studentId,@subject);
    /* do some work */
	END
	
	  
	
	
	
    
END
GO
/****** Object:  StoredProcedure [dbo].[spAddSurvey]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddSurvey] 
	@surveyId int,
	@surveyName varchar(50),
	@surveyDate date,
	@generatedBy int,
	@generatedFor nvarchar(50),
	@type bit ,
	@isActive bit='true'
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   insert into dbo.survey (surveyId,surveyName,surveyDate,surveyGeneratedBy,surveyGeneratedFor,type,isActive)
   values
   (@surveyId,@surveyName,@surveyDate,@generatedBy,@generatedFor,@type,@isActive);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertExamDate]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertExamDate] 
	@iAm nvarchar(10),
	@subjectName  nvarchar(50),
	@sectionName nvarchar(50),
	@className nvarchar(50),
	@examTypeId nvarchar(10),
	@examDate date,
	@totalMarks int 
	
AS
BEGIN
	declare @secid  int;
	declare @subId  nvarchar(50);
	declare @clsId nvarchar(50);
	declare @temp int ;
	declare @campusId int;	
	
SET NOCOUNT ON;

    -- Insert statements for procedure here
	select @secId=sectionId from dbo.Section where sectionName=@sectionName;
	select @campusId=campusId from dbo.PersonalInfo where @iAm=pKId;
	select @subId=subjectId from dbo.Subjects where subjectName=@subjectName;
	select @clsId=classId from dbo.class where @className=className;
	select @temp=CCSec from dbo.CampusClassSection where 
	(@secId=sectionId)AND(@campusId=campusId)AND(@clsId=classId);
	
	INSERT INTO dbo.Exams (CCSec,SubjectId,ExamTypeId,examDate,totalMarks)
	values (@temp, @subId,@examTypeId,@examDate,@totalMarks);
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectStudent]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectStudent]
	@iAm nvarchar(10)=null,
	@campusName nvarchar(50)=null,
	@className nvarchar(50)=null,
	@sectionName nvarchar(50)=null,
	@isActive bit = null,
	@studentId nvarchar(10)=null
	 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if (@iAm  is not null)
	begin
		select @campusName = campusName from dbo.campus
		join dbo.personalInfo on campus.campusId=personalInfo.campusId	
		where @iAm=personalInfo.pKId
	end
    SELECT Distinct personalInfo.pKId as [School ID], min([firstName]+' '+[lastName]) as [Name],
    CAST(MIN(CAST(personalInfo.isActive AS INT)) AS BIT) as [Status], min(campusName) as [Campus] , min(className) as [Class],
    min(sectionName) as [Section] 
    from dbo.PersonalInfo
    
    join dbo.Campus
    on dbo.campus.campusId=dbo.PersonalInfo.campusId
    join dbo.CampusClassSection
    on dbo.CampusClassSection.campusId=dbo.campus.campusId
    join dbo.class
    on dbo.class.classId=dbo.CampusClassSection.classId
    join dbo.section
    on dbo.section.sectionId=dbo.CampusClassSection.sectionId
    join dbo.studentSubject
    on dbo.studentSubject.CCSec=dbo.CampusClassSection.CCSec
    where
    (dbo.personalInfo.userType='student')
    and 
    ((dbo.Campus.campusName=@campusName) or (@campusName is null))
    and
    ((dbo.class.className = @className) or (@className is Null))
    and 
    ((dbo.section.SectionName = @SectionName) or (@SectionName is Null))
    and 
    ((dbo.personalInfo.isActive=@isActive) or (@isActive is null))
    and
    ((dbo.personalInfo.pKId=@studentId) or (@studentId is null))
    group by personalInfo.pKId
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectSectionStudents]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectSectionStudents]
	@subjectName  nvarchar(50),
	@sectionName nvarchar(50),
	@className nvarchar(50),
	@teacher nvarchar(10)

AS
BEGIN
	declare @secid  int;
	declare @subId nvarchar(50);
	declare @clsId nvarchar(50);
	declare @temp int ;
	declare @campusId int;
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    select @secId=sectionId from dbo.Section where sectionName=@sectionName;
	select @campusId=campusId from dbo.PersonalInfo where @teacher=pKId;
	select @subId=subjectId from dbo.Subjects where subjectName=@subjectName;
	select @clsId=classId from dbo.class where @className=className;
	select @temp=CCSec from dbo.CampusClassSection where 
	(@secId=sectionId)AND(@campusId=campusId)AND(@clsId=classId);
	
	SELECT dbo.StudentSubject.pKId as [School ID],[firstName]+ ' '+[lastName] as [Student Name]
	from dbo.StudentSubject
	join dbo.personalInfo
	on StudentSubject.pKId = personalInfo.pKId
	WHERE @temp=dbo.StudentSubject.CCSec;
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectPendingIssues]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamza Sarwar
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectPendingIssues]
	@pKId nvarchar(10)
	
AS
BEGIN
	SELECT issue,generatedBy,issueId FROM dbo.ISSUE 
	WHERE (@pKId=generatedFor)
	AND (status='false');
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectIssue]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamza Sarwar
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[spSelectIssue]
	@issueId int
	
AS
BEGIN
	SELECT * FROM dbo.ISSUE 
	WHERE (@issueId=issueId);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertNewIssue]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hamza Sarwar>
-- Create date: <9/22/2013>
-- Description:	<insert mew issue >
-- =============================================
CREATE PROCEDURE [dbo].[spInsertNewIssue]
	-- Add the parameters for the stored procedure here

	@generatedBy nvarchar(10),
	@generatedFor nvarchar(10),
	@issue nvarchar(500),
	@linkedWith int=null,
	@issueDate date=null,
	@isNew bit='true'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if (@isNew='true')
	BEGIN
		set @linkedWith=null;
	END
    -- Insert statements for procedure here
	insert into dbo.issue 
	(generatedBy,generatedFor,issue,linkedWith,issueDate,isNew)
	values
	(@generatedBy,@generatedFor,@issue,@linkedWith,@issueDate,@isNew);
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertTeacherAttendance]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamza Sarwar
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertTeacherAttendance]
	-- Add the parameters for the stored procedure here
	@pKId nvarchar(50),
	@date DATE,
	@attendance bit = 'false'
AS
BEGIN
	INSERT INTO dbo.Attendance (pKId,date,attendance) values
	(@pKId,@date,@attendance)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertSurveyResponse]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertSurveyResponse]
	@surveyId int,
	@repliedBy int,
	@replyDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
insert into dbo.SurveyResponse (surveyId,repliedBy,repliedDate)
values
(@surveyId,@repliedBy,@replyDate);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertCourseProgress]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hamza Sarwar
-- Create date: Eid ke chutyea 
-- Description:	missing BBQ
-- =============================================
CREATE PROCEDURE [dbo].[spInsertCourseProgress] 
	@subjectName  nvarchar(50),
	@sectionName nvarchar(50),
	@className nvarchar(50),
	@pKId nvarchar(10),
	@progressId int,
	@year nvarchar(50),
	@goal nvarchar(max)
AS
BEGIN
	declare @secid  int;
	declare @subId  nvarchar(50);
	declare @clsId nvarchar(50);
	declare @temp int ;
	declare @campusId int;
	
SET NOCOUNT ON;
	select @secId=sectionId from dbo.Section where sectionName=@sectionName;
	select @campusId=campusId from dbo.PersonalInfo where @pkId=pKId;
	select @subId=subjectId from dbo.Subjects where subjectName=@subjectName;
	select @clsId=classId from dbo.class where @className=className;
	select @temp=CCSec from dbo.CampusClassSection where 
	(@secId=sectionId)AND(@campusId=campusId)AND(@clsId=classId);
	
	insert into dbo.CoursePlan (progressId,CCSec,subjectId,goal,year)
	values (@progressId,@temp,@subId,@goal,@year);
END
GO
/****** Object:  StoredProcedure [dbo].[spAddStudentMarks]    Script Date: 10/27/2013 17:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddStudentMarks] 
	-- Add the parameters for the stored procedure here
	@subjectName nvarchar(50),
	@examDate date,
	@obtainedMarks real,
	@ispresent bit='true',
	@pkid nvarchar(10)
AS
BEGIN
	DECLARE @subId  nvarchar(50);
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
	select @subId=subjectId from dbo.Subjects where subjectName=@subjectName;
    -- Insert statements for procedure here
	INSERT INTO dbo.StudentExam (subjectId,examDate,obtainedMarks,isPresent,pKId)
	values (@subId,@examDate,@obtainedMarks,@isPresent,@pKId);
END
GO
/****** Object:  Default [DF_Campus_isActive]    Script Date: 10/27/2013 17:25:44 ******/
ALTER TABLE [dbo].[Campus] ADD  CONSTRAINT [DF_Campus_isActive]  DEFAULT ('true') FOR [isActive]
GO
/****** Object:  Default [DF_PersonalInfo_isActive]    Script Date: 10/27/2013 17:25:44 ******/
ALTER TABLE [dbo].[PersonalInfo] ADD  CONSTRAINT [DF_PersonalInfo_isActive]  DEFAULT ('false') FOR [isActive]
GO
/****** Object:  Default [DF_PersonalInfo_isNew]    Script Date: 10/27/2013 17:25:44 ******/
ALTER TABLE [dbo].[PersonalInfo] ADD  CONSTRAINT [DF_PersonalInfo_isNew]  DEFAULT ('true') FOR [isNew]
GO
/****** Object:  Default [DF_issue_status]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[issue] ADD  CONSTRAINT [DF_issue_status]  DEFAULT ('false') FOR [status]
GO
/****** Object:  Default [DF_Assignments_isActive]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[Assignments] ADD  CONSTRAINT [DF_Assignments_isActive]  DEFAULT ('False') FOR [ismarked]
GO
/****** Object:  ForeignKey [FK_Campus_ZipCode]    Script Date: 10/27/2013 17:25:44 ******/
ALTER TABLE [dbo].[Campus]  WITH NOCHECK ADD  CONSTRAINT [FK_Campus_ZipCode] FOREIGN KEY([zipCode])
REFERENCES [dbo].[ZipCodes] ([zipCode])
GO
ALTER TABLE [dbo].[Campus] CHECK CONSTRAINT [FK_Campus_ZipCode]
GO
/****** Object:  ForeignKey [FK_CampusClassSection_Campus]    Script Date: 10/27/2013 17:25:44 ******/
ALTER TABLE [dbo].[CampusClassSection]  WITH CHECK ADD  CONSTRAINT [FK_CampusClassSection_Campus] FOREIGN KEY([campusId])
REFERENCES [dbo].[Campus] ([campusId])
GO
ALTER TABLE [dbo].[CampusClassSection] CHECK CONSTRAINT [FK_CampusClassSection_Campus]
GO
/****** Object:  ForeignKey [FK_CampusClassSection_Class]    Script Date: 10/27/2013 17:25:44 ******/
ALTER TABLE [dbo].[CampusClassSection]  WITH CHECK ADD  CONSTRAINT [FK_CampusClassSection_Class] FOREIGN KEY([classId])
REFERENCES [dbo].[Class] ([classId])
GO
ALTER TABLE [dbo].[CampusClassSection] CHECK CONSTRAINT [FK_CampusClassSection_Class]
GO
/****** Object:  ForeignKey [FK_CampusClassSection_Section]    Script Date: 10/27/2013 17:25:44 ******/
ALTER TABLE [dbo].[CampusClassSection]  WITH CHECK ADD  CONSTRAINT [FK_CampusClassSection_Section] FOREIGN KEY([sectionId])
REFERENCES [dbo].[Section] ([sectionId])
GO
ALTER TABLE [dbo].[CampusClassSection] CHECK CONSTRAINT [FK_CampusClassSection_Section]
GO
/****** Object:  ForeignKey [FK_PersonalInfo_Campus]    Script Date: 10/27/2013 17:25:44 ******/
ALTER TABLE [dbo].[PersonalInfo]  WITH CHECK ADD  CONSTRAINT [FK_PersonalInfo_Campus] FOREIGN KEY([campusId])
REFERENCES [dbo].[Campus] ([campusId])
GO
ALTER TABLE [dbo].[PersonalInfo] CHECK CONSTRAINT [FK_PersonalInfo_Campus]
GO
/****** Object:  ForeignKey [FK_PersonalInfo_UserType]    Script Date: 10/27/2013 17:25:44 ******/
ALTER TABLE [dbo].[PersonalInfo]  WITH NOCHECK ADD  CONSTRAINT [FK_PersonalInfo_UserType] FOREIGN KEY([userType])
REFERENCES [dbo].[UserType] ([userType])
GO
ALTER TABLE [dbo].[PersonalInfo] CHECK CONSTRAINT [FK_PersonalInfo_UserType]
GO
/****** Object:  ForeignKey [FK_recommendation_PersonalInfo(student)]    Script Date: 10/27/2013 17:25:46 ******/
ALTER TABLE [dbo].[recommendation]  WITH CHECK ADD  CONSTRAINT [FK_recommendation_PersonalInfo(student)] FOREIGN KEY([studentId])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[recommendation] CHECK CONSTRAINT [FK_recommendation_PersonalInfo(student)]
GO
/****** Object:  ForeignKey [FK_recommendation_PersonalInfo(teacher)]    Script Date: 10/27/2013 17:25:46 ******/
ALTER TABLE [dbo].[recommendation]  WITH CHECK ADD  CONSTRAINT [FK_recommendation_PersonalInfo(teacher)] FOREIGN KEY([teacher])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[recommendation] CHECK CONSTRAINT [FK_recommendation_PersonalInfo(teacher)]
GO
/****** Object:  ForeignKey [FK_SectionSubject_CampusClassSection]    Script Date: 10/27/2013 17:25:46 ******/
ALTER TABLE [dbo].[SectionSubject]  WITH CHECK ADD  CONSTRAINT [FK_SectionSubject_CampusClassSection] FOREIGN KEY([CCSec])
REFERENCES [dbo].[CampusClassSection] ([CCSec])
GO
ALTER TABLE [dbo].[SectionSubject] CHECK CONSTRAINT [FK_SectionSubject_CampusClassSection]
GO
/****** Object:  ForeignKey [FK_SectionSubject_PersonalInfo]    Script Date: 10/27/2013 17:25:46 ******/
ALTER TABLE [dbo].[SectionSubject]  WITH CHECK ADD  CONSTRAINT [FK_SectionSubject_PersonalInfo] FOREIGN KEY([teacher])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[SectionSubject] CHECK CONSTRAINT [FK_SectionSubject_PersonalInfo]
GO
/****** Object:  ForeignKey [FK_SectionSubject_Subjects]    Script Date: 10/27/2013 17:25:46 ******/
ALTER TABLE [dbo].[SectionSubject]  WITH CHECK ADD  CONSTRAINT [FK_SectionSubject_Subjects] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subjects] ([subjectId])
GO
ALTER TABLE [dbo].[SectionSubject] CHECK CONSTRAINT [FK_SectionSubject_Subjects]
GO
/****** Object:  ForeignKey [FK_SubjectNotes_CampusClassSection]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[SubjectNotes]  WITH CHECK ADD  CONSTRAINT [FK_SubjectNotes_CampusClassSection] FOREIGN KEY([CCSec])
REFERENCES [dbo].[CampusClassSection] ([CCSec])
GO
ALTER TABLE [dbo].[SubjectNotes] CHECK CONSTRAINT [FK_SubjectNotes_CampusClassSection]
GO
/****** Object:  ForeignKey [FK_SubjectNotes_PersonalInfo]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[SubjectNotes]  WITH CHECK ADD  CONSTRAINT [FK_SubjectNotes_PersonalInfo] FOREIGN KEY([teacher])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[SubjectNotes] CHECK CONSTRAINT [FK_SubjectNotes_PersonalInfo]
GO
/****** Object:  ForeignKey [FK_SubjectNotes_Subjects]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[SubjectNotes]  WITH CHECK ADD  CONSTRAINT [FK_SubjectNotes_Subjects] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subjects] ([subjectId])
GO
ALTER TABLE [dbo].[SubjectNotes] CHECK CONSTRAINT [FK_SubjectNotes_Subjects]
GO
/****** Object:  ForeignKey [FK_StudentSubject_PersonalInfo]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[StudentSubject]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubject_PersonalInfo] FOREIGN KEY([pKId])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[StudentSubject] CHECK CONSTRAINT [FK_StudentSubject_PersonalInfo]
GO
/****** Object:  ForeignKey [FK_StudentSubject_SectionSubject]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[StudentSubject]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubject_SectionSubject] FOREIGN KEY([CCSec])
REFERENCES [dbo].[CampusClassSection] ([CCSec])
GO
ALTER TABLE [dbo].[StudentSubject] CHECK CONSTRAINT [FK_StudentSubject_SectionSubject]
GO
/****** Object:  ForeignKey [FK_StudentSubject_Subjects]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[StudentSubject]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubject_Subjects] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subjects] ([subjectId])
GO
ALTER TABLE [dbo].[StudentSubject] CHECK CONSTRAINT [FK_StudentSubject_Subjects]
GO
/****** Object:  ForeignKey [FK_Survey_PersonalInfo]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[Survey]  WITH NOCHECK ADD  CONSTRAINT [FK_Survey_PersonalInfo] FOREIGN KEY([surveyGeneratedBy])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_PersonalInfo]
GO
/****** Object:  ForeignKey [FK_Survey_UserType]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[Survey]  WITH NOCHECK ADD  CONSTRAINT [FK_Survey_UserType] FOREIGN KEY([surveyGeneratedFor])
REFERENCES [dbo].[UserType] ([userType])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_UserType]
GO
/****** Object:  ForeignKey [FK_SurveyRepy_PersonalInfo]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[SurveyRepy]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyRepy_PersonalInfo] FOREIGN KEY([repliedBy])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[SurveyRepy] CHECK CONSTRAINT [FK_SurveyRepy_PersonalInfo]
GO
/****** Object:  ForeignKey [FK_SurveyRepy_SurveyQuestion]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[SurveyRepy]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyRepy_SurveyQuestion] FOREIGN KEY([surveyId], [questionId])
REFERENCES [dbo].[SurveyQuestions] ([surveyId], [questionId])
GO
ALTER TABLE [dbo].[SurveyRepy] CHECK CONSTRAINT [FK_SurveyRepy_SurveyQuestion]
GO
/****** Object:  ForeignKey [FK_StudentAttendance_PersonalInfo]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[StudentAttendance]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentAttendance_PersonalInfo] FOREIGN KEY([pKId])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[StudentAttendance] CHECK CONSTRAINT [FK_StudentAttendance_PersonalInfo]
GO
/****** Object:  ForeignKey [FK_StudentAttendance_Subjects]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[StudentAttendance]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendance_Subjects] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subjects] ([subjectId])
GO
ALTER TABLE [dbo].[StudentAttendance] CHECK CONSTRAINT [FK_StudentAttendance_Subjects]
GO
/****** Object:  ForeignKey [FK_note_PersonalInfo]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[note]  WITH NOCHECK ADD  CONSTRAINT [FK_note_PersonalInfo] FOREIGN KEY([createdBy])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[note] CHECK CONSTRAINT [FK_note_PersonalInfo]
GO
/****** Object:  ForeignKey [FK_issue_issue]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[issue]  WITH NOCHECK ADD  CONSTRAINT [FK_issue_issue] FOREIGN KEY([linkedWith])
REFERENCES [dbo].[issue] ([issueId])
GO
ALTER TABLE [dbo].[issue] CHECK CONSTRAINT [FK_issue_issue]
GO
/****** Object:  ForeignKey [FK_issue_PersonalInfoby]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[issue]  WITH NOCHECK ADD  CONSTRAINT [FK_issue_PersonalInfoby] FOREIGN KEY([generatedBy])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[issue] CHECK CONSTRAINT [FK_issue_PersonalInfoby]
GO
/****** Object:  ForeignKey [FK_issue_PersonalInfofor]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[issue]  WITH NOCHECK ADD  CONSTRAINT [FK_issue_PersonalInfofor] FOREIGN KEY([generatedFor])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[issue] CHECK CONSTRAINT [FK_issue_PersonalInfofor]
GO
/****** Object:  ForeignKey [FK_Attendance_PersonalInfo]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_PersonalInfo] FOREIGN KEY([pKId])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_PersonalInfo]
GO
/****** Object:  ForeignKey [FK_Exams_CampusClassSection]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_CampusClassSection] FOREIGN KEY([CCSec])
REFERENCES [dbo].[CampusClassSection] ([CCSec])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_CampusClassSection]
GO
/****** Object:  ForeignKey [FK_Exams_ExamType]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_ExamType] FOREIGN KEY([examTypeId])
REFERENCES [dbo].[ExamType] ([examTypeId])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_ExamType]
GO
/****** Object:  ForeignKey [FK_Exams_Subjects]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Subjects] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([subjectId])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_Subjects]
GO
/****** Object:  ForeignKey [FK_coursePlan_ProgressMethod]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[coursePlan]  WITH CHECK ADD  CONSTRAINT [FK_coursePlan_ProgressMethod] FOREIGN KEY([progressId])
REFERENCES [dbo].[ProgressMethod] ([progressId])
GO
ALTER TABLE [dbo].[coursePlan] CHECK CONSTRAINT [FK_coursePlan_ProgressMethod]
GO
/****** Object:  ForeignKey [FK_coursePlan_SectionSubject]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[coursePlan]  WITH CHECK ADD  CONSTRAINT [FK_coursePlan_SectionSubject] FOREIGN KEY([CCSec], [subjectId])
REFERENCES [dbo].[SectionSubject] ([CCSec], [subjectId])
GO
ALTER TABLE [dbo].[coursePlan] CHECK CONSTRAINT [FK_coursePlan_SectionSubject]
GO
/****** Object:  ForeignKey [FK_Assignments_PersonalInfo]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_PersonalInfo] FOREIGN KEY([student])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_PersonalInfo]
GO
/****** Object:  ForeignKey [FK_Assignments_SectionSubject]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_SectionSubject] FOREIGN KEY([CCsec], [subjectId])
REFERENCES [dbo].[SectionSubject] ([CCSec], [subjectId])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_SectionSubject]
GO
/****** Object:  ForeignKey [FK_SurveyResponse_PersonalInfo]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[SurveyResponse]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyResponse_PersonalInfo] FOREIGN KEY([repliedBy])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[SurveyResponse] CHECK CONSTRAINT [FK_SurveyResponse_PersonalInfo]
GO
/****** Object:  ForeignKey [FK_SurveyResponse_Survey]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[SurveyResponse]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyResponse_Survey] FOREIGN KEY([surveyId])
REFERENCES [dbo].[Survey] ([surveyId])
GO
ALTER TABLE [dbo].[SurveyResponse] CHECK CONSTRAINT [FK_SurveyResponse_Survey]
GO
/****** Object:  ForeignKey [FK_StudentExam_Exams]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [FK_StudentExam_Exams] FOREIGN KEY([subjectId], [examDate])
REFERENCES [dbo].[Exams] ([SubjectId], [examDate])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Exams]
GO
/****** Object:  ForeignKey [FK_StudentExam_PersonalInfo]    Script Date: 10/27/2013 17:25:47 ******/
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [FK_StudentExam_PersonalInfo] FOREIGN KEY([pKId])
REFERENCES [dbo].[PersonalInfo] ([pKId])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_PersonalInfo]
GO
