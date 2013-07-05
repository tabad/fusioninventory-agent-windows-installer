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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\ExecutionModePage.nsh
   @author    Manuel J. Garrido <manuel.garrido@gmail.com>
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
!include "${FIAI_DIR}\Include\WinTasksFunc.nsh"
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\ExecutionModePageLangStrings.nsh"


;--------------------------------
; Handle Variables

Var hCtl_ExecutionModePage
Var hCtl_ExecutionModePage_GroupBox1
Var hCtl_ExecutionModePage_RadioButton1
Var hCtl_ExecutionModePage_RadioButton2
Var hCtl_ExecutionModePage_RadioButton3


;--------------------------------
; Execution Mode Page Functions

Function ExecutionModePage_Back
   Call ExecutionModePage_Leave
FunctionEnd


Function ExecutionModePage_Create
   ; === ExecutionModePage (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_ExecutionModePage
   ${If} $hCtl_ExecutionModePage == error
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(hCtl_ExecutionModePage_Text)" "$(hCtl_ExecutionModePage_SubText)"

   ; === GroupBox1 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 50u 30u 196u 65u "$(hCtl_ExecutionModePage_GroupBox1_Text)"
   Pop $hCtl_ExecutionModePage_GroupBox1

   ; === RadioButton1 (type: RadioButton) ===
   ${NSD_CreateRadioButton} 60u 43u 130u 11u "$(hCtl_ExecutionModePage_RadioButton1_Text)"
   Pop $hCtl_ExecutionModePage_RadioButton1
   ${NSD_AddStyle} $hCtl_ExecutionModePage_RadioButton1 ${WS_GROUP}

   ; === RadioButton2 (type: RadioButton) ===
   ${NSD_CreateRadioButton} 60u 59u 130u 11u "$(hCtl_ExecutionModePage_RadioButton2_Text)"
   Pop $hCtl_ExecutionModePage_RadioButton2

   ; === RadioButton3 (type: RadioButton) ===
   ${NSD_CreateRadioButton} 60u 75u 130u 11u "$(hCtl_ExecutionModePage_RadioButton3_Text)"
   Pop $hCtl_ExecutionModePage_RadioButton3

   ; OnBack Function
   ${NSD_OnBack} ExecutionModePage_Back

   ; Disable RadioButton2 depending on Windows version
   ${IfNot} ${IsTargetOsValidForWindowsTask}
      EnableWindow $hCtl_ExecutionModePage_RadioButton2 0
   ${EndIf}

   ; Push $R0 & R1 onto the stack
   Push $R0
   Push $R1

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Get execution mode
   ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_EXECMODE}"

   ; Select RadioButon depending on execution mode
   ${If} "$R0" == "${EXECMODE_SERVICE}"
      ; Set RadioButton1 Check
      ${NSD_Check} $hCtl_ExecutionModePage_RadioButton1
   ${ElseIf} "$R0" == "${EXECMODE_TASK}"
      ; Set RadioButton2 Check
      ${NSD_Check} $hCtl_ExecutionModePage_RadioButton2
   ${ElseIf} "$R0" == "${EXECMODE_MANUAL}"
      ; Set RadioButton3 Check
      ${NSD_Check} $hCtl_ExecutionModePage_RadioButton3
   ${Else}
      ; It should not be possible
      Nop
   ${EndIf}

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


Function ExecutionModePage_Leave
   ; Push $R0, $R1, $R2 & R3 onto the stack
   Push $R0
   Push $R1
   Push $R2
   Push $R3

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Get RatioButtons state
   ${NSD_GetState} $hCtl_ExecutionModePage_RadioButton1 $R1
   ${NSD_GetState} $hCtl_ExecutionModePage_RadioButton2 $R2
   ${NSD_GetState} $hCtl_ExecutionModePage_RadioButton3 $R3

   ; Save the selected RadioButton
   ${If} $R1 = ${BST_CHECKED}
      ${WriteINIOption} "$R0" "${IO_EXECMODE}" "${EXECMODE_SERVICE}"
   ${ElseIf} $R2 = ${BST_CHECKED}
      ${WriteINIOption} "$R0" "${IO_EXECMODE}" "${EXECMODE_TASK}"
   ${ElseIf} $R3 = ${BST_CHECKED}
      ${WriteINIOption} "$R0" "${IO_EXECMODE}" "${EXECMODE_MANUAL}"
   ${Else}
      ; It should not be possible
      Nop
   ${EndIf}

   ; Pop $R3, $R2, $R1 & $R0 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function ExecutionModePage_Show
   Call ExecutionModePage_Create
   nsDialogs::Show $hCtl_ExecutionModePage
FunctionEnd
