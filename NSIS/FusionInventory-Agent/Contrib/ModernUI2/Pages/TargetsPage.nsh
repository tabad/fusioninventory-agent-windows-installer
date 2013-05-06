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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\TargetsPage.nsh
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
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\TargetsPageLangStrings.nsh"


;--------------------------------
; Handle variables

Var hCtl_TargetsPage
Var hCtl_TargetsPage_GroupBox1
Var hCtl_TargetsPage_TextBox1
Var hCtl_TargetsPage_Button1
Var hCtl_TargetsPage_Label1
Var hCtl_TargetsPage_GroupBox2
Var hCtl_TargetsPage_TextBox2
Var hCtl_TargetsPage_Label2


;--------------------------------
; Targets Page Functions

Function TargetsPage_Back
   Call Targetspage_Leave
FunctionEnd


Function TargetsPage_Button1_OnClick
   ; Push $R0 onto the stack
   Push $R0

   ${NSD_GetText} $hCtl_TargetsPage_TextBox1 $R0
   nsDialogs::SelectFolderDialog "$(hCtl_TargetsPage_SelectFolderDialog_Title)" "$R0"
   Pop $R0

   ; Check the user action
   ${If} "$R0" == "error"
      ; No changes have been done
      Nop
   ${Else}
      ; Have been changes
      ${NSD_SetText} $hCtl_TargetsPage_TextBox1 "$R0"
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function TargetsPage_Create
   ; === TargetsPage (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_TargetsPage
   ${If} "$hCtl_TargetsPage" == "error"
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(hCtl_TargetsPage_Text)" "$(hCtl_TargetsPage_SubText)"

   ; === GroupBox1 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 0u 9u 294u 47u "$(hCtl_TargetsPage_GroupBox1_Text)"
   Pop $hCtl_TargetsPage_GroupBox1

   ; === TextBox1 (type: Text) ===
   ${NSD_CreateText} 11u 25u 194u 11u ""
   Pop $hCtl_TargetsPage_TextBox1

   ; === Button1 (type: Button) ===
   ${NSD_CreateButton} 215u 23u 68u 14u "$(hCtl_TargetsPage_Button1_Text)"
   Pop $hCtl_TargetsPage_Button1
   ${NSD_OnClick} $hCtl_TargetsPage_Button1 TargetsPage_Button1_OnClick

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 11u 41u 194u 11u "$(hCtl_TargetsPage_Label1_Text)"
   Pop $hCtl_TargetsPage_Label1
   ${NSD_AddStyle} $hCtl_TargetsPage_Label1 ${SS_CENTER}

   ; === GroupBox2 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 0u 65u 294u 54u "$(hCtl_TargetsPage_GroupBox2_Text)"
   Pop $hCtl_TargetsPage_GroupBox2

   ; === TextBox2 (type: Text) ===
   ${NSD_CreateText} 11u 81u 271u 11u ""
   Pop $hCtl_TargetsPage_TextBox2

   ; === Label2 (type: Label) ===
   ${NSD_CreateLabel} 11u 97u 271u 18u "$(hCtl_TargetsPage_Label2_Text)"
   Pop $hCtl_TargetsPage_Label2
   ${NSD_AddStyle} $hCtl_TargetsPage_Label2 ${SS_CENTER}

   ; OnBack Function
   ${NSD_OnBack} TargetsPage_Back

   ; Push $R0 & R1 onto the stack
   Push $R0
   Push $R1

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Set TextBox1 Text
   ${ReadINIOption} $R1 "$R0" "${IO_LOCAL}"
   ${NSD_SetText} $hCtl_TargetsPage_TextBox1 "$R1"

   ; Set TextBox2 Text
   ${ReadINIOption} $R1 "$R0" "${IO_SERVER}"
   ${NSD_SetText} $hCtl_TargetsPage_TextBox2 "$R1"

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


Function TargetsPage_Leave
   ; Push $R0 & R1 onto the stack
   Push $R0
   Push $R1

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Save TextBox1 Text
   ${NSD_GetText} $hCtl_TargetsPage_TextBox1 $R1
   ${WriteINIOption} "$R0" "${IO_LOCAL}" "$R1"

   ; Save TextBox2 Text
   ${NSD_GetText} $hCtl_TargetsPage_TextBox2 $R1
   ${WriteINIOption} "$R0" "${IO_SERVER}" "$R1"

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


Function TargetsPage_Show
   Call TargetsPage_Create
   nsDialogs::Show $hCtl_TargetsPage
FunctionEnd
