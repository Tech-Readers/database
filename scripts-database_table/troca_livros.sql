create database troca_livros;

use troca_livros;

CREATE TABLE Usuario (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Livro (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    genero VARCHAR(100),
    condicao VARCHAR(50),
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

CREATE TABLE Troca (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    usuario_oferecendo_id INT NOT NULL,
    usuario_recebendo_id INT NOT NULL,
    data_proposta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'proposta',
    FOREIGN KEY (usuario_oferecendo_id) REFERENCES Usuario(id),
    FOREIGN KEY (usuario_recebendo_id) REFERENCES Usuario(id)
);

CREATE TABLE Livro_Troca (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    troca_id INT NOT NULL,
    livro_id INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    FOREIGN KEY (troca_id) REFERENCES Troca(id),
    FOREIGN KEY (livro_id) REFERENCES Livro(id)
);

CREATE TABLE Avaliacao (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    troca_id INT NOT NULL,
    usuario_id INT NOT NULL,
    nota INT CHECK (nota >= 1 AND nota <= 5),
    comentario TEXT,
    FOREIGN KEY (troca_id) REFERENCES Troca(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

CREATE TABLE Mensagem (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    troca_id INT NOT NULL,
    usuario_envia_id INT NOT NULL,
    usuario_recebe_id INT NOT NULL,
    texto TEXT NOT NULL,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (troca_id) REFERENCES Troca(id),
    FOREIGN KEY (usuario_envia_id) REFERENCES Usuario(id),
    FOREIGN KEY (usuario_recebe_id) REFERENCES Usuario(id)
);
