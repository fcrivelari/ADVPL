#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION DOCASE()

    Local cData := "20/12/2017"

    DO CASE

    CASE cData == "20/12/2017"
    Alert("N�o � Natal" + cData)

    CASE cDate == "25/12/2017"
    Alert("N�o Natal!!")

    OTHERWISE
    MsgAlert("Não sei qual dia � hoje!")

    ENDCASE

RETURN
