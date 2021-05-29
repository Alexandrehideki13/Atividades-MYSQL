# Criando a procedure repita1a9
DELIMITER //
CREATE PROCEDURE repita1a9()
BEGIN
	DECLARE contador TINYINT DEFAULT 1;
    DECLARE result VARCHAR(50) DEFAULT "";
	REPEAT 
		SET result = CONCAT(result , contador , ',');
        SET contador = contador + 1;
	UNTIL contador > 9
    END REPEAT;
    SELECT result;
END //
DELIMITER ;

# Executando a procedure repita1a9
CALL repita1a9();