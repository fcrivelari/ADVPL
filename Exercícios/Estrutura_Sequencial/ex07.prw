#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*-----------------------------
Fa�a um Programa que converta 
metros para cent�metros.
------------------------------*/
USER FUNCTION EXER07()

    Local nMetro := ()

    nMetro := (VAL(FWINPUTBOX("Quantos metros tem seu quarto? ", "")))
    MsgInfo("Seu quarto possui " + cValToChar (nMetro) + " metros, e " +; 
    CValToChar(nMetro * 100) + "cm.", "cTitle")

RETURN
