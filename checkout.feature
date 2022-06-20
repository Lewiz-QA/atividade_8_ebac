        #language: pt

        Funcionalidade: Checkout após Compra
        Como novo cliente da EBAC-SHOP
        Quero fazer concluir meu cadastro
        Para finalizar minha compra

        Contexto:
        Dado que acessei a página de algum produto com estoque da EBAC-SHOP
        * que não possuo uma conta no site
        * que configurei o produto com um tamanho, cor e quantidade específicas
        * que cliquei no botão "Comprar"
        * que cliquei no botão "Ver Carrinho"
        * que cliquei no botão "Concluir Compra"
        * que acessei a página "Checkout"

        # Obs.: os asteriscos substituem a palavra reservada "E"

        # Critério de Aceitação 1: Deve ser cadastrado com todos os dados obrigatórios, marcado com asteriscos
        Esquema do Cenário: Checkouts válidos
        Quando eu preencher o <nome>
        * preencher o <sobrenome>
        * preencher o <pais>
        * preencher o <endereco>
        * preencher a <cidade>
        * preencher o <cep>
        * preencher o <telefone>
        * preencher o <email>
        * clicar no botão "Finalizar Compra"
        Então deve direcionar a tela de "Pedido Recebido"

        Exemplos: Dados válidos
        | nome               | sobrenome  | pais     | endereco                         | cidade                             | cep        | telefone      | email                   |
        | "João Flávio"      | "da Silva" | "Brasil" | "Rua Quatorze de Julho"          | "Ponta Grossa"                     | "84010100" | "42998017359" | "jsilva@mail.com"       |
        | "Luiz"             | "Souza"    | "Brasil" | "Avenida Visconde de Guarapuava" | "Curitiba"                         | "80010100" | "44998017358" | "lgs@mailtwo.com"       |
        | "Lewiz"            | "Jr."      | "Brasil" | "Jardim Nova Suíça"              | "Limeira"                          | "13486023" | "1134232020"  | "jsilva@mail.com.br"    |
        | "Sebastião Júnior" | "Soares"   | "Brasil" | "Rua Pouso Alegre 360"           | "Vila Bela da Santíssima Trindade" | "78245970" | "40042020"    | "teste_123@mail.com.br" |


        # Critério de Aceitação 2: Não deve permitir campo e-mail com formato inválido. Sistema deve inserir uma mensagem de erro
        Cenário: Validar endereços de e-mails
        Quando eu preencher o campo "Endereço de e-mail" com os seguintes dados:
        | email                                                                                                                                                                                                                                                                |
        | "mail"                                                                                                                                                                                                                                                               |
        | "mail.com"                                                                                                                                                                                                                                                           |
        | "Mail@dominio.com."                                                                                                                                                                                                                                           |
        | "email com espaco@teste.org"                                                                                                                                                                                                                                         |
        | "joãoflávioautopeçasmecânica@caracteresespeciais.com"                                                                                                                                                                                                                |            | "123@outlook.com"                                                                                                                                                                                                                                                    |
        | "ebac@.com"                                                                                                                                                                                                                                                          |         | "123"                                                                                                                                                                                                                                                                |
        | "mail@gmail"                                                                                                                                                                                                                                                         |
        | "mail@gmail."                                                                                                                                                                                                                                                        |
        | "endereco_de_email_com_mais_de_255_caracteres_testando_validacao_testando_validacao_testando_validacao_testando_validacao_testando_validacao_testando_validacao_testando_validacao_testando_validacao_testando_validacao_testando_validacao_testando@dominio.com.uk" |
        * preencher os demais campos obrigatórios
        * clicar no botão "Finalizar compra"
        Então deve apresentar a mensagem "E-mail de faturamento inválido"
        * não deve finalizar a compra

        # Obs.: exemplo de Cenário utilizando uma Tabela de Dados (DataTable) ao invés do Esquema do Cenário.

        # Critério de Aceitação 3: Ao tentar cadastrar com campos vazios, deve exibir mensagem de alerta.
        Esquema do Cenário: Checkouts sem dados essenciais
        Quando eu preencher o <nome>
        * preencher o <sobrenome>
        * preencher o <pais>
        * preencher o <endereco>
        * preencher a <cidade>
        * preencher o <cep>
        * preencher o <telefone>
        * preencher o <email>
        * clicar no botão "Finalizar Compra"
        Então deve apresentar a validação de campo obrigatório
        * não deve finalizar a compra

        Exemplos: Campos obrigatórios vazios
        | nome   | sobrenome | pais     | endereco                | cidade         | cep        | telefone     | email             |
        |        | "Silva"   | "Brasil" | "Rua Quatorze de Julho" | "Ponta Grossa" | "84010100" | "4298017359" | "jsilva@mail.com" |
        | "João" |           | "Brasil" | "Rua Quatorze de Julho" | "Ponta Grossa" | "84010100" | "4298017359" | "jsilva@mail.com" |
        | "João" | "Silva"   |          | "Rua Quatorze de Julho" | "Ponta Grossa" | "84010100" | "4298017359" | "jsilva@mail.com" |
        | "João" | "Silva"   | "Brasil" |                         | "Ponta Grossa" | "84010100" | "4298017359" | "jsilva@mail.com" |
        | "João" | "Silva"   | "Brasil" | "Rua Quatorze de Julho" |                | "84010100" | "4298017359" | "jsilva@mail.com" |
        | "João" | "Silva"   | "Brasil" | "Rua Quatorze de Julho" | "Ponta Grossa" |            | "4298017359" | "jsilva@mail.com" |
        | "João" | "Silva"   | "Brasil" | "Rua Quatorze de Julho" | "Ponta Grossa" | "84010100" |              | "jsilva@mail.com" |
        | "João" | "Silva"   | "Brasil" | "Rua Quatorze de Julho" | "Ponta Grossa" | "84010100" | "4298017359" |                   |
        |        |           |          |                         |                |            |              |                   |
