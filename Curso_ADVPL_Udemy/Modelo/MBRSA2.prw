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
    FUN��O BINCLUI - INCLUS�O
----------------------------------*/ 

USER FUNCTION BInclui(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao :=AXInclui(cAlias,nReg,nOpc)
        IF nOpcao == 1
            MsgInfo("Inclus�o Efetuada com Sucesso")
        ELSE
            MsgAlert("Inclus�o Cancelada")       
        ENDIF
    
RETURN NIL

/*---------------------------------
    FUN��O BALTERA - ALTERA��O
----------------------------------*/ 

USER FUNCTION BAltera(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao :=AXAltera(cAlias,nReg,nOpc)
        IF nOpcao == 1
            MsgInfo("Altera��o Efetuada com Sucesso")
        ELSE
            MsgAlert("Altera��o Cancelada")        
        ENDIF
    
RETURN NIL

/*---------------------------------
    FUN��O BDELETA - EXCLUS�O
----------------------------------*/ 

USER FUNCTION BDeleta(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao :=AXDeleta(cAlias,nReg,nOpc)
        IF nOpcao == 1
            MsgInfo("Exclus�o Efetuada com Sucesso")
        ELSE
            MsgAlert("Exclus�o Cancelada")       
        ENDIF
    
RETURN NIL

/*---------------------------------
    FUN��O BLEGENDA - LEGENDA
----------------------------------*/ 

USER FUNCTION BLegenda()
    Local aLegenda := {}
    
    AADD(aLegenda, {"BR_VERDE"   ,"Pessoa Fisica"        })
    AADD(aLegenda, {"BR_AMARELO" ,"Pessoa Juridica"      })
    AADD(aLegenda, {"BR_LARANJA" ,"Exporta��o"           })
    AADD(aLegenda, {"BR_MARROM"  ,"Fornecedor Rural"     })
    AADD(aLegenda, {"BR_PRETO"   ,"N�o Classificado"     })

    BrwLegenda(cCadastro, "Legenda", aLegenda)
    
RETURN
