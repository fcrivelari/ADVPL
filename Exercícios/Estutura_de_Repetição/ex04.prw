#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*-----------------------------------------------------
Fa�a um programa que leia um nome de usu�rio e a sua 
senha e n�o aceite a senha igual ao nome do usu�rio, 
mostrando uma mensagem de erro e voltando a pedir as 
informa��es.
-----------------------------------------------------*/

USER FUNCTION EXER04()

    Local cUser := ""
    Local cPass := ""
    Local nTent := 0

    WHILE cUser .AND. cPass
    cUser := VAL(FWINPUTBOX("Crie seu Usu�rio: ", ""))
    cPass := VAL(FWINPUTBOX("Crie sua Senha", ""))
        IF cUser == cPass
            Alert("Usu�rio e Senha iguais!!", "Alerta")
            nTent += 1
        ELSE 
            MsgInfo("Usu�rio: " + cValToChar(cUser), "Login")
            MsgInfo("Senha: " + cValToChar(cPass), "Senha")
            nTent := .F.
            EXIT
        ENDIF
    ENDDO
RETURN
        
