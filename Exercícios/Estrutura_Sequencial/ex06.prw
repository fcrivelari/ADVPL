#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*--------------------------------
Faça um Programa que peça as 4 
notas bimestrais e mostre a média
---------------------------------*/
USER FUNCTION EXER06()

    Local nBim1 := ()
    Local nBim2 := ()
    Local nBim3 := ()
    Local nBim4 := ()


    nBim1 := VAL(FWINPUTBOX("Digite um número: " + CValToChar(nBim1), ""))
    nBim2 := VAL(FWINPUTBOX("Digite um número: " + CValToChar(nBim2), ""))
    nBim3 := VAL(FWINPUTBOX("Digite um número: " + CValToChar(nBim3), ""))
    nBim4 := VAL(FWINPUTBOX("Digite um número: " + CValToChar(nBim4), ""))

    MsgAlert(("A médias das notas informadas é de : " + cValtoChar((nBim1 + nBim2 + nBim3 + nBIm4) / 4)), "Soma dos Valores")

RETURN
