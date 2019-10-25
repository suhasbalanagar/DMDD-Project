USE [Project]
GO


CREATE TABLE Twitter_Users (
    Name nvarchar(50),
    ScreenName nvarchar(50) PRIMARY KEY,
	Location nvarchar(50),
	Followers float(50),
	Friends float,
	List float,
	Favourites float,
	Verified bit,
	StatusCount float,
	Description nvarchar(500));

SELECT * FROM Twitter_Users;

DROP TABLE Twitter_Users;


create table Tweets_data
(ScreenName nvarchar(50),
 Tweets nvarchar(MAX),
 Time_stamp datetime,
CONSTRAINT Tweets_data_fk FOREIGN KEY (ScreenName)     
    REFERENCES  Twitter_Users(ScreenName));

SELECT * FROM Tweets_data;


---Drop and Create 

drop table [CollegeTwitterName]

ALTER TABLE [dbo].[CollegeTwitterName](
	[ID] [double] PRIMARY KEY,
	[UserName] [nvarchar](255) NULL,
	[College] [nvarchar](255) NULL,
	[TweetFollowers] [float] NULL,
	[Tweet] [nvarchar](255) NULL,
	[TweetTime] [datetime] NULL,
	[Retweets] [float] NULL,
	[ScreenName] [nvarchar](255) UNIQUE
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CollegeTwitter](
	[ID] [float] NULL,
	[UserName] [nvarchar](255) NULL,
	[College] [nvarchar](255) NULL,
	[TweetFollowers] [float] NULL,
	[Tweet] [nvarchar](255) NULL,
	[TweetTime] [datetime] NULL,
	[Retweets] [float] NULL,
	[ScreenName] [nvarchar](255) NULL
) ON [PRIMARY]
GO


------------------------------------------------------------------
create table Instagram_Users
(Username nvarchar(200) PRIMARY KEY, 
UserID float,
Followers float,
Biography nvarchar(4000),
Followees float,
FullName nvarchar(100)
);
SELECT * from Instagram_Users

DELETE  Instagram_Users
 

--Instagram


create table Instagram_Posts
(Username nvarchar(200), 
Time_stamp datetime,
Likes float,
Comments float
CONSTRAINT Instagram_Posts_fk FOREIGN KEY (Username)     
    REFERENCES  Instagram_Users (Username));

select * from Instagram_Posts

DROP TABLE Instagram_Posts
----------------------------------------------------------------------------------------------------
CREATE TABLE Project_Jobs (
    Position_Title nvarchar(100),
    Req_Number nvarchar(20) PRIMARY KEY,
	Division_College nvarchar(100),
	Inter_Division nvarchar(100),
	Location nvarchar(100),
	Full_Part_Time nvarchar(100),
	Grade float,
	Posting_date datetime,
	Responsibility text,
	Qualification text,
	Additional_info text);

	SELECT * FROM Project_Jobs
	DROP TABLE Project_Jobs

	-------------------------------------------------------------------------------------
CREATE TABLE Loc (
    Location nvarchar(100)
);


CREATE TABLE Locations (
    Locationid int IDENTITY(1,1) PRIMARY KEY,
    Location nvarchar(100)
);

Insert into Locations
SELECT 
Location
FROM Loc;

select * From Locations
---------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------
CREATE TABLE ten (
    Tenure nvarchar(100)
);


CREATE TABLE Tenure (
    Tenureid int IDENTITY(1,1) PRIMARY KEY,
    Tenure nvarchar(100)
);

Insert into Tenure
SELECT 
Tenure
FROM ten;

select * From Tenure
---------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------
CREATE TABLE grd (
    Grade nvarchar(100)
);


CREATE TABLE Grade (
    Gradeid int IDENTITY(1,1) PRIMARY KEY,
    Grade nvarchar(100)
);

Insert into Grade
SELECT 
Grade
FROM grd;

select * From Grade

---------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------
CREATE TABLE Dept (
    Department nvarchar(100)
);


CREATE TABLE Department (
    Departmentid int IDENTITY(1,1) PRIMARY KEY,
    Department nvarchar(100)
);

Insert into Department
SELECT 
Department
FROM Dept;

select * From Department

---------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------
CREATE TABLE inter (
    Inter nvarchar(100)
);


CREATE TABLE Interdisciplinary_College (
    Interid int IDENTITY(1,1) PRIMARY KEY,
    interdiscipline_college nvarchar(100)
);

Insert into Interdisciplinary_College
SELECT 
Inter
FROM inter;

select * From Interdisciplinary_College

---------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------
CREATE TABLE FullPart (
    fullpart nvarchar(100)
);


CREATE TABLE FullPartTime (
    FullPartid int IDENTITY(1,1) PRIMARY KEY,
    FullPartTime nvarchar(100)
);

Insert into FullPartTime
SELECT 
fullpart
FROM FullPart;

select * From Department

---------------------------------------------------------------------------------------------

	-------------------------------------------------------------------------------------
CREATE TABLE pos (
    position nvarchar(100)
);


CREATE TABLE Position (
    positionid int IDENTITY(1,1) PRIMARY KEY,
    position nvarchar(100)
);

Insert into Position
SELECT 
position
FROM pos;

select * From Department

---------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------
CREATE TABLE coll (
    collegename nvarchar(100)
);


CREATE TABLE CollegeNames (
    Collegeid int IDENTITY(1,1) PRIMARY KEY,
    collegename nvarchar(100)
);

Insert into CollegeNames
SELECT 
collegename
FROM coll;

select DISTINCT collegename From CollegeNames
DELETE From CollegeNames


---------------------------------------------------------------------------------------------


	-------------------------------FOR WEBSITE-------------------------------------------
	-------------------------------------------------------------------------------------


	ALTER PROCEDURE GetJobByTitle(@Position_Title AS nvarchar(100))
AS
BEGIN
    SELECT
        Position_Title,
		Req_Number,
		Division_College,
		Location
    FROM 
        Project_Jobs
    WHERE
        Position_Title LIKE '%'+@Position_Title+'%' 
END;
GO

exec GetJobByTitle Professor;

select Position_Title from Project_Jobs;

----------------------------------------------------------------------------------------------------------------------------------
Alter PROCEDURE JobsByCollege(@job_college AS nvarchar(100))
AS
BEGIN
    SELECT
        Division_College,
		Position_Title,
		Req_Number,
		Location
		
    FROM 
        Project_Jobs
    WHERE
        Division_College LIKE '%'+@job_college+'%'
    ORDER BY
        Division_College
END;

exec JobsByCollege 'School of law';

select Division_College from Project_Jobs;
----------------------------------------------------------------------------------------------------------------------------------
exec MoviesInYear 1999;


CREATE PROCEDURE PopularityOfCollege(@popularity AS int)
AS
BEGIN
    SELECT
        COUNT(MovieId) AS NoOfMovies
    FROM 
        OscarMovies
    WHERE
        MovieYear = @sum_year;
END;
exec MoviesInaYear 2014;
select * from Project_Jobs;
select * from Twitter_Users;
select * from Instagram_Users;

SELECT I.FullName,T.Name, I.Followers, T.Followers,Maxi from Instagram_Users I INNER JOIN Twitter_Users T ON I.Username = T.ScreenName ;
SELECT Followers, ROW_NUMBER() OVER( ORDER BY Followers) AS Rank  from Instagram_Users

SELECT  I.FullName,I.Followers+T.Followers AS TotalFollowers,ROW_NUMBER() OVER( ORDER BY TotalFollowers) AS Rank from Instagram_Users I INNER JOIN Twitter_Users T ON I.Username = T.ScreenName;
 ORDER BY TotalFollowers;  

 SELECT * FROM Tweets_data
--------------------------------------------------------------------------------------------------------------------------------
Create PROCEDURE JobsBySkill(@job_Skill AS nvarchar(20))
AS
BEGIN
    SELECT
        Position_Title,
		Req_Number,
		Division_College,
		Qualification
		Location
		
    FROM 
        Project_Jobs
    WHERE
        Qualification LIKE '%'+@job_Skill+'%'
    ORDER BY
        Division_College
END;

exec JobsBySkill MBA;



----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE Max_Comments_Instagram
AS
BEGIN
    SELECT 
        Username, 
        FullName,
		Followers
    FROM 
        Instagram_data
    WHERE
	Followers = (SELECT MAX(Followers) from Instagram_data);
END;
EXEC Max_Comments_Instagram

----------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE GetInstagramUser(@Insta_screen AS nvarchar(200))
AS
BEGIN
    SELECT
        Username,
		Followers,
		FullName
    FROM 
        Instagram_data
    WHERE
        Username = @Insta_screen;
END;
exec GetInstagramUser pegs55;
----------------------------------------------------------------------------------------------------------------------------------

