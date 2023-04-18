#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION ESTRREP()

    //------UTILIZANDO FOR NEXT------
/*
    Local nCount
    Local nNUm := 0

    FOR nCount := 0 TO 10 STEP 2 

    nNum += nCount

    NEXT
    Alert("Valor: "+ CValToChar(nNum))  */


    //------UTILIZANDO WHILE ENDDO------

/*  Local nNum1 := 0
    Local nNum2 := 10

    WHILE nNum1 < nNum2
    nNum1++

    ENDDO
    Alert(nNum1 + nNum2)    */
    

    //------UTILIZANDO WHILE(COMPOSTO) ENDDO------

/*    Local nNum1 := 1
    Local cNome := "RCTI"

    WHILE nNum1 != 10 .AND. cNome != "PROTHEUS"
        nNum1++
            IF nNum1 == 5
            cNome := "PROTHEUS"
            ENDIF
    ENDDO
        Alert("Numero: "+ CValToChar(nNUm1))
        Alert("Nome: "+ CValToChar(cNome))
*/
RETURN 
