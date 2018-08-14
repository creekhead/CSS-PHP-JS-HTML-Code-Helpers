;[===========================]
;[          KEY REF          ]
;[^CTRL - !ALT - +SHFT - #WIN]
;[---------------------------]
;[     COMPUTER MGMT MENU    ]
;[===========================]

;CTRL ALT C - START QUICK LINKS GUI BOX
^!c::

Gui, New
Gui, Add, Button, gServices x10 y+5 w150, Services
Gui, Add, Button, gCompMgmt x10 y+5 w150, CompMgmt
Gui, Add, Button, gTaskm x10 y+5 w150, Taskmgmt
Gui, Add, Button, gNet x10 y+5 w150, Network
Gui, Add, Button, gSound x10 y+5 w150, Sound Control
Gui, Add, Button, gSpeakers x10 y+5 w150, Speakers - ON
Gui, Add, Button, gSpdif x10 y+5 w150, SPDIF - ON
Gui, Add, Button, gProhack x10 y+5 w150, Process Hacker
Gui, Add, Button, gProhackExp x10 y+5 w150, Process Explorer
Gui, Add, Button, gProcExp x10 y+5 w150, Process_Explorer_64
Gui, Add, Button, gResMon x10 y+5 w150, Resource_Monitor
Gui, Show
return

Services:
run services.msc
Return

Sound:
run control mmsys.cpl sounds
return

CompMgmt:
run compmgmt.msc
return

Taskm:
run taskmgr
Return

Speakers:
run nircmd setdefaultsounddevice "Speakers" 1
run nircmd setdefaultsounddevice "Speakers" 2
return

Spdif:
run nircmd setdefaultsounddevice "SPDIF-Out" 1
run nircmd setdefaultsounddevice "SPDIF-Out" 2
return

Net:
run control.exe /name Microsoft.NetworkAndSharingCenter
return

Prohack:
run C:\Program Files\Process Hacker 2\ProcessHacker.exe
return

ProhackExp:
run E:\onedrive-pkfrizzlefry\OneDrive\1-helpfulSoftware\_BATCHME\Sysinternals_2015\procexp.exe
return

ProcExp:
run F:\0-OneDrive_2018\OneDrive\1-helpfulSoftware\_BATCHME\Sysinternals_2017\procexp64.exe
Return

ResMon:
run resmon
Return

;END QUICK LINKS GUI BOX

;[===========================]
;[          KEY REF          ]
;[^CTRL - !ALT - +SHFT - #WIN]
;[---------------------------]
;[     WEBSITE TOOLS	     ]
;[===========================]

;CTRL ALT C - START QUICK LINKS GUI BOX
^!v::

Gui, New
Gui, Add, Button, gHTML x10 y+5 w150, HTML_Beautifier
Gui, Add, Button, gJSON x10 y+5 w150, JSON_Beautifier
Gui, Add, Button, gWtoH x10 y+5 w150, WORDtoHTML
Gui, Add, Button, gGgen x10 y+5 w150, Gradient_Generator
Gui, Add, Button, gButG x10 y+5 w150, Button_Generator
Gui, Add, Button, gColorM x10 y+5 w150, ColorMania
Gui, Add, Button, gFontA x10 y+5 w150, FontAwesome_Cheat
Gui, Add, Button, gBootS x10 y+5 w150, Bootstrap_Cheat
Gui, Add, Button, gBootDoc x10 y+5 w150, Bootstrap_Documentation

Gui, Show
return

HTML:
run https://www.10bestdesign.com/dirtymarkup
Return

ColorM:
run "C:\Program Files (x86)\ColorMania\ColorMania.exe"
Return

JSON:
run https://www.freeformatter.com/css-beautifier.html
Return

WtoH:
run https://wordhtml.com
Return

Ggen:
run http://www.colorzilla.com/gradient-editor
Return

ButG:
run https://loading.io/button/generator#top
Return

FontA:
run https://fontawesome.bootstrapcheatsheets.com/
Return

BootDoc:
run https://getbootstrap.com/docs/4.1/components/alerts/
Return

BootS:
run https://www.creative-tim.com/bootstrap-cheat-sheet
run https://hackerthemes.com/bootstrap-cheatsheet
run https://bootstrapcreative.com/resources/bootstrap-4-css-classes-index/
Return


;END QUICK LINKS GUI BOX
