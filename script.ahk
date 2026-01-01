#Requires AutoHotkey v2.0
#SingleInstance Force
InstallMouseHook
InstallKeybdHook
#include *i %A_LineFile%\../FixSocials-AHK/FixSocials.ahk
#Warn VarUnset, off

; use mouse sidebutton as turbo auto-clicker
^+LButton::
{
  SetKeyDelay 20, 20
  while GetKeyState("LButton", "P")
  {
    SendEvent '{LButton}'
  }
}

; AHK Escape Hatch
F10:: ExitApp

; Capslock is Escape
; CapsLock::Esc
; unless you use the windows key
; #CapsLock::Capslock
; outright swap esc & capslock like setxkbmap -option caps:swapescape
CapsLock::Esc
Esc::CapsLock

; set win-space to open search (like a mac)
#Space::#s

; try to use caps/a to trigger windows' window-manager
; Esc+a::#z

; one-finger lockscreen
#z::#l

; Easy task manager access
#t::Run "taskmgr"

; Define the hotkey (Ctrl + `)
; ^+`::ToggleCmder()

; Function to toggle Cmder visibility
; ToggleCmder() {
;    ; Check if Cmder is running
;    if (ProcessExist("Cmder.exe") OR ProcessExist("ConEmu64.exe")) {
;        ; Send the hotkey to toggle Cmder visibility (Ctrl + `)
;        Send "^``"
;    } else {
;          ; Run Cmder if not already running
;          Run "C:\tools\Cmder\Cmder.exe"
;    }
; }

^`::ToggleMT()

ToggleMT() {
	if (WinExist("ahk_exe WindowsTerminal.exe")){
            if (WinActive("ahk_exe WindowsTerminal.exe")) {
              WinMinimize "ahk_exe WindowsTerminal.exe"
            } else if (!WinActive("ahk_exe WindowsTerminal.exe")) {
              WinActivate "ahk_exe WindowsTerminal.exe"
	    }
        } else {
	  Run(EnvGet("LocalAppData") . "\Microsoft\WindowsApps\wt.exe")
	}
}
