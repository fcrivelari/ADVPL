#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*---------------------------------------------------------------
Faça um programa, com uma função que necessite de três argumentos, 
e que forneça a soma desses três argumentos.
---------------------------------------------------------------*/

USER FUNCTION EXER01()
    Local nArg1 := RANDOMIZE( 1,100 )
    Local nArg2 := RANDOMIZE( 1,100 )
    Local nArg3 := RANDOMIZE( 1,100 )

    MsgInfo(nArg1)
    MsgInfo(nArg2)
    MsgInfo(nArg3)

    MsgAlert(nArg1 + nArg2 + nArg3, "A soma dos Valores é:")

RETURN

