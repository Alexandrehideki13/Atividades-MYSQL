# Criando a procedure repeticao5numeros
DELIMITER $$
CREATE PROCEDURE repeticao5numeros()
BEGIN 
	DECLARE contador TINYINT DEFAULT 1;
    DECLARE str VARCHAR(15) DEFAULT "";
	WHILE contador <= 5 DO
		SET str = CONCAT(str , contador , ", ");
		SET contador = contador + 1;
	END WHILE;
    SELECT str;
END $$
DELIMITER ;

# Executando a procedure repeticao5numeros
CALL repeticao5numeros();