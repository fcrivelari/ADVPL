#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*---------------------------------------------------------------
Fa�a um programa, com uma fun��o que necessite de tr�s argumentos, 
e que forne�a a soma desses tr�s argumentos.
---------------------------------------------------------------*/

USER FUNCTION EXER01()
    Local nArg1 := RANDOMIZE( 1,100 )
    Local nArg2 := RANDOMIZE( 1,100 )
    Local nArg3 := RANDOMIZE( 1,100 )

    MsgInfo(nArg1)
    MsgInfo(nArg2)
    MsgInfo(nArg3)

    MsgAlert(nArg1 + nArg2 + nArg3, "A soma dos Valores �:")

RETURN

