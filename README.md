# Oficina_Mecanica

# Esquema Conceitual para Oficina Mecânica

Este projeto consiste na criação de um esquema conceitual para um sistema de controle e gerenciamento de execução de ordens de serviço (OS) em uma oficina mecânica. O objetivo é modelar as entidades, relacionamentos e atributos necessários para representar o fluxo de trabalho descrito na narrativa.

---

## Narrativa

- **Clientes** levam veículos à oficina mecânica para consertos ou revisões periódicas.
- Cada **veículo** é designado a uma **equipe de mecânicos** que identifica os serviços a serem executados e preenche uma **Ordem de Serviço (OS)** com data de entrega.
- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma **tabela de referência de mão-de-obra**.
- O valor de cada **peça** também compõe a OS.
- O cliente autoriza a execução dos serviços.
- A mesma equipe avalia e executa os serviços.
- **Mecânicos** possuem código, nome, endereço e especialidade.
- Cada OS possui: número, data de emissão, valor, status e data para conclusão dos trabalhos.

---

## Esquema Conceitual

### Entidades e Atributos

1. **Cliente**
   - `id_cliente` (PK)
   - `nome`
   - `endereco`
   - `telefone`
   - `email`

2. **Veículo**
   - `id_veiculo` (PK)
   - `placa`
   - `marca`
   - `modelo`
   - `ano`
   - `id_cliente` (FK)

3. **Equipe de Mecânicos**
   - `id_equipe` (PK)
   - `nome_equipe`

4. **Mecânico**
   - `id_mecanico` (PK)
   - `nome`
   - `endereco`
   - `especialidade`
   - `id_equipe` (FK)

5. **Ordem de Serviço (OS)**
   - `id_os` (PK)
   - `data_emissao`
   - `valor_total`
   - `status`
   - `data_conclusao`
   - `id_veiculo` (FK)
   - `id_equipe` (FK)

6. **Serviço**
   - `id_servico` (PK)
   - `descricao`
   - `valor_mao_de_obra`

7. **Peça**
   - `id_peca` (PK)
   - `descricao`
   - `valor`

8. **OS_Servico**
   - `id_os_servico` (PK)
   - `id_os` (FK)
   - `id_servico` (FK)

9. **OS_Peca**
   - `id_os_peca` (PK)
   - `id_os` (FK)
   - `id_peca` (FK)

---

### Relacionamentos

- **Cliente** possui um ou mais **Veículos**.
- **Veículo** é atendido por uma **Equipe de Mecânicos**.
- **Equipe de Mecânicos** é composta por um ou mais **Mecânicos**.
- **Ordem de Serviço (OS)** é gerada para um **Veículo** e é atendida por uma **Equipe de Mecânicos**.
- **OS** pode conter um ou mais **Serviços** e uma ou mais **Peças**.

---

### banco de dados MySQL com base no esquema conceitual descrito. Este código cria as tabelas, define as chaves primárias (PK), chaves estrangeiras (FK) e os relacionamentos entre as entidades. (Diagram)

![Image](https://github.com/user-attachments/assets/812e0c24-eb1d-41c9-8a30-1ea61dde9d77)

---

## Considerações

- **Tabela de Referência de Mão-de-Obra**: A entidade **Serviço** representa a tabela de referência de mão-de-obra, contendo o valor de cada serviço.
- **Autorização do Cliente**: Adicionei um atributo `autorizacao_cliente` (booleano) na entidade **Ordem de Serviço (OS)** para representar a autorização do cliente.
- **Especialidade do Mecânico**: A especialidade foi incluída como um atributo na entidade **Mecânico**.

---

## Como Executar o Projeto

1. **Banco de Dados**:
   - Execute o script SQL fornecido no arquivo `schema.sql` para criar o banco de dados e as tabelas.

2. **Inserção de Dados**:
   - Utilize o exemplo de inserção de dados fornecido no arquivo `exemplos.sql` para popular o banco de dados.

3. **Consultas**:
   - Realize consultas SQL para testar o funcionamento do banco de dados.

---

## Tecnologias Utilizadas

- **MySQL**: Para criação e gerenciamento do banco de dados.
- **Ferramentas de Diagramação**: Utilizado para criar o diagrama Entidade-Relacionamento (DER).


---

## Licença do Mysql 
O MySQL é um sistema de gerenciamento de banco de dados relacional (SGBDR) de código aberto, mas sua licença depende da versão que você está utilizando:

[Mysql](https://www.mysql.com/) < gratuito >
        Não precisam ser open-source, a menos que você modifique e redistribua o próprio MySQL.!!!

---

## Contato

Para dúvidas ou sugestões, entre em contato:

## 👨‍💻 Autor

Bruno Molina, Uma Pessoa com Deficiência Auditiva - PcD, curso de análise de dados,
estudante do curso superior de Tecnologia em Análise e Desenvolvimento de Sistemas. Unicesumar. 2024 - 2026
- [GitHub](https://github.com/brumab) | [LinkedIn](https://www.linkedin.com/in/brumab1122/) | [cv](https://brumab.github.io/cur/)
