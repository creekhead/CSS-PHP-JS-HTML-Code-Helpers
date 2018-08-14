;NOTES: This file is a collection of all kinds of hotkeys, it is a mess but has some gems in it as well...

; #  	WIN
; ! 	Alt
; ^ 	Control
; + 	Shift
; & Combine 2
;[===========================]
;[  		KEY REF			 ]
;[ ^ CTRL|! ALT|+ SHIFT # WIN]
;[===========================]
;Include other scripts
#Include mainScript_moveWindows.ahk
#Include mainScript_menus.ahk

!^a::
send {ctrl down}l{ctrl up}
clipboard = javascript:if(location.search=='?lang=cn'||location.host=='on-stage.com.cn'||location.search=='?lang=cn/'){location='http://'+((location.host=='on-stage.com.cn')?webdev1:811/?lang=cn'+location.pathname+location.hash:'on-stage.com.cn'+location.pathname+location.hash);}else if(location.host=='on-stage.com'||location.host=='webdev1:811'){location='http://'+((location.host=='on-stage.com')?'webdev1:811':'on-stage.com')+location.pathname+location.search+location.hash;}else{location='http://'+((location.host=='tmppro.com')?'webdev1:81':'tmppro.com')+location.pathname+location.search+location.hash;}
Send ^v
send {Enter}
return


!^x::
SetKeyDelay, 10
Click, right
SetKeyDelay, 50
send {Down}
sleep,1
send {Down}
sleep,1
send {Down}
sleep,1
send {Down}
sleep,1
send {Down}
sleep,1
send {Down}
sleep,1
send {Down}
sleep,1
send {Enter}
return

;ADD ICON: `
global mainIconPath := H_Compiled || A_IsCompiled ? A_AhkPath : "C:\Users\pk\Documents\autoHotKey\icons\ANDY.ICO"
Menu, tray, icon, % mainIconPath

Mbutton::
send ^{f5}
return


*CapsLock::Return

;SIMPLE MOVE WINDOW TEST
;#^e::WinMove,A,,100,0,1205,770


^f1::
SendRaw `;[===========================]`r;[       `` KEY REF ``       ]`r;[^CTRL - !ALT - +SHFT - #WIN]`r;[---------------------------]`r;[         NAMEOFFUNC        ]`r;[===========================]`r
return

;[===========================]
;[          KEY REF          ]
;[^CTRL - !ALT - +SHFT - #WIN]
;[---------------------------]
;[  PRINTSCREEN SCREENSHOT   ]
;[===========================]
PrintScreen::
IfWinExist, Snipping Tool
{
    ;SNIPPINGTOOL FOUND
    WinActivate ; use the window found above
    send {Ctrl Down}N{Ctrl Up}
    return
}
else
    ;SNIPPINGTOOL NOT RUNNING
    Run, "C:\windows\system32\SnippingTool.exe"
    WinWait, Snipping Tool, , 3
    if ErrorLevel
    {
        MsgBox, WinWait timed out.
        return
    }
    send {Ctrl Down}N{Ctrl Up}
return

;WINDOWS K, TEST
#k::
Run, C:\Program Files (x86)\FileSeek\FileSeek.exe
return

;Open notepad2
+^v::
Run, C:\Windows\Notepad2.exe
sleep,200
Send ^v
return


CloseCurentWindow()
{
  ;WinGetClass, class, A
  ;WinGet, processname, ProcessName, A
  ;MsgBox, Trying to close process: %Processname%`r`Current classname: %class%
  WinGet, processname, ProcessName, A

      if (Processname = "firefox.exe" OR Processname = "chrome.exe" OR Processname = "iexplore.exe" OR Processname = "sublime_text.exe" OR Processname = "ApplicationFrameHost.exe" )
      {
        ;MsgBox Found "%Processname%"
        ;It is a browser
        send ^{w}
      }else if (Processname = "cmd.exe"){
        ;MsgBox CMD Detected
        send !{space}
        sleep,50
        send C
      }else if (Processname = "ConEmu64.exe"){
        ;MsgBox ConEmu64
        send #!{del}
        sleep,50
        send C
      }else{
        send !{f4}
        return
        ;It is NOT A BROWSER, browser detection is hit or miss, at least for now
        MsgBox, 4, , Close this APPLICATION?, 5  ; 5-second timeout.
        IfMsgBox, No
            Return  ; User pressed the "No" button.
        IfMsgBox, Timeout
            Return ; i.e. Assume "No" if it timed out.
        ; Otherwise, continue:
        ;close it
        send !{f4}
      }

}


;[===========================]
;[^CTRL - !ALT - +SHFT - #WIN]
;[---------------------------]
;Close whatever
^q::
CloseCurentWindow()
return

^!q::
CloseCurentWindow()
return

;Close current window, with name of process
+^q::
WinGetClass, class, A
WinGet, processname, ProcessName, A
MsgBox, Trying to close process: %Processname%`r`Current classname: %class%

CloseCurentWindow()
return

;Close whatever
;^q::
;Send !{f4}
;return


;[=======================]
;[  CTRL ALT + V 			 ]
;[  PASTE WITH QUOTES	 ]
;[=======================]
+^!v::
Send "%Clipboard%"
return

;[==============================START==============================]

;[=======================]
;[  WIN + X 			 ]
;[  RUN CMD 			 ]
;[=======================]
#x::
run E:\onedrive-pkfrizzlefry\OneDrive\1-helpfulSoftware\_COMPRESS_JS\r.bat

;[=======================]
;[  WIN + C				 ]
;[  RUN CMD IN CURRENT	 ]
;[=======================]
#c::
OpenCmdInCurrent()
return

OpenCmdInCurrent()
{
    WinGetText, full_path, A  ; This is required to get the full path of the file from the address bar

    ; Split on newline (`n)
    StringSplit, word_array, full_path, `n
    full_path = %word_array1%   ; Take the first element from the array

msgbox %full_path%

    ; Just in case - remove all carriage returns (`r)
    StringReplace, full_path, full_path, `r, , all

    IfInString full_path, \
    {
        Run, cmd /K cd /D "%full_path%"
    }
    else
    {
        Run, cmd /K cd /D "C:\ "
    }

}




;[=======================]
;[  CTRL+HELP			 ]
;[  SHOW HELP FILE		 ]
;[=======================]
!h::
showHelpFunction()
Text = AHK HELP !H
showTip(text)
return

#h::
showHelpFunction()
Text = AHK HELP #H
showTip(text)
return

^h::
showHelpFunction()
Text = AHK HELP ^H
showTip(text)
return

;HELP Script, show a popup with a command listing to help remember the shortcuts
;READS ahk_help.ahk in My Documents
;REMIND ME of how its done
showHelpFunction(){

	;Create the ListView with two columns, Name and Size:
	Gui, Add, ListView, xm r30 w700 gMyListView, Key|Description|Shortcut

	Gui, Add, Button, x+20 greloadView, Reload View
	Gui, Add, Button, r1 gshowHotKey, Show HotKey
	Gui, Add, Link,, Autohotkey Docs: <a href="https://autohotkey.com/docs/AutoHotkey.htm">AHK Online docs</a>
	Gui, Add, Link,, Autohotkey Dir: <a href="C:\Users\pk\Documents\autoHotKey">Directory </a>


	Gui, Add, Text, w400 , Hotkeys:`n# 	WIN`n! 	Alt`n^ 	CTRL`n+ 	Shift
	Gui, Add, Text, w400 , Mouse:
	Gui, Font, S8 CDefault Bold, Verdana
	Gui, Add, Text, w400 , MIDDLEBUTTON`tREFRESH`nWIN LClick`tDrag`nWIN RClick`tResize`nCtrlAlt RClick`tClose

;QUICK ACTION BUTTONS IN HELP
	Gui, Add, Text, w400 , CTRL+1`tPROJECT FOLDER`nCTRL+2`tIEXPLORE`nCTRL+3`tONENOTE`n`t`nALT+1`t`tPROCESS EXPLORER`nALT+2`t`tPROCESS HACKER`nALT+3`t`tTASK MANAGER`nALT+4`t`tDIR MONITOR`n

	;RESIZE TEXT
  ;Gui, Add, Text, x6 y455 w450 h40 , PDF MOVER1 -->

	;Gui, Add, Text, w400 , GEAR:`n`tCLICK 	INSPECT`n`tUP 	?? COPY n FIREFOX`n`tDOWN 	HELP`n`tLEFT 	CLOSE SOMETHING`n`tRIGHT 	REFRESH CSS

Gui, Font, S24 CDefault Bold Italic, Verdana
;Gui, Add, Text, x6 y455 w450 h40 , PDF MOVER2 -->
	loadHelpFromFile()

	return
}

loadHelpFromFile(){

	; Gather a list of file names from a folder and put them into the ListView:Load

	Loop, read, %A_MyDocuments%\autoHotKey\ahk_help.ahk
	{
		LineNumber = %A_Index%
		Loop, parse, A_LoopReadLine, CSV,`r,`n
		{
			if A_Index = 1
				  key = %A_LoopField%
			if A_Index = 2
				  desc   = %A_LoopField%
			if A_Index = 3
				  shortCut   = %A_LoopField%
			if A_Index > 3
				  shortCut   = %shortCut% , %A_LoopField%

			IfMsgBox, No
				return
		}
		LV_Add("", key, desc, shortCut)
		key =
		desc =
		shortCut =

	}


	LV_ModifyCol()  ; Auto-size each column to fit its contents.
	;LV_ModifyCol(2, "Integer")  ; For sorting purposes, indicate that column 2 is an integer.

	LV_ModifyCol(1,70)
	LV_ModifyCol(2,250)
	LV_ModifyCol(3,500)

	Gui, Show
	return

<!--	<?PHP-->
}

reloadView:
	Gui Destroy
	showHelpFunction()
return

showHotKey:
	MsgBox  #  WIN`n! 	Alt`n^ 	CTRL`n+ 	Shift`n`n& Combine 2
return

MyListView:
	if A_GuiEvent = DoubleClick
	{
		LV_GetText(shortDesc, A_EventInfo, 3)

		testShortCut   = %shortDesc%
		StringReplace, testShortCut, testShortCut, ^, `n, All

    MsgBox %testShortCut%

		;Send {Alt Space}
		;Send {lalt z}
		;Send {ALT z}

	}

return

;[=======================]
;[ DONE WITH HELP		 ]
;[=======================]

;
;[=======================================================]
;[ REMAP WIN ALT EnTER so MEDIA CENTER STOPS LOADING	 ]
;[=======================================================]
;#!ENTER::Run Y:\

;[=======================================================]
;[ 		F9 reload style sheet (addon for FireFox)		 ]
;[=======================================================]
`::Send {F9}


;[===============================================]
;[  		START CONSOLELOG					 ]
;[===============================================]
;CONSOLELOG copy variable, move one line down and paste
;!b::
;Send ^c
;clipboard=%Clipboard%
;Send {Down}{Enter}{Up}
;Send console.log('clipboard',clipboard);
;return

;CONSOLELOG in CONSOLE.LOG
!z::Send if(whatever){{}`nconsole.log('YES');`n{}}else{{}`nconsole.log('NO');`n{}}
Text = ALT+Z
showTip(text)
return

;CONSOLELOG in CONSOLE.LOG
!v::
Send console.log('%Clipboard%',%Clipboard%);{enter}
Text = ALT+V - CONSOLE.LOG
showTip(text)
return

;CONSOLELOG in CONSOLE.LOG
;^!c::
;Send console.log('HERE',el);{left}{left}{left}{left}{left}{left}
;Text = ALT+C - CONSOLE.LOG
;;showTip(text)
;return


;CONSOLELOG:PROFILE START
^![::
Send console.profile("TITLE: ");{left}{left}{left}
return

;CONSOLELOG:PROFILE END
^!]::
Send console.profileEnd();{left}{left}{left}
return

;CONSOLELOG: CLIPBOARD
!x::
SetKeyDelay, 0
send, ^c
Send {End}
;Send {del}
Send {enter}
Send console.log('%Clipboard%',%Clipboard%);
SetKeyDelay, 10
Text = ALT+X - CONSOLE.LOG
showTip(text)
return

;CONSOLELOGL: FOREACH JQ
!b::Send $.each($('.themeName'),function(count,el){{}`r`console.log('Count: count - Element: el');`r`{}});
Text = CJQUERY FOREACH
showTip(text)
return


;CTRL enter...  <BR> tag
^\::
Send <br/>
Text = BR TAG
showTip(text)
return

;CTRL enter...  <HR> tag
^]::
Send <hr/>
Text = HR TAG
showTip(text)
return

!d::
Text = CTRL+D
showTip(text)
Send ^c
Send {End}
Send {enter}
Send console.debug('%Clipboard%',%Clipboard%);
return

;[===============================================]
;[  			END CONSOLELOG					 ]
;[===============================================]




;[===========================]
;[  WIN+V					 ]
;[  RUN VIRUSTOTAL	 ]
;[===========================]
#v::
Text = WIN+V
showTip(text)
Run, C:\Program Files\Mozilla Firefox\firefox.exe http://virustotal.com
return

;[===========================]
;[  CTRL+F1					 ]
;[  AUTOHOTKEY QUICK HELP	 ]
;[===========================]
;CTRL-F1 AUTOHOTKEY QUICK HELP
#f1::
Text = CTRL+F1
showTip(text)
Run http://www.autohotkey.com/docs/KeyList.htm
return

;[=======================]
;[  CTRL+G				 ]
;[  COPY AND GOOGLE IT	 ]
;[=======================]
;^G::
;Text = CTRL+G
;showTip(text)
;Send ^c
;Sleep, 2000
;Run, http://www.google.com/search?q=%Clipboard%
;return

;[=======================]
;[  CTRL+'				 ]
;[  ADD /* */			 ]
;[=======================]
^'::
Send ^c
frontClipboard = /*`n
backClipboard = */`n
clipboard = %frontClipboard%%clipboard%`n%backClipboard%
Send ^v
Text = CTRL+' -- ADD /* */
showTip(text)
return

;[=======================]
;[  WIN+?				 ]
;[  ADD // TO LINES		 ]
;[=======================]
^/::
Send ^c
newClipboard =
Loop, parse, clipboard, `n, `r
{
    ;MsgBox,  LINE:%A_LoopField%
	newClipboard = %newClipboard%//%A_LoopField%`n
}
clipboard = %newClipboard%
Send ^v
Text = CTRL+? -- ADD //
showTip(text)
return

;[=======================]
;[  WIN+.				 ]
;[  ADD <!-- TEXT -->	 ]
;[=======================]
^;::
Send ^c
frontClipboard = <!--
backClipboard = -->
clipboard = %frontClipboard%%clipboard%%backClipboard%
Send ^v
Text = CTRL+C -- ADD <!-- --?
showTip(text)
return


;[=======================]
;[  CTRL+SHIFT+T
;[  INSPECT ELEMENT		 ]
;[=======================]
;^+T::
;Send {Escape}
;Send ^+C
;Text = Inspect
;showTip(text)

;return

;[===============END OF FILE================]

;HELP ME
; #  	WIN
; ! 	Alt
; ^ 	Control
; + 	Shift
; & Combine 2

;[===============================]
;[  SHOW TOOLTIP script changes	 ]
;[===============================]
showTip(text){
	SetTimer, ToolTipTimer, 10  ;timer routine will occur every 10ms..
	Sleep, 1000 ;wait for one second..
	SetTimer, ToolTipTimer, off ;..before turning off timer..
	ToolTip   ;clear tooltip..
	return
}

ToolTipTimer:
ToolTip, %Text%
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return

;[=======================]
;[  WIN + U 			 ]
;[  TINYURL 			 ]
;[=======================]
#u::
copyofclipboard:=clipboard
clipboard=
sendinput,^c
clipwait
run http://tinyurl.com/create.php?url=%clipboard%
sleep,5000
sendinput,!a
clipwait
tooltip TINIED: %clipboard%
SetTimer, RemoveToolTip, 5000
return

;[=======================]
;[  WIN + Just			 ]
;[  JQERYify THIS PAGE	 ]
;[=======================]
#j::
SetKeyDelay, 0
Send, ^a ; Select all
Send, {del} ; Select all
Send var s=document.createElement('script');{Enter}
Send s.setAttribute('src','http://code.jquery.com/jquery.js');{Enter}
Send document.getElementsByTagName('body')[0].appendChild(s);{Enter}
Send, ^a ; Select all
Send, ^{Enter} ; Select all
SetKeyDelay, -1
return

;[===========================================================]
;[===    				CMD WINDOW SCRIPTS	 		      ===]
;[===========================================================]

;[===================]
;[  Ctrl+V 			 ]
;[  CMD PASTE		 ]
;[===================]
#IfWinActive ahk_class ConsoleWindowClass
^V::
SendInput {Raw}%clipboard%
return
#IfWinActive

;[===========================================================]
;[  Ctrl+Z													 ]
;[  CMD UNDOO (Count CLIPBOARD then backspace on count)		 ]
;[===========================================================]
#IfWinActive ahk_class ConsoleWindowClass
^Z::
clippy = %clipboard%
StringLen, length, clippy

clipCount = %length%

Loop, %clipCount%
{
    send {bs}
}
#IfWinActive

;[===============================]
;[  AutoReload script changes	 ]
;[===============================]
~^s::
SetTitleMatchMode, 2   ;--- works in ANYTHING displaying scripts name as ANY part of the window title
IfWinActive,%A_ScriptName%
{
  SplashImage , ,b1 cw008000 ctffff00, %A_ScriptName%, Reloaded
  Sleep,750
  SplashImage, Off
  Reload
}
return

;HELP ME
; #  	WIN
; ! 	Alt
; ^ 	Control
; + 	Shift
; & Combine 2


;[=======================]
;[  CTRL+SHIFT+;
;[  FOLD ALL	 ]
;[=======================]
^,::

Send {Ctrl Down}k2{Ctrl Up}
return




;[===========================]
;[          KEY REF          ]
;[^CTRL - !ALT - +SHFT - #WIN]
;[---------------------------]
;[         AUTO SAVE         ]
;[===========================]

^1::
run C:\Windows\explorer.exe "C:\Users\pk\Documents\15-SUBLIME PROJECTS"
return

^2::
run C:\Program Files\Internet Explorer\iexplore.exe
return

^3::
run, "C:\Program Files (x86)\Microsoft Office\root\Office16\ONENOTE.EXE" "/hyperlink" "onenote:https://musicpeopleinc.sharepoint.com/personalsites/pk/OneNote/Peter`%20Kujawa/"
return

^4::
run, "C:\Program Files (x86)\Microsoft Office\root\Office16\ONENOTE.EXE" "/hyperlink" "onenote:https://d.docs.live.net/08b8dd40a9009f57/Documents/PCNC`%20Notebook/"
return

!1::
run E:\onedrive-pkfrizzlefry\OneDrive\1-helpfulSoftware\_BATCHME\Sysinternals_2015\procexp.exe
return

!2::
run C:\Program Files\Process Hacker 2\ProcessHacker.exe
return

!3::
run C:\Windows\System32\taskmgr.exe
return

!4::
run C:\Program Files\DevEnterprise\Directory Monitor 2\DirectoryMonitor.exe
return


^space::
send {Ctrl Down}.{Ctrl Up}
return

;[===========================]
;[        KEY REF       	 ]
;[^CTRL - !ALT - +SHFT - #WIN]
;[---------------------------]
; TRANSPARENCY
#T::
    DetectHiddenWindows, on
    WinGet, curtrans, Transparent, A
    if ! curtrans
        curtrans = 255
    newtrans := curtrans - 64
    if newtrans > 0
    {
        WinSet, Transparent, %newtrans%, A

    }
    else
    {
        WinSet, Transparent, 255, A
        WinSet, Transparent, OFF, A
    }
    return

; ALWAYS ON TOP
#a:: Winset, AlwaysOnTop, Toggle, A

;RESET TRANSPERENCY
#o::
	WinSet, Transparent, 255, A
	WinSet, Transparent, OFF, A
return

;SET MOUSEMOVE ON/OFF
^!k::
SetTimer, MoveMouse, 500
return

^!l::
SetTimer, MoveMouse, Off
return

MoveMouse:
    MouseMove, 1, 0, 1, R ;Move the mouse one pixel to the right
	Sleep, 50 ; Wait 50 ms. Not realy required, but makes the move visible
    MouseMove, -1, 0, 1, R ;Move the mouse back one pixel
return

;[===========================]
;[        KEY REF       	 ]
;[^CTRL - !ALT - +SHFT - #WIN]
;[---------------------------]
;[ MOVE AND RESIZE WINDOWS   ]
;[      MOUSE COMMANDS       ]
;[===========================]

; CTRL ALT + H TOGGLES HIDDEN FILES
^!h::
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
if (HiddenFiles_Status = 2){
  RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
  ;msgbox 'Hiden files ON'
}else{
  RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
  ;msgbox 'Hiden files OFF'
}
send, {F5}

Return





;[===========================]
;These are functional nut not really used
;[===========================]
#w::
	DetectHiddenWindows, on
	WinSet, TransColor, Black 0, A
return

#g::  ; Press Win+G to show the current settings of the window under the mouse.
	MouseGetPos,,, MouseWin
	WinGet, Transparent, Transparent, ahk_id %MouseWin%
	WinGet, TransColor, TransColor, ahk_id %MouseWin%
	ToolTip Translucency:`t%Transparent%`nTransColor:`t%TransColor%
return


;This detects "double-clicks" of the alt key.
;[===========================]

; ON DOUBLE CLICK CTRL, CLOSE WINDOW
;If !DoubleAlt
;	{
;	}
;~Alt::
;DoubleAlt := A_PriorHotKey = "~Alt" AND A_TimeSincePriorHotkey < 400
;Sleep 0
;KeyWait Alt  ; This prevents the keyboard's auto-repeat feature from interfering.
;return


;TEST FUNCTION
;SHIFT CTRL Whatever
+^r::
  MsgBox TEST
Return

+^j::
msgbox test
return


;GET CURRENT PROGRAM NAME OF Autohotkey Class
+^o::
WinGetClass, class, A
;MsgBox, The active window's class is "%class%".
WinGet, processname, ProcessName, A
;MsgBox The active window's class is "%Processname%".
MsgBox Active class: %class%`r`Current process: %Processname%
clipboard = Active class: %class%`r`Current process: %Processname%
return

;Send date in OneNote
#IfWinActive ahk_class Framework::CFrame
^D::Send +!{f}
return

;Not sure this one ever worked well
;Close notepad2
;#IfWinActive ahk_class Notepad2
;msgbox tes
;Send !{f4}
;Return


;[===========================]
;[        KEY REF        ]
;[^CTRL - !ALT - +SHFT - #WIN]
;[---------------------------]


