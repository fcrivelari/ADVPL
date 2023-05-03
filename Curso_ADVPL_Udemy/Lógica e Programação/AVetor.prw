#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION AVETOR()


    Local dData := DATE()
    Local aValores := {"João",dData,100}

    Alert(aValores[2]) //Exibe a posição do array
    Alert(aValores[3])

RETURN
