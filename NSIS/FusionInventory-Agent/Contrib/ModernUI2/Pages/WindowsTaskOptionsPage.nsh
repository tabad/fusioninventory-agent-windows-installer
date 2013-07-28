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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\WindowsTaskOptionsPage.nsh
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
   This file was generated with the help of NSISDialogDesigner 1.1.2.0
   http://coolsoft.altervista.org/nsisdialogdesigner
   ------------------------------------------------------------------------
*/


!include LogicLib.nsh
!include "${FIAI_DIR}\Include\INIFunc.nsh"
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\WindowsTaskOptionsPageLangStrings.nsh"


;--------------------------------
; Handle variables

Var hCtl_WindowsTaskOptionsPage
Var hCtl_WindowsTaskOptionsPage_GroupBox1
Var hCtl_WindowsTaskOptionsPage_Label1
Var hCtl_WindowsTaskOptionsPage_DropList1
Var hCtl_WindowsTaskOptionsPage_Label2
Var hCtl_WindowsTaskOptionsPage_DropList2


;--------------------------------
; Windows Task Options Page Functions

Function WindowsTaskOptionsPage_Back
   Call WindowsTaskOptionsPage_Leave
FunctionEnd


Function WindowsTaskOptionsPage_DropList1_Load
   ; $R0 INI Section
   ; $R1 Auxiliary
   ; $R2 Auxiliary

   ; Push $R0, $R1 & $R2 onto the stack
   Push $R0
   Push $R1
   Push $R2

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Load DropList1
   ${GetValidWindowsTaskFrequencyCommaUStr} $R1
   ${Do}
      ; Get the first frequency
      ${FirstStrCommaUStr} "$R1" $R2
      ; Check the frequency $R2
      ${If} "$R2" == ""
         ; There aren't more frequencies
         ${ExitDo}
      ${Else}
         ; Add $R2 to DropList1
         ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList1 "$R2"
         ; Get the next frequency
         ${DelStrCommaUStr} "$R1" "$R2" $R1
      ${EndIf}
   ${Loop}

   ; Select the frequency in DropList1
   ${ReadINIOption} $R1 "$R0" "${IO_TASK-FREQUENCY}"
   ${NSD_CB_SelectString} $hCtl_WindowsTaskOptionsPage_DropList1 "$R1"

   ; Set Label2 Text depending on the value of $R1
   ${Select} "$R1"
      ${Case} "${FREQUENCY_MINUTE}"
         StrCpy $R2 "$(WindowsTaskOptionsPage_Minute)"
      ${Case} "${FREQUENCY_HOURLY}"
         StrCpy $R2 "$(WindowsTaskOptionsPage_Hour)"
      ${Case} "${FREQUENCY_DAILY}"
         StrCpy $R2 "$(WindowsTaskOptionsPage_Day)"
   ${EndSelect}
   ${NSD_SetText} $hCtl_WindowsTaskOptionsPage_Label2 "$(WindowsTaskOptionsPage_Label2_Text)"

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function WindowsTaskOptionsPage_DropList1_OnChange
   ; $R0 INI Section
   ; $R1 Auxiliary
   ; $R2 Auxiliary

   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Save DropList1 Text
   ${NSD_GetText} $hCtl_WindowsTaskOptionsPage_DropList1 $R1
   ${WriteINIOption} "$R0" "${IO_TASK-FREQUENCY}" "$R1"

   ; Set Label2 Text depending on the value of $R1
   ${Select} "$R1"
      ${Case} "${FREQUENCY_MINUTE}"
         StrCpy $R2 "$(WindowsTaskOptionsPage_Minute)"
      ${Case} "${FREQUENCY_HOURLY}"
         StrCpy $R2 "$(WindowsTaskOptionsPage_Hour)"
      ${Case} "${FREQUENCY_DAILY}"
         StrCpy $R2 "$(WindowsTaskOptionsPage_Day)"
   ${EndSelect}
   ${NSD_SetText} $hCtl_WindowsTaskOptionsPage_Label2 "$(WindowsTaskOptionsPage_Label2_Text)"

   ; Load DropList2
   Call WindowsTaskOptionsPage_DropList2_Load

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function WindowsTaskOptionsPage_DropList2_Load
   ; $R0 INI Section
   ; $R1 Task frequency
   ; $R2 Auxiliary
   ; $R3 Auxiliary

   ; Push $R0, $R1, $R2 & $R3 onto the stack
   Push $R0
   Push $R1
   Push $R2
   Push $R3

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Get DropList1 Test
   ${NSD_GetText} $hCtl_WindowsTaskOptionsPage_DropList1 $R1

   ; Reset content of DropList2
   SendMessage $hCtl_WindowsTaskOptionsPage_DropList2 ${CB_RESETCONTENT} 0 0

   ; Depending on the value of $R1
   ${Select} "$R1"
      ${Case} "${FREQUENCY_MINUTE}"
         ; Load valid values for minutes
         ${GetValidWindowsTaskMinuteModifierCommaUStr} $R2
         ${Do}
            ; Get the first frequency
            ${FirstStrCommaUStr} "$R2" $R3
            ; Check the minute $R3
            ${If} "$R3" == ""
               ; There aren't more minutes
               ${ExitDo}
            ${Else}
               ; Add $R3 to DropList2
               ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "$R3"
               ; Get the next minute
               ${DelStrCommaUStr} "$R2" "$R3" $R2
            ${EndIf}
         ${Loop}

         ; Select the minute in DropList2
         ${ReadINIOption} $R2 "$R0" "${IO_TASK-MINUTE-MODIFIER}"
         ${NSD_CB_SelectString} $hCtl_WindowsTaskOptionsPage_DropList2 "$R2"

      ${Case} "${FREQUENCY_HOURLY}"
         ; Load valid values for hours
         ${For} $R2 1 23
            ; Add $R3 to DropList2
            ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "$R2"
         ${Next}

         ; Select the hour in DropList2
         ${ReadINIOption} $R2 "$R0" "${IO_TASK-HOURLY-MODIFIER}"
         ${NSD_CB_SelectString} $hCtl_WindowsTaskOptionsPage_DropList2 "$R2"

      ${Case} "${FREQUENCY_DAILY}"
         ; Load valid values for days
         ${For} $R2 1 30
            ; Add $R3 to DropList2
            ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "$R2"
         ${Next}

         ; Select the day in DropList2
         ${ReadINIOption} $R2 "$R0" "${IO_TASK-DAILY-MODIFIER}"
         ${NSD_CB_SelectString} $hCtl_WindowsTaskOptionsPage_DropList2 "$R2"
   ${EndSelect}

   ; Pop $R3, $R2, $R1 & $R0 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function WindowsTaskOptionsPage_DropList2_OnChange
   ; $R0 INI Section
   ; $R1 Auxiliary
   ; $R2 Auxiliary

   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Get DropList1 Test
   ${NSD_GetText} $hCtl_WindowsTaskOptionsPage_DropList1 $R1

   ; Get DropList2 Test
   ${NSD_GetText} $hCtl_WindowsTaskOptionsPage_DropList2 $R2

   ; Save DropList2 Text depending on the value of $R1
   ${Select} "$R1"
      ${Case} "${FREQUENCY_MINUTE}"
         ${WriteINIOption} "$R0" "${IO_TASK-MINUTE-MODIFIER}" "$R2"
      ${Case} "${FREQUENCY_HOURLY}"
         ${WriteINIOption} "$R0" "${IO_TASK-HOURLY-MODIFIER}" "$R2"
      ${Case} "${FREQUENCY_DAILY}"
         ${WriteINIOption} "$R0" "${IO_TASK-DAILY-MODIFIER}" "$R2"
   ${EndSelect}

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function WindowsTaskOptionsPage_Create
   ; === WindowsTaskOptions (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_WindowsTaskOptionsPage
   ${If} $hCtl_WindowsTaskOptionsPage == error
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(WindowsTaskOptionsPage_Text)" "$(WindowsTaskOptionsPage_SubText)"

   ; === GroupBox1 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 50u 30u 196u 65u "$(WindowsTaskOptionsPage_GroupBox1_Text)"
   Pop $hCtl_WindowsTaskOptionsPage_GroupBox1

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 63u 52u 81u 8u "$(WindowsTaskOptionsPage_Label1_Text)"
   Pop $hCtl_WindowsTaskOptionsPage_Label1

   ; === DropList1 (type: DropList) ===
   ${NSD_CreateDropList} 60u 61u 84u 12u ""
   Pop $hCtl_WindowsTaskOptionsPage_DropList1
   ${NSD_AddExStyle} $hCtl_WindowsTaskOptionsPage_DropList1 ${WS_EX_RIGHT}
   ${NSD_OnChange} $hCtl_WindowsTaskOptionsPage_DropList1 WindowsTaskOptionsPage_DropList1_OnChange

   ; === Label2 (type: Label) ===
   ${NSD_CreateLabel} 158u 52u 76u 8u ""
   Pop $hCtl_WindowsTaskOptionsPage_Label2

   ; === DropList2 (type: DropList) ===
   ${NSD_CreateDropList} 155u 61u 79u 12u ""
   Pop $hCtl_WindowsTaskOptionsPage_DropList2
   ${NSD_AddExStyle} $hCtl_WindowsTaskOptionsPage_DropList2 ${WS_EX_RIGHT}
   ${NSD_OnChange} $hCtl_WindowsTaskOptionsPage_DropList2 WindowsTaskOptionsPage_DropList2_OnChange

   ; OnBack function
   ${NSD_OnBack} WindowsTaskOptionsPage_Back

   ; Load DropList1
   Call WindowsTaskOptionsPage_DropList1_Load

   ; Load DropList2
   Call WindowsTaskOptionsPage_DropList2_Load
FunctionEnd


Function WindowsTaskOptionsPage_Leave
   Nop
FunctionEnd


Function WindowsTaskOptionsPage_Show
   ; Push $R0 onto the stack
   Push $R0

   ; Don't show the screen unless quick installation is disabled
   ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_QUICK-INSTALL}"
   ${If} "$R0" == "0"
      ; Don't show the screen unless "Execution Mode" is "Windows Task"
      ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_EXECMODE}"
      ${If} "$R0" == "${EXECMODE_TASK}"
         Call WindowsTaskOptionsPage_Create
         nsDialogs::Show $hCtl_WindowsTaskOptionsPage
      ${EndIf}
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd
