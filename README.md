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
  - **OBS:**
    - email com a cláusula UNIQUE: Restrição que garante que todos os valores na coluna email sejam únicos em toda a tabela.
    - data_cadastro com cláusula DEFAULT CURRENT_TIMESTAMP: Define que por padrão, será preenchida com a data e hora atuais no momento
    em que um novo registro é inserido na tabela.

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
  - disponibiliza_contato_telefone
  - codigo_rastreio (para correios)
  - **OBS:**
    - Campo disponibiliza_contato_telefone:
        1. Foi adicionado corretamente na tabela Trocas com o tipo TINYINT para representar um valor booleano.
        2. Para garantir que o valor padrão seja 0 (false), foi configurado no campo Default.
    - Os checks de validação chk_status_troca, chk_metodo_troca e chk_presencial foram adicionados para assegurar a integridade dos dados, evitando dados incorretos ou     
    inconsistentes:
        1. chk_presencial CHECK: garantir que se o método de entrega for presencial, os campos local_encontro, data_encontro e horario_encontro não sejam nulos.
        Se o método de entrega for correios, esses campos podem ser nulos.
        2. chk_status_troca: A condição especifica que o valor da coluna status_troca deve ser um dos seguintes valores:'proposta', 'aceita', 'rejeitada', 'pendente', 'em 
        andamento', 'concluída'.
        3. chk_metodo_troca: A condição especifica que o valor da coluna metodo_troca deve ser um dos seguintes valores: 'presencial', 'correios'.
    - data_solitacao e data_conclusao com cláusula DEFAULT CURRENT_TIMESTAMP: Define que por padrão, será preenchida com a data e hora atuais no momento
    em que um novo registro é inserido na tabela.

**4. Avaliacoes** :warning:
  - id (PK)
  - troca_id (FK para Troca)
  - usuario_avaliador_id (FK para Usuário)
  - usuario_avaliado_id (FK para Usuário)
  - nota
  - comentario
  - data_avaliacao
  - **OBS:**
    - data_avaliacao com cláusula DEFAULT CURRENT_TIMESTAMP: Define que por padrão, será preenchida com a data e hora atuais no momento
    em que um novo registro é inserido na tabela.

**5. Notificacoes** :warning:
  - id (PK)
  - usuario_remetente_id (FK para Usuário)
  - usuario_destinatario_id (FK para Usuário)
  - troca_id (FK para Troca)
  - texto
  - data_envio
  - status (não lida, lida)
  - **OBS:**
    - data_envio com cláusula DEFAULT CURRENT_TIMESTAMP: Define que por padrão, será preenchida com a data e hora atuais no momento
    em que um novo registro é inserido na tabela.

</p>

## Relacionamentos :handshake:

**1. Usuarios e Enderecos:** :warning:
  - Muitos-para-Um (N:1).
  - Um usuário (Usuarios) pode ter um endereço (Enderecos).
  - Cada endereço pode ser associado a muitos usuários.
  - Chave Estrangeira: endereco_id em Usuarios refere-se a id em Enderecos.

**2. Usuarios e Telefones:** :warning:
 - Um-para-Muitos (1:N).
 - Um usuário (Usuarios) pode ter vários telefones (Telefones).
 - Cada telefone está associado a um único usuário.
 - Chave Estrangeira: usuario_id em Telefones refere-se a id em Usuarios.

**3. Usuarios e Livros:** :warning:
  - Um-para-Muitos (1:N).
  - Um usuário (Usuarios) pode ter vários livros (Livros).
  - Cada livro pertence a um único usuário.
  - Chave Estrangeira: usuario_id em Livros refere-se a id em Usuarios.

**4. Usuarios e Trocas:** :warning:
  - Um-para-Muitos (1:N) (duas vezes).
  - Um usuário (Usuarios) pode oferecer várias trocas (Trocas) e solicitar várias trocas.
  - Cada troca está associada a um único usuário que oferece (usuario_oferecendo_id) e um único usuário que solicita (usuario_solicitador_id).
  - Chave Estrangeira:
    - usuario_oferecendo_id em Trocas refere-se a id em Usuarios.
    - usuario_solicitador_id em Trocas refere-se a id em Usuarios.

**5. Usuarios e Notificacoes:** :warning:
  - Relacionamento: Um-para-Muitos (1:N) (duas vezes).
  - Um usuário (Usuarios) pode enviar várias notificações (Notificacoes) e receber várias notificações.
  - Cada notificação está associada a um único usuário que envia (usuario_remetente_id) e um único usuário que recebe (usuario_destinatario_id).
  - Chave Estrangeira:
    - usuario_remetente_id em Notificacoes refere-se a id em Usuarios.
    - usuario_destinatario_id em Notificacoes refere-se a id em Usuarios.

**6. Usuarios e Avaliacoes:** :warning:
  - Um-para-Muitos (1:N) (duas vezes).
  - Um usuário (Usuarios) pode avaliar vários outros usuários (Avaliacoes) e pode ser avaliado por vários outros usuários.
  - Cada avaliação está associada a um único usuário que avalia (usuario_avaliador_id) e um único usuário que é avaliado (usuario_avaliado_id).
  - Chave Estrangeira:
    - usuario_avaliador_id em Avaliacoes refere-se a id em Usuarios.
    - usuario_avaliado_id em Avaliacoes refere-se a id em Usuarios.
 
**7. Livros e Trocas:** :warning:
  - Relacionamento: Um-para-Muitos (1:N) (duas vezes).
  - Um livro (Livros) pode ser oferecido em várias trocas (Trocas) e solicitado em várias trocas.
  - Cada troca está associada a um único livro oferecido (livro_oferecido_id) e um único livro solicitado (livro_solicitado_id).
  - Chave Estrangeira:
    - livro_oferecido_id em Trocas refere-se a id em Livros.
    - livro_solicitado_id em Trocas refere-se a id em Livros.

**8. Trocas e Notificacoes:** :warning:
  - Um-para-Muitos (1:N).
  - Uma troca (Trocas) pode ter várias notificações (Notificacoes).
  - Cada notificação está associada a uma única troca.
  - Chave Estrangeira: troca_id em Notificacoes refere-se a id em Trocas.

**9. Trocas e Avaliacoes:** :warning:
  - zero-para-Muitos (0:N).
  - Uma troca (Trocas) pode ter zero ou várias avaliações (Avaliacoes).
  - Cada avaliação está associada a uma única troca.
  - Chave Estrangeira: troca_id em Avaliacoes refere-se a id em Trocas.
    
... 

## Licença 

The [MIT License]() (MIT)

Copyright :copyright: 2024 - Conectando Leitores
