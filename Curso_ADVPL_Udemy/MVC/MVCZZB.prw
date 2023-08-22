#Include 'Totvs.ch'
#Include 'Parmtype.ch'
#Include 'FwMvcDef.ch'

/*FWBrowse: https://tdn.totvs.com/display/public/framework/FwBrowse*/
/*FWFormModel: https://tdn.totvs.com/display/public/framework/FWFormModel */

User Function MVCZZB()

    Local oBrowse := Nil

    DbSelectArea("ZZB")

    oBrowse := FwMBrowse():New()    
    oBrowse:SetAlias("ZZB")
    oBrowse:SetMenuDef("MVCZZB")
    oBrowse:SetDescription("Albuns")

    // Legendas
    oBrowse:AddLegend("ZZB->ZZB_TIPO == '1'", "Green", "CD")
    oBrowse:AddLegend("ZZB->ZZB_TIPO == '2'", "Blue", "DVD")

    oBrowse:Activate()
    RestArea()

Return Nil

// Criando MenuDef
Static Function MenuDef()

    Local aRotina := {}
    Local aRotAux := FwMvcMenu("MVCZZB")
    Local nX

    ADD OPTION aRotina TITLE "Informação" ACTION "U_INFMVC"       OPERATION 6 ACCESS 0 

    // Adicionar as demais operacoes ao menu
    For nX := 1 To Len(aRotAux)

        AADD(aRotina,aRotAux[nX])

    Next

/*        ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.MVCZZB" OPERATION MODEL_OPERATION_VIEW   ACCESS 0 //OPERATION 1
	    ADD OPTION aRotina TITLE "Incluir"    ACTION "VIEWDEF.MVCZZB" OPERATION MODEL_OPERATION_INSERT ACCESS 0 //OPERATION 3
	    ADD OPTION aRotina TITLE "Alterar"    ACTION "VIEWDEF.MVCZZB" OPERATION MODEL_OPERATION_UPDATE ACCESS 0 //OPERATION 4
	    ADD OPTION aRotina TITLE "Excluir"    ACTION "VIEWDEF.MVCZZB" OPERATION MODEL_OPERATION_DELETE ACCESS 0 //OPERATION 5
        ADD OPTION aRotina TITLE "Informação" ACTION "U_INFMVC"       OPERATION 6                      ACCESS 0 

/* 
1 - Pesquisar
2 - Visualizar
3 - Incluir
4 - Alterar
5 - Excluir
7 - Copiar
*/

Return aRotina

// Criando ModelDef
Static Function ModelDef()

    Local oModel := NIL
    Local oStZZB := FWFormStruct(1,"ZZB")

    // Instanciando o modelo de dados
    oModel := MPFormModel():New("ZMODELLM", , , ,)
    // Atribuindo formulario para o modelo de dados
    oModel:AddFields("FORMZZB",,oStZZB)
    // Chave primaria da rotina
    oModel:SetPrimaryKey({'ZZB_FILIAL', 'ZZB_COD'})

    // Adicionando descrição ao modelo de dados
    oModel:SetDescription("Modelo de Dados")

    oModel:GetModel("FORMZZB"):SetDescription("Formulario de Cadastro")

Return oModel

// Criando ViewDef
Static Function ViewDef()
 
    //Local aStruZZB := ZZB->(DbStruct()) // Carregar a estrutura da Tabela ZZB
    Local oView    := Nil
    Local oModel   := FWLoadModel("MVCZZB") // Nome do codigo Fonte, e nao nome da Function, pode carregar outro fonte de Modelo MVC.
    Local oStZZB   := FwFormStruct(2, "ZZB") // Tipo de estrutura ( 1-Model | 2-View ), Objeto de Estrutura
    
    // Instanciando
    oView := FWFormView():New()
    oView:SetModel(oModel)
    
    // Removendo Campo
    oStZZB:RemoveField("ZZB_USER")

    // Estrutura Visual dos Campos, colocando um identificador da View e do Modelo de Dados
    oView:AddField("VIEW_ZZB", oStZZB, "FORMZZB")
    
    // CRIA BOX HORIZONTAL
    oView:CreateHorizontalBox("TELA" , 100)
    
    // DEFINE OS TÍTULOS DAS VIEWS
    oView:EnableTitleView("VIEW_ZZB", "Dados View")
    
    // Para nao reabrir a tela, após salvar registro
    oView:SetCloseonOk({||.T.})
    
    // RELACIONA OS BOX COM A ESTRUTURA VISUAL
    oView:SetOwnerView("VIEW_ZZB", "TELA")
        
Return oView

User Function INFMVC()

    Local cMsg := "Meu primeiro programa em MVC"

    MsgInfo(cMsg)

Return
