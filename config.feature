            #language: pt

            Funcionalidade: Configurar produto
            Como cliente da EBAC-SHOP
            Quero configurar meu produto de acordo com meu tamanho e gosto
            E escolher a quantidade
            Para depois inserir no carrinho


            Contexto:
            Dado que acessei a página de algum produto da EBAC-SHOP
            E que meu carrinho está vazio

            @Criterio_Aceitacao_01
            # Seleções de cor, tamanho e quantidade devem ser obrigatórios
            Esquema do Cenário: Compras válidas
            Quando eu informar <tamanho>, <cor> e <quantidade>
            E clicar no botão "Comprar"
            Então deve exibir a mensagem "O produto foi adicionado ao carrinho"
            E deve atualizar o <total> de itens exibido no carrinho do canto superior direito

            Exemplos:
            | tamanho | cor      | quantidade | total |
            | "XS"    | "Orange" | "1"        | "1"   |
            | "L"     | "Red"    | "9"        | "10"  |
            | "M"     | "Blue"   | "10"       | "20"  |

            Esquema do Cenário: Validar dados obrigatórios
            Quando eu informar <tamanho>, <cor> e <quantidade>
            E clicar no botão "Comprar"
            Então deve exibir a <mensagem>

            Exemplos:
            | tamanho | cor    | quantidade | mensagem               |
            |         | "Red"  | "5"        | "Informe o Tamanho"    |
            | "XL"    |        | "2"        | "Informe a Cor"        |
            | "S"     | "Blue" |            | "Informe a Quantidade" |

            @Criterio_Aceitacao_02
            # Deve permitir apenas 10 produtos por venda
            Esquema do Cenário: Validar quantidades inválidas
            Quando eu informar o tamanho, a cor e a <quantidade>
            E clicar no botão "Comprar"
            Então deve apresentar a <mensagem>

            Exemplos:
            | quantidade | mensagem                               |
            | "0"        | "O valor deve ser maior ou igual a 1"  |
            | "10,01"    | "Digite um valor inteiro válido"       |
            | "11"       | "O valor deve ser menor ou igual a 10" |

            @Criterio_Aceitacao_03
            # Quando eu clicar no botão “limpar” deve voltar ao estado original
            Cenário: Reverter para o estado original do produto
            Quando eu informar um tamanho, cor e quantidade diferentes do padrão
            E clicar no botão "Limpar"
            Então espero que o tamanho, a cor e a quantidade voltem aos seus valores iniciais
