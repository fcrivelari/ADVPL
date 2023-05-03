#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*---------------------------------------------------------------------
Fa�a um Programa que pergunte quanto voc� ganha por hora e o n�mero de 
horas trabalhadas no m�s. Calcule e mostre o total do seu sal�rio no 
referido m�s, sabendo-se que s�o descontados 11% para o Imposto de Renda, 
8% para o INSS e 5% para o sindicato, fa�a um programa que nos d�:
                        sal�rio bruto.
                        quanto pagou ao INSS.
                        quanto pagou ao sindicato.
                        o sal�rio l�quido.
------------------------------------------------------------------------*/

USER FUNCTION EXER08()

    Local nValHr    := ()
    Local nHrTrab   := ()
    Local nImpRe    := ()
    Local nInss     := ()
    Local nSind     := ()
    Local nVlBrut   := ()

    nValHr  := (VAL(FWINPUTBOX("Quanto voc� ganha por hora? ", "")))
    nHrTrab :=(VAL(FWINPUTBOX("Quantas horas trabalhou neste m�s? ", "")))
    nVlBrut := MsgInfo("O seu Sal�rio bruto ser� de R$ " + CValToChar(nValHr * nHrTrab), "")
    nImpRe := MsgInfo("Ser� descontado:R$  " + CValToChar((nValHr * nHrTrab) * 0.11) + " de Imposto de Renda.", "")
    nInss := MsgInfo("Ser� descontado:R$  " + CValToChar((nValHr * nHrTrab) * 0.08)  + " de INSS.", "")
    nSind := MsgInfo("Voc� pagou:R$  " + CValToChar((nValHr * nHrTrab) * 0.05) + " ao sindicato.", "")
    MsgInfo("Receber� Liquido:R$ " + CValToChar((nValHr * nHrTrab) - nImpRe) , "")


RETURN
