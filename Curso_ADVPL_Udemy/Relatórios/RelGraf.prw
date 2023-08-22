#Include 'Totvs.ch'
#Include 'RPTDef.ch'
#Include 'FWPrintSetup.ch'

User Function RelGraf()

    Local aArea := GetArea()
    Local cNomeRel := "rel_teste"+dTos(Date())+StrTran(Time(), ':', '-')
    Local cDiretorio := GetTempPath()      
    Local nLinCab := 025
    Local nAltur := 250
    Local nLargur := 1050
    Local aRand := {}
    Private cHoraEx := Time()
    Private nPagAtu := 1
    Private oPrintPvt

    // Variaveis para as fontes utilizadas no relatorio
    Private oFontRod := TFont() :New("Arial", , -06, , .F.)
    Private oFontTit := TFont() :New("Arial", , -20, , .T.)

    // Variaveis para linhas e colunas
    Private nlinAtu := 0
    Private nLinFin := 830
    Private nColIni := 010
    Private nColFin := 510
    Private nColMeio := (nColFin-nColIni)/2

        Processa({||MntQry() },,"Processando..." )

        // Criando Objeto de Impressao
        oPrintPvt := FWMSPrinter() :New(cNomeRel,IMP_PDF,.F.,/**/,.T.,,@oPrintPvt,,,,,.T.)
        oPrintPvt:cPathPDF := GetTempPath()
        oPrintPvt:SetResolution(72)
        oPrintPvt:SetPortrait()
        oPrintPvt:SetPaperSizer(DMPAPER_A4)
        oPrintPvt:SetMargin(60,60,60,60)
        oPrintPvt:StartPage()

        // Cabeçalho
        oPrintPvt:SayAlign(nLinCab,nColMeio-150,"Relatorio Grafico ADVPL", oFontTit,300,20,RGB(0,0,255),2,0)
        nLinCab += 35
        nlinAtu := nLinCab

        // Verificar se o arquivo está aberto
        If File(cDiretorio + "01grafico.png")
            FErase(cDiretorio + "01grafico.png")
        Endif

        DEFINE MSDIALOG oDlg PIXEL FROM 0,0 TO nAltur,nLargur
    
        oChart := FwChartBar() :New()
        oChart:Init(oDlg,.T.,.T.)
        oChart:SetTitle("Clientes que mais compraram",CONTROL_ALIGN_CENTER)

        while TMP->(!Eof()) 
            oChart:AddSeries(TMP->NOME,TMP->TOTAL)
            TMP->(dbSkip())
            
        Enddo

        // Definindo Legendas
        oChart:SetLegend(CONTROL_ALIGN_LEFT)

        // Definindo Cores
        aAdd(aRand,{"199,199,070","022,022,008"})
        aAdd(aRand,{"207,136,077","020,020,006"})
        aAdd(aRand,{"141,225,078","017,019,010"})
        aAdd(aRand,{"166,085,082","017,007,001"})
        aAdd(aRand,{"084,120,164","007,012,017"})

        oChart:oFwChartColor:aRandom := aRand
        oChart:oFwChartColor:SetColor("Random")

        oChart:Build()
        
        ACTIVATE MSDIALOG oDlg CENTERED ON INIT (oChart:SaveToPng(0,0,nLargur,nAltur,cDiretorio+"01grafico.png"),oDlg:End())
    oPrintPvt:SayBitmap(nlinAtu,nColIni,cDiretorio+"01grafico.png",nLargur/2, nAltur/1.6)
    nlinAtu += nAltur + 5
    
    RodaPe()

    oPrintPvt:EndPage()

    oPrintPvt:Preview()

    RestArea(aArea)

Return

Static Function MntQry()
    
    Local cQuery := ""

    cQuery += " SELECT  "
    cQuery += " 	F2_CLIENTE AS CLIENTE,  "
    cQuery += " 	A1_NOME AS NOME,    "
    cQuery += " 	SUM(F2_VALBRUT) TOTAL   "
    cQuery += " FROM " + RetSqlName('SF2') + " AS SF2"
    cQuery += " 	INNER JOIN " + RetSqlName('SA1') + " AS SA1 ON SF2.F2_CLIENTE = A1_COD AND F2_LOJA = A1_LOJA AND SA1.D_E_L_E_T_ = ''   "
    cQuery += " WHERE   "
    cQuery += " 	SF2.D_E_L_E_T_ = '' "
    cQuery += " GROUP BY    " 
    cQuery += " 	F2_CLIENTE,     "
    cQuery += " 	A1_NOME "

    cQuery := ChangeQuery(cQuery)
    DbUseArea(.T.,"TOPCONN", TcGenQry(,,cQuery), 'TMP', .F.,.T.)

Return Nil

Static Function RodaPe()

    Local nLinha := nLinFin
    Local cTitulo := ""

    // Linha divisoria
    oPrintPvt:Line(nLinha,nColIni,nLinha,nColFin, RGB(0,0,200))
    nLinha += 4

    // Escrevendo Dados contidos no rodape
    cTitulo := "Relatório de Clientes - "+ dToc(dDataBase) + " | "+cHoraEx+" | "+cUserName
    oPrintPvt:SayAlign(nLinha,nColIni,cTitulo, oFontRod,250,07, ,0,)

    // Paginação Direita
    cTitulo := "Pagina "+cValToChar(nPagAtu)
    oPrintPvt:SayAlign(nLinha,nColFin,cTitulo, oFontRod, 040,07,,1,)

    oPrintPvt:EndPage()
    nPagAtu++

Return
