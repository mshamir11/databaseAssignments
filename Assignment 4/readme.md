# Mohamed Shamir | 17110084 <!-- omit in toc -->
---


## Contents <!-- omit in toc -->





## Problem 1

Implement the backend connectors for the E-Commerce database created in ​Assignment 2​. 

1. Ensure that ​input sanitization checks are performed. 
2. Submit a method definition for ​Question [1, 2, 3, 5, 6, 13, 16,  19, 20, 21] of the SQL queries implemented in Assignment 2, i.e., you have to write a python function as a solution for each question. It must perform the task as per the question.       

    Ex: If a query is  “ insert name and roll number in STUDENT table. “


```python


  def insert_data(name, roll_num, tablename, dbconnector, dbname):
    
    dummy_query = ‘insert into {0}(name, rollnum) values({1},{2})’.format(tablename, name, roll_num)
    
    dbconnector.update(dbname, dummy_query)
# Here input sanitization is not performed
```



# Here input sanitization is not performed


Assume there is a social network platform named RandomX for movie reviews, where a user can post a review about any movie and give a rating to any movie. To manage all these, we will create a database name RandomX and this database will consist of three schemas. One table will contain all the user details (username, gender, age), the second schema will consist of movie details (movie_id, movie_title, audience_rating), and in the third schema, movies review (movie_id, username, movie_rev) will be there.
For your convenience, all these details are provided in the excel (.xls) files:

User Information: This file consist of dummy user details. 
Movie Information: This file contains all the movie names along with their id and ratings.
Movie Reviews: This file contains all the user reviews of the movie mentioned in the movie information file, along with the username.
Note:  For this question, use a jupyter notebook.

Identify the primary keys and all the constraints and then create a database consisting of all the schemas required as per the question. [hint] [2 Marks]

Insert all the dummy records in the created schemas by reading their respective excel data. [hint: for convenience use pandas library to read excel file] [3 Marks]

Add a new column to the movie review table and name it ‘sentiment.’ This sentiment column consists of ‘positive’, ‘negative’, and ‘neutral’ value based on that row’s review. A review is said to be positive if the number of positive words occurring in it is more than the number of negative words, vice-versa for negative, and for neutral, positive word count is equal to negative word count. A list of positive words and negative words is given below, and your task is to update each row’s sentiment cell with the ‘positive’, ‘negative’, or ‘neutral’ value. [7 Marks]

Positive Words [Link]  and  Negative Words [Link]

Show the top 5 movie names with a rating strictly greater than 3.5, and the count of ‘positive’ sentiment is greater than equal to 2 for that movie. [3 Marks]


References:
https://www.kaggle.com/stefanoleone992/rotten-tomatoes-movies-and-critic-reviews-dataset

