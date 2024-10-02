CREATE TABLE User (
  id VARCHAR(10) PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  dateOfBirth DATE NOT NULL,
  gender CHAR(1) NOT NULL,
  birthPlace CHAR(2),
  lastName VARCHAR(50) NOT NULL,
  firstName VARCHAR(50) NOT NULL
);


CREATE TABLE BusinessCategory (
  bcid VARCHAR(10) PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Subcategory (
  name VARCHAR(50),
  bcid VARCHAR(10),
  FOREIGN KEY (bcid) REFERENCES BusinessCategory(bcid),
  PRIMARY KEY (name, bcid)
);

CREATE TABLE Business (
  bid VARCHAR(10) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  parkingType ENUM('street', 'garage', 'lot', 'valet'),
  ambiance ENUM('romantic', 'classy', 'touristy', 'casual'),
  zipcode INT,
  latitude INT,
  longitude INT,
  streetAddress VARCHAR(255) NOT NULL,
  state CHAR(2),
  bcid VARCHAR(10) NOT NULL,
  FOREIGN KEY (bcid) REFERENCES BusinessCategory(bcid)
);

CREATE TABLE Review (
  id VARCHAR(10) PRIMARY KEY,
  bid VARCHAR(10) NOT NULL,
  author VARCHAR(10) NOT NULL,
  rating INT NOT NULL,
  publishDate DATE NOT NULL,
  textContent TEXT,
  FOREIGN KEY (bid) REFERENCES Business(bid) ON DELETE CASCADE,
  FOREIGN KEY (author) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE Compliment (
  makerID VARCHAR(10) NOT NULL,
  recipientID VARCHAR(10) NOT NULL,
  FOREIGN KEY (makerID) REFERENCES User(id) ON DELETE CASCADE,
  FOREIGN KEY (recipientID) REFERENCES User(id) ON DELETE CASCADE,
  PRIMARY KEY (makerID, recipientID)
);

CREATE TABLE Multimedia (
  id INT PRIMARY KEY AUTO_INCREMENT,
  description TEXT,
  location VARCHAR(255),
  type ENUM('photo','video') NOT NULL,
  private BOOLEAN NOT NULL,
  uAuthor VARCHAR(10),
  bAuthor VARCHAR(10),
  media LONGBLOB NOT NULL,
  FOREIGN KEY (uAuthor) REFERENCES User(id) ON DELETE CASCADE,
  FOREIGN KEY (bAuthor) REFERENCES Business(bid) ON DELETE CASCADE,
  CHECK ((uAuthor IS NOT NULL AND bAuthor IS NULL) OR (bAuthor IS NOT NULL AND uAuthor IS NULL))
);

CREATE TABLE TimeRange (
  id INT PRIMARY KEY AUTO_INCREMENT,
  start TIME NOT NULL,
  end TIME NOT NULL,
  CHECK (start < end),
  UNIQUE (start, end)
);

CREATE TABLE Schedule (
  bid VARCHAR(10),
  dayOfWeek ENUM('M','T','W','Th','F','S','Su') NOT NULL,
  hours INT,
  break INT,
  PRIMARY KEY (bid, dayOfWeek),
  FOREIGN KEY (bid) REFERENCES Business(bid) ON DELETE CASCADE,
  FOREIGN KEY (hours) REFERENCES TimeRange(id),
  FOREIGN KEY (break) REFERENCES TimeRange(id)
);

CREATE TABLE ExceptionSchedule (
  bid VARCHAR(10),
  date DATE NOT NULL,
  hours INT NOT NULL,
  break INT,
  PRIMARY KEY (bid, date),
  FOREIGN KEY (bid) REFERENCES Business(bid) ON DELETE CASCADE,
  FOREIGN KEY (hours) REFERENCES TimeRange(id),
  FOREIGN KEY (break) REFERENCES TimeRange(id)
);

CREATE TABLE Comment (
  id INT PRIMARY KEY AUTO_INCREMENT,
  rid VARCHAR(10) NOT NULL,
  author VARCHAR(10) NOT NULL,
  date DATE,
  textContent TEXT,
  FOREIGN KEY (rid) REFERENCES Review(id) ON DELETE CASCADE,
  FOREIGN KEY (author) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE Friends (
  uid1 VARCHAR(10),
  uid2 VARCHAR(10),
  PRIMARY KEY (uid1, uid2),
  FOREIGN KEY (uid1) REFERENCES User(id) ON DELETE CASCADE,
  FOREIGN KEY (uid2) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE Creates (
  mid INT,
  uid VARCHAR(10) NOT NULL,
  PRIMARY KEY (mid),
  FOREIGN KEY (mid) REFERENCES Multimedia(id) ON DELETE CASCADE,
  FOREIGN KEY (uid) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE Checkin (
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid VARCHAR(10) NOT NULL,
  bid VARCHAR(10) NOT NULL,
  checkinfo VARCHAR(255) NOT NULL,
  FOREIGN KEY (uid) REFERENCES User(id),
  FOREIGN KEY (bid) REFERENCES Business(bid)
);

CREATE TABLE ReviewHasMultimedia (
  mid INT PRIMARY KEY,
  rid VARCHAR(10),
  FOREIGN KEY (mid) REFERENCES Multimedia(id),
  FOREIGN KEY (rid) REFERENCES Review(id) ON DELETE CASCADE
);

CREATE TABLE Votes (
  uid VARCHAR(10),
  rid VARCHAR(10),
  useful BOOL,
  PRIMARY KEY (uid, rid),
  FOREIGN KEY (uid) REFERENCES User(id),
  FOREIGN KEY (rid) REFERENCES Review(id)
);

CREATE TABLE Likes (
  uid VARCHAR(10),
  mid INT,
  PRIMARY KEY (uid, mid),
  FOREIGN KEY (uid) REFERENCES User(id),
  FOREIGN KEY (mid) REFERENCES Multimedia(id)
);

-- USER DATA
-- Create Users
INSERT INTO User (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y1', 'john@yahoo.com', 'John', 'Smith', '1992-12-12', 'FL', 'M');
INSERT INTO USER (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y2', 'juan@gmail.com', 'Juan', 'Carlos', '1988-02-07', 'AK', 'M');
INSERT INTO USER (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y3', 'Jane@gmail.com', 'Jane', 'Chapel', '1980-06-01', 'IL', 'F');
INSERT INTO USER (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y4', 'adi@yahoo.com', 'Aditya', 'Awasthi', '1994-04-12', 'CA', 'M');
INSERT INTO USER (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y5', 'james@hotmail.com', 'James', 'Williams', '1991-05-05', 'NY', 'M');
INSERT INTO USER (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y6', 'mike@yahoo.com', 'Mike', 'Brown', '1988-03-01', 'NC', 'M');
INSERT INTO USER (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y7', 'bob@yahoo.com', 'Bob', 'Jones', '1970-02-19', 'NY', 'M');
INSERT INTO USER (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y8', 'wei@gmail.com', ' Wei', 'Zhang', '1975-03-18', 'NV', 'F');
INSERT INTO USER (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y9', 'mark@gmail.com', 'Mark', 'Davis', '1993-11-02', 'CA', 'M');
INSERT INTO USER (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y10', 'daniel@yahoo.com', 'Daniel', 'Garcia', '1984-05-10', 'NJ', 'M');
INSERT INTO USER (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y11', 'maria@hotmail.com', 'Maria', 'Rodriguez', '1985-08-12', 'CA', 'F');
INSERT INTO USER (id, email, firstName, lastName, dateOfBirth, birthPlace, gender) VALUES ('Y12', 'freya@yahoo.com', 'Freya', 'Wilson', '1995-10-05', 'NJ', 'F');

-- Create Friend Relationships
INSERT INTO Friends (uid1, uid2) VALUES ('Y1', 'Y2');
INSERT INTO Friends (uid1, uid2) VALUES ('Y1', 'Y7');
INSERT INTO Friends (uid1, uid2) VALUES ('Y1', 'Y9');
INSERT INTO Friends (uid1, uid2) VALUES ('Y3', 'Y6');
INSERT INTO Friends (uid1, uid2) VALUES ('Y3', 'Y11');
INSERT INTO Friends (uid1, uid2) VALUES ('Y3', 'Y5');
INSERT INTO Friends (uid1, uid2) VALUES ('Y4', 'Y7');
INSERT INTO Friends (uid1, uid2) VALUES ('Y4', 'Y11');
INSERT INTO Friends (uid1, uid2) VALUES ('Y6', 'Y2');
INSERT INTO Friends (uid1, uid2) VALUES ('Y6', 'Y4');
INSERT INTO Friends (uid1, uid2) VALUES ('Y7', 'Y1');
INSERT INTO Friends (uid1, uid2) VALUES ('Y7', 'Y3');
INSERT INTO Friends (uid1, uid2) VALUES ('Y8', 'Y6');
INSERT INTO Friends (uid1, uid2) VALUES ('Y8', 'Y1');
INSERT INTO Friends (uid1, uid2) VALUES ('Y9', 'Y1');
INSERT INTO Friends (uid1, uid2) VALUES ('Y9', 'Y2');
INSERT INTO Friends (uid1, uid2) VALUES ('Y11', 'Y3');
INSERT INTO Friends (uid1, uid2) VALUES ('Y11', 'Y5');
INSERT INTO Friends (uid1, uid2) VALUES ('Y12', 'Y11');

-- Create Compliments
INSERT INTO Compliment (makerID, recipientID) VALUES ('Y1', 'Y7');
INSERT INTO Compliment (makerID, recipientID) VALUES ('Y1', 'Y9');
INSERT INTO Compliment (makerID, recipientID) VALUES ('Y3', 'Y6');
INSERT INTO Compliment (makerID, recipientID) VALUES ('Y4', 'Y11');
INSERT INTO Compliment (makerID, recipientID) VALUES ('Y6', 'Y4');
INSERT INTO Compliment (makerID, recipientID) VALUES ('Y7', 'Y3');
INSERT INTO Compliment (makerID, recipientID) VALUES ('Y8', 'Y6');
INSERT INTO Compliment (makerID, recipientID) VALUES ('Y11', 'Y5');
INSERT INTO Compliment (makerID, recipientID) VALUES ('Y12', 'Y11');

-- BUSINESS CATEGORIES
-- Create Business Categories
 INSERT INTO BusinessCategory (bcid, name) VALUES ('BCT1', 'Amusement Parks');
 INSERT INTO BusinessCategory (bcid, name) VALUES ('BCT2', 'National Parks');
 INSERT INTO BusinessCategory (bcid, name) VALUES ('BCT3', 'Career Counseling');
 INSERT INTO BusinessCategory (bcid, name) VALUES ('BCT4', 'Food and More');
 INSERT INTO BusinessCategory (bcid, name) VALUES ('BCT5', 'Bars');
 INSERT INTO BusinessCategory (bcid, name) VALUES ('BCT6', 'Restaurents');
 INSERT INTO BusinessCategory (bcid, name) VALUES ('BCT7', 'Pool Cleaners');
 INSERT INTO BusinessCategory (bcid, name) VALUES ('BCT8', 'Coffee Shops');

-- Create Subcategories
 INSERT INTO Subcategory (bcid, name) VALUES ('BCT1', 'Water Parks');
 INSERT INTO Subcategory (bcid, name) VALUES ('BCT2', 'Wildlife National Parks');
 INSERT INTO Subcategory (bcid, name) VALUES ('BCT3', 'Career Counselling for kids');
 INSERT INTO Subcategory (bcid, name) VALUES ('BCT4', 'Ice-cream and Yougurt');
 INSERT INTO Subcategory (bcid, name) VALUES ('BCT5', 'Sports bar');
 INSERT INTO Subcategory (bcid, name) VALUES ('BCT6', 'Ice-cream and Yougurt');
 INSERT INTO Subcategory (bcid, name) VALUES ('BCT7', 'Swimming pool cleaners');
 INSERT INTO Subcategory (bcid, name) VALUES ('BCT8', 'Cold coffee shops');

-- BUSINESS DATA
-- Create Businesses
-- INSERT INTO Business (bid, name, ambiance, bctid, streetAddress, state, zipcode) VALUES ('BX', 'NX', 'AX', 'BCTX');
INSERT INTO Business (bid, name, ambiance, bcid, streetAddress, state, zipcode) VALUES ('B1', 'Big Surf', 'Touristy', 'BCT1', '1500 N McClintock Dr, Tempe', 'AZ', 85281);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B1', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B1', 'T');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B1', 'W');

INSERT INTO Business (bid, name, ambiance, bcid, streetAddress, state, zipcode) VALUES ('B2', 'SMITH THOMSON', 'Touristy', 'BCT6', '1595 Spring Hill Road Suite 110 Vienna', 'VA', 22182);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B2', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B2', 'T');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B2', 'W');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B2', 'Th');

INSERT INTO Business (bid, name, ambiance, bcid, streetAddress, state, zipcode) VALUES ('B3', 'Bay Area Coffee Shop', 'Touristy', 'BCT8', '1522 W. Sam Rayburn Dr. Bonham', 'CA', 95051);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B3', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B3', 'T');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B3', 'W');

INSERT INTO Business (bid, name, ambiance, bcid, streetAddress, state, zipcode) VALUES ('B4', 'China  Coffee Toffee', 'Touristy', 'BCT4', '2570 El Camino Real, Santa Clara', 'CA', 95051);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B4', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B4', 'T');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B4', 'W');

INSERT INTO Business (bid, name, bcid, streetAddress, state, zipcode) VALUES ('B5', 'Hastings Water Works', 'BCT7', '10331 Brecksville Rd. Brecksville', 'OH', 44141);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B5', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B5', 'T');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B5', 'W');

INSERT INTO Business (bid, name, bcid, streetAddress, state, zipcode) VALUES ('B6', 'Catch Your Big Break', 'BCT3', '2341 Roosevelt Ct Santa Clara', 'CA', 95051);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B6', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B6', 'T');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B6', 'W');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B6', 'Th');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B6', 'F');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B6', 'S');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B6', 'Su');

INSERT INTO Business (bid, name, bcid, streetAddress, state, zipcode) VALUES ('B7', 'The Cinebar', 'BCT5', '20285 South Western Ave., Suite # 200, Torrance', 'CA', 90501);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B7', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B7', 'T');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B7', 'W');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B7', 'Th');

INSERT INTO Business (bid, name, bcid, streetAddress, state) VALUES ('B8', 'Coffee Bar & Bistro', 'BCT5', '2585 El Camino Real Santa Clara', 'CA');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B8', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B8', 'T');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B8', 'W');

INSERT INTO Business (bid, name, bcid, streetAddress, state, zipcode) VALUES ('B9', 'Hobee\'s', 'BCT6', '90 Skyport Dr San Jose', 'CA', 95110);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B9', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B9', 'T');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B9', 'W');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B9', 'Th');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B9', 'F');

INSERT INTO Business (bid, name, bcid, streetAddress, state, zipcode) VALUES ('B10', 'Cafe Gourmet', 'BCT6', '80 N Market St San Jose', 'CA', 95113);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B10', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B10', 'T');

INSERT INTO Business (bid, name, bcid, streetAddress, state, zipcode) VALUES ('B11', 'Yellow Stone National Park', 'BCT2', 'Yellow Stone National Park', 'WY', 82190);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B11', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B11', 'F');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B11', 'S');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B11', 'Su');

INSERT INTO Business (bid, name, bcid, streetAddress, state, zipcode) VALUES ('B12', 'Petrified Forest National Park', 'BCT2', 'P.O. Box 221', 'AZ', 86028);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B12', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B12', 'T');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B12', 'Su');

INSERT INTO Business (bid, name, bcid, streetAddress, state, zipcode) VALUES ('B13', 'Grand Canyon National park', 'BCT2', 'Highway 64', 'AZ', 86023);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B13', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B13', 'S');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B13', 'Su');

INSERT INTO Business (bid, name, bcid, streetAddress, state, zipcode) VALUES ('B35', 'Connecticut Bar', 'BCT5', '5847 San Felipe, Suite 2400 Houston', 'TX', 77057);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B35', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B35', 'Th');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B35', 'Su');

INSERT INTO Business (bid, name, bcid, streetAddress, state, zipcode) VALUES ('B36', 'Sherley\'s Bar & Restaurent', 'BCT5', '1132 Terry Road, Hartford', 'CT', 06105);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B36', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B36', 'W');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B36', 'Su');

INSERT INTO Business (bid, name, bcid, streetAddress, state, zipcode) VALUES ('B14', 'Connecticut Bar & Restaurent', 'BCT5', '1133 Terry Road, Hartford', 'CT', 06105);
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B14', 'M');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B14', 'W');
INSERT INTO Schedule (bid, dayOfWeek) VALUES ('B14', 'Su');

-- CHECKIN DATA
-- Depends on Users and Businesses
-- Create Checkins
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y1', 'B3', 'Checkin Info 3');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y1', 'B2', 'Checkin Info 2');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y1', 'B13', 'Checkin Info 13');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y1', 'B35', 'Checkin Info 35');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y1', 'B36', 'Checkin Info 36');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y1', 'B5', 'Checkin Info 5');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y1', 'B4', 'Checkin Info 4');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y1', 'B9', 'Checkin Info 9');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y2', 'B10', 'Checkin info 10');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y2', 'B5', 'Checkin info 5');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y2', 'B11', 'Checkin info 11');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y2', 'B2', 'Checkin info 2');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y2', 'B36', 'Checkin info 36');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y2', 'B35', 'Checkin info 35');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y4', 'B4', 'Checkin info 4');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y4', 'B11', 'Checkin info 11');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y4', 'B12', 'Checkin info 12');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y4', 'B5', 'Checkin info 5');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y4', 'B36', 'Checkin info 36');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y4', 'B35', 'Checkin info 35');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y4', 'B2', 'Checkin info 2');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y5', 'B6', 'Checkin info 6');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y5', 'B11', 'Checkin info 11');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y5', 'B12', 'Checkin info 12');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y5', 'B5', 'Checkin info 5');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y5', 'B36', 'Checkin info 36');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y5', 'B35', 'Checkin info 35');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y5', 'B8', 'Checkin info 8');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y6', 'B36', 'Checkin info 36');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y6', 'B11', 'Checkin info 11');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y6', 'B2', 'Checkin info 2');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y6', 'B3', 'Checkin info 3');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y6', 'B13', 'Checkin info 13');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y7', 'B13', 'Checkin info 13');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y7', 'B35', 'Checkin info 35');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y7', 'B36', 'Checkin info 36');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y7', 'B11', 'Checkin info 11');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y7', 'B2', 'Checkin info 2');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y7', 'B3', 'Checkin info 3');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y8', 'B11', 'Checkin info 11');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y8', 'B2', 'Checkin info 2');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y8', 'B13', 'Checkin info 13');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y8', 'B35', 'Checkin info 35');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y8', 'B36', 'Checkin info 36');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y8', 'B4', 'Checkin info 4');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y9', 'B5', 'Checkin info 5');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y9', 'B11', 'Checkin info 11');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y9', 'B2', 'Checkin info 2');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y9', 'B13', 'Checkin info 13'); 
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y9', 'B35', 'Checkin info 35');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y9', 'B36', 'Checkin info 36');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y10', 'B1', 'Checkin info 1');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y10', 'B5', 'Checkin info 5');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y10', 'B11', 'Checkin info 11');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y10', 'B2', 'Checkin info 2');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y10', 'B36', 'Checkin info 36');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y10', 'B35', 'Checkin info 35');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y10', 'B3', 'Checkin info 3');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y11', 'B3', 'Checkin info 3');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y11', 'B4', 'Checkin info 4'); 
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y11', 'B1', 'Checkin info 1');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y11', 'B5', 'Checkin info 5');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y11', 'B11', 'Checkin info 11');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y11', 'B2', 'Checkin info 2');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y11', 'B36', 'Checkin info 36');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y11', 'B35', 'Checkin info 35');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y12', 'B7', 'Checkin info 7');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y12', 'B10', 'Checkin info 10');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y12', 'B5', 'Checkin info 5');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y12', 'B11', 'Checkin info 11');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y12', 'B2', 'Checkin info 2');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y12', 'B13', 'Checkin info 13'); 
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y12', 'B35', 'Checkin info 35');
INSERT INTO Checkin (uid, bid, checkinfo) VALUES ('Y12', 'B36', 'Checkin info 36');

-- REVIEW DATA
-- Create Reviews & Create Comments
-- INSERT INTO Review () VALUES ();
