#Include 'Protheus.ch'
#include 'Parmtype.ch'

User Function RLHTML()

    If MsgYesNo("Deseja imprimir o relatorio HTML?")

        Processa({|| MntQry()   },,"Processando...")
        MsAguarde({|| GeraHTML()    },,"O Arquivo HTML está sendo gerado...")

    Else 

        Alert("<b>Cancelado pelo usuário.</b>")
        Return Nil

    Endif

Return

/* Função que monta a query     */
Static Function MntQry()

    Local cQuery := " "

    cQuery := "SELECT "
	cQuery += "     B1_FILIAL AS FILIAL, "
	cQuery += "     B1_COD	  AS CODIGO, "
	cQuery += "     B1_DESC	  AS DESCRICAO, "
	cQuery += "     B1_TIPO   AS TIPO, "
	cQuery += "     B1_GRUPO  AS GRUPO, "
	cQuery += "     B1_POSIPI AS IPI "
    cQuery += "FROM " + RetSqlName('SB1')
    cQuery += "WHERE D_E_L_E_T_ = '' "

    cQuery := ChangeQuery(cQuery)
    DbUSeArea(.T.,"TOPCONN", TcGenQry(,,cQuery), 'HT1', .F., .T.)

Return Nil

/* Gera HTML */
Static Function GeraHTML()

    Local cHtml := ""
    Local cFile := "C:\TOTVS12\index.htm"
    Local dData := Date()   // Armazena a data atual
    
    nH := fCreate(cFile)
        If nH == -1 
        MSgStop("Falha ao criar o arquivo HTML " + Str(Ferror()))
        Return
        Endif

    // Montagem do arquivo.html
    cHtml := ' <html xmlns="http://www.w3.org/1999/xhtml">'
    cHtml += "    <head>  "
    cHtml += "    	<!-- Arquivo HTML de exemplo "
    cHtml += " 		Author: RCTI Treinamentos "
    cHtml += "    	 --> "
    cHtml += '    <meta charset="utf-8"> '       
    cHtml += "    <title>Relatorio de produtos</title> " 
    cHtml += "    <link rel='stylesheet' href='estilo-darck.css' /> "
    cHtml += "    </head> "

    cHtml += "    <body> " 
    cHtml += "    <div id='cabec'> " 
    cHtml += "       <center> "
    cHtml += "    <table width='331' id='table-b' summary='Produtos'> "

    cHtml += "    <tr> " 
    cHtml += "     <td width='252' scope='row'><font face='arial'><b>Parametros:</b></font><br /> "
    cHtml += "        <font face='arial'>Data de atualizacao: "+ DToc(dData) +"</font><br /> <font face='arial'></font></td>  "

    cHtml += "     </tr> "
    cHtml += "    </table> "
    cHtml += "    </center>  "

    cHtml += "    <p align=center><font face='Lucida Sans Unicode' size='6'><u>Relatorio exemplo</u></font></p> "
    cHtml += " 	  <center> "
    cHtml += "       <table width='1000' id='table-b' summary='Produtos'> "
    cHtml += "       <tr align='center'> "
    cHtml += "        <th width='72' scope='row'>Filial</th> "
    cHtml += "        <th width='100' scope='row'>Codigo</th> "
    cHtml += "        <th width='200'>Descricao</th> "
    cHtml += "        <th width='72'>Tipo</th> "
    cHtml += "        <th width='72'>Grupo</th> "
    cHtml += "        <th width='100'>Ipi</th> "
    cHtml += "        </tr> "

    FWrite(nH, cHtml)
        cHtml := ""

    While HT1->(!Eof())

        cHtml += "<tr><td>"+ HT1->(FILIAL) + "</td>"
        cHtml += "<td>"+ HT1->(CODIGO) + "</td>"
        cHtml += "<td>"+ HT1->(DESCRICAO) + "</td>"
        cHtml += "<td>"+ HT1->(TIPO) + "</td>"
        cHtml += "<td>"+ HT1->(GRUPO) + "</td>"
        cHtml += "<td>"+ HT1->(IPI) + "</td></tr>"

            FWrite(nH, cHtml)
                cHtml := ""
                HT1->(DbSkip())
                    
    Enddo

        FClose(nH)

    MsgInfo("Arqvuivo gerado com sucesso!!")

    // Abrindo Arquivo

    nRet := ShellExecute("open",cFile,"","C:teste_html\Index.html",1)

Return nRet
