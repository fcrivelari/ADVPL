#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION BANCO001()

    Local aArea := SB1->(GetArea())     // GETAREA PEGA A AREA DE REFERENCIA, NO CASO, A TABELA SB1990
    //Local cMsg := ""

    DbSelectArea("SB1")     //OPEN TABELA
    SB1->(DbSetOrder(1))      //REFERENCIA AO INDICE DA TABELA
    SB1->(DbGoTop())


    //POSICIONA O PRODUTO DE CÓDIGO 0001
    IF SB1->(DbSeek(FWXFILIAL("SB1")+ "0001"))
        Alert(SB1->B1_DESC)

    ENDIF

    RESTAREA(aArea)

RETURN
