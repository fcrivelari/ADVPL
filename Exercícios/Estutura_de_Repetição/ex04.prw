#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/*-----------------------------------------------------
Faça um programa que leia um nome de usuário e a sua 
senha e não aceite a senha igual ao nome do usuário, 
mostrando uma mensagem de erro e voltando a pedir as 
informações.
-----------------------------------------------------*/

USER FUNCTION EXER04()

    Local cUser := ""
    Local cPass := ""
    Local nTent := 0

    WHILE cUser .AND. cPass
    cUser := VAL(FWINPUTBOX("Crie seu Usuário: ", ""))
    cPass := VAL(FWINPUTBOX("Crie sua Senha", ""))
        IF cUser == cPass
            Alert("Usuário e Senha iguais!!", "Alerta")
            nTent += 1
        ELSE 
            MsgInfo("Usuário: " + cValToChar(cUser), "Login")
            MsgInfo("Senha: " + cValToChar(cPass), "Senha")
            nTent := .F.
            EXIT
        ENDIF
    ENDDO
RETURN
        
