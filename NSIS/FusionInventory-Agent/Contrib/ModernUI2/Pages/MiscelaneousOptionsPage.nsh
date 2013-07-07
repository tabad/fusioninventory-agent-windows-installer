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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\MiscelaneousOptionsPage.nsh
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
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\MiscelaneousOptionsPageLangStrings.nsh"


;--------------------------------
; Handle variables

Var hCtl_MiscelaneousOptionsPage
Var hCtl_MiscelaneousOptionsPage_GroupBox1
Var hCtl_MiscelaneousOptionsPage_CheckBox1
Var hCtl_MiscelaneousOptionsPage_CheckBox2
Var hCtl_MiscelaneousOptionsPage_CheckBox3
Var hCtl_MiscelaneousOptionsPage_Label1
Var hCtl_MiscelaneousOptionsPage_TextBox1


;--------------------------------
; Miscelaneous Options Page Functions

Function MiscelaneousOptionsPage_Back
   Call MiscelaneousOptionsPage_Leave
FunctionEnd


Function MiscelaneousOptionsPage_Create
   ; === MiscelaneousOptionsPage (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_MiscelaneousOptionsPage
   ${If} $hCtl_MiscelaneousOptionsPage == error
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(hCtl_MiscelaneousOptionsPage_Text)" "$(hCtl_MiscelaneousOptionsPage_SubText)"

   ; === GroupBox1 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 28u 19u 242u 89u "$(hCtl_MiscelaneousOptionsPage_GroupBox1_Text)"
   Pop $hCtl_MiscelaneousOptionsPage_GroupBox1

   ; === CheckBox1 (type: Checkbox) ===
   ${NSD_CreateCheckbox} 39u 36u 218u 11u "$(hCtl_MiscelaneousOptionsPage_CheckBox1_Text)"
   Pop $hCtl_MiscelaneousOptionsPage_CheckBox1

   ; === CheckBox2 (type: Checkbox) ===
   ${NSD_CreateCheckbox} 39u 51u 218u 11u "$(hCtl_MiscelaneousOptionsPage_CheckBox2_Text)"
   Pop $hCtl_MiscelaneousOptionsPage_CheckBox2

   ; === CheckBox3 (type: Checkbox) ===
   ${NSD_CreateCheckbox} 39u 65u 218u 11u "$(hCtl_MiscelaneousOptionsPage_CheckBox3_Text)"
   Pop $hCtl_MiscelaneousOptionsPage_CheckBox3

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 41u 79u 215u 8u "$(hCtl_MiscelaneousOptionsPage_Label1_Text)"
   Pop $hCtl_MiscelaneousOptionsPage_Label1

   ; === TextBox1 (type: Text) ===
   ${NSD_CreateText} 39u 88u 218u 11u ""
   Pop $hCtl_MiscelaneousOptionsPage_TextBox1

   ; OnBack Function
   ${NSD_OnBack} MiscelaneousOptionsPage_Back

   ; Push $R0 & $R1 onto the stack
   Push $R0
   Push $R1

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Set CheckBox1 Check
   ${ReadINIOption} $R1 "$R0" "${IO_RUNNOW}"
   ${If} "$R1" != "0"
      ${NSD_Check} $hCtl_MiscelaneousOptionsPage_CheckBox1
   ${Else}
      ${NSD_Uncheck} $hCtl_MiscelaneousOptionsPage_CheckBox1
   ${EndIf}

   ; Set CheckBox2 Check
   ${ReadINIOption} $R1 "$R0" "${IO_HTML}"
   ${If} "$R1" != "0"
      ${NSD_Check} $hCtl_MiscelaneousOptionsPage_CheckBox2
   ${Else}
      ${NSD_Uncheck} $hCtl_MiscelaneousOptionsPage_CheckBox2
   ${EndIf}

   ; Set CheckBox3 Check
   ${ReadINIOption} $R1 "$R0" "${IO_SCAN-HOMEDIRS}"
   ${If} "$R1" != "0"
      ${NSD_Check} $hCtl_MiscelaneousOptionsPage_CheckBox3
   ${Else}
      ${NSD_Uncheck} $hCtl_MiscelaneousOptionsPage_CheckBox3
   ${EndIf}

   ; Set TextBox1 Text
   ${ReadINIOption} $R1 "$R0" "${IO_TAG}"
   ${NSD_SetText} $hCtl_MiscelaneousOptionsPage_TextBox1 "$R1"

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


Function MiscelaneousOptionsPage_Leave
   ; Push $R0 & $R1 onto the stack
   Push $R0
   Push $R1

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Save CheckBox1 Check
   ${NSD_GetState} $hCtl_MiscelaneousOptionsPage_CheckBox1 $R1
   ${If} $R1 = ${BST_CHECKED}
      ${WriteINIOption} "$R0" "${IO_RUNNOW}" "1"
   ${Else}
      ${WriteINIOption} "$R0" "${IO_RUNNOW}" "0"
   ${EndIf}

   ; Save CheckBox2 Check
   ${NSD_GetState} $hCtl_MiscelaneousOptionsPage_CheckBox2 $R1
   ${If} $R1 = ${BST_CHECKED}
      ${WriteINIOption} "$R0" "${IO_HTML}" "1"
   ${Else}
      ${WriteINIOption} "$R0" "${IO_HTML}" "0"
   ${EndIf}

   ; Save CheckBox3 Check
   ${NSD_GetState} $hCtl_MiscelaneousOptionsPage_CheckBox3 $R1
   ${If} $R1 = ${BST_CHECKED}
      ${WriteINIOption} "$R0" "${IO_SCAN-HOMEDIRS}" "1"
   ${Else}
      ${WriteINIOption} "$R0" "${IO_SCAN-HOMEDIRS}" "0"
   ${EndIf}

   ; Save TextBox1 Text
   ${NSD_GetText} $hCtl_MiscelaneousOptionsPage_TextBox1 $R1
   ${WriteINIOption} "$R0" "${IO_TAG}" "$R1"

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


Function MiscelaneousOptionsPage_Show
   ; Pushes $R0 onto the stack
   Push $R0

   ; Don't show the screen unless quick installation is disabled
   ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_QUICK-INSTALL}"
   ${If} "$R0" == "0"
      Call MiscelaneousOptionsPage_Create
      nsDialogs::Show $hCtl_MiscelaneousOptionsPage
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd
