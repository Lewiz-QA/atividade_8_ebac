            #language: pt

            Funcionalidade: Configurar produto
            Como cliente da EBAC-SHOP
            Quero configurar meu produto de acordo com meu tamanho e gosto
            E escolher a quantidade
            Para depois inserir no carrinho

            Contexto:
            Dado que acessei a página do produto "Augusta Pullover Jacket" da EBAC-SHOP
            E que meu carrinho está vazio

            # Critério de Aceitação 1: Seleções de cor, tamanho e quantidade devem ser obrigatórios
            Esquema do Cenário: Compras sem dados essenciais
            Quando eu selecionar o <tamanho>
            E selecionar a <cor>
            E preencher a <quantidade>
            E clicar no botão "Comprar"
            Então deve apresentar a <mensagem>
            E não deve adicionar o produto ao carrinho

            Exemplos:
            | tamanho | cor      | quantidade | mensagem                                                                |
            |         | "Orange" | "1"        | "Selecione uma das opções do produto antes de adicioná-lo ao carrinho." |
            | "XS"    |          | "2"        | "Selecione uma das opções do produto antes de adicioná-lo ao carrinho." |
            |         |          |            | "Selecione uma das opções do produto antes de adicioná-lo ao carrinho." |
            | "M"     | "Blue"   |            | "Informe a quantidade."                                                 |

            # Obs.: o quarto exemplo não está funcionando no site, adicionando o produto ao carrinho com a quantidade padrão.

            # Critério de Aceitação 2: Deve permitir apenas 10 produtos por venda
            Esquema do Cenário: Compras com quantidade inválida
            Quando eu selecionar o tamanho "M"
            E selecionar a cor "Blue"
            E preencher a <quantidade>
            E clicar no botão "Comprar"
            Então deve apresentar a <mensagem>
            E não deve adicionar o produto ao carrinho

            Exemplos:
            | quantidade | mensagem                                                           |
            | "0"        | "O valor deve ser maior ou igual a 1."                             |
            | "0,99"     | "O valor deve ser maior ou igual a 1."                             |
            | "10,01"    | "O valor deve ser menor ou igual a 10."                            |
            | "11"       | "O valor deve ser menor ou igual a 10."                            |
            | "1,50"     | "Digite um valor válido. Os dois valores mais próximos são 1 e 2." |


            # Critério de Aceitação 3: Quando eu clicar no botão “limpar” deve voltar ao estado original
            Cenário: Resetar configurações padrão do produto
            Quando seleciono o tamanho "XS"
            E seleciono a cor "Blue"
            E clico no botão "Limpar"
            Então espero que nenhuma opção esteja selecionada no tamanho
            E espero que nenhuma opção esteja selecionada na cor
            E espero que o botão "Comprar" desabilite


            # Compras bem sucedidas
            Esquema do Cenário: Compras válidas
            Quando eu selecionar o <tamanho>
            E selecionar a <cor>
            E preencher a <quantidade>
            E clicar no botão "Comprar"
            Então deve adicionar o produto ao carrinho
            E deve mostrar no cabeçalho o <total> de produtos presente no carrinho

            Exemplos:
            | tamanho | cor      | quantidade | total |
            | "XS"    | "Blue"   | "1"        | "1"   |
            | "S"     | "Red"    | "9"        | "10"  |
            | "L"     | "Orange" | "10"       | "20"  |
            | "L"     | "Orange" | "10"       | "20"  |

            #A última linha foi repetida para testar se o carrinho iria manter o máximo de 10 produtos do mesmo tipo por vez, seguindo o comportamento atual do sistema