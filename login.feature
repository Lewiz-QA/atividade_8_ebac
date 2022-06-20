            #language: pt

            Funcionalidade: Login na plataforma
            Como cliente da EBAC-SHOP
            Quero fazer o login (autenticação) na plataforma
            Para visualizar meus pedidos

            Contexto:
            Dado que acessei a página de login da EBAC-SHOP

            # Critério de Aceitação 1: Ao inserir dados válidos deve ser direcionado para a tela de checkout
            Esquema do Cenário: Autenticações válidas
            Quando eu inserir o <usuario>
            E inserir a <senha>
            Então deve direcionar a tela de checkout
            E deve aparecer a <mensagem>

            Exemplos:
            | usuario                    | senha                            | mensagem       |
            | "teste_1@google.com"       | "1234"                           | "Olá, Fábio"   |
            | "teste_2@microsoft.com.br" | "JoãoFlávio#Peç@$Mecânica.2022!" | "Olá, Ernesto" |

            # Critério de Aceitação 2: Ao inserir um dos campos inválidos deve exibir uma mensagem de alerta “Usuário ou senha inválidos”
            Esquema do Cenário: Login com Credenciais inválidas
            Quando eu inserir o <usuario>
            E inserir a <senha>
            Então deve exibir a mensagem "Usuário ou senha inválidos"
            E não deve direcionar a tela de checkout

            Exemplos:
            | usuario                | senha          |
            | "teste_1@google.com"   | "000000"       |
            | "teste2@microsoft.com" | "0#123456@bc?" |