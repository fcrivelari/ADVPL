#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*-----------------------------
Fa�a um Programa que pe�a 
dois n�meros e imprima a soma.
------------------------------*/
USER FUNCTION EXER05()

    Local nNum1 := ()
    Local nNUm2 := ()

    nNum1 := VAL(FWINPUTBOX("Digite um n�mero: " + CValToChar(nNum1), ""))
    nNum2 := VAL(FWINPUTBOX("Digite um n�mero: " + CValToChar(nNum2), ""))

    MsgAlert(("A soma dos valores � : " + cValtoChar(nNum1 + nNum2)), "Soma dos Valores")

RETURN
