DELIMITER //
CREATE TRIGGER tri_vendas_ai
AFTER INSERT ON comivenda
FOR EACH ROW
BEGIN
	DECLARE vtotal_itens FLOAT(10,2) DEFAULT 0;  # variável soma total dos valores da venda
    DECLARE vtotal_item  FLOAT(10,2) DEFAULT 0;  # variável soma dos valores de cada item
    DECLARE total_item   FLOAT(10,2) DEFAULT 0;  # variável armazena a linha adicionada
	DECLARE qtd_item 	 INT DEFAULT 0;          # variável armazena a quantidade de cada item na venda
    DECLARE fimloop 	 INT DEFAULT 0;
    
    # Cursor para busca de cada item
    DECLARE busca_itens CURSOR FOR
		SELECT n_valoivenda, n_qtdeivenda
          FROM comivenda
		 WHERE n_numevenda = NEW.n_numevenda;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET fimloop = 1;

    OPEN busca_itens;
    itens : LOOP
		
    	IF fimloop = 1 THEN
		LEAVE itens;
		END IF;
        
		FETCH busca_itens INTO total_item, qtd_item;  # atribuindo a linha buscada a variável
		
        # somando todos os valores dos itens
        SET vtotal_item = total_item * qtd_item;
		SET vtotal_itens = vtotal_itens + vtotal_item;
		
    END LOOP itens;     
    CLOSE busca_itens;

	# somo o valor total do item adicionado
	SET vtotal_item = NEW.n_valoivenda * NEW.n_qtdeivenda;
	
    # atualizo o atributo n_totavenda da tabela comvenda
	UPDATE comvenda SET n_totavenda = vtotal_itens - vtotal_item 
	WHERE n_numevenda = NEW.n_numevenda;
    
END //
DELIMITER ;