#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'
//PROGRAMA DE ATUALIZA��O
USER FUNCTION MODELO1()
    Local cAlias:= "SB1"
    Local cTitulo := "Cadastro - AXCadastro"
    Local cVldExc := ".T."
    Local cVlDalt:= ".T."

    AXCadastro(cAlias, cTitulo, cVldExc, cVlDalt)     //CRIA��O DE TELA   

RETURN NIL
