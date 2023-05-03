#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*---------------------------------------------------------------------
Faça um Programa que pergunte quanto você ganha por hora e o número de 
horas trabalhadas no mês. Calcule e mostre o total do seu salário no 
referido mês, sabendo-se que são descontados 11% para o Imposto de Renda, 
8% para o INSS e 5% para o sindicato, faça um programa que nos dê:
                        salário bruto.
                        quanto pagou ao INSS.
                        quanto pagou ao sindicato.
                        o salário líquido.
------------------------------------------------------------------------*/

USER FUNCTION EXER08()

    Local nValHr    := ()
    Local nHrTrab   := ()
    Local nImpRe    := ()
    Local nInss     := ()
    Local nSind     := ()
    Local nVlBrut   := ()

    nValHr  := (VAL(FWINPUTBOX("Quanto você ganha por hora? ", "")))
    nHrTrab :=(VAL(FWINPUTBOX("Quantas horas trabalhou neste mês? ", "")))
    nVlBrut := MsgInfo("O seu Salário bruto será de R$ " + CValToChar(nValHr * nHrTrab), "")
    nImpRe := MsgInfo("Será descontado:R$  " + CValToChar((nValHr * nHrTrab) * 0.11) + " de Imposto de Renda.", "")
    nInss := MsgInfo("Será descontado:R$  " + CValToChar((nValHr * nHrTrab) * 0.08)  + " de INSS.", "")
    nSind := MsgInfo("Você pagou:R$  " + CValToChar((nValHr * nHrTrab) * 0.05) + " ao sindicato.", "")
    MsgInfo("Receberá Liquido:R$ " + CValToChar((nValHr * nHrTrab) - nImpRe) , "")


RETURN
