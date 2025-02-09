-- Inserir um cliente
INSERT INTO Cliente (nome, endereco, telefone, email)
VALUES ('Bruno Molina', 'Rua A, 123', '11987654321', 'nome@gmail.com');

-- Inserir um veículo
INSERT INTO Veiculo (placa, marca, modelo, ano, id_cliente)
VALUES ('ABC-1234', 'Ford', 'Fiesta', 2018, 1);

-- Inserir uma equipe de mecânicos
INSERT INTO EquipeMecanicos (nome_equipe)
VALUES ('Equipe Alpha');

-- Inserir um mecânico
INSERT INTO Mecanico (nome, endereco, especialidade, id_equipe)
VALUES ('Carlos Souza', 'Rua B, 456', 'Motor', 1);

-- Inserir uma ordem de serviço
INSERT INTO OrdemServico (data_emissao, valor_total, status, id_veiculo, id_equipe, autorizacao_cliente)
VALUES ('2023-10-01', 500.00, 'Pendente', 1, 1, TRUE);

-- Inserir um serviço
INSERT INTO Servico (descricao, valor_mao_de_obra)
VALUES ('Troca de óleo', 100.00);

-- Inserir uma peça
INSERT INTO Peca (descricao, valor)
VALUES ('Filtro de óleo', 50.00);

-- Associar serviço à OS
INSERT INTO OS_Servico (id_os, id_servico)
VALUES (1, 1);

-- Associar peça à OS
INSERT INTO OS_Peca (id_os, id_peca)
VALUES (1, 1);