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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\DebugOptionsPage.nsh
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
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\DebugOptionsPageLangStrings.nsh"


;--------------------------------
; Handle variables

Var hCtl_DebugOptionsPage
Var hCtl_DebugOptionsPage_GroupBox1
Var hCtl_DebugOptionsPage_Label1
Var hCtl_DebugOptionsPage_DropList1
Var hCtl_DebugOptionsPage_Label2
Var hCtl_DebugOptionsPage_DropList2
Var hCtl_DebugOptionsPage_Label3
Var hCtl_DebugOptionsPage_TextBox1
Var hCtl_DebugOptionsPage_Button1
Var hCtl_DebugOptionsPage_Label4
Var hCtl_DebugOptionsPage_Number1


;--------------------------------
; Debug Options Page Functions

Function DebugOptionsPage_Button1_OnClick
   ; Push $R0 onto the stack
   Push $R0

   ${NSD_GetText} $hCtl_DebugOptionsPage_TextBox1 $R0
   nsDialogs::SelectFileDialog "open" "$R0" "$(hCtl_DebugOptionsPage_SelectFileDialog_Filter2)|*.log|$(hCtl_DebugOptionsPage_SelectFileDialog_Filter1)|*.*"
   Pop $R0

   ; Check the user action
   ${If} "$R0" == ""
      ; No changes have been done
      Nop
   ${Else}
      ; Have been changes
      ${NSD_SetText} $hCtl_DebugOptionsPage_TextBox1 "$R0"
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function DebugOptionsPage_Create
   ; === DebugOptionsPage (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_DebugOptionsPage
   ${If} $hCtl_DebugOptionsPage == error
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(hCtl_DebugOptionsPage_Text)" "$(hCtl_DebugOptionsPage_SubText)"

   ; === GroupBox1 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 0u 16u 294u 95u "$(hCtl_DebugOptionsPage_GroupBox1_Text)"
   Pop $hCtl_DebugOptionsPage_GroupBox1

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 13u 29u 95u 8u "$(hCtl_DebugOptionsPage_Label1_Text)"
   Pop $hCtl_DebugOptionsPage_Label1

   ; === DropList1 (type: DropList) ===
   ${NSD_CreateDropList} 11u 38u 79u 12u "0"
   Pop $hCtl_DebugOptionsPage_DropList1
   ${NSD_AddExStyle} $hCtl_DebugOptionsPage_DropList1 ${WS_EX_RIGHT}
   ${NSD_CB_AddString} $hCtl_DebugOptionsPage_DropList1 "0"
   ${NSD_CB_AddString} $hCtl_DebugOptionsPage_DropList1 "1"
   ${NSD_CB_AddString} $hCtl_DebugOptionsPage_DropList1 "2"
   ${NSD_CB_SelectString} $hCtl_DebugOptionsPage_DropList1 "0"

   ; === Label2 (type: Label) ===
   ${NSD_CreateLabel} 126u 29u 95u 8u "$(hCtl_DebugOptionsPage_Label2_Text)"
   Pop $hCtl_DebugOptionsPage_Label2

   ; === DropList2 (type: DropList) ===
   ${NSD_CreateDropList} 123u 38u 79u 12u "File"
   Pop $hCtl_DebugOptionsPage_DropList2
   ${NSD_AddExStyle} $hCtl_DebugOptionsPage_DropList2 ${WS_EX_RIGHT}
   ${NSD_CB_AddString} $hCtl_DebugOptionsPage_DropList2 "File"
   ${NSD_CB_AddString} $hCtl_DebugOptionsPage_DropList2 "Stderr"
   ${NSD_CB_SelectString} $hCtl_DebugOptionsPage_DropList2 "File"

   ; === Label3 (type: Label) ===
   ${NSD_CreateLabel} 13u 56u 192u 8u "$(hCtl_DebugOptionsPage_Label3_Text)"
   Pop $hCtl_DebugOptionsPage_Label3

   ; === TextBox1 (type: Text) ===
   ${NSD_CreateText} 11u 65u 194u 11u ""
   Pop $hCtl_DebugOptionsPage_TextBox1

   ; === Button1 (type: Button) ===
   ${NSD_CreateButton} 215u 63u 68u 14u "$(hCtl_DebugOptionsPage_Button1_Text)"
   Pop $hCtl_DebugOptionsPage_Button1
   ${NSD_OnClick} $hCtl_DebugOptionsPage_Button1 DebugOptionsPage_Button1_OnClick

   ; === Label4 (type: Label) ===
   ${NSD_CreateLabel} 13u 81u 192u 8u "$(hCtl_DebugOptionsPage_Label4_Text)"
   Pop $hCtl_DebugOptionsPage_Label4

   ; === Number1 (type: Number) ===
   ${NSD_CreateNumber} 11u 90u 50u 11u ""
   Pop $hCtl_DebugOptionsPage_Number1
   ${NSD_SetTextLimit} $hCtl_DebugOptionsPage_Number1 "4"
FunctionEnd


Function DebugOptionsPage_Leave
   Nop
FunctionEnd


Function DebugOptionsPage_Show
   Call DebugOptionsPage_Create
   nsDialogs::Show $hCtl_DebugOptionsPage
FunctionEnd
