-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS oficina_mecanica;
USE oficina_mecanica;

-- Tabela Cliente
CREATE TABLE IF NOT EXISTS Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela Veículo
CREATE TABLE IF NOT EXISTS Veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabela Equipe de Mecânicos
CREATE TABLE IF NOT EXISTS EquipeMecanicos (
    id_equipe INT AUTO_INCREMENT PRIMARY KEY,
    nome_equipe VARCHAR(100) NOT NULL
);

-- Tabela Mecânico
CREATE TABLE IF NOT EXISTS Mecanico (
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    especialidade VARCHAR(100),
    id_equipe INT,
    FOREIGN KEY (id_equipe) REFERENCES EquipeMecanicos(id_equipe)
);

-- Tabela Ordem de Serviço (OS)
CREATE TABLE IF NOT EXISTS OrdemServico (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    data_emissao DATE NOT NULL,
    valor_total DECIMAL(10, 2),
    status ENUM('Pendente', 'Em andamento', 'Concluído') DEFAULT 'Pendente',
    data_conclusao DATE,
    id_veiculo INT,
    id_equipe INT,
    autorizacao_cliente BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_equipe) REFERENCES EquipeMecanicos(id_equipe)
);

-- Tabela Serviço
CREATE TABLE IF NOT EXISTS Servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    valor_mao_de_obra DECIMAL(10, 2) NOT NULL
);

-- Tabela Peça
CREATE TABLE IF NOT EXISTS Peca (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);

-- Tabela OS_Servico (Relacionamento entre OS e Serviço)
CREATE TABLE IF NOT EXISTS OS_Servico (
    id_os_servico INT AUTO_INCREMENT PRIMARY KEY,
    id_os INT,
    id_servico INT,
    FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

-- Tabela OS_Peca (Relacionamento entre OS e Peça)
CREATE TABLE IF NOT EXISTS OS_Peca (
    id_os_peca INT AUTO_INCREMENT PRIMARY KEY,
    id_os INT,
    id_peca INT,
    FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);