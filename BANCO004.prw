#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION BANCO004()

    Local aArea := SB1->(GetArea())

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))
    SB1->(DBGotop())

    BEGIN TRANSACTION

        MsgInfo("A descrição do produto será alterada", "Atenção")

    IF SB1->(DBSeek(FWXFILIAL('SB1')+ '0001'))
        RecLock('SB1', .F.)     //.F. PARA ALTERAÇÃO E .T. PARA INCLUSÃO DE NOVO DADO
    REPLACE B1_DESC WITH "PRODUTO GENERICO"

        SB1->(MsUnlock())
    
    ENDIF
        MsgAlert("Alteração Efetuada", "Atenção")
        //DISARMTRANSACTION()   PARA ANULAR AS ALTERAÇÕES DO RECLOCK
    END TRANSACTION
    RestArea(aArea)

RETURN
