# Relational

#note don't forget to draw the lines from foreign keys to other entities

## Assumptions

- profile picture is an instance of the private multimedia entity with type photo
- friending is synonymous with following
- videos have the same attributes as photos and can also be marked as personal or business
- review's textual content must contain text and can optionally include either 1 video or 1 photo
- Activity wall is calculated at run time from queries of friends joined with the set ordered set of the most recent posts. (this is an application detail and does not belong in the DB)
- comments only contain text not multimedia
- businesses may have special schedules on a date
- businesses like sushi restaurants may have one break in their schedule
- the visibility of a business photo is an application concern handled by checking if the user is in the businesses list of checked in users. Therefore it is not included in the db schema.
- a user can check into many businesses
- Every user owns at least one multimedia entity of type photo representing their profile picture
- Parking type and ambiance are both strings that contain a valid value from the following sets respectively: street, garage, lot, or valet, and romantic, classy, touristy, or casual.
- A business may only have 1 parking type and 1 ambiance type
- When a user or business account is deleted all reviews from the user or associated with the business are deleted.

## Key

| element | meaning             |
| ------- | ------------------- |
| u       | underline (primary) |
| uq      | unique              |
| f       | foreign             |
| n       | not null            |
| null    | nullable            |

TODO: cascade should be on the actual Entity not the foreign key
TODO: review total participation
TODO: review multiplicty

## Entity Sets

- User(<f target="Comment" onDel="cascade"><f target="Friends" onDel="cascade"><u>id:int</u></f></f>, <n>email:string</n>, <n>dateOfBirth:Date</n>, <n>gender:string</n>, <n>birthPlace:string</n>, <n>lastName:string</n>, <n>firstName:string</n>)
- Compliment(<u>id:int</u>, <f><n>makerID:int</n></f>,<f><n>recipientID:int</n></f>, <n>text:string</n>)
- Multimedia(<u>id:int</u>, description:string, location:string, <n>type:string</n>, <n>privacy:string</n>, <f>uAuthor:int</f>, <f>bAuthor:int</f>, <n>media:longBlob</n>) constraint uAuthor xor bAuther must not be null
- Business(<u>bid:int</u>, parkingType:Enum('street', 'garage', 'lot', 'valet'), ambiance:Enum('romantic', 'classy', 'touristy', 'casual'), zipcode:int, <n>lat:int</n>, <n>long:int</n>, <n>streetAddress:string</n>, state:string, <n><f>category:string</f></n>)
- BusinessCategory(<u>type:string</u>)
- Subcategory(<u>type:string</u>)
- Schedule(<u><f>bid:int</f></u>, <u>dayOfWeek:Enum('M','T','W','Th','F','S',Su')</u>, <n><f>hours:int</f></n>, <f>break:int</f>)
- ExceptionSchedule(<f><u>bid:int</u></f>, <u>date:Date</u>, <n><f>hours:int</f></n>, <f>break:int</f>)
- TimeRange(<u>id</u>, <n>start:Time</n>, <n>end:Time</n>) constraint (start & end are unique together)
- Review(<u>id</u>, <f onDel="cascade"><n>bid</n></f>, <n><f onDel="cascade">author</f></n>, <n>publishDate</n>, <n>textContent</n>)
- Comment(<u>id:int</u>, <f onDel="cascade"><n>rid</n></f>, <f><n>author</n></f>, <n>date</n>, <n>textContent</n>)

## Relations

- Friends(<f><u>uid1:int</u></f>, <f><u>uid2:int</u></f>)
- Creates(<u><f>mid:int</f></u>, <n><f>uid:int</f></n>)
- Checkin(<u>id</u>, <n><f>uid</f></n>, <n><f>bid</f></n>, <n>checkinfo:string</n>)
- ReviewHasMultimedia(<f><u>mid:int</u></f>, <f><n>rid:int</n></f>)
- Votes(<f><u>uid:int</u></f>, <f><u>rid:int</u></f>, useful:bool)
- Likes(<f><u>uid:int</u></f>, <f><u>mid:int</u></f>)
- StarsR(<f><u>uid:int</u></f>, <f><u>rid:int</u></f>)
- StarsB(<f><u>uid:int</u></f>, <f><u>bid:int</u></f>)
- CatToSubcat(<f>cat:string</f>, <u><f>subcat:string</f></u>)
