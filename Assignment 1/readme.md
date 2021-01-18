# Assignment 1 <!-- omit in toc -->

## Contents <!-- omit in toc -->
- [Problem 1](#problem-1)
- [Problem 2](#problem-2)
- [Problem 3](#problem-3)
- [Problem 4](#problem-4)
- [References or Resources 📖](#references-or-resources-)



## Problem 1
1.1 Name some popular companies that use NoSQL databases?       
1.2. What is their justification for not using relational databases?        
1.3. Why companies like FB and Google rely on relational databases?

**Solution**

1.1 Amazon, Netflix, PayPal

1.2 Relational databases are expensive to scale, rigid schemas which are not ready for dynamic data, unable to process massive data with high performance. while NoSQL is highly scalable (both horizontally and vertically), it gives flexibility in schema, relationships are less complicated, and it can deal with large volumes of structured and unstructured data [5].

1.3 Because they are very much query depended. NoSQL is not optimized for complicated querying. There are many relationship tables in facebook, google and twitter. In case of facebook, it includes information regarding user, the photos he/she shared, the places visited, the details about friends, the groups they are involved in, the locations, etc.

## Problem 2
What are the main features of Youtube's database implementation? How it is different than native MySQL?

**Solution**
2.1 Youtube uses MySQL type of database. It stores video content and other meta datas like users,tags,descriptions, likes,comments,subsriptions,etc. 

2.2. Vitess is used in conjugation with MySQL. Vitess is a database clustering system that combines many of the important features of MySQL with the scalability that is a trademark of a NoSQL database. Vitess helps in consolidating the YouTube queries into smaller batches that are much easier to handle and execute. It also creates backups and scales as much is required [6]. Vitess solves the problems like large number of connections to MySQL database, protecting from bad queries, etc[7].By using vitess it gets features of both SQL and NonSQL database. Features of SQL database in Vitess include Transactions,Indexes,Joins,Schema and from NonSQL it has Sharding. It required both the properties, therefore youtube settled for the sweetspot by using Vitess.


## Problem 3
How is Facebook database implementation different than native MySQL implementation? Is FB's implementation available for public use?

## Problem 4
What are the ACID properties? Do all databases need to comply with the ACID properties? Can you think of some examples of databases that do not follow ACID properties? 

**Solution**

1.1 Atomicity, Consistency, Isolation and Durability.
1.2
1.3

## References or Resources 📖

1. The content covered in slides till now (slides contain material from chapter 1 and 2 of DATABASE
SYSTEM CONCEPTS 6th Edition)
2. Introduction to NoSQL: https://www.geeksforgeeks.org/introduction-to-nosql/
3. https://blog.yugabyte.com/facebooks-user-db-is-it-sql-or-nosql/
4. https://www.8bitmen.com/youtube-database-how-does-it-store-so-many-videos-without-running-out-of-storage-space/
5. https://www.geeksforgeeks.org/use-of-nosql-in-industry/
6. https://www.geeksforgeeks.org/how-does-youtube-store-and-analyze-such-huge-amount-of-data/
7. https://www.youtube.com/watch?v=5yDO-tmIoXY