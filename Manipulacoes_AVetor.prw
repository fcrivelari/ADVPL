#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION AVETOR2()

//  ------FUNÇÕES DE MANIPULAÇÃO DE ARRAYS------
/*  AADD() - PERMITE A INSERÇÃO DE UM ITEM EM UM ARRAY JA EXISTENTE
    AINS() - PERMITE A INSERÇÃO DE UM ELEMENTO EM QUALQUER POSIÇÃO DO ARRAY
    ACLONE() - REALIZA A COPIA DE UM ARRAY PARA OUTRO
    ADEL() - PERMITE A EXCLUSÃO DE UM ELEMENTO DO ARRAY, TORNANDO O ULTIMO VALOR
    ASIZE() - REDEFINE A ESTRUTURA DE UM ARRAY PRE-EXISTENTE, ADICIONANDO OU REMOVENDO
    LEN() - RETORNA A QUANTIDADE DE ELEMENTOS DE UM ARRAY
*/

    Local aVetor := {10,20,30}
    //Local nCount

    //Aadd(aVetor, 40)
    //Alert(Len(aVetor))

    //AINS(aVetor,2)
    //aVetor[2] := 200
    //Alert(aVetor[2])

/*aVetor2 := ACLONE(aVetor)
        FOR nCount := 1 TO LEN(aVetor2)
            Alert(aVetor2[nCount])

        NEXT nCount
*/

/*    ADEL(aVetor,2)
    Alert(aVetor[3])
    Alert(LEN(aVetor))
*/

    ASIZE(aVetor,2)
    Alert(LEN(aVetor))

RETURN
