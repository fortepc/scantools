; Default Variable On Reload Set Section

CoordMode, Mouse, Screen
ExplorerTitleBarX := 0 ; X Screen Position of Explorer Title Bar
ExplorerTitleBary := 0 ; Y Screen Position of Explorer Title Bar
PhotoViewerCloseX := 0 ; X Screen Position Of Photo Viewer Close Button
PhotoViewerCloseY := 0 ; Y Screen Position  of Photo Viewer Close Button
ZoomLocationX := 0 ; X Screen Position of where to zoom into
ZoomLocationY := 0 ; Y Screen Position of where to zoom into
ZoomCount := 0 ; How Many Zoom Clicks
AcrobatTabCloseX := 0 ; X Screen Location of Acrobat Tab 1 Close button
AcrobatTabCloseY := 0 ; Y Screen Location of Acrobat Tab 1 Close button
AcrobatTitleBarX := 0 ; X Screen Location of Acrobat Tab
AcrobatTitleBarY := 0 ; Y Screen Location of Acrobat Tab
DeletePrefixCount := 0 ; How many characters to delete from prefix of the FileName
UrlDownloadToFile, https://raw.githubusercontent.com/fortepc/scantools/master/AutoHotKeyScripts/ScanRenameHelper.ahk, C:\icon\ScanRenameHelper.ahk

; Removing the startup message box
; MsgBox, Script Setup Complete. `n Explorer Title Bar saved as X%ExplorerTitleBarX% Y%ExplorerTitleBarY%. Update this with Alt+NumPad 1 `n Photo Viewer Close Button saved as X%PhotoViewerCloseX% Y%PhotoViewerCloseY% Update this with Alt+NumPad 2. `n Zoom Location set to X%ZoomLocationX% Y%ZoomLocationY% Update this with Alt+NumPad 3. `n Zoom Count set to zoom %ZoomCount% times.

!Numpad1::
MouseGetPos, ExplorerTitleBarX,ExplorerTitleBarY
MsgBox, Mouse Position saved! Explorer Title Bar Temporarily saved at X%ExplorerTitleBarX% Y%ExplorerTitleBarY%. 
Return

!Numpad2:: ; Click Alt+NumPad2 to set the location of the photo viewer's close button
MouseGetPos, PhotoViewerCloseX,PhotoViewerCloseY
MsgBox, Mouse Position saved! Photo Viewer Close button Temporarily saved at X%PhotoViewerCloseX% Y%PhotoViewerCloseY%. 
Return

!Numpad3::
MouseGetPos, ZoomLocationX,ZoomLocationY
MsgBox, Mouse Position saved! Zoom Location Temporarily saved at X%ZoomLocationX% Y%ZoomLocationY%.
Return

!Numpad4::
MouseGetPos, AcrobatTabCloseX,AcrobatTabCloseY
MsgBox, Mouse Position saved! Acrobat Tab 1 Close Button. Location Temporarily saved at X%AcrobatTabCloseX% Y%AcrobatTabCloseY%.
Return

!Numpad5::
MouseGetPos, AcrobatTitleBarX,AcrobatTitleBarY
MsgBox, Mouse Position saved! Acrobat Title Bar Location Temporarily saved at X%AcrobatTitleBarX% Y%AcrobatTitleBarY%.
Return

!Numpad9::
InputBox, ZoomCount, Zoom Count, How Many Times to zooom `n Zoom Count currently set to zoom %ZoomCount% times. In
MsgBox, Zoom Count saved! Zoom Count Temporarily set to zoom %ZoomCount% times. 
Return

!Numpad8::
InputBox, DeletePrefixCount, Prefix Length, How Many Characters to delete from file name prefix `n Prefix Length currently set to zoom %ZoomCountDeletePrefixCount% times. In
MsgBox, Prefix Length saved! Next File Rename will now delete the first %DeletePrefixCount% characters. 
Return

; TIF rename 
; 
; Click Alt+Right Control to activate this section

!RControl:: 
If (%PhotoViewerCloseX% = 0)
{
    MsgBox, 0, Setup Needed - Photo Viewer Close Button Unknown, This Script needs to know where the button is to close the photo viewer. Put your cursor over the photo viewer close button in acrobat, then click the spacebar.
    ToolTip , Put cursor above the tab close button, then press space
    KeyWait, Space, D
    MouseGetPos, PhotoViewerCloseX,PhotoViewerCloseY
    MsgBox, Mouse Position saved! Press Alt+Right Control to try again.
    Return
}
If (%ExplorerTitleBarX% = 0)
{
    MsgBox, 0, Setup Needed - Explorer Title Bar Location Unknown, This Script needs to know where the explorer window is to activate the window for this script. Put your cursor over the explorer window's titlebar, then click the spacebar.
    ToolTip , Put cursor above the tab close button, then press space
    KeyWait, Space, D
    MouseGetPos, ExplorerTitleBarX,ExplorerTitleBarY
    MsgBox, Mouse Position saved! Press Alt+Right Control to try again.
    Return
}
Send, {Tab} ; Moves highlighted file to the next file
Click, %PhotoViewerCloseX%,%PhotoViewerCloseY% ; Close button of Photo Viewer
Sleep, 200 ; How long to wait (in ms) before swichng back to explorer window
Click, %ExplorerTitleBarX%,%ExplorerTitleBarY% ; Clicks the Title Bar of Explorer Window to make it the focused window
Sleep, 200 ; How long to wait (in ms) before attempting to open the selected file
Send, {Enter} ; This opens the currently selected File
MouseMove, %ZoomLocationX%,%ZoomLocationY% ; Where the mouse cursor should zoom into
Sleep, 1100 ; How long to wait (in ms) before attempting to zoom in
MouseClick,WheelUp,,,%ZoomCount%,0,D,R ; adjust the first number to change how many times it zooms in
Click, %ExplorerTitleBarX%,%ExplorerTitleBarY% ; Title Bar of Explorer Window
Sleep, 200 ; How long to wait (in ms) before activating rename on selected file
Send, {F2}
Return

!LControl::
If (%AcrobatTabCloseX% = 0)
{
    MsgBox, 0, Setup Needed - Acrobat Tab Location Unknown, This Script needs to know where the button is to close the acrobat tab. Put your cursor over the tab close button in acrobat, then click the spacebar.
    ToolTip , Put cursor above the tab close button, then press space
    KeyWait, Space, D
    MouseGetPos, AcrobatTabCloseX,AcrobatTabCloseY
    Mouse Position saved! Press Alt+Left Control to try again.
    Return
}
If (%ExplorerTitleBarX% = 0)
{
    MsgBox, 0, Setup Needed - Explorer Title Bar Location Unknown, This Script needs to know where the explorer window is to activate the window for this script. Put your cursor over the explorer window's titlebar, then click the spacebar.
    ToolTip , Put cursor above the tab close button, then press space
    KeyWait, Space, D
    MouseGetPos, ExplorerTitleBarX,ExplorerTitleBarY
    MsgBox, Mouse Position saved! Press Alt+Left Control to try again.
    Return
}
Send, {Tab}
Click, %AcrobatTabCloseX%, %AcrobatTabCloseY% ; Location of Acrobat Tab Close
Click, %ExplorerTitleBarX%,%ExplorerTitleBarY% ; Clicks the Title Bar of Explorer Window to make it the focused window
Sleep, 100
Send, {Enter}
Sleep, 1000
Click, %ExplorerTitleBarX%,%ExplorerTitleBarY% ; Clicks the Title Bar of Explorer Window to make it the focused window
Sleep, 300
Send, {F2}
Sleep, 200
Send, {Home}
Sleep, 200
Send, {Del %DeletePrefixCount%}
Return

!/::
Send, {Space}
Send, {U+0338} ; this adds a division symbol ( ̸  ) when you press alt+/, so I can name files with a / in it as a stand in for a slash since you can't name files with a slash. 
Send, {Space}
Return

!;::
Send, {U+A789} ; this adds a division symbol ( ̸  ) when you press alt+/, so I can name files with a / in it as a stand in for a slash since you can't name files with a slash. 
Return

!-::
Send, {Space}
Send, {U+2500} ; this adds a long bar ( ─ ) when you press alt+-, so I can name files with a  ─ seperating sections of the file names (example: "13538 ─ E-026 ─ CONTROL WIRING DIAGRAM - C CE-01")
Send, {Space}
Return

!o::
Send, {U+00D8} ; this adds a diamater symbol (Ø) when you press alt+o. Some drawings use the diameter symbol in their name, so I need to name the files with this sometimes
Return

!'::
Send, {U+2032} ; this adds the prime symbol (′) when you press alt+' which is the way to demote a measurement is in feet. I could use the single quote, but to keep it consistent with the double prime (″) needed to demote inches, I'm using the single prime.
Return

!+'::
Send, {U+2033} ; this adds a double prime symbol (″) when you press alt+shift+'. The double prime is commonly used to denote a measurement is in inches. 
Return
