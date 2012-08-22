@echo off

set PATH=%ProgramFiles%\NSIS;%ProgramFiles(x86)%\NSIS;%PATH%

:: Build x86 installer
echo Please wait. Compilling x86 installer...
MakeNSIS /V3 /O.\FusionInventory-Agent_MakeNSIS-Output-x86.txt /DINSTALLER_PLATFORM_ARCHITECTURE=x86 .\FusionInventory-Agent.nsi
echo Done!

:: Build x86 installer
echo Please wait. Compilling x64 installer...
MakeNSIS /V3 /O.\FusionInventory-Agent_MakeNSIS-Output-x64.txt /DINSTALLER_PLATFORM_ARCHITECTURE=x64 .\FusionInventory-Agent.nsi
echo Done!
