#Include 'Protheus.ch'
#Include 'TopConn.ch'

User Function Trpt002()

    Local oReport   := Nil
    Local cPerg     := Padr("TRPT002",10)       

    Pergunte(cPerg,.F.)         // Busca na SX1 Pergunta apontada na variável cPerg

Return

Static Function RPTPrint(oReport)

    Local oSection1 := oReport:Section(1)
    Local oSection2 := oReport:Section(2)
    Local cQuery    := ""
    Local cNumCod   := ""

    

Return