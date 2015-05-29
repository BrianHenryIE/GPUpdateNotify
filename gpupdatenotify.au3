#AutoIt3Wrapper_Icon=imageres_107.ico

; There might be problems if a user has a command prompt open
; This script sends N{ENTER} to the command window.

$promptEveryXMinutes = 10

Opt("WinTitleMatchMode", -1)
AutoItSetOption("TrayIconHide", 0)
TraySetToolTip("Checking for updates...")
Opt("TrayIconHide", 1)

#include <File.au3>

$iPID = Run('cmd /c c:\windows\System32\gpupdate.exe /force > %temp%\gpupdateoutput.txt', 'c:\', @SW_HIDE)

While ProcessExists($iPID)

	Sleep(10000)
	ControlSend('C:\Windows\system32\cmd.exe', "", "", "N{ENTER}")

WEnd

$file = @tempdir & "\gpupdateoutput.txt"

FileOpen($file, 0)

$reboot = False

For $i = 1 to _FileCountLines($file)
    $line = FileReadLine($file, $i)
	; If StringInStr($line, "logoff") >0 Then $reboot = True
	If StringInStr($line, "restart") >0 Then $reboot = True
Next
FileClose($file)

FileDelete($file)

If $reboot = True Then
	Opt("TrayIconHide", 0)
	TraySetToolTip("Please restart your computer to apply updates.")
	; Stay open, prompt evey x minutes
	While 1
		TrayTip ( "Group Policy Updates Available", "Please restart your computer for updates to apply.", 30, 2)
		Sleep($promptEveryXMinutes * 60 * 1000)
	WEnd
EndIf