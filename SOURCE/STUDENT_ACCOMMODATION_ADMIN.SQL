CREATE TABLE Hostels (
hostel_id INT IDENTITY (1,1) PRIMARY KEY,
hostel_name NVARCHAR(30)  UNIQUE,
location NVARCHAR(50) NOT NULL,
total_rooms INT NOT NULL CHECK (total_rooms IS NOT NULL),
warden_name NVARCHAR(40)
);



CREATE TABLE Rooms (
room_id INT IDENTITY (1,1) PRIMARY KEY, 
floor INT NOT NULL,
capacity INT NOT NULL CHECK (CAPACITY > 0),
status NVARCHAR(30) CHECK (status='occupied' or status='vacant' or status='under maintenance') DEFAULT 'vacant',
hostel_id INT,
FOREIGN KEY (hostel_id) 
REFERENCES Hostels(hostel_id) ON DELETE CASCADE
);



CREATE TABLE Students (
student_id INT IDENTITY (1,1) PRIMARY KEY, 
student_name NVARCHAR (50) NOT NULL, 
dateof_birth DATE NOT NULL,
gender NCHAR (10) NOT NULL,
contact_number NVARCHAR (20) NOT NULL UNIQUE ,
email NVARCHAR (50) NOT NULL UNIQUE,
address NVARCHAR (50) NOT NULL,
joining_date DATE  NOT NULL CHECK (TRY_CONVERT(DATE,joining_date) IS NOT NULL),
status NVARCHAR(9) CHECK (status='active' or status='inactive' or status='graduated') DEFAULT 'active',
room_id INT,
FOREIGN KEY (room_id)
REFERENCES Rooms(room_id) ON DELETE CASCADE
);







CREATE TABLE Staff (
staff_id INT IDENTITY(1,1) PRIMARY KEY,
staff_name NVARCHAR(50) NOT NULL,
role NVARCHAR(50) NOT NULL,
contact_number NVARCHAR(20) UNIQUE,
email NVARCHAR(50) UNIQUE,
hostel_id INT,
FOREIGN KEY (hostel_id)
REFERENCES Hostels(hostel_id) ON DELETE CASCADE
);

CREATE TABLE Facilities(
facility_id INT IDENTITY(1,1) PRIMARY KEY,
facility_name NVARCHAR(50) NOT NULL,
hostel_id INT,
FOREIGN KEY (hostel_id)
REFERENCES Hostels(hostel_id) ON DELETE CASCADE
);




INSERT INTO Hostels (hostel_name,location,total_rooms,warden_name) VALUES
('Ramana','Kharadi',40,'jayalaxmi'),
('Sai','eon IT park',30,'Hanumanthu'),
('Laxmi','Rainbow Cross Road',25,'Vijaya');

INSERT INTO Rooms (floor,capacity,hostel_id,status) VALUES
(1,4,1,'vacant'),
(2,3,2,'occupied'),
(3,2,1,'under maintenance');

INSERT INTO Students (student_name,dateof_birth,gender,contact_number,email,address,joining_date,room_id,status) VALUES
('Prashu','2001-02-16','female','8632473462','prashu123@gmail.com','banglore','2024-07-12',1,'active'),
('sukku','2001-06-14','female','7642852473','sukku@gmail.com','hyderabad','2024-07-06',2,'active'),
('praveen','2000-08-06','male','5638963528','praveen125@gmail.com','chennai','2024-07-14',3,'active');


INSERT INTO Staff (staff_name,role,contact_number,email,hostel_id) VALUES
('Nikitha','Warden','6578453792','nikitha@gmail.com',1),
('Sheela','Maintenance','4563829163','sheela@gmail.com',2),
('Bannu','Security','5478675423','bannu@gmail.com',3);


INSERT INTO Facilities (facility_name,hostel_id) VALUES
('Gym',1),
('Study_Room',2),
('Common_Room',3);


SELECT * FROM Students;
SELECT * FROM Rooms;
SELECT * FROM Hostels;
SELECT * FROM Staff;
SELECT * FROM Facilities;
