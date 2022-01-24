CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`()
BEGIN
	SELECT * FROM salesorderheader LIMIT 100;
END