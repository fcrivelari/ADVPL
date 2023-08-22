#Include 'Totvs.ch'

User Function Graf001()

    Local oChart
    Local oDlg
    Local aRand := {}

    // Criar Janela onde será exibida o grafico

    Define MsDialog oDlg Pixel From 0,0 To 500,700

    oChart := FwChartBar() :New()               // FwChartBar = Grafico em Barra | FwChartPie = Grafico em Pizza
    oChart:Init(oDlg,.T.,.T.)
    oChart:SetTitle("vendas por mês",CONTROL_ALIGN_CENTER)

    oChart:addSerie("Janeiro",21.000)
    oChart:addSerie("Fevereiro",11.000)
    oChart:addSerie("Março",8.000)
    oChart:addSerie("Abril",25.000)
    oChart:addSerie("Maio",10.000)

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

    Activate MsDialog oDlg Centered

Return
