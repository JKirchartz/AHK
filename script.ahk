#Requires AutoHotkey v2.0
#SingleInstance Force
InstallMouseHook
InstallKeybdHook
#include *i %A_LineFile%\../FixSocials-AHK/FixSocials.ahk

; use mouse sidebutton as turbo auto-clicker
XButton1:: {
 SetKeyDelay 20, 20
 While GetKeyState(ThisHotkey , "P")
 SendEvent '{LButton}'
}

; AHK Escape Hatch
F10:: ExitApp

; Capslock is Escape
CapsLock::Esc
; unless you use the windows key
#CapsLock::Capslock

; set win-space to open search (like a mac)
#Space::#s

; Easy task manager access
#t::Run "taskmgr"

; Define the hotkey (Ctrl + `)
^`::ToggleCmder()

; Function to toggle Cmder visibility
ToggleCmder() {
    ; Check if Cmder is running
    if (ProcessExist("Cmder.exe")) {
        ; Send the hotkey to toggle Cmder visibility (Ctrl + `)
        Send({Ctrl Down}`{Ctrl Up})
    } else {
        ; Run Cmder if not already running
        Run "C:\cmder\Cmder.exe"
    }
}

; Function to check if a process is running
ProcessExist(ProcessName) {
    Process Exist, ProcessName
    return ErrorLevel
}
