/*
   ------------------------------------------------------------------------
   FusionInventory
   Copyright (C) 2010-2012 by the FusionInventory Development Team.

   http://www.fusioninventory.org/   http://forge.fusioninventory.org/
   ------------------------------------------------------------------------

   LICENSE

   This file is part of FusionInventory project.

   FusionInventory is free software: you can [...]

   FusionInventory is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU Affero General Public License for more details.

   You should have received a copy of [...]

   ------------------------------------------------------------------------

   @package   FusionInventory Agent Installer for Microsoft Windows
   @file      .\FusionInventory Agent\Include\MiscFunc.nsh     
   @author    Tomas Abad
   @copyright Copyright (c) 2010-2012 FusionInventory Team
   @license   [...]
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012
 
   ------------------------------------------------------------------------
*/


!ifndef __FIAI_MISCFUNC_INCLUDE__
!define __FIAI_MISCFUNC_INCLUDE__


!include FileFunc.nsh
!include WordFunc.nsh
!include "${FIAIDIR}\Include\RegFunc.nsh"
!include "${FIAIDIR}\Include\WindowsInfo.nsh"


; InitGlobalVariables
!macro InitGlobalVariables Un
   Function "${Un}InitGlobalVariables"
      ; Push $R0 onto the stack
      Push $R0

      ; Set incompatible target platform architecture
      StrCpy $IncompatibleTargetPlatformArchitecture 0

      ; Get Windows platform architecture 
      ${GetWindowsPlatformArchitecture} $R0

      ; Set product installation registry subkey
      ${If} $R0 = 32
         ; Platform 32bits
         StrCpy $PRODUCT_INST_SUBKEY "SOFTWARE\${PRODUCT_INTERNAL_NAME}"
         StrCpy $PRODUCT_UNINST_SUBKEY "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_INTERNAL_NAME}"

         ${If} ${INSTALLER_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_64}
            ; Platform 32bits / Installer 64bits !!!
            StrCpy $IncompatibleTargetPlatformArchitecture 1
         ${EndIf}

         ; Set scope of the registry commands
         SetRegView 32
      ${Else}
         ; Platform 64bits
         ${If} ${INSTALLER_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
            ; Platform 64bits / Installer 32bits
            StrCpy $PRODUCT_INST_SUBKEY "SOFTWARE\Wow6432Node\${PRODUCT_INTERNAL_NAME}"
            StrCpy $PRODUCT_UNINST_SUBKEY "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_INTERNAL_NAME}"
         ${Else}
            ; Platform 64bits / Installer 64bits
            StrCpy $PRODUCT_INST_SUBKEY "SOFTWARE\${PRODUCT_INTERNAL_NAME}"
            StrCpy $PRODUCT_UNINST_SUBKEY "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_INTERNAL_NAME}"
         ${EndIf}

         ; Set scope of the registry commands
         SetRegView 64
      ${EndIf}

      ; Set command line syntax error
      StrCpy $CommandLineSyntaxError 0

      ; Pop $R0 off of the stack
      Pop $R0
   FunctionEnd
!macroend

!insertmacro InitGlobalVariables ""
!insertmacro InitGlobalVariables "un."

!define InitGlobalVariables "Call InitGlobalVariables"
!define un.InitGlobalVariables "Call un.InitGlobalVariables"


; InstallFusionInventoryAgent
!define InstallFusionInventoryAgent "Call InstallFusionInventoryAgent"

Function InstallFusionInventoryAgent
   ; Push $R0 onto the stack
   Push $R0
   Push $R1

   ; Set mode at which commands print their status
   SetDetailsPrint textonly

   ; Create directories
   ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_INSTALLDIR}"
   CreateDirectory "$R0"
   CreateDirectory "$R0\certs"
   CreateDirectory "$R0\etc"
   CreateDirectory "$R0\perl"
   CreateDirectory "$R0\perl\agent"
   CreateDirectory "$R0\perl\bin"
   CreateDirectory "$R0\share"
   CreateDirectory "$R0\var"

   ; Create $R0\fusioninventory-agent.bat
   FileOpen $R1 "$R0\fusioninventory-agent.bat" w
   FileWrite $R1 "@echo off" 
   FileWriteByte $R1 "13"
   FileWriteByte $R1 "10"
   FileWrite $R1 "cd perl/bin" 
   FileWriteByte $R1 "13"
   FileWriteByte $R1 "10"
   FileWrite $R1 "perl fusioninventory-agent %*" 
   FileWriteByte $R1 "13"
   FileWriteByte $R1 "10"
   FileWrite $R1 "cd ../.." 
   FileClose $R1

   ; Install $R0\{license,readme,thanks}.txt 
   SetOutPath "$R0\"
   File /oname=license.txt "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-2.2.5\LICENSE"
   File /oname=readme.txt "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-2.2.5\README"
   File /oname=thanks.txt "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-2.2.5\THANKS"
   nsExec::Exec '"$PLUGINSDIR\sed.exe" -i -e "s/$$/\r/" "$R0\license.txt"'  
   nsExec::Exec '"$PLUGINSDIR\sed.exe" -i -e "s/$$/\r/" "$R0\readme.txt"'  
   nsExec::Exec '"$PLUGINSDIR\sed.exe" -i -e "s/$$/\r/" "$R0\thanks.txt"'  
   Delete "$R0\sed*"

   ; Install $R0\etc 
   SetOutPath "$R0\etc\"
   File /r "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-2.2.5\etc\"

   ; Install $R0\perl\agent\FusionInventory
   SetOutPath "$R0\perl\agent\"
   File /r "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-2.2.5\lib\FusionInventory"

   ; Install $R0\perl\bin\7z.{dll,exe}
   ;         $R0\perl\bin\dmidecode.exe
   ;         $R0\perl\bin\hdparm.exe
   ;         $R0\perl\bin\fusioninventory-{agent,injector,win32-service}
   ;         $R0\perl\bin\memconf 
   SetOutPath "$R0\perl\bin\"
   File "${7ZIP_DIR}\7z.dll"
   File "${7ZIP_DIR}\7z.exe"
   File "${DMIDECODE_DIR}\dmidecode.exe"
   File "${HDPARM_DIR}\hdparm.exe"
   File "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-2.2.5\fusioninventory-agent"
   File "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-2.2.5\fusioninventory-injector"
   File "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-2.2.5\fusioninventory-win32-service"
   File "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-2.2.5\memconf"

   ; Install $R0\share 
   SetOutPath "$R0\share\"
   File /r "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-2.2.5\share\"

   ; Set mode at which commands print their status
   SetDetailsPrint lastused

   ; Pop $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


; InstallFusionInventoryAgentTaskDeploy
!define InstallFusionInventoryAgentTaskDeploy "Call InstallFusionInventoryAgentTaskDeploy"

Function InstallFusionInventoryAgentTaskDeploy
   ; Push $R0 onto the stack
   Push $R0
   Push $R1

   ; Set mode at which commands print their status
   SetDetailsPrint textonly

   ; Create directories
   ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_INSTALLDIR}"
   CreateDirectory "$R0"
   CreateDirectory "$R0\perl"
   CreateDirectory "$R0\perl\agent"

   ; Install $R0\perl\agent\FusionInventory
   SetOutPath "$R0\perl\agent\"
   File /r "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-Task-Deploy-2.0.2\lib\FusionInventory"

   ; Set mode at which commands print their status
   SetDetailsPrint lastused

   ; Pop $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


; InstallFusionInventoryAgentTaskESX
!define InstallFusionInventoryAgentTaskESX "Call InstallFusionInventoryAgentTaskESX"

Function InstallFusionInventoryAgentTaskESX
   ; Push $R0 onto the stack
   Push $R0
   Push $R1

   ; Set mode at which commands print their status
   SetDetailsPrint textonly

   ; Create directories
   ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_INSTALLDIR}"
   CreateDirectory "$R0"
   CreateDirectory "$R0\perl"
   CreateDirectory "$R0\perl\agent"
   CreateDirectory "$R0\perl\bin"

   ; Install $R0\perl\agent\FusionInventory
   SetOutPath "$R0\perl\agent\"
   File /r "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-Task-ESX-2.2.0\lib\FusionInventory"

   ; Install $R0\perl\bin\fusioninventory-esx 
   SetOutPath "$R0\perl\bin\"
   File "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-Task-ESX-2.2.0\fusioninventory-esx"

   ; Set mode at which commands print their status
   SetDetailsPrint lastused

   ; Pop $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


; InstallFusionInventoryAgentTaskNetwork
!define InstallFusionInventoryAgentTaskNetwork "Call InstallFusionInventoryAgentTaskNetwork"

Function InstallFusionInventoryAgentTaskNetwork
   ; Push $R0 onto the stack
   Push $R0
   Push $R1

   ; Set mode at which commands print their status
   SetDetailsPrint textonly

   ; Create directories
   ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_INSTALLDIR}"
   CreateDirectory "$R0"
   CreateDirectory "$R0\perl"
   CreateDirectory "$R0\perl\agent"
   CreateDirectory "$R0\perl\bin"

   ; Install $R0\perl\agent\FusionInventory
   SetOutPath "$R0\perl\agent\"
   File /r "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-Task-Network-1.0.0\lib\FusionInventory"

   ; Install $R0\perl\bin\fusioninventory-{netdiscovery,netinventory} 
   SetOutPath "$R0\perl\bin\"
   File "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-Task-Network-1.0.0\fusioninventory-netdiscovery"
   File "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-Task-Network-1.0.0\fusioninventory-netinventory"

   ; Set mode at which commands print their status
   SetDetailsPrint lastused

   ; Pop $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


; InstallStrawberryPerl
!define InstallStrawberryPerl "Call InstallStrawberryPerl"

Function InstallStrawberryPerl
   ; Push $R0 onto the stack
   Push $R0

   ; Set mode at which commands print their status
   SetDetailsPrint textonly

   ; Create directories
   ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_INSTALLDIR}"
   CreateDirectory "$R0"
   CreateDirectory "$R0\perl"
   CreateDirectory "$R0\perl\bin"
   CreateDirectory "$R0\perl\lib"
   CreateDirectory "$R0\perl\site"
   CreateDirectory "$R0\perl\vendor"

   ; Install $R0\perl\bin
   SetOutPath "$R0\perl\bin\"
   !if ${INSTALLER_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
      ;File "${STRAWBERRY_DIR}\c\bin\libeay32_.dll"
      ;File "${STRAWBERRY_DIR}\c\bin\libiconv-2_.dll"
      ;File "${STRAWBERRY_DIR}\c\bin\libxml2-2_.dll"
      ;File "${STRAWBERRY_DIR}\c\bin\libz_.dll"
      File "${STRAWBERRY_DIR}\c\bin\*.dll"
   !else
      ;File "${STRAWBERRY_DIR}\c\bin\libeay32__.dll"
      ;File "${STRAWBERRY_DIR}\c\bin\libiconv-2__.dll"
      ;File "${STRAWBERRY_DIR}\c\bin\libxml2-2__.dll"
      ;File "${STRAWBERRY_DIR}\c\bin\libz__.dll"
      File "${STRAWBERRY_DIR}\c\bin\*.dll"
   !endif
   ;File "${STRAWBERRY_DIR}\perl\bin\perl.exe"
   ;File "${STRAWBERRY_DIR}\perl\bin\perl5.16.0.exe"
   ;File "${STRAWBERRY_DIR}\perl\bin\perl516.dll"
   ;File "${STRAWBERRY_DIR}\perl\bin\libgcc_s_sjlj-1.dll"
   ;File "${STRAWBERRY_DIR}\perl\bin\libstdc++-6.dll"
   File "${STRAWBERRY_DIR}\perl\bin\*.dll"
   File "${STRAWBERRY_DIR}\perl\bin\*.exe"

   ; Install $R0\perl\lib 
   SetOutPath "$R0\perl\lib\"
   ;File /r /x "*.pod" /x "*.h" /x "*.a" "${STRAWBERRY_DIR}\perl\lib\"
   File /r "${STRAWBERRY_DIR}\perl\lib\"

   ; Install $R0\perl\site 
   SetOutPath "$R0\perl\site\"
   ;File /r /x "*.pod" "${STRAWBERRY_DIR}\perl\site\"
   File /r "${STRAWBERRY_DIR}\perl\site\"

   ; Install $R0\perl\vendor 
   SetOutPath "$R0\perl\vendor\"
   ;File /r /x "*.pod" /x "*.h" /x "*.a" "${STRAWBERRY_DIR}\perl\vendor\"
   File /r "${STRAWBERRY_DIR}\perl\vendor\"

   ; Set mode at which commands print their status
   SetDetailsPrint lastused

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


; UninstallCurrentAgent
!define UninstallCurrentAgent "!insertmacro UninstallCurrentAgent"

!macro UninstallCurrentAgent ResultVar
   Call UninstallCurrentAgent
   Pop "${ResultVar}"
!macroend

Function UninstallCurrentAgent
   ; Push $R0, $R1 & $R2 onto the stack
   Push $R0
   Push $R1
   Push $R2

   ; Initialize $R0
   StrCpy $R0 0

   ; Get quiet uninstall string
   ${GetCurrentQuietUninstallString} $R1

   ; Whether the uninstaller exists...
   ${If} "$R1" != ""
      ; Get parent directory
      ${GetParent} "$R1" $R2

      ; Erase quotation marks (") from $R2
      ${WordReplace} "$R2" "$\"" "" "+" $R2

      ; Exec the uninstaller...
      ExecWait '$R1 _?=$R2' $R0
   ${EndIf}

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchanges the top element of the stack with $R0 
   Exch $R0
FunctionEnd


!endif
