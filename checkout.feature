            #language: pt

            Funcionalidade: Checkout após Compra
            Como novo cliente da EBAC-SHOP
            Quero fazer concluir meu cadastro
            Para finalizar minha compra


            Contexto:
            Dado que não possuo uma conta no site da EBAC-SHOP
            E que cliquei para "Concluir a Compra" dos itens adicionados no carrinho
            E que acessei a página "Checkout"

            @Criterio_Aceitacao_01
            # Deve ser cadastrado com todos os dados obrigatórios, marcado com asteriscos
            Esquema do Cenário: Checkouts válidos
            Quando eu informar o <nome> e o <sobrenome>
            E informar o <pais>, o <endereco>, a <cidade> e o <cep>
            E informar o <telefone> e o <email>
            E clicar no botão "Finalizar Compra"
            Então deve direcionar para a tela de "Pedido Recebido" 

            Exemplos:
            | nome          | sobrenome  | pais     | endereco                | cidade                             | cep        | telefone      | email                  |
            | "João Flávio" | "da Silva" | "Brasil" | "Rua Quatorze de Julho" | "Ponta Grossa"                     | "84010100" | "42998017359" | "jsilva@mail.com"      |
            | "Lewiz"       | "Jr."      | "Brasil" | "Jardim Nova Suíça"     | "Limeira"                          | "13486023" | "1134232020"  | "lewiz_jr@mail.com.br" |
            | "Sebastião"   | "Júnior"   | "Brasil" | "Rua Pouso Alegre 360"  | "Vila Bela da Santíssima Trindade" | "78245970" | "40042020"    | "teste123@mail.org"    |

            @Criterio_Aceitacao_02
            # Não deve permitir campo e-mail com formato inválido. Sistema deve inserir uma mensagem de erro
            Esquema do Cenário: Validar e-mails inválidos
            Quando eu informar o <email>
            E clicar no botão "Finalizar compra"
            Então deve apresentar a mensagem "E-mail inválido"

            Exemplos:
            | email                                 |
            | "teste"                               |
            | "teste@"                              |
            | "teste@.com"                          |
            | "teste@gmail"                         |
            | "teste@gmail.com."                    |
            | "email com espaco@teste.org"          |
            | "teste@joão-flávio-peças-mecânica.uk" |
            | "123@outlook.com"                     |

            @Criterio_Aceitacao_03
            # Ao tentar cadastrar com campos vazios, deve exibir mensagem de alerta.
            Esquema do Cenário: Validar dados obrigatórios
            Quando eu informar o <nome> e o <sobrenome>
            E informar o <pais>, o <endereco>, a <cidade> e o <cep>
            E informar o <telefone> e o <email>
            E clicar no botão "Finalizar Compra"
            Então deve apresentar a <mensagem>

            Exemplos:
            | nome   | sobrenome | pais     | endereco                | cidade         | cep        | telefone     | email             | mensagem              |
            |        | "Silva"   | "Brasil" | "Rua Quatorze de Julho" | "Ponta Grossa" | "84010100" | "4298017359" | "jsilva@mail.com" | "Informe o Nome"      |
            | "João" |           | "Brasil" | "Rua Quatorze de Julho" | "Ponta Grossa" | "84010100" | "4298017359" | "jsilva@mail.com" | "Informe o Sobrenome" |
            | "João" | "Silva"   |          | "Rua Quatorze de Julho" | "Ponta Grossa" | "84010100" | "4298017359" | "jsilva@mail.com" | "Informe o País"      |
            | "João" | "Silva"   | "Brasil" |                         | "Ponta Grossa" | "84010100" | "4298017359" | "jsilva@mail.com" | "Informe o Endereço"  |
            | "João" | "Silva"   | "Brasil" | "Rua Quatorze de Julho" |                | "84010100" | "4298017359" | "jsilva@mail.com" | "Informe a Cidade"    |
            | "João" | "Silva"   | "Brasil" | "Rua Quatorze de Julho" | "Ponta Grossa" |            | "4298017359" | "jsilva@mail.com" | "Informe o CEP"       |
            | "João" | "Silva"   | "Brasil" | "Rua Quatorze de Julho" | "Ponta Grossa" | "84010100" |              | "jsilva@mail.com" | "Informe o Telefone"  |
            | "João" | "Silva"   | "Brasil" | "Rua Quatorze de Julho" | "Ponta Grossa" | "84010100" | "4298017359" |                   | "Informe o E-mail"    |
