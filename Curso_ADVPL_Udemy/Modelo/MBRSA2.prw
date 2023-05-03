#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION MBRSA2()
    Local cAlias    := "SA2"
    Local aCores    := {}
    Local cFiltra   := "A2_FILIAL == '"+xFilial ('SA2')+"' .AND. A2_EST == 'SP'"
    Private cCadastro :="Cadastro MBROWSE"
    Private aRotina     := {}
    Private aIndexSA2   := {}
    Private bFiltraBrw  := {|| FilBrowse(cAlias,@aIndexSA2,@cFiltra)}

    AADD(aRotina, {"Pesquisar"      ,"AxPesqui"      ,0,1})
    AADD(aRotina, {"Visualizar"     ,"AxVisual"      ,0,2})
    AADD(aRotina, {"Incluir"        ,"U_BInclui"     ,0,3})
    AADD(aRotina, {"Alterar"        ,"U_BAltera"     ,0,4})
    AADD(aRotina, {"Excluir"        ,"U_BDeleta"     ,0,5})
    AADD(aRotina, {"Legenda"        ,"U_BLegenda"    ,0,6})

    //ACORES - LEGENDAS
    AADD(aCores, {"A2_TIPO == 'F'", "BR_VERDE"   })
    AADD(aCores, {"A2_TIPO == 'J'", "BR_AMARELO" })
    AADD(aCores, {"A2_TIPO == 'X'", "BR_LARANJA" })
    AADD(aCores, {"A2_TIPO == 'R'", "BR_MARROM"  })
    AADD(aCores, {"Empty(A2_TIPO)", "BR_PRETO"   })


    DbSelectArea(cAlias)
    DbSetOrder(1)

    Eval(bFiltraBrW)

    DBGoTop()
    mBrowse(6,1,22,75,cAlias,,,,,,aCores)

    EndFilBrW(cAlias,aIndexSA2)

RETURN

/*---------------------------------
    FUNÇÃO BINCLUI - INCLUSÃO
----------------------------------*/ 

USER FUNCTION BInclui(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao :=AXInclui(cAlias,nReg,nOpc)
        IF nOpcao == 1
            MsgInfo("Inclusão Efetuada com Sucesso")
        ELSE
            MsgAlert("Inclusão Cancelada")       
        ENDIF
    
RETURN NIL

/*---------------------------------
    FUNÇÃO BALTERA - ALTERAÇÃO
----------------------------------*/ 

USER FUNCTION BAltera(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao :=AXAltera(cAlias,nReg,nOpc)
        IF nOpcao == 1
            MsgInfo("Alteração Efetuada com Sucesso")
        ELSE
            MsgAlert("Alteração Cancelada")        
        ENDIF
    
RETURN NIL

/*---------------------------------
    FUNÇÃO BDELETA - EXCLUSÃO
----------------------------------*/ 

USER FUNCTION BDeleta(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao :=AXDeleta(cAlias,nReg,nOpc)
        IF nOpcao == 1
            MsgInfo("Exclusão Efetuada com Sucesso")
        ELSE
            MsgAlert("Exclusão Cancelada")       
        ENDIF
    
RETURN NIL

/*---------------------------------
    FUNÇÃO BLEGENDA - LEGENDA
----------------------------------*/ 

USER FUNCTION BLegenda()
    Local aLegenda := {}
    
    AADD(aLegenda, {"BR_VERDE"   ,"Pessoa Fisica"        })
    AADD(aLegenda, {"BR_AMARELO" ,"Pessoa Juridica"      })
    AADD(aLegenda, {"BR_LARANJA" ,"Exportação"           })
    AADD(aLegenda, {"BR_MARROM"  ,"Fornecedor Rural"     })
    AADD(aLegenda, {"BR_PRETO"   ,"Não Classificado"     })

    BrwLegenda(cCadastro, "Legenda", aLegenda)
    
RETURN
