!RControl:: ; alt+right control triggers the script to tab to the next file name, then click the next photo button in the photo viewer, then reselect the explorer window, then initiate a file rename with F2
CoordMode, Mouse, Screen ; this sets the CoordMode to the screen wide coordinates. 
Send, {Tab}
Click, 2445, 1005
Sleep, 100
MouseMove, 2735, 820 ; this is where the cursor scrolls into. This should be in a placed where the scroll will scroll to the place needed for the document
Sleep, 100
MouseClick,WheelUp,,,4,0,D,R ; adjust the first number to change how many times it zooms
Sleep, 100
Click, 3462, 21
Sleep, 200
Send, {F2}
Return

!/::
Send, {Space}
Send, {U+0338} ; this adds a division symbol ( ̸  ) when you press alt+/, so I can name files with a / in it as a stand in for a slash since you can't name files with a slash. 
Send, {Space}
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
