# Relational

#note don't forget to draw the lines from foreign keys to other entities

## Entity Sets

User(<u>id</u>, email, dateOfBirth, gender, birthPlace, lastName, firstName, ) Where id is a foreign key into friends
Compliment(<u>makerID</u>,<u>recipientID</U>, <u>text</u>) makerId and recipientId are foreign key into User
Multimedia(<u>id</u>, description, location, type, privacy, author) where author is a foreign key into User or Business based on the privacy
Business(<u>bid</u>, parkingType, ambiance, zipcode, lat, long, streetAddress, state, checkinId)
CheckIn(<u>id</u>, bid, uid) not null bid and uid
BusinessCategory()
Subcategory()
Schedule()
TimeRange()
Review()
Comment(<u>cid</u>, author, date, test) should be deleted when review is deleted. Should it be made weak

## Relations

Friends(<u>uid1</u>, <u>uid2</u>) where both uids are foreign keys into user
Creates(<u>mid</u>, uid)
Checkin()
ReviewHasMultimedia(<u>mid</u>, rid)
Votes(<u>uid</u>, <u>rid</u>, useful)
Likes(<u>uid</u>, <u>mid</u>)
StarsR(<u>uid</u>, <u>rid</u>)
StarsB(<u>uid</u>, <u>bid</u>)
HasComment(<u>cid</u>, rid)

# DDL
