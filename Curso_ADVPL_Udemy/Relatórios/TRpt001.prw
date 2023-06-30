#Include 'Protheus.ch'
#Include 'TopConn.ch'

/* Utilizando a classe TReport */

User Function TRpt001()

    Local oReport
    Local cAlias := GetNextAlias()          // Retorna o Alias a ser usado

    oReport := RptStruc(cAlias)

    oReport:PrintDialog()

Return

/* Consulta na Base de Dados*/
Static Function RPrint(oReport, cAlias)

    Local oSecao1 := oReport:Section(1)  // Retorna objeto da classe TRSection(seção)

    oSecao1:BeginQuery()        //Inicia a consulta na secao

        BeginSQL Alias cAlias

            SELECT
            B1_FILIAL FILIAL, B1_COD CODIGO, B1_DESC DESCRICAO, B1_TIPO TIPO, B1_ATIVO ATIVO
            FROM %Table:SB1% SB1
            WHERE B1_FILIAL = '01' AND B1_MSBLQL <> '1' AND D_E_L_E_T_ = ''
            GROUP BY B1_FILIAL, B1_COD, B1_DESC, B1_TIPO, B1_ATIVO

        EndSQL

    oSecao1:EndQuery()                  // Encerra a consulta da secao
    oReport:SetMeter((cAlias)->(RecCount()))        //Define o limite da régua da consulta

    oSecao1:Print()     //Imprime o retorno

Return

/* Funcao que instancia a classe TReport */
Static Function RptStruc(cAlias)

    Local cTitulo := "Produtos Ativos"
    Local cHelp := "Permite Imprimtir Relatório de Produtos"
    Local oReport
    Local oSection1

    //Instanciando a classe TReport
    oReport := TReport():New('TRPT001',cTitulo,/**/, {|oReport|RPrint(oReport, cAlias)},cHelp)

    //Secao
    oSection1 := TRSection() :New(oReport, "Produtos", {"SB1"})

    //Definindo as Colunas
    TRCell() :New(oSection1,"FILIAL"        ,"SB1"      ,"Filial")    
    TRCell() :New(oSection1,"CODIGO"        ,"SB1"      ,"Codigo")    
    TRCell() :New(oSection1,"DESCRICAO"     ,"SB1"      ,"Descricao")    
    TRCell() :New(oSection1,"TIPO"          ,"SB1"      ,"Tipo")    
    TRCell() :New(oSection1,"ATIVO"         ,"SB1"      ,"Ativo")

    
           
Return (oReport)
