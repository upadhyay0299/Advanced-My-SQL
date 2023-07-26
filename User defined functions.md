Steps to create a user-defined function.
1. Change the delimiter to // 
  - Use the command: DELIMITER //
2. Syntax to create a Function:
  - CREATE FUNCTION function() RETURNS DATATYPE DETERMINISTIC RETURN;
 <!-- DETERMINISTIC means that the function always returns the same result for the same input -->
3. Example:
   - CREATE FUNCTION FindTotalCost(Cost Decimal(5,2)) RETURNS Decimal(5,2) 
     DETERMINISTIC 
     BEGIN 
     IF(Cost>=100 And Cost<500)
      THEN SET Cost=Cost -(Cost * 0.1);
    ELSEIF(Cost>=500)
      THEN SET COST=Cost -(Cost * 0.2);
    ENDIF;
    RETURN Cost;
    END //

4. Change the Delimiter back to semicolon --> DELIMITER ;
5. To call the function, Syntax: SELECT FindTotalCost(500);
6. To Drop the function, Syntax: DROP FUNCTION FindTotalCost;
