#Include 'Totvs.ch'
#Include 'Protheus.ch'
#Include 'Parmtype.ch'
#Include 'FwMvcDef.ch'

/*FWBrowse: https://tdn.totvs.com/display/public/framework/FwBrowse*/
/*FWFormModel: https://tdn.totvs.com/display/public/framework/FWFormModel */

User Function MVC002()

    Local aArea := ZZB->(GetArea())
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias("ZZB")
    oBrowse:SetDescription("Albuns")

    // Legendas
    oBrowse:AddLegend("ZZB->ZZB_TIPO == '1'", "Green", "CD")
    oBrowse:AddLegend("ZZB->ZZB_TIPO == '2'", "Blue", "DVD")

    oBrowse:SetMenuDef("MVC002")
    oBrowse:Activate()
    RestArea(aArea)

Return Nil

// OPERAÇÕES DA ROTINA
Static Function MenuDef()

Local aRotina := {}

    aAdd( aRotina, { 'Visualizar', 'VIEWDEF.COMP021_MVC', 0, 2, 0, NIL } )
    aAdd( aRotina, { 'Incluir' , 'VIEWDEF.COMP021_MVC', 0, 3, 0, NIL } )
    aAdd( aRotina, { 'Alterar' , 'VIEWDEF.COMP021_MVC', 0, 4, 0, NIL } )
    aAdd( aRotina, { 'Excluir' , 'VIEWDEF.COMP021_MVC', 0, 5, 0, NIL } )
    aAdd( aRotina, { 'Imprimir' , 'VIEWDEF.COMP021_MVC', 0, 8, 0, NIL } )
    aAdd( aRotina, { 'Copiar' , 'VIEWDEF.COMP021_MVC', 0, 9, 0, NIL } )
    
Return aRotina

Static Function ModelDef()

    Local oModel := MPFormModel():New("MVC002",,,,)
    Local oStPai   := FwFormStruct(1, "ZZB")
    Local oStFilho   := FwFormStruct(1, "ZZA")

    // Atribuindo formulario para o modelo de dados
    oModel:AddField("ZZBMASTER",,oStPai)
    // Cria Grid
    oModel:AddGrid('ZZADETAIL','ZZBMASTER',oStFilho,,,,,)

    oModel:SetRelation('ZZADETAIL',{{'ZZA_FILIAL','xFilial("ZZA")'},{'ZZA_CODALB','ZZB_COD'}},ZZA->(IndexKey(1)))
    
    oModel:SetDescription("Modelo 3")
    oModel:GetModel('ZZBMASTER'):SetDescription('Modelo Albuns')
    oModel:GetModel('ZZADETAIL'):SetDescription('Modelo Musicas')

Return oModel

Static Function ViewDef()

    Local oView := Nil
    Local oModel := FWLoadModel("MVC002")
    Local oStPai := FwFormStruct(2,"ZZB")
    Local oStFilho := FwFormStruct(2,"ZZA")

    oView := FWFormView():New()
    oView:SetModel(oModel)

    oView:AddField('VIEW_ZZB',oStPai,'ZZBMASTER')
    oView:AddGrid('VIEW_ZZA',oStFilho,'ZZADETAIL')
    
    oView:CreateHorizontalBox('CABEC',40)
    oView:CreateHorizontalBox('GRID',60)

    oView:SetOwnerView('VIEW_ZZB','CABE')
    oView:SetOwnerView('VIEW_ZZA','GRID')

    oView:EnableTitleView("VIEW_ZZB",'Cabeçalho')
    oView:EnableTitleView("VIEW_ZZA",'Grid')

Return oView
