#include functions\util.ahk
#include functions\vscode.ahk

#HotIf WinActive('ahk_class CabinetWClass')
PgUp::{
    openVscode()
}
#HotIf

PgDn::{
    Run "C:/Program Files/Git/git-bash.exe"
}

^!l::{
    writeLog()
}

; Apre Tasks
^!t::{
    Run "https://tasks.office.com"
}

; Apre DevOps
^!d::{
    Run "https://dev.azure.com/DEV-PA"
}

; Apre MyAlmaviva
^!a::{
    Run "https://myalmaviva.it"
}

; Crea un Waypoint
^!Up::{
    waypoint()
}

; Ritorna all'ultimo waypoint
^!Down::{
    waystone()
}

; Effettua l'accesso alla piattaforma timbrature
^!z::{
    openTimbrature()
}

; Attiva la VPN
^!v::{
    turnOnVpn()
}

; Scrive le credenziali
^!u::{
    login()
}

; Resetta le credenziali utente
^!r::{
    EnvSet "pass"
    EnvSet "email"
}