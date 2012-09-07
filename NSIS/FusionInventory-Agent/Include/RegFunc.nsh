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
   @file      .\FusionInventory Agent\Include\RegFunc.nsh
   @author    Tomas Abad
   @copyright Copyright (c) 2010-2012 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_REGFUNC_INCLUDE__
!define __FIAI_REGFUNC_INCLUDE__


!include "${FIAI_DIR}\Include\INIFunc.nsh"
!include "${FIAI_DIR}\Include\Registry.nsh"
!include "${FIAI_DIR}\Include\WindowsInfo.nsh"


; AddUninstallInformation
!define AddUninstallInformation "Call AddUninstallInformation"

Function AddUninstallInformation
   ; Push $R0, $R1 & $R2 onto the stack
   Push $R0
   Push $R1
   Push $R2

   ; Set the section from which to read
   StrCpy $R0 "${IOS_FINAL}"

   ; Erase registry subkey
   Call EraseUninstallInformation

   ; Register key 'Architecture'
   !if ${FIAI_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
      ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "Architecture" "32" "REG_DWORD" $R2
   !else
      ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "Architecture" "64" "REG_DWORD" $R2
   !endif

   ; Register key 'BuildID'
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "BuildID" "${PRODUCT_BUILD_ID}" "REG_DWORD" $R2

   ; Register key 'DisplayIcon'
   ${ReadINIOption} $R1 "$R0" "${IO_INSTALLDIR}"
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "DisplayIcon" "$R1\${PRODUCT_UNINSTALLER}" "REG_SZ" $R2

   ; Register key 'DisplayName'
   !if ${FIAI_PLATFORM_ARCHITECTURE} == ${LABEL_PLATFORM_ARCHITECTURE_32}
      ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "DisplayName" "${PRODUCT_NAME} ${PRODUCT_VERSION} (${LABEL_PLATFORM_ARCHITECTURE_32} edition)" "REG_SZ" $R2
   !else
      ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "DisplayName" "${PRODUCT_NAME} ${PRODUCT_VERSION} (${LABEL_PLATFORM_ARCHITECTURE_64} edition)" "REG_SZ" $R2
   !endif

   ; Register key 'DisplayVersion'
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "DisplayVersion" "${PRODUCT_VERSION}" "REG_SZ" $R2

   ; Register key 'HelpLink'
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "HelpLink" "${PRODUCT_WEB_FOR_SUPPORT}" "REG_SZ" $R2

   ; Register key 'InstallLocation'
   ${ReadINIOption} $R1 "$R0" "${IO_INSTALLDIR}"
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "InstallLocation" "$R1" "REG_SZ" $R2

   ; Register key 'NoModify'
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "NoModify" "1" "REG_DWORD" $R2

   ; Register key 'NoRepair'
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "NoRepair" "1" "REG_DWORD" $R2

   ; Register key 'Publisher'
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "Publisher" "${PRODUCT_PUBLISHER}" "REG_SZ" $R2

   ; Register key 'UninstallString'
   ${ReadINIOption} $R1 "$R0" "${IO_INSTALLDIR}"
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "UninstallString" "$R1\${PRODUCT_UNINSTALLER}" "REG_SZ" $R2

   ; Register key 'QuietUninstallString'
   ${ReadINIOption} $R1 "$R0" "${IO_INSTALLDIR}"
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "QuietUninstallString" '"$R1\${PRODUCT_UNINSTALLER}" /S' "REG_SZ" $R2

   ; Register key 'URLUpdateInfo'
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "URLUpdateInfo" "${PRODUCT_WEB_FOR_UPDATES}" "REG_SZ" $R2

   ; Register key 'VersionMajor'
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "VersionMayor" "${PRODUCT_VERSION_MAJOR}" "REG_DWORD" $R2

   ; Register key 'VersionMinor'
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "VersionMinor" "${PRODUCT_VERSION_MINOR}" "REG_DWORD" $R2

   ; Register key 'VersionRelease'
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "VersionRelease" "${PRODUCT_VERSION_RELEASE}" "REG_DWORD" $R2

   ; Register key 'VersionBuild'
   ${registry::Write} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" "VersionBuild" "${PRODUCT_VERSION_BUILD}" "REG_DWORD" $R2

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


; EraseConfigurationOptions
!macro EraseConfigurationOptions Un
   Function "${Un}EraseConfigurationOptions"
      ; Push $R0 onto the stack
      Push $R0

      ; Erase registry subkey
      ${registry::DeleteKey} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" $R0

      ; Pop $R0 off of the stack
      Pop $R0
   FunctionEnd
!macroend

!insertmacro EraseConfigurationOptions ""
!insertmacro EraseConfigurationOptions "un."

!define EraseConfigurationOptions "Call EraseConfigurationOptions"
!define un.EraseConfigurationOptions "Call un.EraseConfigurationOptions"


; EraseUninstallInformation
!macro EraseUninstallInformation Un
   Function "${Un}EraseUninstallInformation"
      ; Push $R0 onto the stack
      Push $R0

      ; Erase registry subkey
      ${registry::DeleteKey} "${PRODUCT_UNINST_ROOT_KEY}\$PRODUCT_UNINST_SUBKEY" $R0

      ; Pop $R0 off of the stack
      Pop $R0
   FunctionEnd
!macroend

!insertmacro EraseUninstallInformation ""
!insertmacro EraseUninstallInformation "un."

!define EraseUninstallInformation "Call EraseUninstallInformation"
!define un.EraseUninstallInformation "Call un.EraseUninstallInformation"


; GetCurrentInstallLocation
!define GetCurrentInstallLocation "!insertmacro GetCurrentInstallLocation"
!macro GetCurrentInstallLocation ResultVar
   Call GetCurrentInstallLocation
   Pop "${ResultVar}"
!macroend

Function GetCurrentInstallLocation
   ; Push $R0, $R1, $R2 & $R3 onto the stack
   Push $R0
   Push $R1
   Push $R2
   Push $R3

   ; Initialize $R0
   StrCpy $R0 ""

   ; Get current uninstall subkey
   Call GetCurrentUninstallSubkey
   Pop $R1

   ${If} "$R1" != ""
      ; Get current install location
      ${registry::Read} "${PRODUCT_UNINST_ROOT_KEY}\$R1" "InstallLocation" $R2 $R3

      ${If} "$R2" != ""
      ${AndIf} "$R3" == "REG_SZ"
         StrCpy $R0 "$R2"
      ${EndIf}
   ${EndIf}

   ; Pop $R3, $R2 & $R1 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; GetCurrentInstallSubkey
!define GetCurrentInstallSubkey "!insertmacro GetCurrentInstallSubkey"
!macro GetCurrentInstallSubkey ResultVar
   Call GetCurrentInstallSubkey
   Pop "${ResultVar}"
!macroend

Function GetCurrentInstallSubkey
   ; Push $R0 & $R1 onto the stack
   Push $R0
   Push $R1

   ; Get Windows platform architecture
   ${GetWindowsPlatformArchitecture} $R0

   ${If} $R1 = 32
      ; Platform 32bits

      ; Check if the subkey SOFTWARE\${PRODUCT_INTERNAL_NAME} exist
      StrCpy $R1 "SOFTWARE\${PRODUCT_INTERNAL_NAME}"
      ${registry::KeyExists} "${PRODUCT_INST_ROOT_KEY}\$R1" $R0
      ${If} $R0 = 0
         ; Subkey found
         StrCpy $R0 "$R1"
      ${Else}
         ; Subkey not found
         StrCpy $R0 ""
      ${EndIf}
   ${Else}
      ; Platform 64bits

      ; Check if the subkey SOFTWARE\${PRODUCT_INTERNAL_NAME} exist
      StrCpy $R1 "SOFTWARE\${PRODUCT_INTERNAL_NAME}"
      ${registry::KeyExists} "${PRODUCT_INST_ROOT_KEY}\$R1" $R0
      ${If} $R0 = 0
         ; Subkey found
         StrCpy $R0 "$R1"
      ${Else}
         ; Check if the subkey SOFTWARE\Wow6432Node\${PRODUCT_INTERNAL_NAME} exist
         StrCpy $R1 "SOFTWARE\Wow6432Node\${PRODUCT_INTERNAL_NAME}"
         ${registry::KeyExists} "${PRODUCT_INST_ROOT_KEY}\$R1" $R0
         ${If} $R0 = 0
            ; Subkey found
            StrCpy $R0 "$R1"
         ${Else}
            ; Subkey not found
            StrCpy $R0 ""
         ${EndIf}
      ${EndIf}
   ${EndIf}

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; GetCurrentQuietUninstallString
!define GetCurrentQuietUninstallString "!insertmacro GetCurrentQuietUninstallString"

!macro GetCurrentQuietUninstallString ResultVar
   Call GetCurrentQuietUninstallString
   Pop "${ResultVar}"
!macroend

Function GetCurrentQuietUninstallString
   ; Push $R0, $R1, $R2 & $R3 onto the stack
   Push $R0
   Push $R1
   Push $R2
   Push $R3

   ; Initialize $R0
   StrCpy $R0 ""

   ; Get current uninstall subkey
   Call GetCurrentUninstallSubkey
   Pop $R1

   ${If} "$R1" != ""
      ; Get current quiet uninstall string
      ${registry::Read} "${PRODUCT_UNINST_ROOT_KEY}\$R1" "QuietUninstallString" $R2 $R3

      ${If} "$R2" != ""
      ${AndIf} "$R3" == "REG_SZ"
         StrCpy $R0 "$R2"
      ${Else}
         ; Get current uninstall string
         Call GetCurrentUninstallString
         Pop $R1

         ${If} "$R1" != ""
            ; Build current quiet uninstall string
            StrCpy $R0 '"$R1" /S'
         ${EndIf}
      ${EndIf}
   ${EndIf}

   ; Pop $R3, $R2 & $R1 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; GetCurrentUninstallString
!define GetCurrentUninstallString "!insertmacro GetCurrentUninstallString"

!macro GetCurrentUninstallString ResultVar
   Call GetCurrentUninstallString
   Pop "${ResultVar}"
!macroend

Function GetCurrentUninstallString
   ; Push $R0, $R1, $R2 & $R3 onto the stack
   Push $R0
   Push $R1
   Push $R2
   Push $R3

   ; Initialize $R0
   StrCpy $R0 ""

   ; Get current uninstall subkey
   Call GetCurrentUninstallSubkey
   Pop $R1

   ${If} "$R1" != ""
      ; Get current uninstall string
      ${registry::Read} "${PRODUCT_UNINST_ROOT_KEY}\$R1" "UninstallString" $R2 $R3

      ${If} "$R2" != ""
      ${AndIf} "$R3" == "REG_SZ"
         StrCpy $R0 "$R2"
      ${EndIf}
   ${EndIf}

   ; Pop $R3, $R2 & $R1 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; GetCurrentUninstallSubkey
!define GetCurrentUninstallSubkey "!insertmacro GetCurrentUninstallSubkey"
!macro GetCurrentUninstallSubkey ResultVar
   Call GetCurrentUninstallSubkey
   Pop "${ResultVar}"
!macroend

Function GetCurrentUninstallSubkey
   ; Push $R0 & $R1 onto the stack
   Push $R0
   Push $R1

   ; Get Windows platform architecture
   ${GetWindowsPlatformArchitecture} $R0

   ${If} $R1 = 32
      ; Platform 32bits

      ; Check if the subkey SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME} exist
      ;    This subkey is now deprecated
      StrCpy $R1 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
      ${registry::KeyExists} "${PRODUCT_INST_ROOT_KEY}\$R1" $R0
      ${If} $R0 = 0
         ; Subkey found
         StrCpy $R0 "$R1"
      ${Else}
         ; Check if the subkey SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_INTERNAL_NAME} exist
         StrCpy $R1 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_INTERNAL_NAME}"
         ${registry::KeyExists} "${PRODUCT_INST_ROOT_KEY}\$R1" $R0
         ${If} $R0 = 0
            ; Subkey found
            StrCpy $R0 "$R1"
         ${Else}
            ; Subkey not found
            StrCpy $R0 ""
         ${EndIf}
      ${EndIf}
   ${Else}
      ; Platform 64bits

      ; Check if the subkey SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME} exist
      ;    This subkey is now deprecated
      StrCpy $R1 "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
      ${registry::KeyExists} "${PRODUCT_INST_ROOT_KEY}\$R1" $R0
      ${If} $R0 = 0
         ; Subkey found
         StrCpy $R0 "$R1"
      ${Else}
         ; Check if the subkey SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_INTERNAL_NAME} exist
         StrCpy $R1 "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_INTERNAL_NAME}"
         ${registry::KeyExists} "${PRODUCT_INST_ROOT_KEY}\$R1" $R0
         ${If} $R0 = 0
            ; Subkey found
            StrCpy $R0 "$R1"
         ${Else}
            ; Check if the subkey SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_INTERNAL_NAME} exist
            StrCpy $R1 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_INTERNAL_NAME}"
            ${registry::KeyExists} "${PRODUCT_INST_ROOT_KEY}\$R1" $R0
            ${If} $R0 = 0
               ; Subkey found
               StrCpy $R0 "$R1"
            ${Else}
               ; Subkey not found
               StrCpy $R0 ""
            ${EndIf}
         ${EndIf}
      ${EndIf}
   ${EndIf}

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsFusionInventoryAgentInstalled
!define IsFusionInventoryAgentInstalled "!insertmacro IsFusionInventoryAgentInstalled"

!macro IsFusionInventoryAgentInstalled ResultVar
   Call GetCurrentInstallSubkey
   Pop ${ResultVar}
   ${If} "${ResultVar}" == ""
      StrCpy "${ResultVar}" 0
   ${Else}
      StrCpy "${ResultVar}" 1
   ${EndIf}
!macroend


; WriteConfigurationOptions
!define WriteConfigurationOptions "Call WriteConfigurationOptions"

Function WriteConfigurationOptions
   ; Push $R0 $R1 & $R2 onto the stack
   Push $R0
   Push $R1
   Push $R2

   ; Set the section from which to read
   StrCpy $R0 "${IOS_FINAL}"

   ; Erase registry subkey
   ${EraseConfigurationOptions}

   ; Register key '${IO_BACKEND-COLLECT-TIMEOUT}'
   ${ReadINIOption} $R1 "$R0" "${IO_BACKEND-COLLECT-TIMEOUT}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_BACKEND-COLLECT-TIMEOUT}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_CA-CERT-DIR}'
   ${ReadINIOption} $R1 "$R0" "${IO_CA-CERT-DIR}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_CA-CERT-DIR}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_CA-CERT-FILE}'
   ${ReadINIOption} $R1 "$R0" "${IO_CA-CERT-FILE}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_CA-CERT-FILE}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_DEBUG}'
   ${ReadINIOption} $R1 "$R0" "${IO_DEBUG}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_DEBUG}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_DELAYTIME}'
   ${ReadINIOption} $R1 "$R0" "${IO_DELAYTIME}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_DELAYTIME}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_HTML}'
   ${ReadINIOption} $R1 "$R0" "${IO_HTML}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_HTML}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_HTTPD-IP}'
   ${ReadINIOption} $R1 "$R0" "${IO_HTTPD-IP}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_HTTPD-IP}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_HTTPD-PORT}'
   ${ReadINIOption} $R1 "$R0" "${IO_HTTPD-PORT}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_HTTPD-PORT}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_HTTPD-TRUST}'
   ${ReadINIOption} $R1 "$R0" "${IO_HTTPD-TRUST}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_HTTPD-TRUST}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_LOCAL}'
   ${ReadINIOption} $R1 "$R0" "${IO_LOCAL}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_LOCAL}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_LOGFILE}'
   ${ReadINIOption} $R1 "$R0" "${IO_LOGFILE}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_LOGFILE}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_LOGFILE-MAXSIZE}'
   ${ReadINIOption} $R1 "$R0" "${IO_LOGFILE-MAXSIZE}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_LOGFILE-MAXSIZE}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_LOGGER}'
   ${ReadINIOption} $R1 "$R0" "${IO_LOGGER}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_LOGGER}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_NO-CATEGORY}'
   ${ReadINIOption} $R1 "$R0" "${IO_NO-CATEGORY}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_NO-CATEGORY}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_NO-HTTPD}'
   ${ReadINIOption} $R1 "$R0" "${IO_NO-HTTPD}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_NO-HTTPD}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_NO-P2P}'
   ${ReadINIOption} $R1 "$R0" "${IO_NO-P2P}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_NO-P2P}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_NO-SSL-CHECK}'
   ${ReadINIOption} $R1 "$R0" "${IO_NO-SSL-CHECK}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_NO-SSL-CHECK}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_NO-TASK}'
   ${ReadINIOption} $R1 "$R0" "${IO_NO-TASK}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_NO-TASK}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_PASSWORD}'
   ${ReadINIOption} $R1 "$R0" "${IO_PASSWORD}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_PASSWORD}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_PROXY}'
   ${ReadINIOption} $R1 "$R0" "${IO_PROXY}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_PROXY}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_SERVER}'
   ${ReadINIOption} $R1 "$R0" "${IO_SERVER}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_SERVER}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_SCAN-HOMEDIRS}'
   ${ReadINIOption} $R1 "$R0" "${IO_SCAN-HOMEDIRS}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_SCAN-HOMEDIRS}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_TAG}'
   ${ReadINIOption} $R1 "$R0" "${IO_TAG}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_TAG}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_TIMEOUT}'
   ${ReadINIOption} $R1 "$R0" "${IO_TIMEOUT}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_TIMEOUT}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_USER}'
   ${ReadINIOption} $R1 "$R0" "${IO_USER}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_USER}" "$R1" "REG_SZ" $R2

   ; Register key '${IO_WAIT}'
   ${ReadINIOption} $R1 "$R0" "${IO_WAIT}"
   ${registry::Write} "${PRODUCT_INST_ROOT_KEY}\$PRODUCT_INST_SUBKEY" "${IO_WAIT}" "$R1" "REG_SZ" $R2

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


!endif
