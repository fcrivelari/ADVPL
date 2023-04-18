#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION BANCO004()

    Local aArea := SB1->(GetArea())

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))
    SB1->(DBGotop())

    BEGIN TRANSACTION

        MsgInfo("A descri��o do produto ser� alterada", "Aten��o")

    IF SB1->(DBSeek(FWXFILIAL('SB1')+ '0001'))
        RecLock('SB1', .F.)     //.F. PARA ALTERA��O E .T. PARA INCLUS�O DE NOVO DADO
    REPLACE B1_DESC WITH "PRODUTO GENERICO"

        SB1->(MsUnlock())
    
    ENDIF
        MsgAlert("Altera��o Efetuada", "Aten��o")
        //DISARMTRANSACTION()   PARA ANULAR AS ALTERA��ES DO RECLOCK
    END TRANSACTION
    RestArea(aArea)

RETURN
