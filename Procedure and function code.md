Developing functions in MySQL
Once you have completed the tasks in the ungraded lab, you can check and compare your answers with the following solutions.


Task 1 solution: 

Create a function that prints the cost value of a specific order. This should be based on the user input of the OrderID. The expected output result should be the same as the result in the screenshot below when you call the function with OrderID 5.

123
CREATE FUNCTION FindCost(order_id INT) 
RETURNS DECIMAL (5,2) DETERMINISTIC 
RETURN (SELECT Cost FROM Orders WHERE OrderID = order_id);
Screenshot of output of of findcost column in a table

Task 2 solution:

Create a stored procedure called GetDiscount(). This stored procedure must return the final cost of the customer’s order after the discount value has been deducted. The discount value is based on the order’s quantity. The stored procedure must have the following specifications:

The procedure should take one parameter that accepts a user input value of an OrderID. 

The procedure must find the order quantity of the specificOrderID. 

If the value of the order quantity is more than or equal to 20 then the procedure should return the new cost after a 20% discount. 

If the value of the order quantity is less than 20 and more than or equal to 10 then the procedure should return the new cost after a 10% discount.

45678910111213141516171819231
          SET cost_after_discount = current_cost - (current_cost * 0.2);              
        ELSEIF order_quantity >= 10 THEN
          SET cost_after_discount = current_cost - (current_cost * 0.1); 
        ELSE SET cost_after_discount = current_cost;
        END IF;
    SELECT cost_after_discount; 
END//

DELIMITER ; 
Screenshot of output of cost after discount column in a table
The expected output result should be the same as the result in the screenshot when the procedure is called with an OrderID value of 5.  

![Uploading Screenshot 2023-11-01 221552.png…]()
