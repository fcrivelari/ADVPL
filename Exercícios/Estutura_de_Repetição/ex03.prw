#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*---------------------------------------------------------------
Fa�a um programa que pe�a uma nota, entre zero e dez. Mostre uma 
mensagem caso o valor seja inv�lido e continue pedindo at� que o
usu�rio informe um valor v�lido.
---------------------------------------------------------------*/

USER FUNCTION EXER03()

    Local nNota := (0, 10)
    Local nTent := 0
    Local nChute := 0

    WHILE nChute != nNota
    nChute := VAL(FWINPUTBOX("De um nota de 0 a 10", ""))
        IF nChute > 10
            MsgAlert("A nota deve ser entre 0 e 10", "Alerta")
                nTent +=1
        ELSE
            MsgInfo("A nota digitada foi: " + CValToChar(nNota))
            nChute := .F.
            EXIT
        ENDIF
    ENDDO
RETURN
