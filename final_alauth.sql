--Amelia Lauth
--SQL Fall 2023 Final Project 

--Physical Design using SQL 
--Using Horse Race Database 

--I want to begin with the STRONG tables. 
CREATE TABLE OWNER 
(
OWNER_ID int primary key identity(1,1),
OWNER_FNAME varchar(50) not null,
OWNER_LNAME varchar(50) not null,
OWNER_DOB date not null,
OWNER_ADDRESS varchar(20),
OWNER_CITY varchar(20),
OWNER_STATE char(2)
)


CREATE TABLE TRAINER
(
TRAINER_ID int primary key identity(1,1),
TRAINER_FNAME varchar(50) not null,
TRAINER_LNAME varchar(50) not null,
TRAINER_DOB date not null,
TRAINER_CELL_PHONE char(12),
TRAINER_EMAIL varchar(30),
TRAINER_LEVEL decimal(7,2)
)


CREATE TABLE RACE
(
RACE_ID int primary key identity(1,1),
RACE_NAME varchar(250) not null,
RACE_DATE date, 
RACE_LOCATION varchar(50), 
RACE_NUM_HORSES int
)


CREATE TABLE JOCKEY 
(
JOCKEY_ID int primary key identity(1,1),
JOCKEY_FNAME varchar(50) not null,
JOCKEY_LNAME varchar(50) not null,
JOCKEY_DOB date not null,
JOCKEY_CELL_PHONE char(12),
JOCKEY_EMAIL varchar(30),
JOCKEY_SALARY decimal(7,2),
JOCKEY_YEARS_EXPEREINCE decimal(7,2), 
JOCKEY_WEIGHT_LBS decimal(7,2)
)


CREATE TABLE HORSE
(
HORSE_ID int primary key identity(1,1),
HORSE_NAME varchar(100) not null,
HORSE_DOB date not null,
HORSE_COLOR varchar(20),
HORSE_HEIGHT_HANDS decimal(7,2),
HORSE_WEIGHT_LBS decimal(7,2),
HORSE_SEX char(1)
)


--Now that the strong tables are finished, we create the weak tables. 
CREATE TABLE HORSE_OWNER
(
HORSE_ID int references HORSE(HORSE_ID) not null,
OWNER_ID int references OWNER(OWNER_ID) not null,
HORSE_OWNER_YEARS_OWNERSHIP decimal(7,2) not null,
primary key(HORSE_ID, OWNER_ID) --this is our composite key!
)


CREATE TABLE HORSE_JOCKEY
(
HORSE_ID int references HORSE(HORSE_ID) not null,
JOCKEY_ID int references JOCKEY(JOCKEY_ID) not null,
HORSE_JOCKEY_WEIGHT decimal(7,2) not null,
HORSE_JOCKEY_NUMBER int not null,
HORSE_JOCKEY_RACECOLOR varchar(20), 
primary key(HORSE_ID, JOCKEY_ID) --this is our composite key!
)


CREATE TABLE HORSE_TRAINER 
(
HORSE_ID int references HORSE(HORSE_ID) not null,
TRAINER_ID int references TRAINER(TRAINER_ID) not null,
HORSE_TRAINER_YEARS_TRAINING decimal(7,2) not null,
HORSE_TRAINER_BARN varchar(30),
primary key(HORSE_ID, TRAINER_ID) --this is our composite key!
)



CREATE TABLE HORSE_RACE
(
HORSE_ID int references HORSE(HORSE_ID) not null, 
RACE_ID int references RACE(RACE_ID) not null, 
HORSE_RACE_BETS int, 
HORSE_RACE_WINNER varchar(30) not null,
primary key(HORSE_ID, RACE_ID) --this is our composite key!
)


--Now we must populate our tables. Each table has 4-5 data entries. 
--First the HORSE table. 
INSERT INTO HORSE
(
HORSE_NAME, 
HORSE_DOB, 
HORSE_COLOR, 
HORSE_HEIGHT_HANDS,
HORSE_WEIGHT_LBS,
HORSE_SEX
)
VALUES
(
'Thunderbird',
'2018-12-13', 
'Black', 
16.3, 
1100,
'M'
)



INSERT INTO HORSE
(
HORSE_NAME, 
HORSE_DOB, 
HORSE_COLOR, 
HORSE_HEIGHT_HANDS,
HORSE_WEIGHT_LBS,
HORSE_SEX
)
VALUES
(
'My Fair Lady',
'2019-02-14', 
'Tan', 
16.1, 
1050,
'F'
)



INSERT INTO HORSE
(
HORSE_NAME, 
HORSE_DOB, 
HORSE_COLOR, 
HORSE_HEIGHT_HANDS,
HORSE_WEIGHT_LBS,
HORSE_SEX
)
VALUES
(
'Sunny Bucket',
'2018-06-22', 
'White/Black', 
15.9, 
1200,
'M'
)


INSERT INTO HORSE
(
HORSE_NAME, 
HORSE_DOB, 
HORSE_COLOR, 
HORSE_HEIGHT_HANDS,
HORSE_WEIGHT_LBS,
HORSE_SEX
)
VALUES
(
'Sassy',
'2019-09-25', 
'Brown', 
15.2, 
960,
'F'
)


INSERT INTO HORSE
(
HORSE_NAME, 
HORSE_DOB, 
HORSE_COLOR, 
HORSE_HEIGHT_HANDS,
HORSE_WEIGHT_LBS,
HORSE_SEX
)
VALUES
(
'Kingsley',
'2018-10-02', 
'Black', 
16.5, 
1300,
'M'
)


--Now the JOCKEY table. 
INSERT INTO JOCKEY
(
JOCKEY_FNAME, 
JOCKEY_LNAME, 
JOCKEY_DOB, 
JOCKEY_CELL_PHONE, 
JOCKEY_EMAIL, 
JOCKEY_SALARY, 
JOCKEY_YEARS_EXPEREINCE, 
JOCKEY_WEIGHT_LBS
)
VALUES
(
'Matthew', 
'Jackson',
'1996-10-22',
'920-592-3344', 
'mattjackson@gmai.com',
56000,
2.5, 
135.25
)

--put in a new record. 
INSERT INTO JOCKEY
(
JOCKEY_FNAME, 
JOCKEY_LNAME, 
JOCKEY_DOB, 
JOCKEY_CELL_PHONE, 
JOCKEY_EMAIL, 
JOCKEY_SALARY, 
JOCKEY_YEARS_EXPEREINCE, 
JOCKEY_WEIGHT_LBS
)
VALUES
(
'Trent', 
'Dean',
'1994-03-14',
'562-123-3267', 
'tdean@gmai.com',
78000,
6.25, 
128.5
)


--put in a new record. 
INSERT INTO JOCKEY
(
JOCKEY_FNAME, 
JOCKEY_LNAME, 
JOCKEY_DOB, 
JOCKEY_CELL_PHONE, 
JOCKEY_EMAIL, 
JOCKEY_SALARY, 
JOCKEY_YEARS_EXPEREINCE, 
JOCKEY_WEIGHT_LBS
)
VALUES
(
'Martha', 
'Stewart',
'1997-08-09',
'403-456-9876', 
'marthast@gmai.com',
66000,
4.75, 
115.5
)


--put in a new record. 
INSERT INTO JOCKEY
(
JOCKEY_FNAME, 
JOCKEY_LNAME, 
JOCKEY_DOB, 
JOCKEY_CELL_PHONE, 
JOCKEY_EMAIL, 
JOCKEY_SALARY, 
JOCKEY_YEARS_EXPEREINCE, 
JOCKEY_WEIGHT_LBS
)
VALUES
(
'Kyle', 
'Bennet',
'1985-05-13',
'568-234-8779', 
'bennetk@gmai.com',
57500,
3.5, 
140.5
)


--put in a new record. 
INSERT INTO JOCKEY
(
JOCKEY_FNAME, 
JOCKEY_LNAME, 
JOCKEY_DOB, 
JOCKEY_CELL_PHONE, 
JOCKEY_EMAIL, 
JOCKEY_SALARY, 
JOCKEY_YEARS_EXPEREINCE, 
JOCKEY_WEIGHT_LBS
)
VALUES
(
'Jane', 
'Price',
'1991-11-02',
'123-456-7886', 
'janepricet@gmai.com',
76500,
6.75, 
123.5
)


--Now populate the OWNER table. 
INSERT INTO OWNER
(
OWNER_FNAME, 
OWNER_LNAME, 
OWNER_DOB, 
OWNER_ADDRESS, 
OWNER_CITY, 
OWNER_STATE
)
VALUES
(
'Jack', 
'Daniels',
'1967-10-08', 
'3021 Oakland Drive', 
'Millburg', 
'TN'
)



INSERT INTO OWNER
(
OWNER_FNAME, 
OWNER_LNAME, 
OWNER_DOB, 
OWNER_ADDRESS, 
OWNER_CITY, 
OWNER_STATE
)
VALUES
(
'Mary', 
'Owens',
'1956-07-04', 
'54011 TowerDrive Ln', 
'Millburg', 
'TN'
)


INSERT INTO OWNER
(
OWNER_FNAME, 
OWNER_LNAME, 
OWNER_DOB, 
OWNER_ADDRESS, 
OWNER_CITY, 
OWNER_STATE
)
VALUES
(
'Thomas', 
'Shelby',
'1968-04-30', 
'6709 Tulip Way', 
'Manick', 
'NC'
)


INSERT INTO OWNER
(
OWNER_FNAME, 
OWNER_LNAME, 
OWNER_DOB, 
OWNER_ADDRESS, 
OWNER_CITY, 
OWNER_STATE
)
VALUES
(
'Chris', 
'Dunphy',
'1972-01-23', 
'3546 Burger Dr', 
'Dallas', 
'TX'
)




--Now populate the RACE table. 
INSERT INTO RACE
(
RACE_NAME, 
RACE_DATE, 
RACE_LOCATION, 
RACE_NUM_HORSES
)
VALUES 
(
'Kentucky Derby', 
'2023-05-06', 
'Louisville, KY', 
9
)


INSERT INTO RACE
(
RACE_NAME, 
RACE_DATE, 
RACE_LOCATION, 
RACE_NUM_HORSES
)
VALUES 
(
'Belmont Stakes', 
'2023-06-10', 
'Elmont, NY', 
9
)


INSERT INTO RACE
(
RACE_NAME, 
RACE_DATE, 
RACE_LOCATION, 
RACE_NUM_HORSES
)
VALUES 
(
'Preakness Stakes', 
'2023-05-20', 
'Baltimore, MD', 
14
)




INSERT INTO RACE
(
RACE_NAME, 
RACE_DATE, 
RACE_LOCATION, 
RACE_NUM_HORSES
)
VALUES 
(
'Arlington Million', 
'2023-07-13', 
'New Kent County, VA', 
11
)



INSERT INTO RACE
(
RACE_NAME, 
RACE_DATE, 
RACE_LOCATION, 
RACE_NUM_HORSES
)
VALUES 
(
'Whitemore Stakes', 
'2023-03-18', 
'Hot Springs, AR', 
14
)


--Now populate the TRAINER table. 
INSERT INTO TRAINER
(
TRAINER_FNAME, 
TRAINER_LNAME, 
TRAINER_DOB, 
TRAINER_CELL_PHONE, 
TRAINER_EMAIL, 
TRAINER_LEVEL
)
VALUES
(
'Rogan', 
'Peterson', 
'1966-10-04', 
'576-345-8765',
'rpeterson@gmail.com', 
4
)


INSERT INTO TRAINER
(
TRAINER_FNAME, 
TRAINER_LNAME, 
TRAINER_DOB, 
TRAINER_CELL_PHONE, 
TRAINER_EMAIL, 
TRAINER_LEVEL
)
VALUES
(
'Rex', 
'Laffel', 
'1971-09-22', 
'543-123-4567',
'rexLaff@gmail.com', 
2
)



INSERT INTO TRAINER
(
TRAINER_FNAME, 
TRAINER_LNAME, 
TRAINER_DOB, 
TRAINER_CELL_PHONE, 
TRAINER_EMAIL, 
TRAINER_LEVEL
)
VALUES
(
'Tami', 
'Jacobs', 
'1977-09-04', 
'576-345-8765',
'tammijacobs@gmail.com', 
4
)

--Now inserting into the HORSE_OWNER table
INSERT INTO HORSE_OWNER
(
HORSE_ID, 
OWNER_ID, 
HORSE_OWNER_YEARS_OWNERSHIP
)
VALUES
(
1,
3,
4
)

INSERT INTO HORSE_OWNER
(
HORSE_ID, 
OWNER_ID, 
HORSE_OWNER_YEARS_OWNERSHIP
)
VALUES
(
3,
1,
2.5
)



INSERT INTO HORSE_OWNER
(
HORSE_ID, 
OWNER_ID, 
HORSE_OWNER_YEARS_OWNERSHIP
)
VALUES
(
2,
4,
4
)



INSERT INTO HORSE_OWNER
(
HORSE_ID, 
OWNER_ID, 
HORSE_OWNER_YEARS_OWNERSHIP
)
VALUES
(
5,
3,
3.5
)



INSERT INTO HORSE_OWNER
(
HORSE_ID, 
OWNER_ID, 
HORSE_OWNER_YEARS_OWNERSHIP
)
VALUES
(
4,
2,
1.5
)



--Now populate the HORSE_JOCKEY table. 
INSERT INTO HORSE_JOCKEY
(
HORSE_ID, 
JOCKEY_ID, 
HORSE_JOCKEY_WEIGHT, 
HORSE_JOCKEY_NUMBER,
HORSE_JOCKEY_RACECOLOR
)
VALUES
(
2,
3,
1165.5,
8,
'Blue'
)


INSERT INTO HORSE_JOCKEY
(
HORSE_ID, 
JOCKEY_ID, 
HORSE_JOCKEY_WEIGHT, 
HORSE_JOCKEY_NUMBER,
HORSE_JOCKEY_RACECOLOR
)
VALUES
(
3,
1,
1335.25,
5,
'Red'
)



INSERT INTO HORSE_JOCKEY
(
HORSE_ID, 
JOCKEY_ID, 
HORSE_JOCKEY_WEIGHT, 
HORSE_JOCKEY_NUMBER,
HORSE_JOCKEY_RACECOLOR
)
VALUES
(
1,
5,
1223.5,
1,
'Orange'
)


INSERT INTO HORSE_JOCKEY
(
HORSE_ID, 
JOCKEY_ID, 
HORSE_JOCKEY_WEIGHT, 
HORSE_JOCKEY_NUMBER,
HORSE_JOCKEY_RACECOLOR
)
VALUES
(
5,
4,
1440.5,
5,
'Magenta'
)


INSERT INTO HORSE_JOCKEY
(
HORSE_ID, 
JOCKEY_ID, 
HORSE_JOCKEY_WEIGHT, 
HORSE_JOCKEY_NUMBER,
HORSE_JOCKEY_RACECOLOR
)
VALUES
(
4,
2,
1088.5,
7,
'Blue'
)



--Populate the HORSE_RACE table. 
INSERT INTO HORSE_RACE
(
HORSE_ID,
RACE_ID,
HORSE_RACE_BETS, 
HORSE_RACE_WINNER
)
VALUES
(1,
5,
52,
'Seattle Slew'
)



INSERT INTO HORSE_RACE
(
HORSE_ID,
RACE_ID,
HORSE_RACE_BETS, 
HORSE_RACE_WINNER
)
VALUES
(3,
2,
97,
'Sunny Bucket'
)



INSERT INTO HORSE_RACE
(
HORSE_ID,
RACE_ID,
HORSE_RACE_BETS, 
HORSE_RACE_WINNER
)
VALUES
(5,
3,
88,
'War Admiral'
)



INSERT INTO HORSE_RACE
(
HORSE_ID,
RACE_ID,
HORSE_RACE_BETS,
HORSE_RACE_WINNER
)
VALUES
(
2,
1,
102,
'Red Rum'
)



INSERT INTO HORSE_RACE
(
HORSE_ID,
RACE_ID,
HORSE_RACE_BETS,
HORSE_RACE_WINNER
)
VALUES
(
4,
4,
63,
'Sassy'
)


--FINALLY going to populate the HORSE_TRAINER table. 
INSERT INTO HORSE_TRAINER
(
HORSE_ID,
TRAINER_ID,
HORSE_TRAINER_YEARS_TRAINING,
HORSE_TRAINER_BARN
)
VALUES
(
1,
2,
3,
'Bestys Barn'
)


INSERT INTO HORSE_TRAINER
(
HORSE_ID,
TRAINER_ID,
HORSE_TRAINER_YEARS_TRAINING,
HORSE_TRAINER_BARN
)
VALUES
(
3,
1,
2,
'Rolls Barn'
)


INSERT INTO HORSE_TRAINER
(
HORSE_ID,
TRAINER_ID,
HORSE_TRAINER_YEARS_TRAINING,
HORSE_TRAINER_BARN
)
VALUES
(
2,
2,
1,
'Bestys Barn'
)


INSERT INTO HORSE_TRAINER
(
HORSE_ID,
TRAINER_ID,
HORSE_TRAINER_YEARS_TRAINING,
HORSE_TRAINER_BARN
)
VALUES
(
4,
3,
2,
'Rainbow Barn'
)


INSERT INTO HORSE_TRAINER
(
HORSE_ID,
TRAINER_ID,
HORSE_TRAINER_YEARS_TRAINING,
HORSE_TRAINER_BARN
)
VALUES
(
5,
3,
3,
'Rainbow Barn'
)





--SINGLE TABLE QUERIES
--Question 1: What are the names and birth dates of the owners who live in TN? 
SELECT OWNER_FNAME,
	OWNER_LNAME,
	OWNER_DOB
	FROM OWNER
WHERE OWNER_STATE = 'TN'


--Question 2: What is the height of the shortest horse?
SELECT MIN(HORSE_HEIGHT_HANDS) AS SmallestHorseHeight
	FROM HORSE


--Question 3: What are the names and contact information of jockeys who have at least 4 years of jockey experience? 
SELECT JOCKEY_FNAME,
	JOCKEY_LNAME,
	JOCKEY_CELL_PHONE,
	JOCKEY_EMAIL
	FROM JOCKEY
WHERE JOCKEY_YEARS_EXPEREINCE >= 4;


--Question 4: List the race names, dates, and locations of races having 9 and 14 horses. This may be wanted if someone is only interested in races holding these many horses. 
SELECT RACE_NAME,
	RACE_DATE,
	RACE_LOCATION
	FROM RACE
WHERE RACE_NUM_HORSES IN (9, 14)


--Question 5: Which trainers train at a level 4? Again, someone may want to only select their options from the level 4 trainers. 
SELECT TRAINER_FNAME, 
	TRAINER_LNAME
	FROM TRAINER
WHERE TRAINER_LEVEL = 4;



--MULTIPLE TABLE QUERIES 
--Question 1: Who has owned a horse for more than 3 years? 
SELECT DISTINCT O.OWNER_FNAME,
	O.OWNER_LNAME
	FROM OWNER O, 
		HORSE_OWNER HO
	WHERE O.OWNER_ID = HO.OWNER_ID
	AND HO.HORSE_OWNER_YEARS_OWNERSHIP > 3
		

--Question 2: Which owner(s) owns more than 1 horse? 
SELECT COUNT(O.OWNER_ID) AS NumberOfHorses, 
	O.OWNER_FNAME, 
	O.OWNER_LNAME
	FROM OWNER O INNER JOIN HORSE_OWNER HO
		ON O.OWNER_ID = HO.OWNER_ID
	GROUP BY OWNER_FNAME, OWNER_LNAME
	HAVING COUNT(O.OWNER_ID) > 1


--Question 3: For each horse and jockey who have the race color blue, list out the ID, first name, last name, and salary of each jockey. People may want to know who that jockey is. 
SELECT J.JOCKEY_FNAME,
	J.JOCKEY_LNAME, 
	J.JOCKEY_SALARY
	FROM JOCKEY J,
		HORSE_JOCKEY HJ
	WHERE J.JOCKEY_ID = HJ.JOCKEY_ID
	AND HJ.HORSE_JOCKEY_RACECOLOR = 'Blue'


--Question 4: Which horses (along with their sex) are trained by trainers who are at a level of 4? 
SELECT H.HORSE_NAME,
	H.HORSE_SEX
	FROM HORSE H INNER JOIN HORSE_TRAINER HT
		ON H.HORSE_ID = HT.HORSE_ID
	INNER JOIN TRAINER T
		ON HT.TRAINER_ID = T.TRAINER_ID
	WHERE T.TRAINER_LEVEL = 4



--Question 5: Which race and on what date had the highest bet on a horse, and who was that horse's trainer? 
SELECT R.RACE_NAME, 
	R.RACE_DATE,
	T.TRAINER_FNAME,
	T.TRAINER_LNAME
	FROM HORSE H,
		HORSE_RACE HR,
		TRAINER T,
		HORSE_TRAINER HT,
		RACE R
	WHERE R.RACE_ID = HR.RACE_ID
	AND HR.HORSE_ID = H.HORSE_ID
	AND H.HORSE_ID = HT.HORSE_ID
	AND HT.TRAINER_ID = T.TRAINER_ID
	AND HR.HORSE_RACE_BETS = (SELECT MAX(HORSE_RACE_BETS)
								FROM HORSE_RACE)




--VIEWS
--Question 1: Create a view named MALE_HORSES. It consists of the horse ID, name, date of birth, 
--color, and height for every horse that is male and weighs 1200 lbs or more.
CREATE VIEW MALE_HORSES AS 
SELECT H.HORSE_ID,
	H.HORSE_NAME,
	H.HORSE_DOB,
	H.HORSE_COLOR,
	H.HORSE_HEIGHT_HANDS
	FROM HORSE H
	WHERE H.HORSE_SEX = 'M'
	AND H.HORSE_WEIGHT_LBS >= 1200



--Question 2: Create a view named HIGH_SALARY_JOCKEYS. It will consist of the jockey's ID, name, date of birth, and years of experience for every jockey who receives 
--a salary that is $60,000 or more. A person may only want to see something with a new a jockey who is in this pay range. 
CREATE VIEW HIGH_SALARY_JOCKEYS AS 
SELECT J.JOCKEY_ID,
	J.JOCKEY_FNAME,
	J.JOCKEY_LNAME,
	J.JOCKEY_DOB,
	J.JOCKEY_YEARS_EXPEREINCE
	FROM JOCKEY J
	WHERE J.JOCKEY_SALARY > 60000




--BUILT-IN, NON-AGGREGATED FUNCTIONS
--Question 1: For each horse ID, list the owners last name only in uppercase, in comma-delimit fields. We may only want to know the last name of the owner for a quick horse review. 
SELECT CAST(H.HORSE_ID AS varchar(10)) + ',' + ' ' + UPPER(O.OWNER_LNAME) AS HORSE_ID_OWNER_SURNAME
	FROM HORSE H INNER JOIN HORSE_OWNER HO
		ON H.HORSE_ID = HO.HORSE_ID
	INNER JOIN OWNER O
		ON HO.OWNER_ID = O.OWNER_ID



--Question 2: Write a function to give each Jockey a salary raise (by 2%) because it is a holiday. 
SELECT J.JOCKEY_ID,
	ROUND(J.JOCKEY_SALARY + (J.JOCKEY_SALARY * 0.02), 2) AS JOCKEY_NEWSALARY
	FROM JOCKEY J

	--MY TEST FOR QUESTION 2
	SELECT * FROM JOCKEY



--Question 3: Due to poor weather, all the horse races need to have their race dates moved 5 days from now. Please list the horse ID, horse name, race name and new race date. 
SELECT H.HORSE_ID,
	H.HORSE_NAME,
	R.RACE_NAME,
	DATEADD(DAY, 5, R.RACE_DATE) AS NEW_RACE_DATE
	FROM HORSE H,
		HORSE_RACE HR,
		RACE R
	WHERE H.HORSE_ID = HR.HORSE_ID
	AND HR.RACE_ID = R.RACE_ID

	--MY TEST ON QUESTION 3:
	SELECT * FROM RACE



--Question 4: List all the jockeys and trainers and concatenate the jockeys' names into one field and the 
--trainers' names into a second field for each horse. Provide the horses' name and ID too. This would be helpful for end-of-the-year summary report.
SELECT H.HORSE_ID,
	H.HORSE_NAME,
	CONCAT(J.JOCKEY_FNAME, ' ', J.JOCKEY_LNAME) AS JOCKEY_FULLNAME,
	CONCAT(T.TRAINER_FNAME, ' ', T.TRAINER_LNAME) AS TRAINER_FULLNAME
	FROM JOCKEY J INNER JOIN HORSE_JOCKEY HJ
		ON J.JOCKEY_ID = HJ.JOCKEY_ID
	INNER JOIN HORSE H
		ON HJ.HORSE_ID = H.HORSE_ID
	INNER JOIN HORSE_TRAINER HT
		ON H.HORSE_ID = HT.HORSE_ID
	INNER JOIN TRAINER T
		ON HT.TRAINER_ID = T.TRAINER_ID



--STORED PROCEDURES
--Question 1: Create a stored procedure to to be used when a new horse is added to this database. All values will be available as inputs, except the 
--horse_ID which will need to be calculated. 
CREATE PROCEDURE addHorse(
@horseName varchar(100), 
@horseDOB date,
@horseColor varchar(20),
@horseHeight decimal(7,2),
@horseWeight decimal(7,2),
@horseSex char(1)) AS
INSERT INTO HORSE	
(HORSE_ID,
HORSE_NAME,
HORSE_DOB,
HORSE_COLOR,
HORSE_HEIGHT_HANDS,
HORSE_WEIGHT_LBS,
HORSE_SEX
)
VALUES
((SELECT MAX(HORSE_ID) + 1 FROM HORSE),
	@horseName,
	@horseDOB,
	@horseColor,
	@horseHeight,
	@horseWeight,
	@horseSex
)


--Question 2: Create a stored procedure to be used to report which 
--horse a jockey will be given when a jockey ID is provided.
CREATE PROCEDURE jockeyHorse (
@jockeyID int
) AS 
SELECT H.HORSE_NAME
	FROM JOCKEY J INNER JOIN HORSE_JOCKEY HJ
		ON J.JOCKEY_ID = HJ.JOCKEY_ID
	INNER JOIN HORSE H
		ON HJ.HORSE_ID = H.HORSE_ID
	WHERE J.JOCKEY_ID = @jockeyID

	--Test for this second stored procedure. 
	EXEC jockeyHorse 1




--TRIGGERS (2 TRIGGERS) AND CURSORS (1 CURSOR)
--Question 1: Create a trigger with a cursor so that when a jockey is eligible for a raise (where jockey_raise is True), then the jockey will receive a 12% salary raise. 

--First alter the JOCKEY table with the new bit field. 
ALTER TABLE JOCKEY
ADD  JOCKEY_RAISE bit

--Now this is the trigger with a cursor. 
ALTER TRIGGER jockeyRaise
	on JOCKEY
	AFTER UPDATE AS 
	DECLARE @jockeyID int  --create my variable. 

	--now declare my cursor and grab both logical and invisible tables. 
	DECLARE jockeySalaryRaise CURSOR FOR 
		SELECT i.JOCKEY_ID
			FROM inserted i INNER JOIN deleted d
				ON i.JOCKEY_ID = d.JOCKEY_ID
				WHERE i.JOCKEY_RAISE = 1
				AND d.JOCKEY_RAISE = 0

	--OPEN THE CURSOR 
	OPEN jockeySalaryRaise 
	FETCH NEXT 
		FROM jockeySalaryRaise INTO @jockeyID
	--begin while loop to get each value in cursor. 
	WHILE @@FETCH_STATUS = 0
	BEGIN --begin the magic here. 
		UPDATE JOCKEY 
			SET JOCKEY_SALARY = JOCKEY_SALARY * 1.125,
			JOCKEY_RAISE = 0
		WHERE JOCKEY_ID = @jockeyID

	FETCH NEXT FROM jockeySalaryRaise INTO @jockeyID
	END

	CLOSE jockeySalaryRaise
	DEALLOCATE jockeySalaryRaise

	--Testing for Question 1: 
	SELECT * FROM JOCKEY WHERE JOCKEY_ID = 3

	--UPDATE A DIFFERENT FIELD. 
	UPDATE JOCKEY	
		SET JOCKEY_SALARY =  63000
	WHERE JOCKEY_ID = 3

	--SINGLE UPDATE ON THE TRIGGER. 
	UPDATE JOCKEY 
		SET JOCKEY_RAISE = 1
	WHERE JOCKEY_ID = 1
		
	--MULTIPLE UPDATES ON THE TRIGGER TO TEST THE CURSOR 
	UPDATE JOCKEY	
		SET JOCKEY_RAISE = 1
	WHERE JOCKEY_ID = 3

	UPDATE JOCKEY	
		SET JOCKEY_RAISE = 1
	WHERE JOCKEY_ID = 2

		



--Question 2: Create a trigger that will increase the horse's weight by 50 lbs if the horse's next level increase is true. 
ALTER TABLE HORSE
ADD HORSE_LEVEL_INCREASE bit

ALTER TRIGGER horseAddedWeight
	on HORSE 
	AFTER UPDATE AS 

	DECLARE @horseID INT 

	SELECT @horseID = i.HORSE_ID
		FROM inserted i INNER JOIN deleted d
			ON i.HORSE_ID = d.HORSE_ID
			WHERE I.HORSE_LEVEL_INCREASE = 1
			AND d.HORSE_LEVEL_INCREASE = 0

	UPDATE HORSE	
		SET HORSE_WEIGHT_LBS = HORSE_WEIGHT_LBS + 50,
			HORSE_LEVEL_INCREASE = 0
		WHERE HORSE_ID = @horseID



	--TEST MY TRIGGER FOR QUESTION 2:
	SELECT * FROM HORSE WHERE HORSE_ID = 1

	--TEST THE TRIGGER NOW. 
	UPDATE HORSE 
		SET HORSE_LEVEL_INCREASE = 1
	WHERE HORSE_ID = 1


--All Done :)
--NOTE TO KAREN: Thanks for a great semester! Merry Christmas and hope to see you around next semester! 



--These are all our table drops in case of accidents!
drop table HORSE_JOCKEY

drop table HORSE_OWNER

drop table HORSE_RACE
drop table HORSE_TRAINER

drop table HORSE

drop table JOCKEY

DROP TABLE TRAINER

drop table OWNER