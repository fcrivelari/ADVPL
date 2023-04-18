#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION OPERADOR ()

    Local nNum1 := 10
    Local nNum2 := 20
    //OPERADORES MATEMATICOS
    //Alert(nNum1 + nNum2)
    //Alert(nNum2 - nNUm1)
    //Alert(nNum1 * nNum2)
    //Alert(nNum2 / nNum1)
    //Alert(nNum2 % nNum1)

    //OPERADORES RELACIONAIS
    Alert (nNum1 < nNum2)
    Alert (nNum1 > nNum2)
    Alert (nNum1 = nNum2)
    Alert (nNum1 == nNum2)
    Alert (nNum1 <= nNum2)
    Alert (nNum1 >= nNum2)
    Alert (nNum1 != nNum2)

    //OPERADORES DE ATRIBUIÇÃO
    nNum1 := 10 //ATRIBUIÇÃO SIMPLES
    nNum1 += nNum2 //nNum1 = nNum1 + nNum2
    nNum2 -= nNum1 //nNum2 = nNum2 - nNum1
    nNum1 *= nNum2 //nNum1 = nNum1 * nNum2
    nNum2 /= nNum1 //nNum2 = nNum2 / nNum1
    //nNum2 %= nNum1 //nNum2 = nNum2 % nNum1
    
RETURN
