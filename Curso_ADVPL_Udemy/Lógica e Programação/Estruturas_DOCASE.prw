#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION DOCASE()

    Local cData := "20/12/2017"

    DO CASE

    CASE cData == "20/12/2017"
    Alert("NÃo é Natal" + cData)

    CASE cDate == "25/12/2017"
    Alert("Não Natal!!")

    OTHERWISE
    MsgAlert("NÃ£o sei qual dia é hoje!")

    ENDCASE

RETURN
