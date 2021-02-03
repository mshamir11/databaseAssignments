drop database if exists dummy; 
CREATE database if not exists dummy;
use dummy;

CREATE TABLE if not exists Users (
  user_ID int not null,
  user_name varchar(500),
  PRIMARY KEY (user_ID)
 

);
CREATE TABLE if not exists Orders (
  order_Number int not null AUTO_INCREMENT,
  product_ID int,
  user_ID int,
  PRIMARY KEY (order_Number),
  FOREIGN KEY (user_ID) REFERENCES Users(user_ID) ON DELETE SET NULL
);

INSERT INTO Users VALUES(1,"Anonymouse");

INSERT INTO Users VALUES(2,"Babu");
INSERT INTO Orders(product_ID,user_ID) VALUES(2,2);
INSERT INTO Orders(product_ID,user_ID) VALUES(3,2);
INSERT INTO Orders(product_ID,user_ID) VALUES(4,2);

BEGIN
DECLARE orderCursor CURSOR FOR SELECT order_Number from Orders WHERE user_ID =2
OPEN orderCursor

  FETCH NEXT FROM orderCursor
CLOSE orderCursor

END 