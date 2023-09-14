point := ""

/*
    Crea un id casuale e crea un commento nella riga
    inferiore all'attuale contenente l'id
*/
waypoint(){
    global point := Random(1000000000000000,9999999999999999)
    Send "{End}{Enter}"
    Send Format("/* Waypoint: {1} */", point)
}

/*
    Cerca nel file attuale l'ultimo id generato
    e porta il cursore nella riga corretta, 
    successivamente elimina il waypoint
*/
waystone(){
    if point {
        Send "^f"
        Send Format("/* Waypoint: {1} */", point)
        Sleep 500
        Send "{Esc}^+k"
    }
}

/*
    Crea una riga sotto alla parola selezionata e la inserisce
    in un console.log(); di JavaScript
*/
writeLog(){
    A_Clipboard := ""
    Send "^c"
    ClipWait (1,1)
    Send "{End}{Enter}"
    Send Format("console.log({1});", A_Clipboard)
    A_Clipboard := ""
}

/*
    Avvia un'istanza di VSCode in base alla cartella
    nella quale viene richiamata la funzione
*/
openVscode(){
    ComObject("WScript.Shell").Exec(A_ComSpec " /C code " getCurrentPath())
}

/*
    Ritorna la path della cartella attuale
*/
getCurrentPath(hwnd := 0) {
    Static winTitle := 'ahk_class CabinetWClass'
    hWnd ?    explorerHwnd := WinExist(winTitle ' ahk_id ' hwnd): ((!explorerHwnd := WinActive(winTitle)) && explorerHwnd := WinExist(winTitle))
    If explorerHwnd
        For window in ComObject('Shell.Application').Windows
            Try If window && window.hwnd && window.hwnd = explorerHwnd
                Return window.Document.Folder.Self.Path
            Return False
}