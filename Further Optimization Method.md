Further optimization techniques
This reading provides an overview of different optimization techniques that can be used to support the performance of your MySQL database.

Overview
As you should be aware by now, database optimization techniques are used to improve the performance of your database. In the previous lesson, you learned how to optimize MySQL SELECT queries using a range of different techniques.

However, there are other optimization techniques that can be used to support your database optimization such as transactions, common table expressions and prepared statements.

You may have encountered these already in this lesson. So, let's take a few moments to explore the basics of how these techniques are used to optimize database queries.

MySQL Transaction
As a database engineer, you should use MySQL transaction any time you have a critical activity to complete. If any error occurs during the execution of the query, then you can use this technique to restore your database to the original state.

This is a particularly useful technique to consider when writing a series of related queries that must all execute as intended to achieve an expected outcome.

For example, Lucky Shrub have written a series of queries to assist with new orders. When an order is received, the database first checks that there are enough items available in stock to fulfill the order. Once the order has been processed, the database then updates the number of items remaining in stock.

There are a lot of steps in this process. And some of the changes, or required operations, may fail to occur in the database. If so, then Lucky Shrub can use MySQL transaction to cancel the changes and rollback the current transaction if any statements fail to execute as required.

You can use the MySQL BEGIN or BEGIN WORK aliases to start a MySQL transaction. Although the START TRANSACTION command is the standard way to start a transaction process in MySQL. 

Then type the required SELECT statements. If all queries execute as expected, then the COMMIT statement is used to commit the current transaction and make the transaction changes permanently.

However, one or more of these statements may fail to execute as required. If so, then you can use the ROLLBACK statement to roll back the current transaction, cancel the changes made to the database and restore it to its original state.

This process is illustrated in the following abstract syntax:

123
START TRANSACTION; 
SQL statements 
ROLLBACK; 
Common Table Expressions
Database engineers often need to write complex SQL queries, which are usually difficult to read and maintain.

In this situation, you can use the Common Table Expression (CTE) technique to deconstruct the complex queries into simple blocks of code. With CTE, you can rewrite the query in a way that simplifies it and makes it easier to read and maintain.

The basic abstract syntax of the Common Table Expression is as follows: 

123
WITH CTE_Name AS (query code)  
SELECT * 
FROM CTE_Name; 
In this syntax, you use the WITH clause to start the common table expression, followed by the name of the Common Table Expression. This can be a custom name.

Next, use the AS keyword to associate the query with the related expression name. Finally, you use a SELECT statement to query the common table expression name.

If you require multiple queries, then you just need to associate each query with its related expression name and separate it by a comma as in the following example: 

1234
WITH 
  cte1 AS (query1), 
  cte2 AS (query2) 
SELECT cte1  UNION cte2;
This abstract syntax specifies two common table expressions separated by a comma. Each expression is associated with a query using the AS keyword.

Prepared statements
A query must be parsed by MySQL before it can be executed, which takes time and causes delays.

However, creating prepared statements in MySQL reduces the parsing time for queries. A prepared statement only needs to be parsed by MySQL once, regardless of the number of times it’s used and executed.

A prepared statement in MySQL is a template that you create with an SQL statement. A prepared statement starts with a PREPARE command followed by the statement name. This can be a custom name. It can also include certain unspecified values, used as parameters and labelled with a question mark ?

For example, in the following syntax, the two question marks ? represent two parameters that can be used to insert two different values into the Products table:

1
PREPARE InsertProductData FROM ‘INSERT INTO Products VALUES(?, ?)’; 
Prepared statements also minimize the bandwidth usage when communicating data with the MySQL server. You only need to pass the parameter’s values to the prepared statement, not the whole SQL statement.

Creating prepared statements also secures your database from SQL injections, a common hacking technique that can be used to destroy your database. A SQL injection attempts to pass malicious code to your database through SQL statements. However, this can be avoided if you use prepared statements when building your SQL queries.

Conclusion
MySQL transaction statements, common table expressions and prepared statements are all examples of effective optimization techniques that can be used to improve the performance of your MySQL database.

A transaction in MySQL contains one or more SQL queries that can be committed permanently to the database, or you can roll back to the original state if any of the executed queries fails.  

The Common Table Expression can be used to minimize the complexity of your queries and make them easier to read and maintain.  

The prepared statement supports database security and allows you to reuse the same SQL statements repeatedly and more efficiently.
