#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*-----------------------------
Faça um Programa que peça 
dois números e imprima a soma.
------------------------------*/
USER FUNCTION EXER05()

    Local nNum1 := ()
    Local nNUm2 := ()

    nNum1 := VAL(FWINPUTBOX("Digite um número: " + CValToChar(nNum1), ""))
    nNum2 := VAL(FWINPUTBOX("Digite um número: " + CValToChar(nNum2), ""))

    MsgAlert(("A soma dos valores é : " + cValtoChar(nNum1 + nNum2)), "Soma dos Valores")

RETURN
