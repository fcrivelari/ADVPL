#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION ESTRUTURAS()

    //ESTRUTURA DE DECIS�O/DESVIO   -   IF/ELSE OU DO/CASE
    Local nNum1 := 22
    Local nNum2 := 100

    IF(nNum = nNum2)
        MsgInfo("A variavel nNum1 � igual a nNum2")

    ELSEIF(nNum1 > nNum2)
    MsgInfo("A variavel nNum1 � maior")

    ELSEIF(nNum1 != nNum2)
        Alert("A variavel nNum1 n�o � diferente de nNum2")

    ENDIF

RETURN
        


