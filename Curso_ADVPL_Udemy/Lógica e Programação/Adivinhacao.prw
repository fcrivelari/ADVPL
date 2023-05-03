#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION ADIVINHA()
    Local nNum := RANDOMIZE( 1,100 )
    Local nChute := 0
    Local nTent := 0

    WHILE nChute != nNum
    nChute := VAL(FWINPUTBOX("Escolha um número [1 - 100]", ""))
        IF nChute == nNum
            MSGINFO("Você acertou - <b>"+ CValToChar(nChute) + "</b><br>ERROS: " + CValToChar(nTent), "Fim de Jogo")
        
        ELSEIF nChute > nNum
            MSGALERT("Valor Alto","Tente Novamente")
            nTent += 1
        ELSE
            MSGALERT("Valor Baixo", "Tente Novamente")
            nTent += 1
        ENDIF
    ENDDO

RETURN
