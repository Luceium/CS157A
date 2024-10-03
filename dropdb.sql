DROP TABLE ExceptionSchedule; -- ON DELETE CASCADE means ExceptionSchedule table will be empty after dropping Business AND references TimeRange
DROP TABLE Schedule; -- ON DELETE CASCADE means Schedule table will be empty after dropping Business AND references TimeRange
DROP TABLE TimeRange;
DROP TABLE Checkin; -- ON DELETE CASCADE means Checkin table will be empty after dropping Business, or User
DROP TABLE Likes; -- ON DELETE CASCADE means Likes table will be empty after dropping Review, or User
DROP TABLE Votes; -- ON DELETE CASCADE means Votes table will be empty after dropping Review, or User
DROP TABLE Comment; -- ON DELETE CASCADE means Comment table will be empty after dropping Review, or User
DROP TABLE Review; -- ON DELETE CASCADE means Review table will be empty after dropping Business, or User
DROP TABLE Multimedia; -- ON DELETE CASCADE means Multimedia table will be empty after dropping Business, or User
DROP TABLE Business; -- References BusinessCategory
DROP TABLE Subcategory; -- ON DELETE CASCADE means Subcategorytable will be empty after dropping BusinessCategory
DROP TABLE BusinessCategory;
DROP TABLE Compliment; -- ON DELETE CASCADE means Compliment table will be empty after dropping User
DROP TABLE Friends; -- ON DELETE CASCADE means Friends table will be empty after dropping User
DROP TABLE User;