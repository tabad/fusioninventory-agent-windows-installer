/*
   ------------------------------------------------------------------------
   FusionInventory Agent Installer for Microsoft Windows
   Copyright (C) 2010-2012 by the FusionInventory Development Team.

   http://www.fusioninventory.org/ http://forge.fusioninventory.org/
   ------------------------------------------------------------------------

   LICENSE

   This file is part of FusionInventory project.

   FusionInventory Agent Installer for Microsoft Windows is free software;
   you can redistribute it and/or modify it under the terms of the GNU
   General Public License as published by the Free Software Foundation;
   either version 2 of the License, or (at your option) any later version.


   FusionInventory Agent Installer for Microsoft Windows is distributed in
   the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
   PURPOSE. See the GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software Foundation,
   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
   or see <http://www.gnu.org/licenses/>.

   ------------------------------------------------------------------------

   @package   FusionInventory Agent Installer for Microsoft Windows
   @file      .\FusionInventory-Agent.nsi
   @author    Tomas Abad
   @copyright Copyright (c) 2010-2012 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


SetCompressor /FINAL /SOLID lzma


;--------------------------------
; Definitions

; Notes: FusionInventory Agent (FIA)
;        FusionInventory Agent Installer (FIAI)

!ifndef OS_BUILDER_NO_WINDOWS
   !define FIAI_DIR ".\FusionInventory-Agent"
!else
   !define FIAI_DIR "./FusionInventory-Agent"
!endif

!define LABEL_PLATFORM_ARCHITECTURE_32 "x86"
!define LABEL_PLATFORM_ARCHITECTURE_64 "x64"
!define DEFAULT_FIAI_PLATFORM_ARCHITECTURE ${LABEL_PLATFORM_ARCHITECTURE_32}

; Use MakeNSIS '/D' option for choose the architecture
!ifdef FIAI_PLATFORM_ARCHITECTURE
   !if ${FIAI_PLATFORM_ARCHITECTURE} != ${LABEL_PLATFORM_ARCHITECTURE_32}
      !if ${FIAI_PLATFORM_ARCHITECTURE} != ${LABEL_PLATFORM_ARCHITECTURE_64}
         !undef FIAI_PLATFORM_ARCHITECTURE
         !define FIAI_PLATFORM_ARCHITECTURE ${DEFAULT_FIAI_PLATFORM_ARCHITECTURE}
      !endif
   !endif
!else
   !define FIAI_PLATFORM_ARCHITECTURE ${DEFAULT_FIAI_PLATFORM_ARCHITECTURE}
!endif

!define STRAWBERRY_RELEASE "5.16.2.2"
!define FIA_RELEASE "master"
!define FIA_TASK_DEPLOY_RELEASE "2.0.4"
!define FIA_TASK_ESX_RELEASE "2.2.1"
!define FIA_TASK_INVENTORY_RELEASE "1.0"
!define FIA_TASK_NETWORK_RELEASE "1.0.2"
!define FIA_TASK_NETDISCOVERY_RELEASE "2.2.0"
!define FIA_TASK_NETINVENTORY_RELEASE "2.2.0"
!define FIA_TASK_WAKEONLAN_RELEASE "2.0"

!define PRODUCT_NAME "FusionInventory Agent"
!define PRODUCT_INTERNAL_NAME "FusionInventory-Agent"
!define PRODUCT_VERSION_MAJOR "2"
!define PRODUCT_VERSION_MINOR "3"
!define PRODUCT_VERSION_RELEASE "0"
!define PRODUCT_VERSION_BUILD "2013030702"
!define PRODUCT_VERSION "${PRODUCT_VERSION_MAJOR}.${PRODUCT_VERSION_MINOR}.${PRODUCT_VERSION_RELEASE}-${PRODUCT_VERSION_BUILD}_experimental"
!define PRODUCT_PUBLISHER "FusionInventory Team"
!define PRODUCT_WEB_FOR_SUPPORT "http://forge.fusioninventory.org/projects/fusioninventory-agent"
!define PRODUCT_WEB_SITE "http://www.fusioninventory.org"
!define PRODUCT_UNINSTALLER "Uninstall.exe"
!define PRODUCT_INST_ROOT_KEY "HKEY_LOCAL_MACHINE"
!define PRODUCT_UNINST_ROOT_KEY "HKEY_LOCAL_MACHINE"
!define PRODUCT_INSTALLER "fusioninventory-agent_windows-${FIAI_PLATFORM_ARCHITECTURE}_${PRODUCT_VERSION}.exe"
!define PRODUCT_WEB_FOR_UPDATES "http://prebuilt.fusioninventory.org/stable/windows-${FIAI_PLATFORM_ARCHITECTURE}/"

!define FILE_VERSION "${PRODUCT_VERSION_MAJOR}.${PRODUCT_VERSION_MINOR}.${PRODUCT_VERSION_RELEASE}.${PRODUCT_VERSION_BUILD}"
!define VI_PRODUCT_VERSION "${FILE_VERSION}"

!ifndef OS_BUILDER_NO_WINDOWS
   !define PRODUCT_BUILD_ID_FILE "${FIAI_DIR}\Include\BuildID.nsh"
!else
   !define PRODUCT_BUILD_ID_FILE "${FIAI_DIR}/Include/BuildID.nsh"
!endif
!searchparse /file "${PRODUCT_BUILD_ID_FILE}" `!define PREVIOUS_PRODUCT_X86_BUILD_ID "` PREVIOUS_PRODUCT_X86_BUILD_ID `"`
!searchparse /file "${PRODUCT_BUILD_ID_FILE}" `!define PREVIOUS_PRODUCT_X64_BUILD_ID "` PREVIOUS_PRODUCT_X64_BUILD_ID `"`
!if ${FIAI_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
   !define /math PRODUCT_BUILD_ID ${PREVIOUS_PRODUCT_X86_BUILD_ID} + 1
   !undef PREVIOUS_PRODUCT_X86_BUILD_ID
   !define PREVIOUS_PRODUCT_X86_BUILD_ID ${PRODUCT_BUILD_ID}
!else
   !define /math PRODUCT_BUILD_ID ${PREVIOUS_PRODUCT_X64_BUILD_ID} + 1
   !undef PREVIOUS_PRODUCT_X64_BUILD_ID
   !define PREVIOUS_PRODUCT_X64_BUILD_ID ${PRODUCT_BUILD_ID}
!endif
!ifndef OS_BUILDER_NO_WINDOWS
   !system `echo ;> "${PRODUCT_BUILD_ID_FILE}"`
   !system `echo ; Do not edit!>> "${PRODUCT_BUILD_ID_FILE}"`
   !system `echo ;>> "${PRODUCT_BUILD_ID_FILE}"`
   !system `echo !define PREVIOUS_PRODUCT_X86_BUILD_ID "${PREVIOUS_PRODUCT_X86_BUILD_ID}">> "${PRODUCT_BUILD_ID_FILE}"`
   !system `echo !define PREVIOUS_PRODUCT_X64_BUILD_ID "${PREVIOUS_PRODUCT_X64_BUILD_ID}">> "${PRODUCT_BUILD_ID_FILE}"`
!else
   !system `echo ';' > "${PRODUCT_BUILD_ID_FILE}"`
   !system `echo '; Do not edit!' >> "${PRODUCT_BUILD_ID_FILE}"`
   !system `echo ';' >> "${PRODUCT_BUILD_ID_FILE}"`
   !system `echo '!define PREVIOUS_PRODUCT_X86_BUILD_ID "${PREVIOUS_PRODUCT_X86_BUILD_ID}"' >> "${PRODUCT_BUILD_ID_FILE}"`
   !system `echo '!define PREVIOUS_PRODUCT_X64_BUILD_ID "${PREVIOUS_PRODUCT_X64_BUILD_ID}"' >> "${PRODUCT_BUILD_ID_FILE}"`
!endif

!undef PREVIOUS_PRODUCT_X86_BUILD_ID
!undef PREVIOUS_PRODUCT_X64_BUILD_ID

!define 7ZIP_DIR "..\Tools\7zip\${FIAI_PLATFORM_ARCHITECTURE}"
!define DMIDECODE_DIR "..\Tools\dmidecode\${LABEL_PLATFORM_ARCHITECTURE_32}"
!define HDPARM_DIR "..\Tools\hdparm\${LABEL_PLATFORM_ARCHITECTURE_32}"
!define SED_DIR "..\Tools\sed\${LABEL_PLATFORM_ARCHITECTURE_32}"
!define SETACL_DIR "..\Tools\setacl\${FIAI_PLATFORM_ARCHITECTURE}"
!define STRAWBERRY_DIR "..\Perl\Strawberry\${STRAWBERRY_RELEASE}\${FIAI_PLATFORM_ARCHITECTURE}"

!define FIA_DIR "${STRAWBERRY_DIR}\cpan\sources\FusionInventory-Agent-${FIA_RELEASE}"

!define FIAI_HELP_FILE "fusioninventory-agent_windows-${FIAI_PLATFORM_ARCHITECTURE}_${PRODUCT_VERSION}.rtf"


;--------------------------------
; Compiler

!addplugindir ".\Plugins"


;--------------------------------
; Installer Attributes

BrandingText "${PRODUCT_PUBLISHER}"
Caption "${PRODUCT_NAME} ${PRODUCT_VERSION} (${FIAI_PLATFORM_ARCHITECTURE} edition) Setup"
!if ${FIAI_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
   InstallDir "$PROGRAMFILES32\${PRODUCT_INTERNAL_NAME}"
!else
   InstallDir "$PROGRAMFILES64\${PRODUCT_INTERNAL_NAME}"
!endif
Name "${PRODUCT_NAME} ${PRODUCT_VERSION} (${FIAI_PLATFORM_ARCHITECTURE} edition)"
OutFile ".\${PRODUCT_INSTALLER}"
RequestExecutionLevel admin
ShowInstDetails hide
ShowUninstDetails nevershow
XPStyle on


;--------------------------------
; Global Variables

; Product installation registry subkey
Var PRODUCT_INST_SUBKEY
Var PRODUCT_UNINST_SUBKEY

; Command Line Syntax Error
Var CommandLineSyntaxError

; Incompatible target platform architecture
Var IncompatibleTargetPlatformArchitecture


;--------------------------------
; Includes

!include LogicLib.nsh
!include MUI2.nsh
!include WordFunc.nsh
!include "${FIAI_DIR}\Include\CommandLineParser.nsh"
!include "${FIAI_DIR}\Include\INIFunc.nsh"
!include "${FIAI_DIR}\Include\LangStrings.nsh"
!include "${FIAI_DIR}\Include\MiscFunc.nsh"
!include "${FIAI_DIR}\Include\PadLock.nsh"
!include "${FIAI_DIR}\Include\RegFunc.nsh"
!include "${FIAI_DIR}\Include\Registry.nsh"
!include "${FIAI_DIR}\Include\WinServicesFunc.nsh"


;--------------------------------
; Modern UI 2.0 Settings

; Page header
; The icon for the installer
!define MUI_ICON "${FIAI_DIR}\Contrib\Graphics\Icons\Installer.ico"
; The icon for the uninstaller
!define MUI_UNICON "${FIAI_DIR}\Contrib\Graphics\Icons\Uninstaller.ico"
; Display an image on the header of the page
!define MUI_HEADERIMAGE
; Bitmap image to display on the header of installers pages
!define MUI_HEADERIMAGE_BITMAP  "${FIAI_DIR}\Contrib\Skins\Default\HeaderRightMUI2.bmp"
; Bitmap image to display on the header of uninstaller pages
!define MUI_HEADERIMAGE_UNBITMAP "${FIAI_DIR}\Contrib\Skins\Default\HeaderRightMUI2.bmp"
; Display the header image on the right side instead of the left side
!define MUI_HEADERIMAGE_RIGHT

; Installer welcome/finish page
; Bitmap for the Welcome page and the Finish page
!define MUI_WELCOMEFINISHPAGE_BITMAP "${FIAI_DIR}\Contrib\Skins\Default\WelcomeMUI2.bmp"

; Uninstaller welcome/finish page
; Bitmap for the Welcome page and the Finish page
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "${FIAI_DIR}\Contrib\Skins\Default\WelcomeMUI2.bmp"

; Components page
; A small description area on the bottom of the page
!define MUI_COMPONENTSPAGE_SMALLDESC

; Installer finish page
; Do not automatically jump to the finish page, to allow the user to check the install log
!define MUI_FINISHPAGE_NOAUTOCLOSE

; Uninstaller finish page
; Do not automatically jump to the finish page, to allow the user to check the uninstall log
!define MUI_UNFINISHPAGE_NOAUTOCLOSE

; Abort warning
; Show a message box with a warning when the user wants to close the installer
!define MUI_ABORTWARNING
; Set the Cancel button as the default button on the message box
!define MUI_ABORTWARNING_CANCEL_DEFAULT

; Uninstaller abort warning
; Show a message box with a warning when the user wants to close the uninstaller
!define MUI_UNABORTWARNING
; Set the Cancel button as the default button on the message box
!define MUI_UNABORTWARNING_CANCEL_DEFAULT


;--------------------------------
; Modern UI 2.0 Page Settings

; Welcome page settings
; Extra space for the title area
!define MUI_WELCOMEPAGE_TITLE_3LINES

; License page settings
; Display a checkbox the user has to check to agree with the license terms
!define MUI_LICENSEPAGE_CHECKBOX

; Finish page settings
; Extra space for the title area
!define MUI_FINISHPAGE_TITLE_3LINES
; Application which the user can select to run using a checkbox
!define MUI_FINISHPAGE_RUN "c:\windows\system32\notepad.exe"
; Do not check the 'Run program' checkbox by default
!define MUI_FINISHPAGE_RUN_NOTCHECKED
; File or website which the user can select to view using a checkbox
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\readme.txt"
; Do not check the 'Show Readme' checkbox by default
;!define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
; Text for a link on the which the user can click to view a website or file
!define MUI_FINISHPAGE_LINK "The FusionInventory Team"
; Website or file which the user can select to view using the link
!define MUI_FINISHPAGE_LINK_LOCATION http://fusioninventory.org/


;--------------------------------
; Modern UI 2.0 Custom Fuctions


;--------------------------------
; Custom Pages Functions

!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\HelpPage.nsh"
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\InstallModePage.nsh"


;--------------------------------
; Installer Pages

Page custom HelpPage_Show HelpPage_Leave ""
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "${FIAI_DIR}\LicenseEnglish.rtf"
Page custom InstallModePage_Show InstallModePage_Leave ""
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
;Page custom GlobalOptions "" " "
;Page custom SpecificOptions "" " "
;Page custom NetworkOptions "" " "
;Page custom ExecModeOptions "" " "
;Page custom ScheduleTaskOptions "" " "
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH


;--------------------------------
; Modern UI 2.0 Page Settings
;  (For Uninstaller Pages)

; Welcome page settings
; Extra space for the title area
!define MUI_WELCOMEPAGE_TITLE_3LINES

; Finish page settings
; Extra space for the title area
!define MUI_FINISHPAGE_TITLE_3LINES


;--------------------------------
; Uninstaller Pages

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH


;--------------------------------
; Modern UI 2.0 Language Files
;    (After Pages Always)

!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "French"
!insertmacro MUI_LANGUAGE "Spanish"


;--------------------------------
; Reserve Files

ReserveFile "${NSISDIR}\Plugins\nsDialogs.dll"
ReserveFile ".\Plugins\EnumINI.dll"
ReserveFile ".\Plugins\GetVersion.dll"
ReserveFile ".\Plugins\nsRichEdit.dll"
ReserveFile ".\Plugins\registry.dll"
ReserveFile ".\Plugins\SimpleFC.dll"
ReserveFile ".\Plugins\SimpleSC.dll"
ReserveFile "${FIAI_DIR}\INI\Options.ini"
ReserveFile "${FIAI_DIR}\LicenseEnglish.rtf"
ReserveFile "${SED_DIR}\libiconv2.dll"
ReserveFile "${SED_DIR}\libintl3.dll"
ReserveFile "${SED_DIR}\regex2.dll"
ReserveFile "${SED_DIR}\sed.exe"


;--------------------------------
;Version Information

VIProductVersion "${VI_PRODUCT_VERSION}"

VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${PRODUCT_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "Setup ${PRODUCT_NAME} for Microsoft Windows"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${PRODUCT_PUBLISHER} (${PRODUCT_WEB_SITE})"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "${PRODUCT_NAME} is distributed under GNU GPL License"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "${PRODUCT_PUBLISHER}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${PRODUCT_NAME} for Microsoft Windows"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${FILE_VERSION} (Build ${PRODUCT_BUILD_ID})"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${PRODUCT_VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "InternalName" "${PRODUCT_INTERNAL_NAME}"
;VIAddVersionKey /LANG=${LANG_ENGLISH} "OriginalFilename" ""
;VIAddVersionKey /LANG=${LANG_ENGLISH} "PrivateBuild" ""
;VIAddVersionKey /LANG=${LANG_ENGLISH} "SpecialBuild" ""

VIAddVersionKey /LANG=${LANG_FRENCH} "ProductName" "${PRODUCT_NAME}"
VIAddVersionKey /LANG=${LANG_FRENCH} "Comments" "fSetup ${PRODUCT_NAME} for Microsoft Windows"
VIAddVersionKey /LANG=${LANG_FRENCH} "CompanyName" "${PRODUCT_PUBLISHER}  (${PRODUCT_WEB_SITE})"
VIAddVersionKey /LANG=${LANG_FRENCH} "LegalTrademarks" "f${PRODUCT_NAME} is distributed under GNU GPL License"
VIAddVersionKey /LANG=${LANG_FRENCH} "LegalCopyright" "${PRODUCT_PUBLISHER}"
VIAddVersionKey /LANG=${LANG_FRENCH} "FileDescription" "f${PRODUCT_NAME} for Microsoft Windows"
VIAddVersionKey /LANG=${LANG_FRENCH} "FileVersion" "${FILE_VERSION} (Build ${PRODUCT_BUILD_ID})"
VIAddVersionKey /LANG=${LANG_FRENCH} "ProductVersion" "${PRODUCT_VERSION}"
VIAddVersionKey /LANG=${LANG_FRENCH} "InternalName" "${PRODUCT_INTERNAL_NAME}"
;VIAddVersionKey /LANG=${LANG_FRENCH} "OriginalFilename" ""
;VIAddVersionKey /LANG=${LANG_FRENCH} "PrivateBuild" ""
;VIAddVersionKey /LANG=${LANG_FRENCH} "SpecialBuild" ""

VIAddVersionKey /LANG=${LANG_SPANISH} "ProductName" "${PRODUCT_NAME}"
VIAddVersionKey /LANG=${LANG_SPANISH} "Comments" "Instalador de ${PRODUCT_NAME} para Microsoft Windows"
VIAddVersionKey /LANG=${LANG_SPANISH} "CompanyName" "${PRODUCT_PUBLISHER}  (${PRODUCT_WEB_SITE})"
VIAddVersionKey /LANG=${LANG_SPANISH} "LegalTrademarks" "${PRODUCT_NAME} es distribuido bajo licencia GNU GPL"
VIAddVersionKey /LANG=${LANG_SPANISH} "LegalCopyright" "${PRODUCT_PUBLISHER}"
VIAddVersionKey /LANG=${LANG_SPANISH} "FileDescription" "${PRODUCT_NAME} para Microsoft Windows"
VIAddVersionKey /LANG=${LANG_SPANISH} "FileVersion" "${FILE_VERSION} (Build ${PRODUCT_BUILD_ID})"
VIAddVersionKey /LANG=${LANG_SPANISH} "ProductVersion" "${PRODUCT_VERSION}"
VIAddVersionKey /LANG=${LANG_SPANISH} "InternalName" "${PRODUCT_INTERNAL_NAME}"
;VIAddVersionKey /LANG=${LANG_SPANISH} "OriginalFilename" ""
;VIAddVersionKey /LANG=${LANG_SPANISH} "PrivateBuild" ""
;VIAddVersionKey /LANG=${LANG_SPANISH} "SpecialBuild" ""


;--------------------------------
; Install Types

InstType "$(InstType_Default)"
InstType "$(InstType_Full)"
InstType "$(InstType_Minimal)"


;--------------------------------
; Installer Sections

Section "-Init" SecInit
   AddSize 1024

   ; Debug
   StrCpy $0 "Init"
   DetailPrint "$(Msg_InstallingSection)"

   ${IfNot} ${Silent}
      ; Build the ${IOS_FINAL} section in the Options.ini file
      ${CopyINIOptionSection} "${IOS_GUI}" "${IOS_FINAL}"
   ${EndIf}

   ; Get current install subkey (Debug)
   ${GetCurrentInstallSubKey} $R0
   DetailPrint "Current Install Subkey: '$R0'"

   ; Get current install location (Debug)
   ${GetCurrentInstallLocation} $R0
   DetailPrint "Current Install Location: '$R0'"

   ; Get current uninstall subkey (Debug)
   ${GetCurrentUninstallSubKey} $R0
   DetailPrint "Current Uninstall Subkey: '$R0'"

   ; Get current uninstall string (Debug)
   ${GetCurrentUninstallString} $R0
   DetailPrint "Current Uninstall String: '$R0'"

   ; Get current quiet uninstall string (Debug)
   ${GetCurrentQuietUninstallString} $R0
   DetailPrint "Current Quiet Uninstall String: '$R0'"

   ; Windows information (Debug)
   ${GetWindowsName} $R0
   DetailPrint "WindowsName: $R0"
   ${GetWindowsType} $R0
   DetailPrint "WindowsType: $R0"
   ${GetWindowsVersion} $R0
   DetailPrint "WindowsVersion: $R0"
   ${GetWindowsServerName} $R0
   DetailPrint "WindowsServerName: $R0"
   ${GetWindowsServicePack} $R0
   DetailPrint "WindowsServicePack: $R0"
   ${GetWindowsServicePackBuild} $R0
   DetailPrint "WindowsServicePackBuild: $R0"
   ${GetWindowsServicePackMinor} $R0
   DetailPrint "WindowsServicePackMinor: $R0"
   ${GetWindowsServicePackMajor} $R0
   DetailPrint "WindowsServicePackMajor: $R0"
   ${GetWindowsPlatformId} $R0
   DetailPrint "WindowsPlatformId: $R0"
   ${GetWindowsPlatformArchitecture} $R0
   DetailPrint "WindowsPlatformArchitecture: $R0"

   ; Installer platform (Debug)
   DetailPrint "Installer platform architecture: ${FIAI_PLATFORM_ARCHITECTURE}"

   ; Registry subkey (Debug)
   DetailPrint "Registry Install SubKey: $PRODUCT_INST_SUBKEY"
   DetailPrint "Registry Uninstall SubKey: $PRODUCT_UNINST_SUBKEY"

   ; Uninstall current agent
   ${UninstallCurrentAgent} $R0
   DetailPrint "Agent Uninstalled with Code: '$R0'"

   ; Remove Windows service (be sure)
   ${RemoveFusionInventoryService}

   ; Create directories
   ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_INSTALLDIR}"
   CreateDirectory "$R0"
   WriteUninstaller "$R0\${PRODUCT_UNINSTALLER}"

   ; Install Strawberry Perl
   ${InstallStrawberryPerl}
SectionEnd

SectionGroup /e "$(SectionGroup_FusionInventoryAgentTasks)" SecGrpFusionInventoryAgentTasks
   Section /o "Deploy" SecDeploy
      AddSize 1024
      SectionIn 2
      Nop
      SectionGetText ${SecDeploy} $0
      DetailPrint "$(Msg_InstallingSection)"

      ; Install FusionInventory Agent Task Deploy
      ${InstallFusionInventoryAgentTaskDeploy}
   SectionEnd

   Section /o "ESX" SecESX
      AddSize 1024
      SectionIn 2
      Nop
      SectionGetText ${SecESX} $0
      DetailPrint "$(Msg_InstallingSection)"

      ; Install FusionInventory Agent Task ESX
      ${InstallFusionInventoryAgentTaskESX}
   SectionEnd

   Section "Inventory" SecInventory
      AddSize 1024
      SectionIn 1 2 3 RO
      Nop
      SectionGetText ${SecInventory} $0
      DetailPrint "$(Msg_InstallingSection)"

      ; Install FusionInventory Agent
      ${InstallFusionInventoryAgent}
   SectionEnd

   Section /o "Network" SecNetwork
      AddSize 1024
      SectionIn 2
      Nop
      SectionGetText ${SecNetwork} $0
      DetailPrint "$(Msg_InstallingSection)"

      ; Install FusionInventory Agent Task Network
      ${InstallFusionInventoryAgentTaskNetwork}
   SectionEnd

   Section /o "WakeOnLan" SecWakeOnLan
      AddSize 1024
      SectionIn 2
      Nop
      SectionGetText ${SecWakeOnLan} $0
      DetailPrint "$(Msg_InstallingSection)"

      ; Install FusionInventory Agent Task WakeOnLan
      ${InstallFusionInventoryAgentTaskWakeOnLan}
   SectionEnd

SectionGroupEnd

Section "-End" SecEnd
   AddSize 1024

   ; Debug
   StrCpy $0 "End"
   DetailPrint "$(Msg_InstallingSection)"

   ; AddUninstallInformation
   ${AddUninstallInformation}

   ; WriteConfigurationOptions
   ${WriteConfigurationOptions}

   ; InstallFusionInventoryService
   ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_EXECMODE}"
   ${If} "$R0" == "${EXECMODE_SERVICE}"
      ${InstallFusionInventoryService}
   ${EndIf}
SectionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
   !insertmacro MUI_DESCRIPTION_TEXT ${SecDeploy} "$(SecDeploy_Description)"
   !insertmacro MUI_DESCRIPTION_TEXT ${SecESX} "$(SecESX_Description)"
   !insertmacro MUI_DESCRIPTION_TEXT ${SecInventory} "$(SecInventory_Description)"
   !insertmacro MUI_DESCRIPTION_TEXT ${SecNetwork} "$(SecNetwork_Description)"
   !insertmacro MUI_DESCRIPTION_TEXT ${SecWakeOnLan} "$(SecWakeOnLan_Description)"
!insertmacro MUI_FUNCTION_DESCRIPTION_END


;--------------------------------
; Uninstall Types


;--------------------------------
; Uninstaller Sections

Section "-un.InitSection"
   ReadRegStr $R0 "${PRODUCT_UNINST_ROOT_KEY}" "$PRODUCT_UNINST_SUBKEY" "InstallLocation"

   ; Set mode at which commands print their status
   SetDetailsPrint textonly

   ; Remove Windows service
   ${RemoveFusionInventoryService}

   ; Delete file $R0\fusioninventory-agent.bat
   delete "$R0\fusioninventory-agent.bat"

   ; Delete file $R0\license.txt
   delete "$R0\license.txt"

   ; Delete file $R0\readme.txt
   delete "$R0\readme.txt"

   ; Delete file $R0\thanks.txt
   delete "$R0\thanks.txt"

   ; Delete file $R0\${PRODUCT_UNINSTALLER}
   delete "$R0\${PRODUCT_UNINSTALLER}"

   ; Delete directory $R0\certs (whether is empty)
   RMDir "$R0\certs"

   ; Delete directory $R0\debug
   RMDir /r "$R0\debug"

   ; Delete directory $R0\etc
   RMDir /r "$R0\etc"

   ; Delete directory $R0\perl
   RMDir /r "$R0\perl"

   ; Delete directory $R0\share
   RMDir /r "$R0\share"

   ; Delete directory $R0\var
   RMDir /r "$R0\var"

   ; Delete directory $R0 (whether is empty)
   RMDir "$R0"

   ; un.EraseConfigurationOptions (Debug)
   ${un.EraseConfigurationOptions}

   ; un.EraseUninstallInformation (Debug)
   ${un.EraseUninstallInformation}
   ;
   ; Sleep 15' (Debug)
   ;Sleep 10000
SectionEnd


;
;--------------------------------
; Callback Installer Functions

Function .onInit
   ; Push $R0 onto the stack
   Push $R0

   ; ClosePadLock
   ${ClosePadLock}

   ; Set default language
   ;StrCpy $LANGUAGE ${LANG_ENGLISH}
   ;StrCpy $LANGUAGE ${LANG_FRENCH}
   ;StrCpy $LANGUAGE ${LANG_SPANISH}

   ; Language selection dialog
   ;!define MUI_LANGDLL_ALWAYSSHOW
   !insertmacro MUI_LANGDLL_DISPLAY

   ; Initializes the plugins directory
   InitPluginsDir

   ; Extract file Options.ini
   SetOutPath "$PLUGINSDIR"
   File "${FIAI_DIR}\INI\Options.ini"

   ; Extract files ${SED_DIR}\libiconv2.dll
   ;               ${SED_DIR}\libintl3.dll
   ;               ${SED_DIR}\regex2.dll
   ;               ${SED_DIR}\sed.exe
   SetOutPath "$PLUGINSDIR"
   File "${SED_DIR}\libiconv2.dll"
   File "${SED_DIR}\libintl3.dll"
   File "${SED_DIR}\regex2.dll"
   File "${SED_DIR}\sed.exe"

   ; Initialize default options
   ${InitINIOptionSectionDefault}

   ; Initialize global variables
   ${InitGlobalVariables}

   ; Check for incompatible target platform architecture
   ${If} $IncompatibleTargetPlatformArchitecture != 0
      ; Platform 32bits / Installer 64bits !!!
      MessageBox MB_OK|MB_ICONSTOP "$(Msg_IncompatibleTargetPlatformArchitecture)" /SD IDOK
      Abort
   ${EndIf}

   ; GetCommandLineOptions
   ${GetCommandLineOptions}

   ; Check whether there is a syntax error
   ${If} ${Errors}
      ; Clears the error flag
      ClearErrors

      ; Set command line syntax error
      StrCpy $CommandLineSyntaxError 1
   ${EndIf}

   ; Check for dump help file
   ${If} $CommandLineSyntaxError = 0
   ${AndIfNot} ${Silent}
      ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_DUMPHELP}"
      ${If} $R0 = 1
         ; Dump help file
         Call BuildHelpFile
         CopyFiles /SILENT /FILESONLY "$PLUGINSDIR\${FIAI_HELP_FILE}" "$EXEDIR\${FIAI_HELP_FILE}"
         Abort
      ${EndIf}
   ${EndIf}

   ; Check for silent installation mode
   ${If} ${Silent}
      ; Silent installation mode

      ; Check for command line syntax error
      ${If} $CommandLineSyntaxError = 1
         Abort
      ${Else}
         Call .onInitSilentMode
      ${EndIf}
   ${Else}
      ; Visual installation mode

      ; Check for command line syntax error
      ${If} $CommandLineSyntaxError = 1
         Nop
      ${Else}
         Call .onInitVisualMode
      ${EndIf}
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd

Function .onInstSuccess
   ; Debug
   ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_INSTALLDIR}"
   CreateDirectory "$R0\debug\"
   CopyFiles "${INI_OPTIONS_FILE}" "$R0\debug\"
   CopyFiles "$PLUGINSDIR\CommandLineParser.log" "$R0\debug\"
FunctionEnd


Function .onInstFailed
   ; Debug
   ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_INSTALLDIR}"
   CreateDirectory "$R0\debug\"
   CopyFiles "${INI_OPTIONS_FILE}" "$R0\debug\"
   CopyFiles "$PLUGINSDIR\CommandLineParser.log" "$R0\debug\"
FunctionEnd


;--------------------------------
; Callback Uninstaller Functions

Function un.onInit
   ; ClosePadLock
   ${un.ClosePadLock}

   ; Set default language
   ;StrCpy $LANGUAGE ${LANG_ENGLISH}
   ;StrCpy $LANGUAGE ${LANG_FRENCH}
   ;StrCpy $LANGUAGE ${LANG_SPANISH}

   ; Language selection dialog
   ;!define MUI_LANGDLL_ALWAYSSHOW
   !insertmacro MUI_LANGDLL_DISPLAY

   ;; Initializes the plugins directory
   ;InitPluginsDir

   ;; Extract file Options.ini
   ;SetOutPath "$PLUGINSDIR"
   ;File "${FIAI_DIR}\INI\Options.ini"

   ; Initialize global variables
   ${un.InitGlobalVariables}
FunctionEnd


;--------------------------------
; Functions

Function .onInitSilentMode
   ; Push $R0 onto the stack
   Push $R0

   ; Has the user accepted the licence?
   ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_ACCEPTLICENSE}"
   ${If} $R0 = 0
   ${OrIf} "$R0" == ""
      ; He must accept the license in silent mode
      Abort
   ${EndIf}

   ; Is FusionInventory Agent installed?
   ${IsFusionInventoryAgentInstalled} $R0

   ${If} $R0 = 0
      ; The agent is not installed yet

      ; Build the ${IOS_FINAL} section in the Options.ini file
      ${CopyINIOptionSection} "${IOS_DEFAULT}" "${IOS_FINAL}"
      ${UpdateINIOptionSection} "${IOS_FINAL}" "${IOS_COMMANDLINE}"
      ${WriteINIOption} "${IOS_FINAL}" "${IO_INSTALLTYPE}" "${INSTALLTYPE_FROMSCRATCH}"

      ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_EXECMODE}"
      ${If} "$R0" == "${EXECMODE_CURRENTCONF}"
         ${WriteINIOption} "${IOS_FINAL}" "${IO_EXECMODE}" "${EXECMODE_SERVICE}"
         ${WriteINIOption} "${IOS_FINAL}" "${IO_SERVICE-START-TYPE}" "${SERVICE_STARTTYPE_AUTO}"
         ${WriteINIOption} "${IOS_FINAL}" "${IO_SERVICE-STATUS}" "${SERVICE_STATUS_RUNNING}"
      ${EndIf}
   ${Else}
      ; The agent is already installed

      ; What kind of installation is requested?
      ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_INSTALLTYPE}"

      ${If} "$R0" == "${INSTALLTYPE_FROMSCRATCH}"
         ; Install the agent from scratch

         ; Build the ${IOS_FINAL} section in the Options.ini file
         ${CopyINIOptionSection} "${IOS_DEFAULT}" "${IOS_FINAL}"
         ${UpdateINIOptionSection} "${IOS_FINAL}" "${IOS_COMMANDLINE}"

         ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_EXECMODE}"
         ${If} "$R0" == "${EXECMODE_CURRENTCONF}"
            ${WriteINIOption} "${IOS_FINAL}" "${IO_EXECMODE}" "${EXECMODE_SERVICE}"
            ${WriteINIOption} "${IOS_FINAL}" "${IO_SERVICE-START-TYPE}" "${SERVICE_STARTTYPE_AUTO}"
            ${WriteINIOption} "${IOS_FINAL}" "${IO_SERVICE-STATUS}" "${SERVICE_STATUS_RUNNING}"
         ${EndIf}
      ${Else}
         ; Install the agent from current configuration

         ; Build the ${IOS_FINAL} section in the Options.ini file
         ${InitINIOptionSectionCurrentConfig}
         ${CopyINIOptionSection} "${IOS_DEFAULT}" "${IOS_FINAL}"
         ${UpdateINIOptionSection} "${IOS_FINAL}" "${IOS_CURRENTCONFIG}"
         ${UpdateINIOptionSection} "${IOS_FINAL}" "${IOS_COMMANDLINE}"

         ; Some options could have been overwritten. Fixing them...

         ; Fixing the ${IO_CA-CERT-DIR} option
         ;    With sense in Windows platform x64 architecture when you
         ;    swap the x86 package by the x64 package, or vice versa
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_CA-CERT-DIR}"
         ${If} "$R0" == ""
            ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_CA-CERT-DIR}"
            !if ${FIAI_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
               ${WordReplace} "$R0" "$PROGRAMFILES64\" "$PROGRAMFILES32\" "+1" "$R0"
            !else
               ${WordReplace} "$R0" "$PROGRAMFILES32\" "$PROGRAMFILES64\" "+1" "$R0"
            !endif
            ${WriteINIOption} "${IOS_FINAL}" "${IO_CA-CERT-DIR}" "$R0"
         ${EndIf}

         ; Fixing the ${IO_CA-CERT-FILE} option
         ;    With sense in Windows platform x64 architecture when you
         ;    swap the x86 package by the x64 package, or vice versa
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_CA-CERT-FILE}"
         ${If} "$R0" == ""
            ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_CA-CERT-FILE}"
            !if ${FIAI_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
               ${WordReplace} "$R0" "$PROGRAMFILES64\" "$PROGRAMFILES32\" "+1" "$R0"
            !else
               ${WordReplace} "$R0" "$PROGRAMFILES32\" "$PROGRAMFILES64\" "+1" "$R0"
            !endif
            ${WriteINIOption} "${IOS_FINAL}" "${IO_CA-CERT-FILE}" "$R0"
         ${EndIf}

         ; Fixing the ${IO_EXECMODE} option
         ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_EXECMODE}"
         ${If} "$R0" == "${EXECMODE_CURRENTCONF}"
            ${ReadINIOption} $R0 "${IOS_CURRENTCONFIG}" "${IO_EXECMODE}"
            ${WriteINIOption} "${IOS_FINAL}" "${IO_EXECMODE}" "$R0"
         ${EndIf}

         ; Fixing the ${IO_SERVICE-START-TYPE} and ${IO_SERVICE-STATUS} options
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_EXECMODE}"
         ${If} "$R0" == "${EXECMODE_SERVICE}"
            ${WriteINIOption} "${IOS_FINAL}" "${IO_SERVICE-START-TYPE}" "${SERVICE_STARTTYPE_AUTO}"
            ${WriteINIOption} "${IOS_FINAL}" "${IO_SERVICE-STATUS}" "${SERVICE_STATUS_RUNNING}"
         ${EndIf}

         ; Fixing the ${IO_LOGFILE} option
         ;    With sense in Windows platform x64 architecture when you
         ;    swap the x86 package by the x64 package, or vice versa
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_LOGFILE}"
         ${If} "$R0" == ""
            ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_LOGFILE}"
            !if ${FIAI_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
               ${WordReplace} "$R0" "$PROGRAMFILES64\" "$PROGRAMFILES32\" "+1" "$R0"
            !else
               ${WordReplace} "$R0" "$PROGRAMFILES32\" "$PROGRAMFILES64\" "+1" "$R0"
            !endif
            ${WriteINIOption} "${IOS_FINAL}" "${IO_LOGFILE}" "$R0"
         ${EndIf}
      ${EndIf}
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function .onInitVisualMode
   ; Push $R0 onto the stack
   Push $R0

   ; Is FusionInventory Agent installed?
   ${IsFusionInventoryAgentInstalled} $R0

   ${If} $R0 = 0
      ; The agent is not installed yet

      ; Build the ${IOS_DEFAULTGUI} section in the Options.ini file
      ${CopyINIOptionSection} "${IOS_DEFAULT}" "${IOS_DEFAULTGUI}"
      ${UpdateINIOptionSection} "${IOS_DEFAULTGUI}" "${IOS_COMMANDLINE}"
      ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_INSTALLTYPE}" "${INSTALLTYPE_FROMSCRATCH}"

      ${ReadINIOption} $R0 "${IOS_DEFAULTGUI}" "${IO_EXECMODE}"
      ${If} "$R0" == "${EXECMODE_CURRENTCONF}"
         ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_EXECMODE}" "${EXECMODE_SERVICE}"
         ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_SERVICE-START-TYPE}" "${SERVICE_STARTTYPE_AUTO}"
         ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_SERVICE-STATUS}" "${SERVICE_STATUS_RUNNING}"
      ${EndIf}
   ${Else}
      ; The agent is already installed

      ; Note: Whether you change this block of code, please, remember also to do the necessary changesi
      ;       into function InstallModePage Leave in ${FIAI_DIR}\Contrib\ModernUI2\Pages\InstallModePage.nsh

      ; What kind of installation is requested?
      ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_INSTALLTYPE}"

      ${If} "$R0" == "${INSTALLTYPE_FROMSCRATCH}"
         ; Install the agent from scratch

         ; Build the ${IOS_DEFAULTGUI} section in the Options.ini file
         ${CopyINIOptionSection} "${IOS_DEFAULT}" "${IOS_DEFAULTGUI}"
         ${UpdateINIOptionSection} "${IOS_DEFAULTGUI}" "${IOS_COMMANDLINE}"

         ${ReadINIOption} $R0 "${IOS_DEFAULTGUI}" "${IO_EXECMODE}"
         ${If} "$R0" == "${EXECMODE_CURRENTCONF}"
            ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_EXECMODE}" "${EXECMODE_SERVICE}"
            ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_SERVICE-START-TYPE}" "${SERVICE_STARTTYPE_AUTO}"
            ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_SERVICE-STATUS}" "${SERVICE_STATUS_RUNNING}"
         ${EndIf}
      ${Else}
         ; Install the agent from current configuration

         ; Build the ${IOS_DEFAULTGUI} section in the Options.ini file
         ${InitINIOptionSectionCurrentConfig}
         ${CopyINIOptionSection} "${IOS_DEFAULT}" "${IOS_DEFAULTGUI}"
         ${UpdateINIOptionSection} "${IOS_DEFAULTGUI}" "${IOS_CURRENTCONFIG}"
         ${UpdateINIOptionSection} "${IOS_DEFAULTGUI}" "${IOS_COMMANDLINE}"

         ; Some options could have been overwritten. Fixing them...

         ; Fixing the ${IO_CA-CERT-DIR} option
         ;    With sense in Windows platform x64 architecture when you
         ;    swap the x86 package by the x64 package, or vice versa
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_CA-CERT-DIR}"
         ${If} "$R0" == ""
            ${ReadINIOption} $R0 "${IOS_DEFAULTGUI}" "${IO_CA-CERT-DIR}"
            !if ${FIAI_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
               ${WordReplace} "$R0" "$PROGRAMFILES64\" "$PROGRAMFILES32\" "+1" "$R0"
            !else
               ${WordReplace} "$R0" "$PROGRAMFILES32\" "$PROGRAMFILES64\" "+1" "$R0"
            !endif
            ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_CA-CERT-DIR}" "$R0"
         ${EndIf}

         ; Fixing the ${IO_CA-CERT-FILE} option
         ;    With sense in Windows platform x64 architecture when you
         ;    swap the x86 package by the x64 package, or vice versa
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_CA-CERT-FILE}"
         ${If} "$R0" == ""
            ${ReadINIOption} $R0 "${IOS_DEFAULTGUI}" "${IO_CA-CERT-FILE}"
            !if ${FIAI_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
               ${WordReplace} "$R0" "$PROGRAMFILES64\" "$PROGRAMFILES32\" "+1" "$R0"
            !else
               ${WordReplace} "$R0" "$PROGRAMFILES32\" "$PROGRAMFILES64\" "+1" "$R0"
            !endif
            ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_CA-CERT-FILE}" "$R0"
         ${EndIf}

         ; Fixing the ${IO_EXECMODE} option
         ${ReadINIOption} $R0 "${IOS_DEFAULTGUI}" "${IO_EXECMODE}"
         ${If} "$R0" == "${EXECMODE_CURRENTCONF}"
            ${ReadINIOption} $R0 "${IOS_CURRENTCONFIG}" "${IO_EXECMODE}"
            ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_EXECMODE}" "$R0"
         ${EndIf}

         ; Fixing the ${IO_SERVICE-START-TYPE} and ${IO_SERVICE-STATUS} options
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_EXECMODE}"
         ${If} "$R0" == "${EXECMODE_SERVICE}"
            ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_SERVICE-START-TYPE}" "${SERVICE_STARTTYPE_AUTO}"
            ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_SERVICE-STATUS}" "${SERVICE_STATUS_RUNNING}"
         ${EndIf}

         ; Fixing the ${IO_LOGFILE} option
         ;    With sense in Windows platform x64 architecture when you
         ;    swap the x86 package by the x64 package, or vice versa
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_LOGFILE}"
         ${If} "$R0" == ""
            ${ReadINIOption} $R0 "${IOS_DEFAULTGUI}" "${IO_LOGFILE}"
            !if ${FIAI_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
               ${WordReplace} "$R0" "$PROGRAMFILES64\" "$PROGRAMFILES32\" "+1" "$R0"
            !else
               ${WordReplace} "$R0" "$PROGRAMFILES32\" "$PROGRAMFILES64\" "+1" "$R0"
            !endif
            ${WriteINIOption} "${IOS_DEFAULTGUI}" "${IO_LOGFILE}" "$R0"
         ${EndIf}
      ${EndIf}
   ${EndIf}

   ; Build the ${IOS_GUI} section in the Options.ini file
   ${CopyINIOptionSection} "${IOS_DEFAULTGUI}" "${IOS_GUI}"

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd
