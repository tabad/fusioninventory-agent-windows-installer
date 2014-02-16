/*
   ------------------------------------------------------------------------
   FusionInventory Agent Installer for Microsoft Windows
   Copyright (C) 2010-2013 by the FusionInventory Development Team.

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
   @file      .\FusionInventory Agent\Include\CurrentConfig.nsh
   @author    Tomas Abad <tabadgp@gmail.com>
   @copyright Copyright (c) 2010-2013 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_CURRENTCONFIG_INCLUDE__
!define __FIAI_CURRENTCONFIG_INCLUDE__


!include "LogicLib.nsh"
!include "${FIAI_DIR}\Include\CommaUStrFunc.nsh"
!include "${FIAI_DIR}\Include\INIFunc.nsh"
!include "${FIAI_DIR}\Include\OptionChecks.nsh"
!include "${FIAI_DIR}\Include\RegFunc.nsh"
!include "${FIAI_DIR}\Include\StrFunc.nsh"
!include "${FIAI_DIR}\Include\WinServicesFunc.nsh"
!include "${FIAI_DIR}\Include\WinTasksFunc.nsh"


Function GetCurrentOptions
   ; $R0 INI Section
   ; $R1 Install Subkey
   ; $R2 Auxiliary
   ; $R3 Auxiliary

   ; Get parameters
   Pop $R1
   Pop $R0

   ; Push $R2 & $R3 onto the stack
   Push $R2
   Push $R3

   ; Get option 'collect-timeout'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_COLLECT-TIMEOUT}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionCollectTimeoutValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_COLLECT-TIMEOUT}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'ca-cert-dir'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_CA-CERT-DIR}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionCaCertDirValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_CA-CERT-DIR}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'ca-cert-file'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_CA-CERT-FILE}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionCaCertFileValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_CA-CERT-FILE}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'debug'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_DEBUG}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionDebugValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_DEBUG}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'delaytime'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_DELAYTIME}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionDelaytimeValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_DELAYTIME}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'httpd-ip'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_HTTPD-IP}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionHttpdIpValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_HTTPD-IP}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'httpd-port'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_HTTPD-PORT}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionHttpdPortValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_HTTPD-PORT}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'httpd-trust'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_HTTPD-TRUST}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${AddCommaStrCommaUStr} "" "$R2" $R2
      ${If} ${IsValidOptionHttpdTrustValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_HTTPD-TRUST}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'logfile'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_LOGFILE}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionLogfileValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_LOGFILE}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'logfile-maxsize'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_LOGFILE-MAXSIZE}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionLogfileMaxsizeValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_LOGFILE-MAXSIZE}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'logger'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_LOGGER}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${AddCommaStrCommaUStr} "" "$R2" $R2
      ${If} ${IsValidOptionLoggerValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_LOGGER}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'no-category'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-CATEGORY}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${AddCommaStrCommaUStr} "" "$R2" $R2
      ${If} ${IsValidOptionNoCategoryValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_NO-CATEGORY}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'no-httpd'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-HTTPD}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionNoHttpdValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_NO-HTTPD}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'no-p2p'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-P2P}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionNoP2pValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_NO-P2P}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'no-ssl-check'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-SSL-CHECK}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionNoSslCheckValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_NO-SSL-CHECK}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Set option 'no-start-menu'
   SetShellVarContext all
   ${IfNot} ${FileExists} "$SMPROGRAMS\FusionInventory Status.url"
   ${AndIfNot} ${FileExists} "$SMPROGRAMS\${PRODUCT_NAME}\FusionInventory Website.url"
      ${WriteINIOption} "$R0" "${IO_NO-START-MENU}" "1"
   ${EndIf}

   ; Get option 'no-task'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-TASK}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${AddCommaStrCommaUStr} "" "$R2" $R2
      ${If} ${IsValidOptionNoTaskValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_NO-TASK}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'password'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_PASSWORD}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionPasswordValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_PASSWORD}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'proxy'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_PROXY}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionProxyValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_PROXY}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'scan-homedirs'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_SCAN-HOMEDIRS}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionScanHomedirsValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_SCAN-HOMEDIRS}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'server'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_SERVER}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${AddCommaStrCommaUStr} "" "$R2" $R2
      ${If} ${IsValidOptionServerValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_SERVER}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'tag'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_TAG}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionTagValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_TAG}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'timeout'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_TIMEOUT}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionTimeoutValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_TIMEOUT}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Get option 'user'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_USER}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionUserValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_USER}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Pop $R3 & $R2 off of the stack
   Pop $R3
   Pop $R2
FunctionEnd


; GetCurrentProductArchitecture
!define GetCurrentProductArchitecture "!insertmacro GetCurrentProductArchitecture"

!macro GetCurrentProductArchitecture ResultVar
   Call GetCurrentProductArchitecture
   Pop "${ResultVar}"
!macroend

Function GetCurrentProductArchitecture
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
      ${registry::Read} "${PRODUCT_UNINST_ROOT_KEY}\$R1" "Architecture" $R2 $R3

      ${If} "$R2" != ""
      ${AndIf} "$R3" == "REG_SZ"
         ${Trim} "$R2" $R2
         ${Select} "$R2"
            ${Case} "32"
               ; x86 architecture
               StrCpy $R0 "${PLATFORM_ARCHITECTURE_32}"
            ${Case} "64"
               ; x64 architecture
               StrCpy $R0 "${PLATFORM_ARCHITECTURE_64}"
            ${CaseElse}
               ; Invalid architecture
               StrCpy $R0 "Error!"
         ${EndSelect}
      ${Else}
         ; x86 architecture
         ;    Previous installer
         StrCpy $R0 "${PLATFORM_ARCHITECTURE_32}"
      ${EndIf}
   ${EndIf}

   ; Pop $R3, $R2 & $R1 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; GetCurrentProductVersion
!define GetCurrentProductVersion "!insertmacro GetCurrentProductVersion"

!macro GetCurrentProductVersion ResultVar
   Call GetCurrentProductVersion
   Pop "${ResultVar}"
!macroend

Function GetCurrentProductVersion
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
      ${registry::Read} "${PRODUCT_UNINST_ROOT_KEY}\$R1" "DisplayVersion" $R2 $R3

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


; InitINIOptionsSectionCurrentConfig
!define InitINIOptionSectionCurrentConfig "Call InitINIOptionSectionCurrentConfig"

Function InitINIOptionSectionCurrentConfig
   ; $R0 INI Section
   ; $R1 Current Install Subkey

   ; Push $R0, $R1, $R2, $R3 & $R4 onto the stack
   Push $R0
   Push $R1
   Push $R2
   Push $R3
   Push $R4

   ; Set default section
   StrCpy $R0 "${IOS_CURRENTCONFIG}"

   ; Delete section
   ${DeleteINIOptionSection} "$R0"

   ; Get current install subkey
   ${GetCurrentInstallSubkey} $R1

   ; Migrate deprecated options
   Push "$R0"
   Push "$R1"
   Call MigrateDeprecatedOptions

   ; Note: The values of current option have preference
   ;       over the values of deprecated options

   ; Get current options
   Push "$R0"
   Push "$R1"
   Call GetCurrentOptions

   ; ToDo
   ; Get execmode
   ; Get current install dir
   ; Get firewall configuration

   ; Get current execution mode
   ;   Windows service has preference over Windows task
   ${If} ${FusionInventoryAgentServiceIsInstalled}
      ; FusionInventory Agent Windows service installed
      ${WriteINIOption} "$R0" "${IO_EXECMODE}" "${EXECMODE_SERVICE}"
      ${GetFusionInventoryWindowsServiceStartType} $R1
      ${WriteINIOption} "$R0" "${IO_SERVICE-START-TYPE}" "$R1"
      ${GetFusionInventoryWindowsServiceStatus} $R1
      ${WriteINIOption} "$R0" "${IO_SERVICE-STATUS}" "$R1"
   ${ElseIf} ${FusionInventoryAgentTaskIsInstalled}
      ; FusionInventory Agent Windows task installed
      ${WriteINIOption} "$R0" "${IO_EXECMODE}" "${EXECMODE_TASK}"
      ${GetFusionInventoryTaskSchedule} $R1 $R2

      ${IfNot} ${Errors}
         ${WriteINIOption} "$R0" "${IO_TASK-FREQUENCY}" "$R1"
         ${Select} "$R1"
            ${Case} "${FREQUENCY_MINUTE}"
               ${WriteINIOption} "$R0" "${IO_TASK-MINUTE-MODIFIER}" "$R2"
            ${Case} "${FREQUENCY_HOURLY}"
               ${WriteINIOption} "$R0" "${IO_TASK-HOURLY-MODIFIER}" "$R2"
            ${Case} "${FREQUENCY_DAILY}"
               ${WriteINIOption} "$R0" "${IO_TASK-DAILY-MODIFIER}" "$R2"
         ${EndSelect}
      ${EndIf}
   ${EndIf}

   ${ReadINIOption} $R1 "$R0" "${IO_EXECMODE}"
   ${If} "$R1" == ""
      ; Neither Windows service nor Windows task
      ${WriteINIOption} "$R0" "${IO_EXECMODE}" "${EXECMODE_MANUAL}"
   ${EndIf}

   ; Get current installed tasks
   ${GetCurrentInstallLocation} $R1
   ${If} "$R1" != ""
      StrCpy $R2 ""
      ${If} ${FileExists} "$R1\perl\agent\FusionInventory\Agent\Task\Deploy.pm"
      ${OrIf} ${FileExists} "$R1\perl\lib\FusionInventory\Agent\Task\OCSDeploy.pm"
          ${AddStrCommaUStr} "$R2" "${TASK_DEPLOY}" $R2
      ${EndIf}
      ${If} ${FileExists} "$R1\perl\agent\FusionInventory\Agent\Task\ESX.pm"
      ${OrIf} ${FileExists} "$R1\perl\lib\FusionInventory\Agent\Task\ESX.pm"
          ${AddStrCommaUStr} "$R2" "${TASK_ESX}" $R2
      ${EndIf}
      ${If} ${FileExists} "$R1\perl\agent\FusionInventory\Agent\Task\Inventory.pm"
      ${OrIf} ${FileExists} "$R1\perl\lib\FusionInventory\Agent\Task\Inventory.pm"
          ${AddStrCommaUStr} "$R2" "${TASK_INVENTORY}" $R2
      ${EndIf}
      ${If} ${FileExists} "$R1\perl\agent\FusionInventory\Agent\Task\NetDiscovery.pm"
      ${OrIf} ${FileExists} "$R1\perl\lib\FusionInventory\Agent\Task\NetDiscovery.pm"
          ${AddStrCommaUStr} "$R2" "${TASK_NETDISCOVERY}" $R2
      ${EndIf}
      ${If} ${FileExists} "$R1\perl\agent\FusionInventory\Agent\Task\NetInventory.pm"
      ${OrIf} ${FileExists} "$R1\perl\lib\FusionInventory\Agent\Task\SNMPQuery.pm"
          ${AddStrCommaUStr} "$R2" "${TASK_NETINVENTORY}" $R2
      ${EndIf}
      ${If} ${FileExists} "$R1\perl\agent\FusionInventory\Agent\Task\WakeOnLan.pm"
      ${OrIf} ${FileExists} "$R1\perl\lib\FusionInventory\Agent\Task\WakeOnLan.pm"
          ${AddStrCommaUStr} "$R2" "${TASK_WAKEONLAN}" $R2
      ${EndIf}
      ${WriteINIOption} "$R0" "${IO_INSTALLTASKS}" "$R2"
   ${EndIf}

   ; Pop $R4, $R3, $R2, $R1 and $R0 off of the stack
   Pop $R4
   Pop $R3
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function MigrateDeprecatedOptions
   ; $R0 INI Section
   ; $R1 Install Subkey
   ; $R2 Auxiliary
   ; $R3 Auxiliary

   ; Get parameters
   Pop $R1
   Pop $R0

   ; Push $R2 & $R3 onto the stack
   Push $R2
   Push $R3

   ; Migrate option 'backend-collect-timeout'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_BACKEND-COLLECT-TIMEOUT}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionCollectTimeoutValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_COLLECT-TIMEOUT}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Migrate option 'no-inventory'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-INVENTORY}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionNoInventoryValue} "$R2"
      ${AndIf} $R2 = 1
         ; Write option into $R0 section
         ${ReadINIOption} $R3 "$R0" "${IO_NO-TASK}"
         ${AddStrCommaUStr} "$R3" "${TASK_INVENTORY}" $R3
         ${WriteINIOption} "$R0" "${IO_NO-TASK}" "$R3"
      ${EndIf}
   ${EndIf}

   ; Migrate option 'no-netdiscovery'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-NETDISCOVERY}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionNoNetdiscoveryValue} "$R2"
      ${AndIf} $R2 = 1
         ; Write option into $R0 section
         ${ReadINIOption} $R3 "$R0" "${IO_NO-TASK}"
         ${AddStrCommaUStr} "$R3" "${TASK_NETDISCOVERY}" $R3
         ${WriteINIOption} "$R0" "${IO_NO-TASK}" "$R3"
      ${EndIf}
   ${EndIf}

   ; Migrate option 'no-ocsdeploy'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-OCSDEPLOY}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionNoOcsdeployValue} "$R2"
      ${AndIf} $R2 = 1
         ; Write option into $R0 section
         ${ReadINIOption} $R3 "$R0" "${IO_NO-TASK}"
         ${AddStrCommaUStr} "$R3" "${TASK_DEPLOY}" $R3
         ${WriteINIOption} "$R0" "${IO_NO-TASK}" "$R3"
      ${EndIf}
   ${EndIf}

   ; Migrate option 'no-printer'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-PRINTER}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionNoPrinterValue} "$R2"
      ${AndIf} $R2 = 1
         ; Write option into $R0 section
         ${ReadINIOption} $R3 "$R0" "${IO_NO-CATEGORY}"
         ${AddStrCommaUStr} "$R3" "${CATEGORY_PRINTER}" $R3
         ${WriteINIOption} "$R0" "${IO_NO-CATEGORY}" "$R3"
      ${EndIf}
   ${EndIf}

   ; Migrate option 'no-snmpquery'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-SNMPQUERY}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionNoSnmpqueryValue} "$R2"
      ${AndIf} $R2 = 1
         ; Write option into $R0 section
         ${ReadINIOption} $R3 "$R0" "${IO_NO-TASK}"
         ${AddStrCommaUStr} "$R3" "${TASK_NETINVENTORY}" $R3
         ${WriteINIOption} "$R0" "${IO_NO-TASK}" "$R3"
      ${EndIf}
   ${EndIf}

   ; Migrate option 'no-socket'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-SOCKET}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionNoSocketValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_NO-HTTPD}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Migrate option 'no-software'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-SOFTWARE}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionNoSoftwareValue} "$R2"
      ${AndIf} $R2 = 1
         ; Write option into $R0 section
         ${ReadINIOption} $R3 "$R0" "${IO_NO-CATEGORY}"
         ${AddStrCommaUStr} "$R3" "${CATEGORY_SOFTWARE}" $R3
         ${WriteINIOption} "$R0" "${IO_NO-CATEGORY}" "$R3"
      ${EndIf}
   ${EndIf}

   ; Migrate option 'no-wakeonlan'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_NO-WAKEONLAN}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionNoWakeonlanValue} "$R2"
      ${AndIf} $R2 = 1
         ; Write option into $R0 section
         ${ReadINIOption} $R3 "$R0" "${IO_NO-TASK}"
         ${AddStrCommaUStr} "$R3" "${TASK_WAKEONLAN}" $R3
         ${WriteINIOption} "$R0" "${IO_NO-TASK}" "$R3"
      ${EndIf}
   ${EndIf}

   ; Migrate option 'rpc-ip'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_RPC-IP}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionRpcIpValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_HTTPD-IP}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Migrate option 'rpc-port'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_RPC-PORT}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionRpcPortValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_HTTPD-PORT}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Migrate option 'rpc-trust-localhost'
   ${registry::Read} "${PRODUCT_INST_ROOT_KEY}\$R1" "${IO_RPC-TRUST-LOCALHOST}" $R2 $R3
   ${If} "$R3" == "REG_SZ"
      ${Trim} "$R2" $R2
      ${If} ${IsValidOptionRpcTrustLocalhostValue} "$R2"
         ; Write option into $R0 section
         ${WriteINIOption} "$R0" "${IO_HTTPD-TRUST}" "$R2"
      ${EndIf}
   ${EndIf}

   ; Pop $R3 & $R2 off of the stack
   Pop $R3
   Pop $R2
FunctionEnd


!endif
