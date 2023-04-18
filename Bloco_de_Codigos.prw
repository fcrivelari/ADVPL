#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION BLOCO()

/*Local bBloco := {|| Alert("Ola Mundo!")}
    EVAL(bBloco)
*/

//PASSAGEM POR PARAMETROS - BLOCO DE CÓDIGOS
    Local bBloco := {|cMsg| Alert(CMsg)}
    EVAL(bBloco,"Olá Mundo!")

RETURN

