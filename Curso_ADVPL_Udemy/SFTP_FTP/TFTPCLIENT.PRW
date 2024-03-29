#Include 'Totvs.ch'

User Function fUpFile(cFileOrig, nSegundos)
    Local cServer     := "192.168.0.2"
    Local nPort       := 21
    Local cUser       := "totvs12"
    Local cPass       := "072599Fn"
    Local cFTPDest    := "/FTP/"
    Local cDataTemp   := "C:\TOTVS12\Protheus\protheus_data\"
    Local cNameFile   := ""
    Local cFileDest   := ""
    Default cFileOrig := "teste.txt"
    Default nSegundos := 5

    Local sRet
    Local nRet 

    //Se tiver o arquivo e o destino
    If ! Empty(cFileOrig)
         
        oFtp := tFTPClient():New()
         
        //Tenta estabelecer a conex�o
        If oFtp:FTPConnect(cServer, nPort, cUser, cPass) == 0
             
            //Pega apenas o nome do arquivo com a extens�o
            cNameFile := SubStr(cFileOrig, RAt("\", cFileOrig) + 1, Len(cFileOrig))
            cFileDest := cValToChar(Year(Date())) + "_" + StrZero(Month(Date()), 2) + "_" + cNameFile
             
            //Se n�o existir a pasta tempor�ria dentro da Protheus Data, cria elaadmin
            If ! ExistDir(cDataTemp)
                MakeDir(cDataTemp)
            EndIf
             
            //Copia o arquivo origem para dentro da Protheus Data
            //CpyT2S(cFileOrig, cDataTemp)
             
            //Muda o diret�rio do FTP
            If oFtp:ChDir(cFTPDest) == 0
                 
                //Tenta fazer o upload da Protheus Data para o destino no FTP
                nRet := oFtp:SendFile(cNameFile, cFileDest)
                sRet := oFtp:GetLastResponse()
                Conout(sRet)
                If nRet == 0
                sRet := oFtp:GetLastResponse()
                Conout(sRet)
                    //Sleep(nSegundos * 1000)
                     
                    MsgInfo("Arquivo transferido com suceso!", "Importante")
                Else
                    MsgStop("Falha ao copiar o arquivo para o FTP!", "Aten��o")
                EndIf
                 
            Else
                MsgStop("N�o foi poss�vel mudar o diret�rio de Upload!", "Aten��o")
            EndIf
             
            //Fecha a conex�o
            oFtp:Close()
        Else
            MsgStop("Erro de conex�o!", "Aten��o")
        EndIf
    EndIf
Return
