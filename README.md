<h1>Conectando Leitores</h1> 

<p align="center">
  <img src="http://img.shields.io/static/v1?label=Draw.io&message=24.6.4&color=f08705&style=for-the-badge&logo=diagramsdotnet"/>
  <img src="http://img.shields.io/static/v1?label=Workbench MySQL&message=8.0.38&color=4479a1&style=for-the-badge&logo=mysql&logoColor=f5f5f5"/>
  <img src="http://img.shields.io/static/v1?label=PostgreSQL&message=16&color=4169e1&style=for-the-badge&logo=postgresql&logoColor=f5f5f5"/>
  <img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=RED&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=STATUS&message=CONCLUIDO&color=GREEN&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=License&message=MIT&color=green&style=for-the-badge"/>
</p>

> Status do Projeto: :heavy_check_mark: (concluido) | :warning: (em desenvolvimento) | :x: (não iniciada)

### Tópicos 

:small_blue_diamond: [Entidades e Atributos](#entidades-e-atributos-file_folder)

:small_blue_diamond: [Relacionamentos](#relacionamentos-video_game)

:small_blue_diamond: [Linguagens, dependencias e libs utilizadas](#linguagens-dependencias-e-libs-utilizadas-books-gear)

:small_blue_diamond: [Desenvolvedores/Contribuintes](#desenvolvedorescontribuintes-octocat)

... 

## Entidades e Atributos :file_folder:

<p align="justify">

**1. Usuarios**
  - id (PK)
  - nome
  - email
  - senha (ATENÇÃO: Deverá ser permitido apenas um cadastro por email)
  - telefone (ATENÇÃO: atributo multivalorado)
  - endereco (logradouro, numero, municipio, estado, CEP) (ATENÇÃO: Atributo composto)
  - data_cadastro

**2. Livros**
  - id (PK)
  - titulo
  - autor (ATENÇÃO: atributo multivalorado)
  - descricao
  - genero
  - estado_conservacao
  - status (disponível/indisponível)
  - usuario_id (FK para Usuario)

**3. Trocas**
  - id (PK)
  - usuario_oferecendo_id (FK para Usuario)
  - usuario_solicitando_id (FK para Usuario)
  - data_solitacao
  - data_conclusao
  - status (proposta, aceita, rejeitada, concluída)
  - livro_oferecido_id (FK para Livro)
  - livro_solicitado_id (FK para Livro)

**4. Avaliacoes**
  - id (PK)
  - troca_id (FK para Troca)
  - usuario_avaliador_id (FK para Usuário)
  - usuario_avaliado_id (FK para Usuário)
  - nota
  - comentario
  - data_avaliacao

**5. Mensagens** 
  - id (PK)
  - troca_id (FK para Troca)
  - usuario_remetente_id (FK para Usuário)
  - usuario_destinatario_id (FK para Usuário)
  - texto
  - data_envio

</p>

## Relacionamentos :video_game:

❌ **Cadastro de Usuários:** 
  1. Permitir que os usuários se cadastrem na plataforma com informações básicas (nome, email, senha, telefone, endereço).

❌ **Gerenciamento de Livros:** 
  1. Permitir que os usuários adicionem livros à sua lista de livros disponíveis para troca, incluindo informações como título, autor, gênero, e condição do livro.
  2. Permitir que os usuários removam ou atualizem informações dos seus livros listados.

❌ **Busca de Livros:** 
  1. Implementar uma funcionalidade de busca que permita aos usuários procurar livros por título, autor, gênero ou condição.

❌ **Propostas de Troca:** 
  1. Permitir que os usuários enviem propostas de troca para outros usuários, especificando quais livros estão oferecendo e quais desejam receber.

❌ **Histórico de Trocas:**  
  1. Registrar todas as trocas realizadas para manter um histórico que pode ser visualizado pelos usuários.

❌ **Sistema de Avaliação e Reputação:**  
  1. Implementar um sistema de avaliação onde os usuários possam avaliar suas experiências de troca, contribuindo para a reputação de outros usuários.

❌ **Mensagens:** 
  1. Permitir a comunicação direta entre usuários através de mensagens para coordenar detalhes da troca

... 

## Linguagens, tecnologias, dependências e libs utilizadas :gear: :books:


- [PostgreSQL](https://www.postgresql.org/download/)
- [Git](https://git-scm.com/downloads)
- [GitHub](https://github.com/)
  


## Licença 

The [MIT License]() (MIT)

Copyright :copyright: 2024 - Conectando Leitores
