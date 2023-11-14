Database optimization in practice with indexes
This reading provides an overview of how MySQL utilizes indexes on query operations and how indexes can be used to optimize database performance in a practical scenario.

Introduction to Indexes and MySQL Indexes
As you may know already, an index is a data structure that is used to help search for data in a table for a given SELECT query without scanning every row. Indexes help retrieve data faster and speed up search queries. This means that indexes play a key role in database optimization.

In MySQL, indexes are created on table columns. However, not all the columns in a table should be indexed. You must decide which columns to index in a table based on which ones are used to regularly filter SELECT queries.

An indexed column’s data is stored in a separate location known as the index. The data is ordered according to type (for example numeric, alphabetical or date order). Each piece of data in the index points to the original table row. By creating a relationship, or reference, between the index and table, it becomes easier and faster to search for data.

It is important to note that indexes may hinder the performance of data change queries (INSERT, UPDATE or DELETE queries) while improving the performance of SELECT queries. The reason for this is that when inserting, updating or deleting a row in a table, data also needs to be inserted, updated or deleted in the index as well.

Query operations and indexes in MySQL
It is important to be aware of what query operations MySQL uses indexes on. This can help you to identify which table columns you need to create indexes on when creating SQL queries.

MySQL uses indexes when performing the following operations in queries:

Filtering rows using the WHERE clause: If there are multiple indexes used on the same column, MySQL chooses the index that works with the minimum number of rows.

Performing JOIN operations: To get the best performance from an index, the columns used in a JOIN should both have the same data type.  

MIN and MAX functions: An index can be used with these functions to find the minimum and maximum value of a specific column.

Sorting and grouping operations: An index can be used with these operations.

When you know which operations MySQL uses indexes on, you can then inspect your queries and create indexes on columns that are used to perform those operations. This helps the MySQL query optimizer optimize your queries to a greater extent.

Using indexes to optimize query performance
If a queried table contains very high data volumes (such as thousands or even millions of records), then performing search operations and obtaining results gives rise to slow response times. This leads to a suboptimal and inefficient database.

Let’s take a few moments to see how Lucky Shrub can use indexes to optimize query performance.

Lucky Shrub expands their business rapidly across many cities within the state of Arizona and gains tens of thousands of new clients. As part of this expansion, they have also introduced a loyalty scheme. So, the database’s clients table now stores data on each client’s city, state, date of birth (DOB) and loyalty points in addition to their id, full name and contact number.

Lucky Shrub need to query the Clients table to retrieve the following data:

The names of clients who are from Tucson, Arizona. 

The names of clients who are from Arizona but outside of Tucson.

A list of clients with the maximum loyalty points.

A list of clients whose date of birth falls on a given date.

To retrieve this data, they can write the following queries:

1. All clients from Tucson, Arizona

1
SELECT ClientID, FullName FROM Clients WHERE City = Tucson;
2. The names of clients who are from Arizona but outside of Tucson.

1
SELECT ClientID, FullName FROM Clients WHERE State = Arizona AND City <> Tucson;
3. A list of clients with the maximum loyalty points.

1
SELECT ClientID, MAX(LoyaltyPoints) FROM Clients; 
4. A list of clients whose date of birth falls on a given date.

1
SELECT ClientID, FullName FROM Clients WHERE DOB = 1990-01-01;
With tens of thousands of clients in the table, these queries will take a long time to return the results. This is an inefficient approach and doesn't adhere to database optimization guidelines.

The solution is for Lucky Shrub to create indexes on the columns within the Client’s table that MySQL uses to carry out these searches. These are the City, State, LoyaltyPoints, and DOB columns. By creating indexes on these columns, Lucky Shrub significantly reduce the time it takes to execute each query. This leads to a more efficient and more optimal database.

Conclusion
Indexes help speed up searches on a database by allowing the MySQL query optimizer to execute queries according to the best possible plan. The real performance impact of indexes is best observed in a database that has a large amount of data as opposed to a database that has a small amount of data. It’s important that indexes are created on the correct table columns. Don’t create indexes unnecessarily as they could have a negative impact on data change statements like INSERT, UPDATE and DELETE.
