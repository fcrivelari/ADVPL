#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION BANCO002()
    Local aArea := SB1->(GetArea())
    Local cMsg := ''

    DbSelectArea("SB1")
    SB1->(DbSetOrder(1))    //PARA INDICE CUSTOMIZADO PODE SER UTILIZADO DBSETORDERNICKNAME
    SB1->(DbGoTop())        //PARA INICIAR A VARREDURA NO INICIO DA TABELA

    cMsg := Posicione ( 'SB1',;                             //POSICIONE É UMA FUNÇÃO ALTERNATIVA PARA SELECIONAR QUALQUER CAMPO DA TABELA
                        1,;
                        FWXFilial('SB1')+ '0001',;
                        'B1_DESC')
    
    Alert("Descrição Produto: " +cMsg)

    RESTAREA(aArea)

RETURN
