#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'
#INCLUDE 'TopConn.ch'

USER FUNCTION BANCO003()

    Local aArea := SB1->(GetArea())
    Local cQuery := ""
    Local aDados := {}
    Local nCount

    cQuery := " SELECT "
    cQuery += " B1_COD AS CODIGO,"
    cQuery += " B1_DESC AS DESCRICAO"
    cQuery += " FROM SB1990"

        //EXECUTANDO A CONSULTA ACIMA
        TCQuery cQuery New Alias "TMP"

        WHILE ! TMP->(EOF())        //EOF = END O FILE(FINAL DE ARQUIVO)
            AADD(aDados, TMP->CODIGO)
            AADD(aDados, TMP->DESCRICAO)
            TMP->(DBSkip())

        ENDDO

            Alert(LEN(aDados))

                FOR nCount := 1 TO LEN (aDados)
                    MsgInfo(aDados[nCount])
                NEXT nCount

                TMP->(DBCloseArea())
                RestArea(aArea)

RETURN
