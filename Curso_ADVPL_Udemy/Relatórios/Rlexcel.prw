#Include 'Protheus.ch'

User Function RLExcel()

    Processa({||MntQuery()},,"Processando..." ) 
    MsAguarde({|| GeraExcel()},,"O Arqvuivo Excel Está sendo gerado...")

    DbSelectArea("TR1")
    DbCloseArea()


Return Nil

// Montando a Query
Static Function MntQuery()

    Local cQuery := ""

    cQuery :="  SELECT "
    cQuery +="  	SB1.B1_COD AS CODIGO, "
    cQuery +="  	SB1.B1_DESC AS DESCRICAO, "
    cQuery +="  	SB1.B1_TIPO AS TIPO, "
    cQuery +="  	SBM.BM_GRUPO GRUPO, "
    cQuery +="  	SBM.BM_DESC BM_DESCRICAO, "
    cQuery +="  	SBM.BM_PROORI BM_ORIGEM "
    cQuery +="  FROM " + RetSqlName('SB1') + " SB1 "
    cQuery +="  INNER JOIN " + RetSqlName('SBM') + " SBM ON (SBM.BM_FILIAL =  '" + FWxFilial ('SBM') + "' AND SBM.BM_GRUPO = B1_GRUPO AND SBM.D_E_L_E_T_ = '') "
    cQuery +="  WHERE SB1.B1_FILIAL = '" + FWxFilial ('SBM') + "' AND SB1.D_E_L_E_T_ = '' "
    cQuery +="  ORDER BY "
    cQuery +="  	SB1.B1_COD "

    If Select ("TR1") <> 0
        DbSelectArea ("TR1")
        DbCloseArea()
    Endif

    cQuery := ChangeQuery(cQuery)
    DbUseArea(.T.,"TOPCONN", TcGenQry(,,cQuery),'TR1',.F.,.T.)

Return Nil

// Função que Gera o Arquivo Excel
Static Function GeraExcel()

    Local oExcel := FWMsExcel() :New()
    Local lOk := .F.
    Local cArq := ""
    Local cDirTmp := "C:\TOTVS12\"

    DbSelectArea("TR1")
    TR1->(DbGoTop())

    oExcel:AddWorkSheet("PRODUTOS")                                  // Cria uma Planilha de Trabalho, apenas uma tabela pór worksheet
    oExcel:AddTable("PRODUTOS","TESTE")                              // Cria a tabela na WorkSheet

    oExcel:AddColumn("PRODUTOS","TESTE","CODIGO",1,1)                // Adiciona Coluna
    oExcel:AddColumn("PRODUTOS","TESTE","DESCRICAO",1,1)     
    oExcel:AddColumn("PRODUTOS","TESTE","TIPO",1,1) 
    oExcel:AddColumn("PRODUTOS","TESTE","GRUPO",1,1) 
    oExcel:AddColumn("PRODUTOS","TESTE","BM_DESCRICAO",1,1) 
    oExcel:AddColumn("PRODUTOS","TESTE","BM_ORIGEM",1,1) 

        While TR1->(!Eof())

            oExcel:AddRow("PRODUTOS","TESTE",{TR1->(CODIGO),;          // Adiciona Linhas
                                              TR1->(DESCRICAO),;
                                              TR1->(TIPO),;
                                              TR1->(GRUPO),;
                                              TR1->(BM_DESCRICAO),;
                                              TR1->(BM_ORIGEM)})

        lOk := .T.
        TR1->(DbSkip())                                              

        Enddo

    oExcel:Activate()                                   // Ativa a Planilha

        cArq := CriaTrab(Nil, .F.) + ".xml"             // Criando um arquivo no formato xml 
        oExcel:GetXMLFile(cArq)                          

        If __CopyFile(cArq,cDirTmp + cArq)      
            
            If lOk

                oExcelApp := MSExcel() :New()                   // Instancia o objeto
                oExcelApp:WorkBooks:Open(cDirTmp + cArq)        // Abre o diretorio e arquivo
                oExcelApp:SetVisible(.T.)                       // Torna visivel
                oExcelApp:Destroy()                             // Encerra o processo

                MsgInfo("O arquivo Excel foi gerado no diretório: " + cDirTmp + cArq + ". ")

            Else

                MsgAlert("Erro ao copiar o arquivo Excel!")

            Endif

        Endif

Return Nil
