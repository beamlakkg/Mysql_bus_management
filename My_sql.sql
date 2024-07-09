CREATE DATABASE `BusManagmentSystem`;

USE `BusManagmentSystem`;

-- Create tables

CREATE TABLE `Passenger`(

`PassengerID` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,

`FirstName` VARCHAR(255) NOT NULL,

`LastName` VARCHAR(255) NOT NULL,

`ContactNumber` INT NOT NULL UNIQUE,

`DepartureTimeAndDate` DATETIME NOT NULL,

`DepartureLocation` VARCHAR(255) NOT NULL,

`Destination` VARCHAR(255) NOT NULL

);

CREATE TABLE `BusStation`(

`StationNumber` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,

`StationName` VARCHAR(255) NOT NULL

);

CREATE TABLE `Ticket`(

`TicketNumber` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,

`SerialNumber` INT UNSIGNED NOT NULL UNIQUE,

`BookingDate` DATE NOT NULL,

`Fare` FLOAT NOT NULL,

`BusID` INT UNSIGNED,

`PassengerID` INT UNSIGNED,

FOREIGN KEY(PassengerID) REFERENCES Passenger(PassengerID) ON DELETE SET NULL

);

CREATE TABLE `Bus`(

`BusID` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,

`BusModel` VARCHAR(255) NOT NULL,

`SeatLeft` INT UNSIGNED NOT NULL DEFAULT 51,

`DepartureTimeAndDate` DATETIME NOT NULL,

`DepartureLocation` VARCHAR(255) NOT NULL,

`Destination` VARCHAR(255) NOT NULL,

`EmployeeID` INT UNSIGNED,

`StationNumber` INT UNSIGNED,

FOREIGN KEY(StationNumber) REFERENCES Busstation(StationNumber) ON DELETE SET NULL

);

CREATE TABLE `Department`(

`DepartmentNumber` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,

`NUMBEROFEMPLOYEE` INT UNSIGNED,

`Location` VARCHAR(255) NOT NULL,

`Name` VARCHAR(255) NOT NULL UNIQUE

);
CREATE TABLE `project`(

`Number` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,

`Location` VARCHAR(255) NOT NULL,

`Name` VARCHAR(255) NOT NULL UNIQUE,

`DepartmentNumber` INT UNSIGNED,

FOREIGN KEY(DepartmentNumber) REFERENCES Department(DepartmentNumber) ON DELETE 

SET NULL

);

CREATE TABLE `Employee`(

`EmployeeID` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,

`Age` INT UNSIGNED NOT NULL,

`Payment` INT UNSIGNED NOT NULL,

`FirstName` VARCHAR(255) NOT NULL,

`LastName` VARCHAR(255) NOT NULL,

`ContactNumber` INT NOT NULL UNIQUE,

`Number` INT UNSIGNED,

`StationNumber` INT UNSIGNED,

`TicketNumber` INT UNSIGNED,

`PassengerID` INT UNSIGNED,

FOREIGN KEY(`Number`) REFERENCES Project(`Number`) ON DELETE SET NULL,

FOREIGN KEY(StationNumber) REFERENCES Busstation(StationNumber) ON DELETE SET NULL,

FOREIGN KEY(PassengerID) REFERENCES Passenger(PassengerID) ON DELETE SET NULL,

FOREIGN KEY(TicketNumber) REFERENCES Ticket(TicketNumber) ON DELETE SET NULL

);

-- Insert commands

INSERT INTO `passenger`(PassengerID, FirstName, LastName, ContactNumber, 

DepartureTimeAndDate, DepartureLocation, Destination)

VALUES

('1','Bemnet', 'Asefaw', '0999999999','2023-10-5 12:30:00','lamberet','Hawassa'),

('2','Lidya','tesfaye','0999999998','2023-11-23 06:30:00','adis_sefer','gonder'),

('3','Abebe','Getachew','0978654312','2021-09-12 12:30:00','lamberet','bahrDar'),

('4','kebede','Mulachew','0912345678','2021-11-23 06:30:00','adis_sefer','gonder'),

('5','Lula','Abdi','0978656778','2021-09-12 12:30:00','lamberet','bahrDar'),

('6','Temsgen','Yewaleshet','0911234567','2023-10-5 12:30:00','lamberet','Hawassa');

INSERT INTO `Ticket`(TicketNumber, serialnumber, bookingdate, fare)

VALUES ('1', '342740','2023-10-5','540'),

('2','342670','2023-11-23', '1350'),

('3','342145','2021-09-12','1155'),

('4','324567','2023-11-23', '1350'),

('5','356723','2021-09-12','1155'),

('6','323456','2023-10-5','540');

UPDATE `Ticket`SET busid = 1 WHERE Ticketnumber = 1 OR Ticketnumber = 6;

UPDATE `Ticket`SET busid = 2 WHERE Ticketnumber = 2 OR Ticketnumber = 4;

UPDATE `Ticket`SET busid = 3 WHERE Ticketnumber = 3 OR Ticketnumber = 5;

UPDATE `Ticket`SET Passengerid= 1 WHERE Ticketnumber = 1 OR Ticketnumber = 6;

UPDATE `Ticket`SET Passengerid= 2 WHERE Ticketnumber = 2 OR Ticketnumber = 4;

UPDATE `Ticket`SET Passengerid= 3 WHERE Ticketnumber = 3 OR Ticketnumber = 5;
INSERT INTO `Bus`(busid, busmodel, seatleft, DepartureTimeAndDate, DepartureLocation, 

Destination)

VALUES

('1','MAN NLxx3','23','2023-10-5 12:30:00','lamberet','Hawassa'),

('2','MAN NLxx2','16','2023-11-23 06:30:00','adis_sefer','gonder'),

('3','MAN NLxx6','10','2021-09-12 12:30:00','lamberet','bahrDar');

INSERT INTO `Busstation`(stationname)

VALUES ('lamberet'), ('adis_sefer');

UPDATE `Bus`SET Employeeid = 1 WHERE Busid= 1;

UPDATE `Bus` SET Employeeid = 4 WHERE Busid= 2;

UPDATE `Bus`SET Employeeid = 6 WHERE Busid= 3;

UPDATE `Bus`SET Stationnumber = 1 WHERE Busid= 1;

UPDATE `Bus`SET Stationnumber = 2 WHERE Busid= 2;

UPDATE `Bus`SET Stationnumber = 1 WHERE Busid= 3;

INSERT INTO `Employee`(EmployeeID, age, payment, firstname, lastname, contactnumber)

VALUES ('1','30','5000','Daniel','Belay','0999234657'),

('2','40','6000','Mebrat','abebe','0987654321'),

('3','32','4500','Tefera','Belete','09621738'),

('4','25','2500','Mastewal','Bekele','091123467'),

('5','33','2500','Fissha','Solomon','095562678');

INSERT INTO `project`(`number`, location, `name`)

VALUES('1','addis_abeba', 'travel_hawassa'),

('2','addis_abeba', 'travel_gonder'),

('3','addis_abeba', 'bus_Reservation'),

('4','addis_abeba', 'travel_agency');

UPDATE`Employee` SET stationnumber= 1 WHERE EmployeeID=1 OR EmployeeID=3 OR 

EmployeeID=4;

UPDATE `Employee` SET stationnumber= 2 WHERE EmployeeID=2 OR EmployeeID=5;

UPDATE `Employee` SET ticketnumber= 1 WHERE EmployeeID=1 OR EmployeeID=3 OR 

EmployeeID=4;

UPDATE `Employee` SET ticketnumber= 2 WHERE EmployeeID=2 OR EmployeeID=5;

UPDATE `Employee` SET Passengerid= 1 WHERE EmployeeID=1 OR EmployeeID=3 OR 

EmployeeID=4;

UPDATE `Employee` SET Passengerid= 2 WHERE EmployeeID=2 OR EmployeeID=5;

UPDATE `Employee` SET `number`=1 WHERE EmployeeID=1;

UPDATE `Employee` SET `number`=2 WHERE EmployeeID=2 OR EmployeeID=5;

UPDATE `Employee` SET `number`=3 WHERE EmployeeID=3;

UPDATE `Employee` SET `number`=4 WHERE EmployeeID=4;

INSERT INTO `department`(departmentnumber, numberofemployee, location, `name`)

VALUES ('1','75', 'addis_abeba', 'Drivers_and_maintaince'),

('2','50', 'addis_abeba', 'service'),

('3','10','addis_abeba', 'marketing');

UPDATE`project`SET departmentnumber=1 WHERE `number`=1 OR `number`=2;

UPDATE `project`SET departmentnumber=2 WHERE `number`=3;

UPDATE `project`SET departmentnumber=3 WHERE `number`=4; 
-- Frequent Queries

-- get all Passenger departing to specific location 

SELECT * FROM Passenger WHERE Destination= 'Hawassa';

-- getting all employee information

SELECT e.employeeid,e.firstname, e.lastname, d.departmentnumber, d.name AS 'DepartmentName',

d.location,e.number AS 'ProjectNumber'

FROM employee e, department d 

WHERE e.employeeid = d.departmentnumber;

-- all passengers with their tickets information

SELECT p.PassengerID, p.FirstName, p.LastName, p.LastName, p.DepartureTimeAndDate, 

p.DepartureLocation, p.Destination,

t.TicketNumber, t.SerialNumber, t.BookingDate, t.Fare

FROM Passenger p,Ticket t 

WHERE P.PassengerID = T.ticketnumber

ORDER BY P.PassengerID ASC;

-- get all projects in specific department

SELECT b.BusID, BusModel, B.Seatleft, B.DepartureLocation, B.Destination

FROM Bus b

WHERE Seatleft>15;
--Get all the buses that departure at specific time

SELECT *FROM Bus

WHERE DepartureTimeAndDate='2023-10-5 12:30:00';

--Get the sum of the total fare collected on specific day

SELECT sum(fare),BookingDate

FROM Ticket

GROUP BY BookingDate;

--Create Trigger

CREATE TRIGGER update_seat_left

AFTER INSERT ON Ticket

FOR EACH ROW

UPDATE Bus SET SeatLeft = SeatLeft - 1 WHERE BusID = NEW.BusID

Create Stored Procedures:

DELIMITER //

CREATE PROCEDURE add_passenger(IN fname VARCHAR(255), IN lname VARCHAR(255), IN 

contact VARCHAR(255), IN departure DATETIME, IN dep_location VARCHAR(255), IN destination 

VARCHAR(255))

BEGIN

INSERT INTO Passenger (FirstName, LastName, ContactNumber, DepartureTimeAndDate, 

DepartureLocation, Destination)

VALUES (fname, lname, contact, departure, dep_location, destination);

END //

DELIMITER ;
