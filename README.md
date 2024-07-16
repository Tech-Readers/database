<h1>Conectando Leitores</h1> 

<p align="center">
  <img src="http://img.shields.io/static/v1?label=Draw.io&message=24.6.4&color=f08705&style=for-the-badge&logo=diagramsdotnet"/>
  <img src="http://img.shields.io/static/v1?label=Workbench MySQL&message=8.0.38&color=4479a1&style=for-the-badge&logo=mysql&logoColor=f5f5f5"/>
  <img src="http://img.shields.io/static/v1?label=PostgreSQL&message=16&color=4169e1&style=for-the-badge&logo=postgresql&logoColor=f5f5f5"/>
  <img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=yellow&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=License&message=MIT&color=green&style=for-the-badge"/>
</p>

> Status do Projeto: :heavy_check_mark: (concluido) | :warning: (em desenvolvimento) | :x: (não iniciada)

### Tópicos 

:small_blue_diamond: [Entidades e Atributos](#entidades-e-atributos-file_folder) :warning:

:small_blue_diamond: [Relacionamentos](#relacionamentos-handshake) :warning:

:small_blue_diamond: [Modelo Lógico - DER](modelo_logico_der) :warning:

:small_blue_diamond: [Modelo Físico - Scrips Create Database Table](scripts_database_table) :x:

... 

## Entidades e Atributos :file_folder:

<p align="justify">

**1. Usuarios** :warning:
  - id (PK)
  - nome
  - email
  - senha (ATENÇÃO: Deverá ser permitido apenas um cadastro por email)
  - telefone (ATENÇÃO: atributo multivalorado)
  - endereco (logradouro, numero, municipio, estado, CEP) (ATENÇÃO: Atributo composto)
  - data_cadastro

**2. Livros** :warning:
  - id (PK)
  - titulo
  - autor (ATENÇÃO: atributo multivalorado)
  - descricao
  - genero
  - estado_conservacao
  - status (disponível/indisponível)
  - usuario_id (FK para Usuario)

**3. Trocas** :warning:
  - id (PK)
  - usuario_oferecendo_id (FK para Usuario)
  - usuario_solicitando_id (FK para Usuario)
  - data_solitacao
  - data_conclusao
  - status_troca (proposta, aceita, rejeitada, pendente, em andamento, concluída)
  - livro_oferecido_id (FK para Livro)
  - livro_solicitado_id (FK para Livro)
  - metodo_troca (presencial ou correios)
  - local_encontro (para presencial)
  - data_encontro (para presencial)
  - horario_encontro (para presencial)
  - codigo_rastreio (para correios)

**4. Avaliacoes** :warning:
  - id (PK)
  - troca_id (FK para Troca)
  - usuario_avaliador_id (FK para Usuário)
  - usuario_avaliado_id (FK para Usuário)
  - nota
  - comentario
  - data_avaliacao

**5. Notificacoes** :warning:
  - id (PK)
  - usuario_remetente_id (FK para Usuário)
  - usuario_destinatario_id (FK para Usuário)
  - texto
  - data_envio
  - status (não lida, lida) 

</p>

## Relacionamentos :handshake:

**1. Usuarios:** :warning:
  - Tem um endereço (relação muitos-para-um com Enderecos)
  - Pode fazer muitas trocas (relação um-para-muitos com Trocas)
  - Pode fazer muitas avaliações (relação um-para-muitos com Avaliacoes)
  - Pode enviar e receber muitas mensagens (relação um-para-muitos com Mensagens)

**2. Enderecos:** :warning:
  - Pode ser associado a muitos usuários (relação um-para-muitos com Usuarios)

**3. Usuarios e Enderecos:** :warning:
  - A chave estrangeira endereco_id na tabela Usuarios está correta. Assim, um usuário pode ter um endereço, e o mesmo endereço pode ser compartilhado por vários usuários.

**4. Livros:** :warning:
  - Pertencem a um usuário (relação muitos-para-um com Usuarios)
  - Podem ser oferecidos em muitas trocas (relação um-para-muitos com Trocas)

**5. Trocas:** :warning:
  - Envolvem dois usuários (relação muitos-para-um com Usuarios)
  - Envolvem dois livros (relação muitos-para-um com Livros)
  - Podem ter muitas avaliações (relação um-para-muitos com Avaliacoes)

**6. Usuarios e Trocas:** :warning:
   - A tabela Trocas referencia tanto usuario_oferecendo_id quanto usuario_solicitando_id, representando os dois usuários envolvidos na troca.

**7. Trocas e Livros:** :warning:
   - A tabela Trocas referencia livro_oferecido_id e livro_solicitado_id, representando os livros envolvidos na troca.

**8. Avaliacoes:** :warning:
  - Referenciam uma troca (relação muitos-para-um com Trocas)
  - Referenciam um usuário (relação muitos-para-um com Usuarios)

**9. Trocas e Avaliacoes:** :warning:
  - A tabela Avaliacoes possui referências troca_id e usuario_id, permitindo que cada avaliação seja associada a uma troca específica e ao usuário que fez a avaliação.

**10. Notificacoes:** :warning:
  - A tabela Notificacoes referencia usuario_remetente_id e usuario_destinatario_id, representando os usuários envolvidos.
  - Referenciam um usuário remetente (relação muitos-para-um com Usuarios)
  - Referenciam um usuário destinatário (relação muitos-para-um com Usuarios)
  - Uma troca pode gerar várias Notificações.

... 

## Licença 

The [MIT License]() (MIT)

Copyright :copyright: 2024 - Conectando Leitores
