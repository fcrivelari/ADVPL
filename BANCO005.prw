#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION BANCO005()

    Local aArea := GetArea()
    Local aDados := {}
    Private lMSErroAuto
/*MSGEXECAUTO: PERMITE MANIPULAR MAIS DE UMA TABELA EM UM �NICO C�DIGO, 
               USADA PARA MANIPULAR,COMO ALTERAR OU INCLUIR OS DADOS NAS TABELAS PADR�ES,
               TEM ALGUMAS VARIAVEIS PRE-DEFINIDAS
*/

    //ADICIONANDO DADOS AO VETOR DA TABELA SB1990
    aDados := {;
                {"B1_COD", "0003",                  NIL}, ;
                {"B1_DESC", "PRODUTO GEN�RICO TWO", NIL},;
                {"B1_TIPO", "GG",                   NIL},;
                {"B1_UM", "PC",                     NIL},;
                {"B1_LOCPAD", "01",                 NIL},;
                {"B1_PICM", 0,                      NIL},;
                {"B1_IPI", 0,                       NIL},;
                {"B1_CONTRAT", "N",                 NIL},;
                {"B1_LOCALIZ", "N",                 NIL};
                }


    BEGIN TRANSACTION
        //CHAMA CADASTRO DO PRODUTO
        MsExecAuto({|x,y|MATA010(x,y)},aDados,3)                        //C�DIGOS DE ALTERA��ES 3=INCLUS�O, 4=ALTERA��O, 5=EXCLUS�O
    
    //CASO OCORRA ALGUM ERRO
    IF lMSErroAuto 
        Alert("Ocorreram erros durante a opera��o!")
        MostraErro()

        DisarmTransaction()
        
    ELSE
        MsgInfo("Opera��o Finalizada", "Aviso")

    ENDIF

    END TRANSACTION

    RestArea(aArea)

RETURN
