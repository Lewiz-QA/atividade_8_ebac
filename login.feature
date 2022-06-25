            #language: pt

            Funcionalidade: Login na plataforma
            Como cliente da EBAC-SHOP
            Quero fazer o login (autenticação) na plataforma
            Para visualizar meus pedidos


            Contexto:
            Dado que acesse a página de login da EBAC-SHOP

            @Criterio_Aceitacao_01
            # Ao inserir dados válidos deve ser direcionado para a tela de checkout
            Esquema do Cenário: Autenticações válidas
            Quando eu inserir <usuario> e <senha>
            Então deve direcionar a tela "Checkout"

            Exemplos:
            | usuario                      | senha           |
            | "john@ebac.com"              | "Jôãó@Bç#2022!" |
            | "mary_jane@microsoft.com.br" | "12345678"      |
            | "george.1991@teste.org"      | "testpassword"  |

            @Criterio_Aceitacao_02
            # Ao inserir um dos campos inválidos deve exibir uma mensagem de alerta “Usuário ou senha inválidos”
            Esquema do Cenário: Validar autenticações inválidas
            Quando eu inserir <usuario> e <senha>
            Então deve exibir a mensagem "Usuário ou senha inválidos"

            Exemplos:
            | usuario                 | senha           |
            | "john@ebac.com.br"      | "Jôãó@Bç#2022!" |
            | "george.1991@teste.org" | "Testpassword"  |