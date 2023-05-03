#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION A010TOK()
    Local lExecuta  := .T.
    Local cTipo     := AllTrim(M->B1_TIPO)
    Local cConta    := AllTrim(M->B1_CONTA)

    IF (cTipo = "PA" .AND. cConta = "001")
        Alert("A conta <b> "+ cConta + "</b> não pode estar associada a um produto do tipo <b>" + cTipo)

        lExecuta := .F.
    
    ENDIF

RETURN (lExecuta)
