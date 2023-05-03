#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch

/*---------------------------------------------------------------
Faça um Programa que peça um valor e mostre na tela se o valor é
positivo ou negativo.
---------------------------------------------------------------*/

USER FUNCTION EXER02()

    Local nValor := 0

    nValor := VAL(FWINPUTBOX("Escolha um número [1 - 100]", ""))
        IF nValor < 50 
            MsgAlert("O valor digitado é inferior ao número 50.", "")
        ELSEIF nValor > 50
            MsgAlert("O valor digitado é superior ao número 50", "")
        ENDIF

RETURN
