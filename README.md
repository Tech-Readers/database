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

:small_blue_diamond: [Modelo Lógico - DER](modelo_logico_der)

:small_blue_diamond: [Modelo Físico - Scrips create ](script_database_table)

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

**1. Usuarios:**
  - Tem um endereço (relação muitos-para-um com Enderecos)
  - Pode fazer muitas trocas (relação um-para-muitos com Trocas)
  - Pode fazer muitas avaliações (relação um-para-muitos com Avaliacoes)
  - Pode enviar e receber muitas mensagens (relação um-para-muitos com Mensagens)

**2. Enderecos:**
  - Pode ser associado a muitos usuários (relação um-para-muitos com Usuarios)

**3. Usuarios e Enderecos:**
  - A chave estrangeira endereco_id na tabela Usuarios está correta. Assim, um usuário pode ter um endereço, e o mesmo endereço pode ser compartilhado por vários usuários.

**4. Livros:**
  - Pertencem a um usuário (relação muitos-para-um com Usuarios)
  - Podem ser oferecidos em muitas trocas (relação um-para-muitos com Trocas)

**5. Trocas:**
  - Envolvem dois usuários (relação muitos-para-um com Usuarios)
  - Envolvem dois livros (relação muitos-para-um com Livros)
  - Podem ter muitas avaliações (relação um-para-muitos com Avaliacoes)

**6. Usuarios e Trocas:**
   - A tabela Trocas referencia tanto usuario_oferecendo_id quanto usuario_solicitando_id, representando os dois usuários envolvidos na troca.

**7. Trocas e Livros:**
   - A tabela Trocas referencia livro_oferecido_id e livro_solicitado_id, representando os livros envolvidos na troca.

**8. Avaliacoes:**
  - Referenciam uma troca (relação muitos-para-um com Trocas)
  - Referenciam um usuário (relação muitos-para-um com Usuarios)

**9. Trocas e Avaliacoes:**
  - A tabela Avaliacoes possui referências troca_id e usuario_id, permitindo que cada avaliação seja associada a uma troca específica e ao usuário que fez a avaliação.

**10. Mensagens:**
  - Referenciam uma troca (relação muitos-para-um com Trocas)
  - Referenciam um usuário remetente (relação muitos-para-um com Usuarios)
  - Referenciam um usuário destinatário (relação muitos-para-um com Usuarios)

**11. Usuarios e Mensagens:**
  - A tabela Mensagens referencia usuario_remetente_id e usuario_destinatario_id, representando os usuários envolvidos na comunicação.

... 

## Linguagens, tecnologias, dependências e libs utilizadas :gear: :books:


- [PostgreSQL](https://www.postgresql.org/download/)
- [Git](https://git-scm.com/downloads)
- [GitHub](https://github.com/)
  


## Licença 

The [MIT License]() (MIT)

Copyright :copyright: 2024 - Conectando Leitores
