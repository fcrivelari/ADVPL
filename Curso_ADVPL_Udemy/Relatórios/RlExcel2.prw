#Include 'Protheus.ch'

// RLExcel - Gera um relatório no arquivo EXCEL
// https://tdn.totvs.com/display/public/framework/FWMsExcelEx

User Function RLExcel2()

    MsgInfo("Este programa tem como objtivo imprimir reltórios em Excel")

    Processa({||MntQuery()},,"Processando..." ) 
    MsAguarde({|| GeraExcel()},,"O Arquivo Excel está sendo gerado...")

    DbSelectArea("TR1")
    DbCloseArea()


Return Nil

// MntQuery - Montando a Query
Static Function MntQuery()

    Local cQuery := ""

    cQuery := " SELECT          "   
    cQuery += " 	A1_COD      AS COD_CLI,     "
    cQuery += " 	A1_NOME     AS NOME,        "
    cQuery += " 	A1_VEND     AS PEDIDO,      "
    cQuery += " 	A1_MCOMPRA,                 "
    cQuery += " 	C5_NUM      AS PEDIDO,      "
    cQuery += " 	C5_TIPO,                    "
    cQuery += " 	C5_VEND1,                   "
    cQuery += " 	C5_CLIENTE,                 "
    cQuery += " 	C5_EMISSAO  AS EMISSAO,     "
    cQuery += " 	C6_ITEM,                    "
    cQuery += " 	C6_PRODUTO,                 "
    cQuery += " 	C6_UM,                      "
    cQuery += " 	C6_QTDVEN   AS QTDVEN,      "
    cQuery += " 	C6_PRCVEN,                  "
    cQuery += " 	C6_VALOR    AS VALOR,       "
    cQuery += " 	C6_NUM,                     "
    cQuery += " 	B1_DESC     AS DESCRICAO,   "
    cQuery += " 	B1_GRUPO                    "
    cQuery += " FROM SA1990 SA1, SC5990 SC5, SC6990 SC6,SB1990 SB1   "
    cQuery += " WHERE   "
    cQuery += " 	SA1.D_E_L_E_T_ = ''     "
    cQuery += " 	AND C5_FILIAL = '01' AND SC5.D_E_L_E_T_ = '' AND C5_CLIENTE = A1_COD    "
    cQuery += " 	AND C6_FILIAL = '01' AND SC6.D_E_L_E_T_ = '' AND C6_NUM = C5_NUM        "
    cQuery += " 	AND	B1_FILIAL = '01' AND SB1.D_E_L_E_T_ = '' AND B1_COD = C6_PRODUTO    "
    cQuery += " ORDER BY    "
    cQuery += " 	A1_FILIAL,  "
    cQuery += " 	A1_COD,     "
    cQuery += " 	C5_FILIAL,  "
    cQuery += " 	C5_NUM,     "
    cQuery += " 	C6_FILIAL,  "
    cQuery += " 	C6_ITEM     "

    If Select ("TR1") <> 0
        DbSelectArea ("TR1")
        DbCloseArea()
    Endif

    cQuery := ChangeQuery(cQuery)
    DbUseArea(.T.,"TOPCONN", TcGenQry(,,cQuery),'TR1',.F.,.T.)

Return Nil

// GeraExcel - Função que Gera o Arquivo Excel
Static Function GeraExcel()

    Local oExcel := FWMsExcel() :New()          // 
    Local lOk := .F.
    Local cArq := ""
    Local cDirTmp := "C:\TOTVS12\"

    DbSelectArea("TR1")
    TR1->(DbGoTop())

    // Atributos da Classe
    oExcel:SetFontSize(12)              // Define tamanho da fonte
    oExcel:SetFont("Arial")             // Define estilo da fonte
    oExcel:SetTitleBold(.T.)            // Titulo em negrito
    oExcel:SetBgGeneralColor("#333")      // Cor de fundo
    oExcel:SetTitleFrColor("#FFFF00")     // Define cor do titulo
    oExcel:SetLineFrColor("#A9A9A9")     // Define a cor da primeira linha
    oExcel:Set2LineFrColor("#FFFFFF")    // Define a cor da segunda linha

    // Area de Trabalho 1

    oExcel:AddWorkSheet("ABA 1")                                        // Cria uma Planilha de Trabalho, apenas uma tabela por worksheet
    oExcel:AddTable("ABA 1","CLIENTES")                                 // Cria a tabela na WorkSheet
    oExcel:AddColumn("ABA 1","CLIENTES","COD_CLI",1,1)                  // Adiciona Coluna
    oExcel:AddColumn("ABA 1","CLIENTES","NOME",1,1)     
    oExcel:AddColumn("ABA 1","CLIENTES","PEDIDO",1,1) 

    // Area de Trabalho 2

    oExcel:AddWorkSheet("ABA 2")                                        // Cria uma Planilha de Trabalho, apenas uma tabela por worksheet
    oExcel:AddTable("ABA 2", "PEDIDOS")                                 // Cria a tabela na WorkSheet
    oExcel:AddColumn("ABA 2","PEDIDOS","PEDIDO",1,1)                    // Adiciona Coluna
    oExcel:AddColumn("ABA 2","PEDIDOS","EMISSAO",1,1)     
    oExcel:AddColumn("ABA 2","PEDIDOS","QTDVEN",1,1) 
    oExcel:AddColumn("ABA 2","PEDIDOS","VALOR",3,3) 
    oExcel:AddColumn("ABA 2","PEDIDOS","DESCRICAO",1,1)      

    While TR1->(!Eof())

        oExcel:AddRow("ABA 1","CLIENTES",{TR1->(COD_CLI),;
                                          TR1->(NOME),;
                                          TR1->(PEDIDO)})

        oExcel:AddRow("ABA 2","PEDIDOS",{TR1->(PEDIDO),;
                                         TR1->(Stod(EMISSAO)),;
                                         TR1->(QTDVEN),;
                                         TR1->(VALOR),;
                                         TR1->(DESCRICAO)})

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
