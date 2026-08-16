CREATE TABLE mesa (
  id_mesa INT AUTO_INCREMENT PRIMARY KEY,
  numero INT NOT NULL UNIQUE,
  capacidade INT NOT NULL,
  status VARCHAR(20) NOT NULL
  );
  
  CREATE TABLE atendente (
    id_atendente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    cargo VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE categoria (
      id_categoria INT AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(50) NOT NULL,
      descricao VARCHAR(150)
      );
      
      CREATE TABLE prato (
        id_prato INT AUTO_INCREMENT PRIMARY KEY,
        id_categoria INT NOT NULL,
        nome VARCHAR(100) NOT NULL,
        descricao VARCHAR(200),
        preco DECIMAL(10,2) NOT NULL,
        disponivel BOOLEAN NOT NULL DEFAULT TRUE,
        
        FOREIGN KEY (id_categoria)
            REFERENCES categoria(id_categoria)
        );
        
        CREATE TABLE atendimento (
          id_atendimento INT AUTO_INCREMENT PRIMARY KEY,
          id_mesa INT NOT NULL,
          id_atendente INT NOT NULL,
          data DATE NOT NULL,
          hora_inicio TIME NOT NULL,
          hora_fim TIME,
          status VARCHAR(20) NOT NULL,
          
          FOREIGN KEY (id_mesa)
              REFERENCES mesa(id_mesa),
          
          FOREIGN KEY(id_atendente)
              REFERENCES atendente(id_atendente)
          );
          
          CREATE TABLE pedido (
            id_pedido INT AUTO_INCREMENT PRIMARY KEY,
            id_atendimento INT NOT NULL,
            id_atendente INT NOT NULL,
            data_hora DATETIME NOT NULL,
            status VARCHAR(20) NOT NULL,
            observacao VARCHAR(200),
            
            FOREIGN KEY(id_atendimento)
                REFERENCES atendimento(id_atendimento),
            
            FOREIGN KEY(id_atendente)
                REFERENCES atendente(id_atendente)
            );
            
            CREATE TABLE item_pedido(
              id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
              id_pedido INT NOT NULL,
              id_prato INT NOT NULL,
              quantidade INT NOT NULL,
              observacao VARCHAR(200),
              preco_unitario DECIMAL(10,2) NOT NULL,
              
              FOREIGN KEY (id_pedido)
                  REFERENCES pedido(id_pedido),
              
              FOREIGN KEY (id_prato)
                  REFERENCES prato(id_prato)
              );
        
        INSERT INTO mesa (numero, capacidade, status)
        VALUES
        (1,4, 'Disponivel'),
        (2,2, 'Disponivel'),
        (3,6, 'Ocupada'),
        (4,4, 'Disponivel');
          
        INSERT INTO atendente (nome, telefone, cargo)
        VALUES
        ('Ana Souza', '41999990001', 'Garcom'),
        ('Carlos Lima', '41999990002', 'Garcom'),
         ('Maria Silva', '41999990003', 'Atendente');
          
          INSERT INTO categoria(nome, descricao)
          VALUES
          ('Bebidas', 'Bebidas do restaurante'),
          ('Entradas', 'Pratos servidos como entrada'),
          ('Pratos Principais', 'Pratos principais do cardapio'),
          ('Sobremesas', 'Doces e sobremesas');
          
          INSERT INTO prato
          (id_categoria, nome, descricao, preco, disponivel)
          VALUES
          (1, 'Refrigerante', 'Refrigerante lata 350 ml', 8.00, TRUE),
          (1, 'Suco Natural', 'Suco natural da fruta', 10.00, TRUE),
          (2, 'Batata Frita', 'Porcao de batata frita', 18.00, TRUE),
          (3, 'Hamburguer Artesanal', 'Hamburguer Artesanal da casa', 32.00, TRUE),
          (3, 'Lasanha a Bolonhesa', 'Lasanha com molho bolonhesa', 39.90, TRUE),
          (4, 'Pudim', 'Pudim tradicional', 12.00, TRUE);
          
          INSERT INTO atendimento
          (id_mesa, id_atendente, data, hora_inicio, hora_fim, status)
          VALUES
          (2,1, '2026-08-10', '18:30:00', '19:50:00', 'Encerrado'),
          (3,2, '2026-08-10', '20:00:00', NULL, 'Aberto'),
          (1,3, '2026-08-10', '12:00:00', '13:10:00', 'Encerrado');
         
         INSERT INTO pedido
         (id_atendimento, id_atendente, data_hora, status, observacao)
         VALUES
         (1, 1, '2026-08-10 18:40:00', 'Entregue', NULL),
         (1, 1, '2026-08-10 19:20:00', 'Entregue', 'Sobremesa'),
         (2,2, '2026-08-10 20:05:00', 'Em preparo', NULL),
         (3,3, '2026-08-10 12:10:00', 'Entregue', NULL);
         
         INSERT INTO item_pedido
         (id_pedido, id_prato, quantidade, observacao, preco_unitario)
         VALUES
         (1,4,2,'Sem cebola',32.00),
         (1,1,2, NULL, 8.00),
         (2,6,1, NULL, 12.00),
         (3,5,1,'Sem queijo',39.90),
         (3,2,1, NULL, 10.00),
         (4,4,1, NULL, 32.00),
         (4,3,1, NULL, 18.00),
         (4,2,1, NULL, 10.00);
          