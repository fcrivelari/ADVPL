#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*--------------------------------
Fa�a um Programa que pe�a as 4 
notas bimestrais e mostre a m�dia
---------------------------------*/
USER FUNCTION EXER06()

    Local nBim1 := ()
    Local nBim2 := ()
    Local nBim3 := ()
    Local nBim4 := ()


    nBim1 := VAL(FWINPUTBOX("Digite um n�mero: " + CValToChar(nBim1), ""))
    nBim2 := VAL(FWINPUTBOX("Digite um n�mero: " + CValToChar(nBim2), ""))
    nBim3 := VAL(FWINPUTBOX("Digite um n�mero: " + CValToChar(nBim3), ""))
    nBim4 := VAL(FWINPUTBOX("Digite um n�mero: " + CValToChar(nBim4), ""))

    MsgAlert(("A m�dias das notas informadas � de : " + cValtoChar((nBim1 + nBim2 + nBim3 + nBIm4) / 4)), "Soma dos Valores")

RETURN
