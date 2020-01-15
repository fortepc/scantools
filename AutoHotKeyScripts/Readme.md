# ScanRenameHelper.ahk
I've updated my Scan Rename Helper script for Auto Hot Key https://github.com/fortepc/scantools/blob/master/AutoHotKeyScripts/ScanRenameHelper.ahk 

As with before, you must have AutoHotKey installed for this script to do anything. That is downloadable here: https://www.autohotkey.com/ to get my script running simply install AutoHotKey if you don't already have it. Then download my script here https://github.com/fortepc/scantools/raw/master/AutoHotKeyScripts/ScanRenameHelper.ahk, save it Wherever you want, and just open the "ScanRenameHelper.ahk" file. If all went as planned you'll see a green "H" icon appear in your task bar, and a dialog box open up telling you the script loaded successfully.

As for what I've changed, 

I've completely rewritten the "Next Tiff" section (and renamed it to simply be the next image) to be more reliable (The old version, it was possible for the photo/tif viewer to get out of sync with whatever file you were renaming causing you to mistakenly rename a nunch of files with the wrong name if you weren't careful), while also using variables instead of hard-coded mouse coordinates, and added the feature to on-the-fly change and update the mouse coordinates variables without having to manually change the code. On first launch it will still default to the coordinates hard coded in as the defaults, but they can be easily changed with the Config Hotkeys. On first launch it will tell you what the coordinates are.

While the script is running these are the current keyboard shortcuts.

## Config Hotkeys

Alt+NumPad 1 = Set Current Cursor Location to File Explorer Title Bar Location

Alt+NumPad 2 = Set Current Cursor Location to The Photo Viewer Close Button

Alt+NumPad 3 = Set Current Cursor Location to the Cursor Location for Zooming in

Alt+NumPad 4 = (Coming Soon, not implemented yet. Will be the location for the Acrobat Tab close button)

Alt+NumPad 9 = Set the number of "Zoom In" actions to perform (This will pop up a dialog box)

(These can only be activated using the numpad buttons to the right of the main keyboard section, they cannot be activated using the number row above the main keyboard. If you don't have a numpad, let me know and I can give you an alternate version with different config hotkeys)

## Next File Hotkeys

Alt+RControl = Next File using Photo Viewer. This should be activated before you click out of renaming your current document.

Alt+LControl = Next File using Acrobat This should be activated before you click out of renaming your current document. *(Alpha, needs re-written still to support the config hotkeys)*

## Special Character Hotkeys

Alt+O = Ø (Occasionally used for a Diameter Symbol in Drawing Names)

Alt+-  = ─ (Used as a delimiter in naming files with multiple parts ie: "[project number] ─ [sheet number] ─ [sheet name].pdf" Using this as a delimiter avoids confusion because the - character is often used as part of a project number, sheet number, or sheet name.)

Alt+Shift+' = ″ (Called a "double prime" it is a symbol often used to denote inches in sheet names. Often replaced with a " (double quote) in regular typing, but double quotes are not allowed in file names in windows)

(or Alt+")

Alt+' = ′ (Called a "prime" it is a symbol often used to denote feet in sheet names. Often replaced with a ' (Single Quote) in regular typing. This is preferred to be used over the single quote to maintain consistency with the double prime.

Alt+; = ꞉ (Called a "modifier letter colon" this symbol is used as an alternate to the : (colon) because a regular colon is not allowed in file names in windows)

Alt+/ =  ̸  (Called a "combining long solidus overlay" this symbol is used as an alternate to the / (forward slash) because the forward slash is not allowed in file names in windows.)

## Known Issues

When using the "Next File using Photo Viewer" script, you may find that it doesn't actually zoom in. This can happen when the photo or document you're opening is taking too long to load before the script executes the zoom in. To do a one time retry you can "Shift+Tab" (Before clicking or doing anything else) to select the previous file, then activate the "Alt+RControl" hotkey again and it will usually work better the second time. If you're continually having this issue open the "ScanRenameHelper.ahk" file in notepad, find the line labeled "How long to wait (in ms) before attempting to zoom in" (Line 51 as of writing this update, but it may change) and increase the number you see on that line. This is in milliseconds, 1 sec = 1000 ms, so change accordingly. After you save the change you'll have to restart the script, do this by right clicking on the "H" icon in your taskbar and clicking "Reload This Script" (Seen here: http://prntscr.com/qo25hu)
