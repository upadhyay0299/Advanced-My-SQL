## Variables
- Variables are used to store values. It can be used in two ways:
    1. Inside or outside a Stored Procedures.
    2. Inside or outside a SELECT statement.
- To assing a value to a variable within a Stored Procedure:
    SET @variable_name=value;
- Using variable in a SELECT statement:
    SELECT * from table_name where column1=@variable_name;
  - Variable declaration for Procedure:
    - It can be done using **DECLARE** keyword.
  - Syntax of variable declaration for Procedure:
    - DECLARE variable_name DATATYPE DEFAULT value;
- Declaring variable inside a SELECT statement:
  - SELECT @variable_name :=value FROM table;

Select statement can also be used to assign a value to a variable using Function
  - SELECT function() INTO @variable_name FROM table_name;

## Parameters
- Pass arguments, or values to a function or procedure from the outside.
- There are three types of Procedures:
    1. IN
    2. OUT
    3. INOUT
#### 1. IN Parameter:
    - Value ---> Procedure
    - It is the default parameter.
    - Syntax: CREATE PROCEDURE procedure_name(IN logic(value1, value2)) SELECT logic;
    - Example: CREATE PROCEDURE calculateTax(IN Salary Decimal(5,2)) SELECT Salary * 0.2 AS Tax;
    - Calling the procedure: Call calculateTax(100000);

#### 2. OUT Parameter
   - Value --> Procedure --> Variable
   - Example: CREATE PROCEDURE getLowestCost (OUT LowestCost Decimal(5,2)) SELECT MIN(Cost) INTO LowestCost FROM Orders;
   -  Calling the procedure: Call getLowestCost(@order_lowest_cost);
   -  Output the result : SELECT @order_lowest_cost;     

#### 3. INOUT Procedure
   - Value --> Procedure --> NewValue
   - Syntax: CREATE PROCEDURE SquareAnumber(INOUT aNumber INT)
              BEGIN
                 SET aNumber=aNUmber*aNumber
              END
   - Calling the procedure: Call SquareAnumber(@x_number);
   - Output the result : SELECT @x_number;
