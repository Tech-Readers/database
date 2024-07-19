-- Tabela Enderecos
CREATE TABLE Enderecos (
    id SERIAL PRIMARY KEY,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(45),
    bairro VARCHAR(255),
    complemento VARCHAR(45),
    cep CHAR(8) NOT NULL,
    municipio VARCHAR(255) NOT NULL,
    uf CHAR(2) NOT NULL
);

-- Tabela Usuarios
CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(45) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES Enderecos(id)
);

-- Tabela Telefones
CREATE TABLE Telefones (
    id SERIAL PRIMARY KEY,
    contato VARCHAR(45) NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabela Anuncios
CREATE TABLE Anuncios (
    id SERIAL PRIMARY KEY,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_conclusao TIMESTAMP,
    titulo VARCHAR(255) NOT NULL,
    titulo_livro_oferecido VARCHAR(255) NOT NULL,
    autor_livro_oferecido VARCHAR(255) NOT NULL,
    genero_livro_oferecido VARCHAR(100),
    titulo_livro_solicitado VARCHAR(255) NOT NULL,
    autor_livro_solicitado VARCHAR(255) NOT NULL,
    genero_livro_oferecido VARCHAR(100),
    descricao LONGTEXT,
    anunciante_id INT NOT NULL,
    FOREIGN KEY (anunciante_id) REFERENCES Usuarios(id)
);

-- Tabela Mensagens
CREATE TABLE Mensagens (
    id SERIAL PRIMARY KEY,
    texto LONGTEXT NOT NULL,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lido BOOLEAN DEFAULT FALSE,
    usuario_remetente_id INT NOT NULL,
    usuario_destinatario_id INT NOT NULL,
    anuncio_id INT NOT NULL,
    FOREIGN KEY (usuario_remetente_id) REFERENCES Usuarios(id),
    FOREIGN KEY (usuario_destinatario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (anuncio_id) REFERENCES Anuncios(id)
);

-- Tabela Avaliacoes
CREATE TABLE Avaliacoes (
    id SERIAL PRIMARY KEY,
    nota INT NOT NULL,
    comentario LONGTEXT,
    data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    qtd_like INT DEFAULT 0,
    usuario_avaliador_id INT NOT NULL,
    anuncio_id INT NOT NULL,
    FOREIGN KEY (usuario_avaliador_id) REFERENCES Usuarios(id),
    FOREIGN KEY (anuncio_id) REFERENCES Anuncios(id)
);
