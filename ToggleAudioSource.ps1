<#
Use 
   Get-AudioDevice -List
to learn about available devices on your system.
Then set the two variables below with the start of their names.
#>
$device1 = "Speakers (High Definition Audio Device)"
$device2 = "Speakers (Logitech G560 Gaming Speaker)"

$Audio = Get-AudioDevice -playback
Write-Output "Audio device was " $Audio.Name
Write-Output "Audio device now set to " 

if ($Audio.Name.StartsWith($device1)) {
   (Get-AudioDevice -list | Where-Object Name -like ("$device2*") | Set-AudioDevice).Name
}  Else {
   (Get-AudioDevice -list | Where-Object Name -like ("$device1*") | Set-AudioDevice).Name
}

& 'C:\Program Files\VideoLAN\VLC\vlc.exe' --qt-start-minimized --play-and-exit --qt-notification=0 "C:\Users\alexa\Documents\Scripts\toggle.wav"