#Include 'Protheus.ch'

User Function RelTxt()

    If MsgYesNo("Esta fun��o tem como objetivo gerar arquivo TXT.")
        
        Processa({||MntQry() },,"Processando..." )
        MsAguarde({||GerArq() },,"O arquivo TXT est� sendo gerado...")

    Else
        Alert("Cancelada pelo Operador")
    Endif

Return Nil

/* Query MntQry */
Static Function MntQry()

    Local cQuery := ""

    cQuery := "SELECT B1_FILIAL AS FILIAL, B1_COD AS CODIGO, "
    cQuery += "B1_DESC AS DESCRICAO "
    cQuery += "FROM SB1990 WHERE D_E_L_E_T_ = '' "

    cQuery := ChangeQuery(cQuery)
        DbUseArea(.T.,"TOPCONN", TcGenQry(,,cQuery), 'TMP',.F.,.T.)     //TcGenQry = Cria uma tabela tempor�ria que vai armazenar os dados retornados na consulta

Return Nil

/* Gera o arqvuivo TXT */
Static Function GerArq()

    Local cDir := "C:\TOTVS12\"
    Local cArq := "arquivo2.txt"
    Local nHandle := FCreate(cDir+cArq)             // Cria o arquivo
    Local nLinha

    If nHandle < 0
        MsgAlert("Erro ao criar o arquivo", "ERRO")
    Else 
        While TMP->(!EOF())     // Enquanto for diferente do fim da tabela tempor�ria
         
        FWrite(nHandle, TMP->(FILIAL)+ " | " + TMP->(CODIGO)+ " | " +TMP->(DESCRICAO)+ CRLF)    // Escreve no arquivo TXT
        TMP->(dbSkip())

        Enddo

        /*For nLinha := 1 TO 100
            FWRITE( nHandle, "Gravando a Linha" + Strzero(nLinha,3) + CRLF )    // Escreve no arquivo TXT
        Next nLinha*/

        FCLOSE(nLinha)
    
    Endif

    If FILE("C:\TOTVS12\arquivo2.txt")
        MsgInfo("Arquivo Criado com sucesso!")
    Else
        MsgAlert( "N�o foi poss�vel criar o arquivo", "ALERTA" )
    Endif 
    
Return
