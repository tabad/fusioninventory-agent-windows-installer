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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\InstallationTypePage.nsh
   @author    Tomas Abad <tabadgp@gmail.com>
   @copyright Copyright (c) 2010-2013 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/

/*
   ------------------------------------------------------------------------
   This file was generated with the help of NSISDialogDesigner 0.9.16.0
   http://coolsoft.altervista.org/nsisdialogdesigner
   ------------------------------------------------------------------------
*/


!include LogicLib.nsh
!include WordFunc.nsh
!include "${FIAI_DIR}\Include\INIFunc.nsh"
!include "${FIAI_DIR}\Include\MiscFunc.nsh"
!include "${FIAI_DIR}\Include\CurrentConfig.nsh"
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\InstallationTypePageLangStrings.nsh"


;--------------------------------
; Handle Variables

Var hCtl_InstallationTypePage
Var hCtl_InstallationTypePage_Label1
Var hCtl_InstallationTypePage_RadioButton1
Var hCtl_InstallationTypePage_Label2
Var hCtl_InstallationTypePage_RadioButton2
Var hCtl_InstallationTypePage_Label3


;--------------------------------
; InstallationType Page Functions

Function InstallationTypePage_Create
   ; Push $R0 & $R1 onto the stack
   Push $R0
   Push $R1

   ; === InstallationTypePage (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_InstallationTypePage
   ${If} "$hCtl_InstallationTypePage" == "error"
     Pop $R0
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(InstallationTypePage_Text)" "$(InstallationTypePage_SubText)"

   ; Get current product version
   ;    Label1_Text use it.
   ${GetCurrentProductVersion} $R0

   ; Get current product architecture
   ;    Label1_Text use it.
   ${GetCurrentProductArchitecture} $R1

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 0u 0u 294u 45u "$(InstallationTypePage_Label1_Text)"
   Pop $hCtl_InstallationTypePage_Label1

   ; === RadioButton1 (type: RadioButton) ===
   ${NSD_CreateRadioButton} 16u 50u 252u 14u "$(InstallationTypePage_RadioButton1_Text)"
   Pop $hCtl_InstallationTypePage_RadioButton1
   ${NSD_AddStyle} $hCtl_InstallationTypePage_RadioButton1 ${WS_GROUP}

   ; === Label2 (type: Label) ===
   ${NSD_CreateLabel} 32u 63u 236u 23u "$(InstallationTypePage_Label2_Text)"
   Pop $hCtl_InstallationTypePage_Label2

   ; === RadioButton2 (type: RadioButton) ===
   ${NSD_CreateRadioButton} 16u 90u 252u 14u "$(InstallationTypePage_RadioButton2_Text)"
   Pop $hCtl_InstallationTypePage_RadioButton2

   ; === Label3 (type: Label) ===
   ${NSD_CreateLabel} 32u 104u 236u 23u "$(InstallationTypePage_Label3_Text)"
   Pop $hCtl_InstallationTypePage_Label3

   ; OnBack function
   ${NSD_OnBack} InstallationTypePage_Back

   ; Default values
   ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_INSTALLTYPE}"

   ${If} "$R0" == "${INSTALLTYPE_FROMSCRATCH}"
      ; Check RadioButton1
      ${NSD_Check} $hCtl_InstallationTypePage_RadioButton1
      ${NSD_Uncheck} $hCtl_InstallationTypePage_RadioButton2
   ${ElseIf} "$R0" == "${INSTALLTYPE_FROMCURRENTCONFIG}"
      ; Check RadioButton2
      ${NSD_Uncheck} $hCtl_InstallationTypePage_RadioButton1
      ${NSD_Check} $hCtl_InstallationTypePage_RadioButton2
   ${Else}
      ; Check RadioButton2
      ${NSD_Uncheck} $hCtl_InstallationTypePage_RadioButton1
      ${NSD_Check} $hCtl_InstallationTypePage_RadioButton2
   ${EndIf}

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


Function InstallationTypePage_Show
   ; Is FusionInventory Agent installed?
   ${If} ${FusionInventoryAgentIsInstalled}
      ; The agent is already installed
      Call InstallationTypePage_Create
      nsDialogs::Show $hCtl_InstallationTypePage
   ${Else}
      ; The agent is not installed yet
      Abort
   ${EndIf}
FunctionEnd


Function InstallationTypePage_Leave
   ; Push $R0 & $R1 onto the stack
   Push $R0
   Push $R1

   ${NSD_GetState} $hCtl_InstallationTypePage_RadioButton1 $R0

   ${If} "$R0" == "${BST_CHECKED}"
      ; ${INSTALLTYPE_FROMSCRATCH}
      ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_INSTALLTYPE}"

      ${If} "$R0" != "${INSTALLTYPE_FROMSCRATCH}"
         ; ${INSTALLTYPE_FROMCURRENTCONFIG} -> ${INSTALLTYPE_FROMSCRATCH}
         ${CopyINIOptionSection} "${IOS_DEFAULT}" "${IOS_GUI}"
         ${UpdateINIOptionSection} "${IOS_GUI}" "${IOS_COMMANDLINE}"
         ${WriteINIOption} "${IOS_GUI}" "${IO_INSTALLTYPE}" "${INSTALLTYPE_FROMSCRATCH}"

         ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_EXECMODE}"
         ${If} "$R0" == "${EXECMODE_CURRENT}"
            ${WriteINIOption} "${IOS_GUI}" "${IO_EXECMODE}" "${EXECMODE_SERVICE}"
            ${WriteINIOption} "${IOS_GUI}" "${IO_SERVICE-START-TYPE}" "${SERVICE_STARTTYPE_AUTO}"
            ${WriteINIOption} "${IOS_GUI}" "${IO_SERVICE-STATUS}" "${SERVICE_STATUS_RUNNING}"
         ${EndIf}

         ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_INSTALLTASKS}"
         ${Select} "$R0"
            ${Case} "${INSTALLTASK_MINIMAL}"
               ; Install the minimal tasks.
               ${GetInstallTasksMinimalCommaUStr} $R0
            ${Case} "${INSTALLTASK_DEFAULT}"
               ; Install default tasks.
               ${GetInstallTasksDefaultCommaUStr} $R0
            ${Case} "${INSTALLTASK_FULL}"
               ; Install all tasks.
               ${GetInstallTasksFullCommaUStr} $R0
         ${EndSelect}
         ${GetInstallTasksMinimalCommaUStr} $R1
         ${AddCommaStrCommaUStr} "$R0" "$R1" $R0
         ${If} "${TASK_NETDISCOVERY}" IsInCommaUStr "$R0"
            ; Agent tasks ${TASK_NETINVENTORY} & ${TASK_NETDISCOVERY} are inter-dependent
            ${AddStrCommaUStr} "$R0" "${TASK_NETINVENTORY}" $R0
         ${EndIf}
         ${If} "${TASK_NETINVENTORY}" IsInCommaUStr "$R0"
            ; Agent tasks ${TASK_NETINVENTORY} & ${TASK_NETDISCOVERY} are inter-dependent
            ${AddStrCommaUStr} "$R0" "${TASK_NETDISCOVERY}" $R0
         ${EndIf}
         ${WriteINIOption} "${IOS_GUI}" "${IO_INSTALLTASKS}" "$R0"

         ; Normalize options
         ${NormalizeOptions} "${IOS_GUI}"

         ; Synchronize NSIS sections with 'installtasks' option
         Push "${IOS_GUI}"
         Call SyncNSISSectionsWithInstallTasksOption

         ; Unset "quick install" when installing from scratch
         ${WriteINIOption} "${IOS_GUI}" "${IO_QUICK-INSTALL}" "0"
      ${EndIf}
   ${Else}
      ; ${INSTALLTYPE_FROMCURRENTCONFIG}
      ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_INSTALLTYPE}"

      ${If} "$R0" != "${INSTALLTYPE_FROMCURRENTCONFIG}"
         ; ${INSTALLTYPE_FROMSCRATCH} -> ${INSTALLTYPE_FROMCURRENTCONFIG}
         ${InitINIOptionSectionCurrentConfig}
         ${CopyINIOptionSection} "${IOS_DEFAULT}" "${IOS_GUI}"
         ${UpdateINIOptionSection} "${IOS_GUI}" "${IOS_CURRENTCONFIG}"
         ${UpdateINIOptionSection} "${IOS_GUI}" "${IOS_COMMANDLINE}"
         ${WriteINIOption} "${IOS_GUI}" "${IO_INSTALLTYPE}" "${INSTALLTYPE_FROMCURRENTCONFIG}"

         ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_INSTALLTASKS}"
         ${Select} "$R0"
            ${Case} "${INSTALLTASK_MINIMAL}"
               ; Install the minimal tasks.
               ${GetInstallTasksMinimalCommaUStr} $R0
            ${Case} "${INSTALLTASK_DEFAULT}"
               ; Install default tasks.
               ${GetInstallTasksDefaultCommaUStr} $R0
            ${Case} "${INSTALLTASK_FULL}"
               ; Install all tasks.
               ${GetInstallTasksFullCommaUStr} $R0
         ${EndSelect}
         ${GetInstallTasksMinimalCommaUStr} $R1
         ${AddCommaStrCommaUStr} "$R0" "$R1" $R0
         ${If} "${TASK_NETDISCOVERY}" IsInCommaUStr "$R0"
            ; Agent tasks ${TASK_NETINVENTORY} & ${TASK_NETDISCOVERY} are inter-dependent
            ${AddStrCommaUStr} "$R0" "${TASK_NETINVENTORY}" $R0
         ${EndIf}
         ${If} "${TASK_NETINVENTORY}" IsInCommaUStr "$R0"
            ; Agent tasks ${TASK_NETINVENTORY} & ${TASK_NETDISCOVERY} are inter-dependent
            ${AddStrCommaUStr} "$R0" "${TASK_NETDISCOVERY}" $R0
         ${EndIf}
         ${WriteINIOption} "${IOS_GUI}" "${IO_INSTALLTASKS}" "$R0"

         ; Normalize options
         ${NormalizeOptions} "${IOS_GUI}"

         ; Synchronize NSIS sections with 'installtasks' option
         Push "${IOS_GUI}"
         Call SyncNSISSectionsWithInstallTasksOption

         ; Some options could have been overwritten. Fixing them...

         ; Fixing the ${IO_CA-CERT-DIR} option
         ;    With sense in Windows platform x64 architecture when you
         ;    swap the x86 package by the x64 package, or vice versa
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_CA-CERT-DIR}"
         ${If} "$R0" == ""
            ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_CA-CERT-DIR}"
            !if ${PRODUCT_PLATFORM_ARCHITECTURE} == ${PLATFORM_ARCHITECTURE_32}
               ${WordReplace} "$R0" "$PROGRAMFILES64\" "$PROGRAMFILES32\" "+1" "$R0"
            !else
               ${WordReplace} "$R0" "$PROGRAMFILES32\" "$PROGRAMFILES64\" "+1" "$R0"
            !endif
            ${WriteINIOption} "${IOS_GUI}" "${IO_CA-CERT-DIR}" "$R0"
         ${EndIf}

         ; Fixing the ${IO_CA-CERT-FILE} option
         ;    With sense in Windows platform x64 architecture when you
         ;    swap the x86 package by the x64 package, or vice versa
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_CA-CERT-FILE}"
         ${If} "$R0" == ""
            ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_CA-CERT-FILE}"
            !if ${PRODUCT_PLATFORM_ARCHITECTURE} == ${PLATFORM_ARCHITECTURE_32}
               ${WordReplace} "$R0" "$PROGRAMFILES64\" "$PROGRAMFILES32\" "+1" "$R0"
            !else
               ${WordReplace} "$R0" "$PROGRAMFILES32\" "$PROGRAMFILES64\" "+1" "$R0"
            !endif
            ${WriteINIOption} "${IOS_GUI}" "${IO_CA-CERT-FILE}" "$R0"
         ${EndIf}

         ; Fixing the ${IO_EXECMODE} option
         ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_EXECMODE}"
         ${If} "$R0" == "${EXECMODE_CURRENT}"
            ${ReadINIOption} $R0 "${IOS_CURRENTCONFIG}" "${IO_EXECMODE}"
            ${WriteINIOption} "${IOS_GUI}" "${IO_EXECMODE}" "$R0"
         ${EndIf}

         ; Fixing the ${IO_SERVICE-START-TYPE} and ${IO_SERVICE-STATUS} options
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_EXECMODE}"
         ${If} "$R0" == "${EXECMODE_SERVICE}"
            ${WriteINIOption} "${IOS_GUI}" "${IO_SERVICE-START-TYPE}" "${SERVICE_STARTTYPE_AUTO}"
            ${WriteINIOption} "${IOS_GUI}" "${IO_SERVICE-STATUS}" "${SERVICE_STATUS_RUNNING}"
         ${EndIf}

         ; Fixing the ${IO_LOGFILE} option
         ;    With sense in Windows platform x64 architecture when you
         ;    swap the x86 package by the x64 package, or vice versa
         ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_LOGFILE}"
         ${If} "$R0" == ""
            ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_LOGFILE}"
            !if ${PRODUCT_PLATFORM_ARCHITECTURE} == ${PLATFORM_ARCHITECTURE_32}
               ${WordReplace} "$R0" "$PROGRAMFILES64\" "$PROGRAMFILES32\" "+1" "$R0"
            !else
               ${WordReplace} "$R0" "$PROGRAMFILES32\" "$PROGRAMFILES64\" "+1" "$R0"
            !endif
            ${WriteINIOption} "${IOS_GUI}" "${IO_LOGFILE}" "$R0"
         ${EndIf}
      ${EndIf}
   ${EndIf}

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


Function InstallationTypePage_Back
   Call InstallationTypePage_Leave
FunctionEnd
