CREATE TABLE User (
  id INT PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  dateOfBirth DATE NOT NULL,
  gender VARCHAR(20) NOT NULL,
  birthPlace VARCHAR(100),
  lastName VARCHAR(50) NOT NULL,
  firstName VARCHAR(50) NOT NULL
);

CREATE TABLE Compliment (
  id INT PRIMARY KEY,
  makerID INT NOT NULL,
  recipientID INT NOT NULL,
  text TEXT NOT NULL,
  FOREIGN KEY (makerID) REFERENCES User(id) ON DELETE CASCADE,
  FOREIGN KEY (recipientID) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE Multimedia (
  id INT PRIMARY KEY,
  description TEXT,
  location VARCHAR(255),
  type ENUM('photo','video') NOT NULL,
  private BOOLEAN NOT NULL,
  uAuthor INT,
  bAuthor INT,
  media LONGBLOB NOT NULL,
  FOREIGN KEY (uAuthor) REFERENCES User(id) ON DELETE CASCADE,
  FOREIGN KEY (bAuthor) REFERENCES Business(bid) ON DELETE CASCADE,
  CHECK (author IS NOT NULL OR bAuthor IS NOT NULL)
);

CREATE TABLE Business (
  bid INT PRIMARY KEY,
  parkingType ENUM('street', 'garage', 'lot', 'valet'),
  ambiance ENUM('romantic', 'classy', 'touristy', 'casual'),
  zipcode INT,
  lat INT NOT NULL,
  long INT NOT NULL,
  streetAddress VARCHAR(255) NOT NULL,
  state VARCHAR(2),
  type VARCHAR(50) NOT NULL,
  FOREIGN KEY (type) REFERENCES BusinessCategory(type)
);

CREATE TABLE BusinessCategory (
  type VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Subcategory (
  type VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Schedule (
  bid INT,
  dayOfWeek ENUM('M','T','W','Th','F','S','Su') NOT NULL,
  hours INT NOT NULL,
  break INT,
  PRIMARY KEY (bid, dayOfWeek),
  FOREIGN KEY (bid) REFERENCES Business(bid) ON DELETE CASCADE,
  FOREIGN KEY (hours) REFERENCES TimeRange(id),
  FOREIGN KEY (break) REFERENCES TimeRange(id)
);

CREATE TABLE ExceptionSchedule (
  bid INT,
  date DATE NOT NULL,
  hours INT NOT NULL,
  break INT,
  PRIMARY KEY (bid, date)
  FOREIGN KEY (bid) REFERENCES Business(bid) ON DELETE CASCADE,
  FOREIGN KEY (hours) REFERENCES TimeRange(id),
  FOREIGN KEY (break) REFERENCES TimeRange(id)
);

CREATE TABLE TimeRange (
  id INT PRIMARY KEY,
  start TIME NOT NULL,
  end TIME NOT NULL,
  CHECK (start < end),
  UNIQUE (start, end)
);

CREATE TABLE Review (
  id INT PRIMARY KEY,
  bid INT NOT NULL,
  author INT NOT NULL,
  publishDate DATE NOT NULL,
  textContent TEXT NOT NULL,
  FOREIGN KEY (bid) REFERENCES Business(bid) ON DELETE CASCADE,
  FOREIGN KEY (author) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE Comment (
  id INT PRIMARY KEY,
  rid INT NOT NULL,
  author INT NOT NULL,
  date DATE NOT NULL,
  textContent TEXT NOT NULL,
  FOREIGN KEY (rid) REFERENCES Review(id) ON DELETE CASCADE,
  FOREIGN KEY (author) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE Friends (
  uid1 INT,
  uid2 INT,
  PRIMARY KEY (uid1, uid2),
  FOREIGN KEY (uid1) REFERENCES User(id) ON DELETE CASCADE,
  FOREIGN KEY (uid2) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE Creates (
  mid INT,
  uid INT NOT NULL,
  PRIMARY KEY (mid),
  FOREIGN KEY (mid) REFERENCES Multimedia(id),
  FOREIGN KEY (uid) REFERENCES User(id)
);

CREATE TABLE Checkin (
  id INT PRIMARY KEY,
  uid INT NOT NULL,
  bid INT NOT NULL,
  checkinfo VARCHAR(255) NOT NULL,
  FOREIGN KEY (uid) REFERENCES User(id),
  FOREIGN KEY (bid) REFERENCES Business(bid)
);

CREATE TABLE ReviewHasMultimedia (
  mid INT PRIMARY KEY,
  rid INT,
  FOREIGN KEY (mid) REFERENCES Multimedia(id),
  FOREIGN KEY (rid) REFERENCES Review(id) ON DELETE CASCADE
);

CREATE TABLE Votes (
  uid INT,
  rid INT,
  useful BOOLEAN,
  PRIMARY KEY (uid, rid),
  FOREIGN KEY (uid) REFERENCES User(id),
  FOREIGN KEY (rid) REFERENCES Review(id)
);

CREATE TABLE Likes (
  uid INT,
  mid INT,
  PRIMARY KEY (uid, mid),
  FOREIGN KEY (uid) REFERENCES User(id),
  FOREIGN KEY (mid) REFERENCES Multimedia(id)
);

CREATE TABLE StarsR (
  uid INT,
  rid INT,
  PRIMARY KEY (uid, rid),
  FOREIGN KEY (uid) REFERENCES User(id),
  FOREIGN KEY (rid) REFERENCES Review(id)
);

CREATE TABLE StarsB (
  uid INT,
  bid INT,
  PRIMARY KEY (uid, bid),
  FOREIGN KEY (uid) REFERENCES User(id),
  FOREIGN KEY (bid) REFERENCES Business(bid)
);

CREATE TABLE CatToSubcat (
  cat VARCHAR(50),
  subcat VARCHAR(100) PRIMARY KEY,
  FOREIGN KEY (cat) REFERENCES BusinessCategory(type),
  FOREIGN KEY (subcat) REFERENCES Subcategory(type)
);
