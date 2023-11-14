Overview of MySQL triggers
In this reading you’ll learn about the uses, advantages and disadvantages of MySQL triggers. You will also learn how to create, remove and list triggers in a MySQL database.


MySQL triggers and their uses
A MySQL trigger is a stored program that is associated with a table. A trigger is activated before or after a defined SQL operation is performed on a table. 

Triggers can be activated on SQL operations like INSERT, UPDATE and DELETE. MySQL supports Row-Level triggers that are invoked before or after a row is inserted, updated or deleted in a table.

You can specify a set of actions to be performed on a table when the specified operation occurs. This is done within the body of a trigger.

Triggers can be used in MySQL for the following purposes:

Enforcing business rules

Ensure data integrity (as a replacement to constraints)

Insert records to other tables for audit trail purposes

Query data for reporting purposes

Replicate data to different tables to achieve data consistency

 Creating and removing MYSQL triggers
The syntax to create a trigger in MySQL is as follows:

1234
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE| DELETE}
ON table_name FOR EACH ROW
trigger_body;
This syntax has 5 main parts:

1. Trigger name: All triggers must have a unique name within a schema or database name attached (optional). Triggers in different schemas can have the same name.

2. Trigger time:  This specifies when to action the trigger.  It can be BEFORE or AFTER the specified action to indicate that the trigger activates before or after each row that is inserted, modified or deleted.

3. Trigger event: This is the type of operation that activates the trigger. For example, INSERT, UPDATE and DELETE.

4. Table name: There must be a table to which the trigger is associated. It’s not possible to associate a trigger to a temporary table or a view.

5. Trigger body: Consists of the statements that execute when the trigger activates. The BEGIN END block should be used to execute multiple statements.

The syntax to remove a MySQL trigger is as follows:

1
DROP TRIGGER [IF EXISTS] [schema_name.]trigger_name
The schema name must be specified if the trigger is not in the default (current) schema. When a table is dropped, any triggers associated with that table will also be dropped.

Accessing table columns from within a trigger
You often must access table column values when writing the code in the trigger body. Accessing a table column within the body of the trigger can be done using the OLD and NEW modifiers. OLD is used to access the value of the column before the operation (For example BEFORE INSERT, UPDATE and DELETE). NEW is used to access the value of the column after the operation.

The OLD and NEW modifiers are available for INSERT, UPDATE and DELETE operations as follows:

Trigger event

OLD

NEW

INSERT

No

Yes

UPDATE

Yes

Yes

DELETE

Yes

No

Ensure that you use the OLD and NEW modifiers within your trigger correctly. Use the INSERT, UPDATE and DELETE triggers as specified in the table above.

Below are two examples of using the OLD and NEW modifiers within the trigger body.

Using the NEW modifier:

12345678
CREATE TRIGGER OrderQtyCheck  
  BEFORE INSERT ON Orders  
  FOR EACH ROW  
BEGIN 
  IF NEW.Quantity < 0 THEN  
    SET NEW.Quantity = 0; 
  END IF; 
END;
In this example an order is inserted. The NEW modifier is used to access the Quantity column’s value after the insert operation.

Using the OLD modifier:

1234
CREATE TRIGGER AfterDeleteOrder 
  AFTER DELETE   
  ON Orders FOR EACH ROW 
INSERT INTO Audits VALUES(4,'AFTER',CONCAT('Order ',OLD.OrderID, ' was deleted at ', CURRENT_TIME(), ' on ', CURRENT_DATE()),'DELETE');
In this example an order is deleted. The OLD modifier is used to access the OrderID column's value before the DELETE operation. 

Listing all triggers in the MySQL database
It is also helpful to view the triggers in your MySQL database.

You can use the SHOW TRIGGERS statement to view this.

123
SHOW TRIGGERS
[{FROM | IN} database_name]
[LIKE 'pattern' | WHERE search_condition];
This syntax returns all triggers in the specified database. 

The database name should be specified after the FROM or IN keyword.

It is possible to find triggers based on a pattern and find triggers that match a condition by adding the LIKE and the WHERE sections to this syntax.

Advantages and Disadvantages of triggers
Advantages of triggers:

Enables validation of data even before it is inserted or updated.

Provides an alternative way to run scheduled tasks or to perform tasks automatically.

Increases the performance of SQL queries because it does not need to compile each time that the query is executed.

Reduces client-side code for validations. This saves time and effort.

Easy to maintain.

  Disadvantages of triggers:

It's not possible to perform all kinds of constraint validations using a trigger. 

Not easy to troubleshoot because they work in the database layer and not in client/application layer. Therefore,  the errors in triggers may be hidden to the developer.

 May increase the overhead of the database server.

Conclusion
Triggers are a good way of enforcing business rules. Triggers are also a good alternative to constraints. They can be invoked automatically on specified actions on a database table. However, triggers should not be overused as it may increase the overhead of the MySQL database.
