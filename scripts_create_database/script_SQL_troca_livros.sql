-- Habilitar a extensão pgcrypto para usar UUIDs
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Tabela Enderecos
CREATE TABLE Enderecos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(45) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    complemento VARCHAR(255),
    cep CHAR(8) NOT NULL,
    municipio VARCHAR(255) NOT NULL,
    uf CHAR(2) NOT NULL
);

-- Tabela Usuarios
CREATE TABLE Usuarios (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    endereco_id UUID NOT NULL,
    image VARCHAR(500),
    FOREIGN KEY (endereco_id) REFERENCES Enderecos(id)
);

-- Tabela Telefones
CREATE TABLE Telefones (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    contato VARCHAR(45) NOT NULL,
    usuario_id UUID NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabela Anuncios
CREATE TABLE Anuncios (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_conclusao TIMESTAMP,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    titulo VARCHAR(255) NOT NULL,
    titulo_livro_oferecido VARCHAR(255) NOT NULL,
    autor_livro_oferecido VARCHAR(255) NOT NULL,
    genero_livro_oferecido VARCHAR(100) NOT NULL,
    titulo_livro_solicitado VARCHAR(255) NOT NULL,
    autor_livro_solicitado VARCHAR(255) NOT NULL,
    genero_livro_solicidado VARCHAR(100) NOT NULL,
    descricao TEXT,
    anunciante_id UUID NOT NULL,
    image VARCHAR(500),
    FOREIGN KEY (anunciante_id) REFERENCES Usuarios(id)
);

-- Tabela Mensagens
CREATE TABLE Mensagens (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    texto TEXT NOT NULL,
    data_envio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    lido BOOLEAN NOT NULL DEFAULT FALSE,
    usuario_remetente_id UUID NOT NULL,
    usuario_destinatario_id UUID NOT NULL,
    anuncio_id UUID NOT NULL,
    FOREIGN KEY (usuario_remetente_id) REFERENCES Usuarios(id),
    FOREIGN KEY (usuario_destinatario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (anuncio_id) REFERENCES Anuncios(id)
);

-- Tabela Avaliacoes
CREATE TABLE Avaliacoes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nota INTEGER NOT NULL,
    comentario TEXT,
    data_avaliacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    qtd_like INTEGER DEFAULT 0,
    usuario_avaliador_id UUID NOT NULL,
    anuncio_id UUID NOT NULL,
    FOREIGN KEY (usuario_avaliador_id) REFERENCES Usuarios(id),
    FOREIGN KEY (anuncio_id) REFERENCES Anuncios(id)
);
