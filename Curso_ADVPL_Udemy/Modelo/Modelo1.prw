#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'
//PROGRAMA DE ATUALIZAÇÃO
USER FUNCTION MODELO1()
    Local cAlias:= "SB1"
    Local cTitulo := "Cadastro - AXCadastro"
    Local cVldExc := ".T."
    Local cVlDalt:= ".T."

    AXCadastro(cAlias, cTitulo, cVldExc, cVlDalt)     //CRIAÇÃO DE TELA   

RETURN NIL
