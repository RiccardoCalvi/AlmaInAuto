
/*
    Apre il portale di timbrature ed effettua
    il login
*/
openTimbrature(){
    turnOnVpn()
    Run "https://timbratureweb.gruppoalmaviva.it/"
    Sleep 2000
    login()
    Sleep 1000
}

/*
    Apre e attiva la VPN
*/
turnOnVpn(){
    userSetup()
    Run "C:\Program Files (x86)\CheckPoint\Endpoint Connect\TrGUI.exe"
    Sleep 1000 
    Send EnvGet("pass")
    Send "{Enter}"
    Sleep 6000
}

userSetup(){
    while !EnvGet("email"){
        US := InputBox("Inserisci la tua email AlmavivA", "Email", "w320 h240")
        if US.Result = "Cancel"{
            MsgBox "Il valore inserito non e' valido"
            Exit
        }
        else{
            EnvSet "email", US.Value
            break
        }
    }

    while !EnvGet("pass"){
        PW := InputBox("Inserisci la tua password AlmavivA", "Password", "w320 h240 Password")
        if PW.Result = "Cancel"{
            MsgBox "Il valore inserito non e' valido"
            Exit
        }
        else{
            EnvSet "pass", PW.Value
            break
        }
    }
}

login(){
    userSetup()
    Send EnvGet("email")
    Sleep 100
    Send "{Tab}"
    Sleep 100
    Send EnvGet("pass")
    Sleep 100
    Send "{Enter}"
}

