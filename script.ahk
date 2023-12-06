#Requires AutoHotkey v2.0
#SingleInstance Force
InstallMouseHook
InstallKeybdHook
#include FixSocials-AHK/FixSocials.ahk

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


; TODO: update this for AHK2 (there's gotta be much better ways)
; if Cmder isn't running start it, otherwise Cmder will catch this key combo 
;Start_Cmder() {
;        TrayTip, Cmder Running?
;        Process, Exist, Cmder.exe
;        If ! errorlevel
;        {
;          IfExist, C:\cmder\Cmder.exe
;          {
;            TrayTip, Starting Cmder
;            Run, "C:\cmder\Cmder.exe"
;            Sleep 2000
;            TrayTip
;          }
;          Return
;        }
;        else
;        {
;          Return
;        }
;}
;^+`::Start_Cmder()
