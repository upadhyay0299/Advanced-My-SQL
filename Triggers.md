# Triggers
A set of actions that can be performed automatically.
### Syntax:
CREATE TRIGGER trigger_name
trigger type
ON table 
{logic};
### Example:
CREATE TRIGGER OrderQtyCheck
BEFORE INSERT
ON ORDERS FOR EACH ROW
BEGIN
  IF NEW.orderQty < 0 THEN
  SET NEW.orderQty=0;
  END IF;
END;
