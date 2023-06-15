#INCLUDE 'Protheus.ch'

USER FUNCTION RelTxt()

    IF MsgYesN("Esta função tem como objetivo gerar arquivo TXT.")
        GerArq()
    ELSE
        Alert("Cancelada pelo Operador")
    ENDIF

RETURN NIL


/* Função que gera o arqvuivo TXT*/
STATIC FUNCTION GerArq()

LOCAL cDir := "C:\TOTVS12"
LOCAL cArq := "Teste_arquivo.txt"
LOCAL nHandle := FCreate(cDir+cArq)

    IF nHandle < 0
        MsgAlert("Erro ao criar o arquivo", "ERRO")
    ELSE 
        FOR nLinha := 1 TO 100
            FWRITE( nHandle, "Gravando a Linha" + Strzero(nLinha,3) + CRLF )
        NEXT nLinha

        FCLOSE(nLinha)
    
    ENDIF

    IF FILE("C:\TOTVS12\Teste_arquivo.txt")
        MsgInfo("Arquivo Criado com sucesso!")
    ELSE
        MsgAlert( "Não foi possível criar o arquivo", "ALERTA" )
    ENDIF
    
RETURN
