#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION AVETOR()


    Local dData := DATE()
    Local aValores := {"Jo�o",dData,100}

    Alert(aValores[2]) //Exibe a posi��o do array
    Alert(aValores[3])

RETURN
