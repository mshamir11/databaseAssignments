drop database if exists ecommerce; 

CREATE database if not exists ecommerce;
use ecommerce;




-- Create User
CREATE TABLE if not exists City (
  city_name varchar(50),
  PRIMARY KEY (city_name)
);


CREATE TABLE if not exists State (
  state_name varchar(50),
  PRIMARY KEY (state_name)
);

CREATE TABLE if not exists Country (
  country_name varchar(50),
  PRIMARY KEY (country_name)
);


CREATE TABLE if not exists Users (
  user_ID int not null,
  user_Name varchar(50),
  email varchar(50),
  password varchar(50),
  city varchar(50),
  state varchar(50),
  country varchar(50),
  phone varchar(50),
  date_created date,
  time_created time,
  PRIMARY KEY (user_ID),
  FOREIGN KEY (country) REFERENCES Country(country_name),
  FOREIGN KEY (state) REFERENCES State(state_name),
  FOREIGN KEY (city) REFERENCES City(city_name)

);


CREATE TABLE if not exists Delivery_Address (
  address_ID int AUTO_INCREMENT ,
  user_ID int,
  city varchar(50),
  state varchar(50),
  country varchar(50),
  Phone varchar(50),
  Pin varchar(50),
  PRIMARY KEY (address_ID),
  FOREIGN KEY (user_ID) REFERENCES Users(user_ID) ON DELETE CASCADE,
  FOREIGN KEY (country) REFERENCES Country(country_name) ON DELETE SET NULL,
  FOREIGN KEY (state) REFERENCES State(state_name) ON DELETE SET NULL,
  FOREIGN KEY (city) REFERENCES City(city_name) ON DELETE SET NULL

);

-- Create Product Table

CREATE TABLE if not exists Category (
  category_ID int,
  category_name varchar(50),
  PRIMARY KEY (category_ID)
);

CREATE TABLE if not exists Retailer (
  retailer_ID int,
  retailer_Name varchar(50),
  email varchar(50),
  City varchar(50),
  /* District varchar(50), */
  State varchar(50),
  Country varchar(50),
  PRIMARY KEY (retailer_ID),
  FOREIGN KEY (country) REFERENCES Country(country_name) ON DELETE SET NULL,
  FOREIGN KEY (state) REFERENCES State(state_name) ON DELETE SET NULL,
  /* FOREIGN KEY (district) REFERENCES District(district_name), */
  FOREIGN KEY (city) REFERENCES City(city_name) ON DELETE SET NULL

);



CREATE TABLE if not exists Products (
  product_ID int not null AUTO_INCREMENT,
  product_Name varchar(100) not null,
  category_ID int not null,
  date_added date not null,
  average_rating float(2),
  price float(2) not null,
  retailer_ID int,
  quantity_InStock int,
  PRIMARY KEY (product_ID),
  FOREIGN KEY (category_ID) REFERENCES Category(category_ID) ON DELETE CASCADE,
  FOREIGN KEY (retailer_ID) REFERENCES Retailer(retailer_ID) ON DELETE SET NULL
);



CREATE TABLE if not exists Orders (
  order_Number int not null AUTO_INCREMENT,
  product_ID int,
  user_ID int,
  order_Date date,
  order_Time time,
  address_ID int,
  quantity int not null,
  rating float(2),
  review varchar(500),
  PRIMARY KEY (order_Number),
  FOREIGN KEY (product_ID) REFERENCES Products(product_ID) ON DELETE SET NULL ,
  FOREIGN KEY (user_ID) REFERENCES Users(user_ID) ON DELETE SET NULL,
  FOREIGN KEY (address_ID) REFERENCES Delivery_Address(address_ID) ON DELETE SET NULL
);

CREATE TABLE if not exists Cart (
  cart_ID int not null AUTO_INCREMENT,
  user_ID int not null,
  product_ID int not null,
  quantity int,
  PRIMARY KEY (cart_ID),
  FOREIGN KEY (user_ID) REFERENCES Users(user_ID) ON DELETE CASCADE,
  FOREIGN KEY (product_ID) REFERENCES Products(product_ID) ON DELETE CASCADE
);

CREATE TABLE if not exists History (
  history_ID int not null AUTO_INCREMENT,
  user_ID int not null,
  product_ID int not null,
  No_of_visits int,
  PRIMARY KEY (history_ID),
  FOREIGN KEY (user_ID) REFERENCES Users(user_ID) ON DELETE CASCADE,
  FOREIGN KEY (product_ID) REFERENCES Products(product_ID) ON DELETE CASCADE

);

CREATE TABLE if not exists Electronics (
  product_ID int,
  Name varchar(50),
  description varchar(500),
  sub_category varchar(50),
  FOREIGN KEY (product_ID) REFERENCES Products(product_ID) ON DELETE CASCADE

);

CREATE TABLE if not exists Novels (
  product_ID int,
  Name varchar(50),
  Author varchar(50),
  year_of_publication date,
  description varchar(500),
  FOREIGN KEY (product_ID) REFERENCES Products(product_ID) ON DELETE CASCADE
);

CREATE TABLE if not exists Clothes (
  product_ID int,
  Name varchar(50),
  Date_of_first_arrival date,
  description varchar(500),
  brand varchar(50),
  FOREIGN KEY (product_ID) REFERENCES Products(product_ID) ON DELETE CASCADE

);


-- Inserting into City

INSERT INTO City VALUES ("Ahmedabad");
INSERT INTO City VALUES ("Gandhinagar");
INSERT INTO City VALUES ("Mumbai");
INSERT INTO City VALUES ("Chennai");
INSERT INTO City VALUES ("Kochi");
INSERT INTO City VALUES ("Hyderabad");
INSERT INTO City VALUES ("Delhi");
INSERT INTO City VALUES ("Kolkata");
INSERT INTO City VALUES ("Madrid");
INSERT INTO City VALUES ("Barcelona");
INSERT INTO City VALUES ("London");






INSERT INTO State VALUES ("Gujarat");
INSERT INTO State VALUES ("Delhi");
INSERT INTO State VALUES ("Maharashtra");
INSERT INTO State VALUES ("Kerala");
INSERT INTO State VALUES ("Tamil Nadu");
INSERT INTO State VALUES ("Telangana");
INSERT INTO State VALUES ("West Bengal");
INSERT INTO State VALUES ("Madrid");
INSERT INTO Country VALUES ("India");
INSERT INTO Country VALUES ("Spain");
INSERT INTO Country VALUES ("Germany");



INSERT INTO Category VALUES (1,"Clothes");
INSERT INTO Category VALUES (2,"Electronics");

INSERT INTO Category VALUES (3,"Novels");









INSERT INTO Users(user_ID,user_Name) VALUES(88888,'Anonymous');










