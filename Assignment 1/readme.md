# Assignment 1 <!-- omit in toc --> 📗

## Contents <!-- omit in toc --> :newspaper:
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

1.1 Amazon, Netflix, PayPal, Adobe,etc.

1.2 Relational databases are expensive to scale, rigid schemas which are not ready for dynamic data, unable to process massive data with high performance. while NoSQL is highly scalable (both horizontally and vertically), it gives flexibility in schema, relationships are less complicated, and it can deal with large volumes of structured and unstructured data [5]. It offers reduced risk of errors.

1.3 Because they are very much query depended. NoSQL is not optimized for complicated querying. There are many relationship tables in facebook, google and twitter. In case of facebook, it includes information regarding user, the photos he/she shared, the places visited, the details about friends, the groups they are involved in, the locations, etc.

## Problem 2
What are the main features of Youtube's database implementation? How it is different than native MySQL?

**Solution**        
2.1 Youtube uses MySQL type of database. It stores video content and other meta datas like users,tags,descriptions, likes,comments,subsriptions,etc. The main features of Youtube Database include[14]:     

- Use of Vitess for horizontal Scaling.
- Master-Slave Replicas are created to deal with the traffic. Master nod handles the write traffic while both master and slave replicas handle read requests. Read requests are routed to both master and the replicas to cut down the load on the master.
- Sharding is done to scale the database.
- Disaster Management: It stores the data in datacenters located at different geographical regions to ensure the redundancy or loss of data due to any natural calamity or any other unforeseen situations. It also helps to reduce the latency of the system as user requests are routed to the nearby data centers.

2.2. Vitess is used in conjugation with MySQL. Vitess is a database clustering system that combines many of the important features of MySQL with the scalability that is a trademark of a NoSQL database. Vitess helps in consolidating the YouTube queries into smaller batches that are much easier to handle and execute. It also creates backups and scales as much is required [6]. Vitess solves the problems like large number of connections to MySQL database, protecting from bad queries, etc[7].By using vitess it gets features of both SQL and NonSQL database. Features of SQL database in Vitess include Transactions,Indexes,Joins,Schema and from NonSQL it has Sharding. 


## Problem 3
How is Facebook database implementation different than native MySQL implementation? Is FB's implementation available for public use?

**Solution**

3.1 It uses MySQL with a caching system called memcache. Initially, InnoDB database engine was used and they developed myRocksDB database engine laterwards[12]. Facebook also uses TAO (The associations and objects), a Facebook specific NoSQL graph API built to run on sharded MySQL. Facebooks uses TAO's custom NoSQL API as a flexible query instead of SQL. It also helped FB to shift from manually sharded MySQL master-slave replicas to a highly scalable,auto-shared and geo-distributed data center clusters.SQL-based access patterns such as cross-shard ACID transactions and JOINs were disallowed in TAO as a means to preserve such low latency guarantees. However, it supported non-atomic two-shard writes in the context of an association update (whose two objects may be in two different shards).Shards can be migrated or cloned to different server in the same cluster to balance the load and to smooth out load spikes. Earlier, facebook had used the data distribution in the application layer, now they use distribution in the database layer itself[3].

3.2. myRocks DB is available for public use as it is part of an open source project by Facebook [11]. But, TAO is not available as open source.

## Problem 4
What are the ACID properties? Do all databases need to comply with the ACID properties? Can you think of some examples of databases that do not follow ACID properties? 

**Solution**

1.1 Atomicity   : It means a transaction either succeeds completely or fails completely.    
    Consistency : Data written to the database should be valid according to all the defined rules.  
    Isolation   : All the transactions to the database should be independent of each other. Parallel or concurrent execution of tasks should leave the database in the same state as the transactions are done in  a sequential order.  
    Durability  : Once a transaction is commited, it will remain committed even in the case of a power failure.

1.2 No, not necessarily. ACID comes with a trade off of performance. Places where performance is more important than data loss, Databases without ACID can be used.   
1.3 NoSQL Databases partialy or completely does not adhere to ACID properties (But, some of modern database engines like MongoDB does support ACID transactions). Data's such as photos, messages, videos, etc are fine even the database is not ACID compliant. ACID properties are required when the data handled is more sensitive and cannot afford any losses like the database used in financial transactions, health care units, etc[10]. Examples of databases which are not acid compliant include Cassandra, MySQL (if its used on Database Engine like InnoDB, then it becomes ACID compliant). Netflix and Instagram uses Non ACID compliant databases for some of its use cases [13].

## References or Resources 📖

1. The content covered in slides till now (slides contain material from chapter 1 and 2 of DATABASE
SYSTEM CONCEPTS 6th Edition)
2. Introduction to NoSQL: https://www.geeksforgeeks.org/introduction-to-nosql/
3. https://blog.yugabyte.com/facebooks-user-db-is-it-sql-or-nosql/
4. https://www.8bitmen.com/youtube-database-how-does-it-store-so-many-videos-without-running-out-of-storage-space/
5. https://www.geeksforgeeks.org/use-of-nosql-in-industry/
6. https://www.geeksforgeeks.org/how-does-youtube-store-and-analyze-such-huge-amount-of-data/
7. https://www.youtube.com/watch?v=5yDO-tmIoXY
8. https://engineering.fb.com/2016/08/31/core-data/myrocks-a-space-and-write-optimized-mysql-database/
9. https://www.percona.com/blog/2014/03/27/a-conversation-with-5-facebook-mysql-gurus/
10. https://www.quora.com/Why-are-ACID-properties-not-followed-in-Big-Data
11. http://myrocks.io/
12. https://www.8bitmen.com/what-database-does-facebook-use-a-1000-feet-deep-dive/
13. https://www.infoworld.com/article/2611540/datastax-ceo--let-s-clear-the-air-about-nosql-and-acid.html
14. https://www.8bitmen.com/youtube-database-how-does-it-store-so-many-videos-without-running-out-of-storage-space/