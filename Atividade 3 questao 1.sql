# Criando a função novoAluno
DELIMITER // 
CREATE FUNCTION novoAluno(codigoCurso INT, 
						  dataNascimento DATE, 
                          totalCredito INT, 
                          mgp DOUBLE(10,2), 
                          nomeAluno VARCHAR(50), 
                          email VARCHAR(50)) 
RETURNS VARCHAR(50)
BEGIN
	INSERT INTO aluno(cod_curso, dat_nasc, tot_cred, mgp, nom_alun, email) 
		 VALUES (codigoCurso, 
				 dataNascimento, 
                 totalCredito, 
                 mgp, 
                 nomeAluno, 
                 email);
	RETURN nomeAluno;	
END //
DELIMITER ;

# Executando a função novoAluno
SELECT novoAluno(2, '1989-06-12', 60, 9.00, 'Adriana Lins', 'adrianalins@gmail.com') AS 'Novo(a) Aluno(a)';