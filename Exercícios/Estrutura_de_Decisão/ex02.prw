#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch

/*---------------------------------------------------------------
Fa�a um Programa que pe�a um valor e mostre na tela se o valor �
positivo ou negativo.
---------------------------------------------------------------*/

USER FUNCTION EXER02()

    Local nValor := 0

    nValor := VAL(FWINPUTBOX("Escolha um n�mero [1 - 100]", ""))
        IF nValor < 50 
            MsgAlert("O valor digitado � inferior ao n�mero 50.", "")
        ELSEIF nValor > 50
            MsgAlert("O valor digitado � superior ao n�mero 50", "")
        ENDIF

RETURN
