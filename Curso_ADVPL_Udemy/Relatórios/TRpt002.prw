#Include 'Protheus.ch'
#Include 'TopConn.ch'

User Function Trpt002()

    Local oReport   := Nil
    Local cPerg     := Padr("TRPT002",10)       

    Pergunte(cPerg,.F.)         // Busca na SX1 Pergunta apontada na variável cPerg

    oReport := RPTStruc(cPerg)
    oReport:PrintDialog()

Return

// Consulta na Base de Dados e cria as seções 
Static Function RPTPrint(oReport)

    Local oSection1 := oReport:Section(1)
    Local oSection2 := oReport:Section(2)
    Local cQuery    := ""
    Local cNumCod   := ""

    cQuery := "SELECT   "
    cQuery += "    SA1.A1_COD,  "
    cQuery += "    SA1.A1_NOME,     "
    cQuery += "    SC5.C5_NUM,  "
    cQuery += "    SC6.C6_QTDVEN,   "
    cQuery += "    SC6.C6_PRCVEN,   "
    cQuery += "    SB1.B1_DESC  "
    cQuery += "FROM     "
    cQuery += "    SA1990 SA1, SC5990 SC5, SC6990 SC6, SB1990 SB1   "
    cQuery += "WHERE SA1.D_E_L_E_T_ = ''    "
    cQuery += "    AND SC5.C5_FILIAL = '" + MV_PAR01 + "' " 
    cQuery += "    AND SC5.D_E_L_E_T_ = ''  "
    cQuery += "    AND SC5.C5_CLIENTE = SA1.A1_COD  "
    cQuery += "    AND SC6.C6_FILIAL = '" + MV_PAR01 + "' " 
    cQuery += "    AND SC6.D_E_L_E_T_ = ''  "
    cQuery += "    AND SC6.C6_NUM = SC5.C5_NUM  "
    cQuery += "    AND SB1.B1_FILIAL = '" + MV_PAR01 + "' " 
    cQuery += "    AND SB1.D_E_L_E_T_ = ''  "
    cQuery += "    AND SB1.B1_COD = SC6.C6_PRODUTO  "
    cQuery += "ORDER BY     "
    cQuery += "    A1_FILIAL,   "
    cQuery += "    A1_COD,  "
    cQuery += "    C5_FILIAL,   "
    cQuery += "    C5_NUM,  "
    cQuery += "    C6_FILIAL,   "
    cQuery += "    C6_ITEM  "

    // Verifica se a tabela ja esta aberta
    If Select("TEMP") <> 0
        DbSelectArea("TEMP")
        DbCloseArea()

    Endif

    // Enviar os dados da cQuery para nova tabela(TEMP)
    TCQuery cQuery New Alias "TEMP"
        
        DbSelectArea("TEMP")
        // Aponta para o primeiro registro da tabela
        TEMP->(DbGoTop())       

        // Coordena o relatório
        oReport:SetMeter(TEMP->(LastRec()))
    
        While !Eof()
                // Se o usuário cancelar
                If oReport:Cancel()
                Exit
            
            Endif

            // Iniciando a Primeira Seção
            oSection1:Init()
            // Chama o objeto oReport
            oReport:IncMeter()

            // Armazena o codigo retornado da A1
            cNumCod := TEMP->A1_COD

            // Envia mensagem ao usuário informando que está incluindo o codigo do cliente
            IncProc("Imprimindo Cliente "+ Alltrim(TEMP->A1_COD))

    // Imprimindo e setando os valores da primeira seção, Cabeçalho
    oSection1:Cell("A1_COD"):SetValue(TEMP->A1_COD)
    oSection1:Cell("A1_NOME"):SetValue(TEMP->A1_NOME)
    oSection1:PrintLine()       // Cria uma linha divisória


            //Iniciar a impressão da seção 2
            oSection2:Init()

            //Verifica se o codigo do cliente é o mesmo, se sim, imprime os dados do pedido
            While TEMP->A1_COD == cNumCod
                oReport:IncMeter()

            IncProc("Imprimindo pedidos..."+ Alltrim(TEMP->C5_NUM))

                // Imprime dados do produto
                oSection2:Cell("C5_NUM"):SetValue(TEMP->C5_NUM)
                oSection2:Cell("B1_DESC"):SetValue(TEMP->B1_DESC)
                oSection2:Cell("C6_PRCVEN"):SetValue(TEMP->C6_PRCVEN)
                oSection2:Cell("C6_QTDVEN"):SetValue(TEMP->C6_QTDVEN)

                // Cria uma linha divisória
                oSection2:PrintLine()       

                TEMP->(DbSkip())


            Enddo

            // Finaliza seção 2
            oSection2:Finish()      
            
            // Imprime uma linha separadora
            oReport:ThinLine()      

            // Finaliza seção 1
            oSection1:Finish()      

            Enddo

Return

// Monta a Estrutura do relatório
Static Function RPTStruc(cNome)

    Local oReport := Nil
    Local oSection1 := Nil
    Local oSection2 := Nil

    oReport := TReport() :New(cNome,"Relatorio de pedidos por cliente", cNome, {|oReport| RPTPrint(oReport)},"Descrição do Help")

    // Definindo a orientacao como retrato
    oReport:SetPortrait()

    // Montagem estrutura oSection1,            TRSection = Layout do Relatorio
    oSection1 := TRSection() :New(oReport, "Clientes", {"SA1"}, Nil, .F.,.T.)
    TRCell() :New(oSection1,"A1_COD"    ,"TEMP"     ,"CODIGO"   ,"@!"   ,40)
    TRCell() :New(oSection1,"A1_NOME"   ,"TEMP"     ,"NOME"     ,"@!"   ,200) 

    // Montagem estrutura oSection2,            TRSection = Layout do Relatorio
    oSection2 := TRSection() :New(oReport, "Produtos", {"SB1"}, Nil, .F.,.T.)
    TRCell() :New(oSection2,"C5_NUM"    ,"TEMP",    "PEDIDO"        ,"@!"           ,30)
    TRCell() :New(oSection2,"B1_DESC"   ,"TEMP",    "DESCRIÇÃO"     ,"@!"           ,100) 
    TRCell() :New(oSection2,"C6_PRCVEN" ,"TEMP",    "PREC. VEND"    ,"@E 999999.99" ,20)
    TRCell() :New(oSection2,"C6_QTDVEN" ,"TEMP",    "QUANTIDADE"    ,"@E 999999.99" ,30)

    // Quebra de Seção .F. ou .T.
    oSection1:SetPageBreak(.F.)


Return (oReport)
