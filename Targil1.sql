INSERT INTO Building (DateOfConstruction, BuildingName, ZIP) values (TO_DATE('3/11/2023','MM/DD/YYYY'), 'Alyse', '72285');
INSERT INTO Building (DateOfConstruction, BuildingName, ZIP) values (TO_DATE('2/18/2023','MM/DD/YYYY'), 'Lida', '20');
INSERT INTO Building (DateOfConstruction, BuildingName, ZIP) values (TO_DATE('5/22/2022','MM/DD/YYYY'), 'Dud', '1');
INSERT INTO Building (DateOfConstruction, BuildingName, ZIP) values (TO_DATE('11/15/2022','MM/DD/YYYY'), 'Salem', '404');

DROP Table Cleaner;
DROP Table Building;
DROP Table Bed;
DROP Table Room;

DELETE  Cleaner;
DELETE  Building;
DELETE  Bed;
DELETE  Room;

UPDATE Building
  SET BuildingName = 'beren'

UPDATE Building
  SET BuildingName = 'tananbaum'
  
UPDATE Building
  SET BuildingName = 'scwarz'

UPDATE Building
  SET BuildingName = 'broder'


SELECT * FROM Cleaner;
SELECT * FROM Building;
SELECT * FROM Bed;
SELECT * FROM Room;



CREATE TABLE Building
(
  BuildingName VARCHAR(50) NOT NULL,
  ZIP INT NOT NULL,
  DateOfConstruction DATE NOT NULL,
  PRIMARY KEY (ZIP)
);

CREATE TABLE Room
(
  IsNagish VARCHAR(50) NOT NULL,
  RoomID INT NOT NULL,
  Color VARCHAR(50) NOT NULL,
  Password VARCHAR(50) NOT NULL,
  SquareFeet INT NOT NULL,
  ZIP INT NOT NULL,
  CleanerID INT,
  PRIMARY KEY (RoomID, ZIP),
  FOREIGN KEY (ZIP) REFERENCES Building(ZIP),
  FOREIGN KEY (CleanerID) REFERENCES Cleaner(ID)
);

CREATE TABLE Bed
(
  BedNum INT NOT NULL,
  IsTopBunk VARCHAR(50) NOT NULL,
  Cost INT NOT NULL,
  ID INT NOT NULL,
  RoomID INT NOT NULL,
  ZIP INT NOT NULL,
  PRIMARY KEY (RoomID, ZIP, BedNum),
  FOREIGN KEY (ID) REFERENCES Student(ID),
  FOREIGN KEY (RoomID, ZIP) REFERENCES Room(RoomID, ZIP)
);

CREATE TABLE AC
(
  Company VARCHAR(50) NOT NULL,
  ModelNum INT NOT NULL,
  RoomID INT NOT NULL,
  ZIP INT NOT NULL,
  PRIMARY KEY (RoomID, ZIP),
  FOREIGN KEY (RoomID, ZIP) REFERENCES Room(RoomID, ZIP)
);
