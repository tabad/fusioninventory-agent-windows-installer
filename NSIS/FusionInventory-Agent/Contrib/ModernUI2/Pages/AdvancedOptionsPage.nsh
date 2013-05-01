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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\AdvancedOptionsPage.nsh
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
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\AdvancedOptionsPageLangStrings.nsh"


;--------------------------------
; Handle variables

Var hCtl_AdvancedOptionsPage
Var hCtl_AdvancedOptionsPage_Label1
Var hCtl_AdvancedOptionsPage_GroupBox1
Var hCtl_AdvancedOptionsPage_Label2
Var hCtl_AdvancedOptionsPage_Number1
Var hCtl_AdvancedOptionsPage_Label3
Var hCtl_AdvancedOptionsPage_Number2
Var hCtl_AdvancedOptionsPage_Label4
Var hCtl_AdvancedOptionsPage_Number3
Var hCtl_AdvancedOptionsPage_Label5
Var hCtl_AdvancedOptionsPage_Number4
Var hCtl_AdvancedOptionsPage_GroupBox2
Var hCtl_AdvancedOptionsPage_CheckBox1
Var hCtl_AdvancedOptionsPage_Label6
Var hCtl_AdvancedOptionsPage_TextBox1
Var hCtl_AdvancedOptionsPage_Label7
Var hCtl_AdvancedOptionsPage_Label8
Var hCtl_AdvancedOptionsPage_TextBox2
Var hCtl_AdvancedOptionsPage_Label9



;--------------------------------
; Advanced Options Page Functions

Function AdvancedOptionsPage_Create
   ; === AdvancedOptionsPage (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_AdvancedOptionsPage
   ${If} $hCtl_AdvancedOptionsPage == error
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(hCtl_AdvancedOptionsPage_Text)" "$(hCtl_AdvancedOptionsPage_SubText)"

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 0u 0u 294u 18u "$(hCtl_AdvancedOptionsPage_Label1_Text)"
   Pop $hCtl_AdvancedOptionsPage_Label1

   ; === GroupBox1 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 0u 21u 144u 108u "$(hCtl_AdvancedOptionsPage_GroupBox1_Text)"
   Pop $hCtl_AdvancedOptionsPage_GroupBox1

   ; === Label2 (type: Label) ===
   ${NSD_CreateLabel} 11u 34u 123u 8u "$(hCtl_AdvancedOptionsPage_Label2_Text)"
   Pop $hCtl_AdvancedOptionsPage_Label2
   ${NSD_AddStyle} $hCtl_AdvancedOptionsPage_Label2 ${SS_CENTER}

   ; === Number1 (type: Number) ===
   ${NSD_CreateNumber} 47u 43u 53u 11u ""
   Pop $hCtl_AdvancedOptionsPage_Number1
   ${NSD_AddStyle} $hCtl_AdvancedOptionsPage_Number1 ${SS_CENTER}
   ${NSD_SetTextLimit} $hCtl_AdvancedOptionsPage_Number1 "4"

   ; === Label3 (type: Label) ===
   ${NSD_CreateLabel} 11u 57u 123u 8u "$(hCtl_AdvancedOptionsPage_Label3_Text)"
   Pop $hCtl_AdvancedOptionsPage_Label3
   ${NSD_AddStyle} $hCtl_AdvancedOptionsPage_Label3 ${SS_CENTER}

   ; === Number2 (type: Number) ===
   ${NSD_CreateNumber} 47u 66u 53u 11u ""
   Pop $hCtl_AdvancedOptionsPage_Number2
   ${NSD_AddStyle} $hCtl_AdvancedOptionsPage_Number2 ${SS_CENTER}
   ${NSD_SetTextLimit} $hCtl_AdvancedOptionsPage_Number2 "4"

   ; === Label4 (type: Label) ===
   ${NSD_CreateLabel} 11u 79u 123u 8u "$(hCtl_AdvancedOptionsPage_Label4_Text)"
   Pop $hCtl_AdvancedOptionsPage_Label4
   ${NSD_AddStyle} $hCtl_AdvancedOptionsPage_Label4 ${SS_CENTER}

   ; === Number3 (type: Number) ===
   ${NSD_CreateNumber} 47u 88u 53u 11u ""
   Pop $hCtl_AdvancedOptionsPage_Number3
   ${NSD_AddStyle} $hCtl_AdvancedOptionsPage_Number3 ${SS_CENTER}
   ${NSD_SetTextLimit} $hCtl_AdvancedOptionsPage_Number3 "4"

   ; === Label5 (type: Label) ===
   ${NSD_CreateLabel} 11u 102u 123u 8u "$(hCtl_AdvancedOptionsPage_Label5_Text)"
   Pop $hCtl_AdvancedOptionsPage_Label5
   ${NSD_AddStyle} $hCtl_AdvancedOptionsPage_Label5 ${SS_CENTER}

   ; === Number4 (type: Number) ===
   ${NSD_CreateNumber} 47u 111u 53u 11u ""
   Pop $hCtl_AdvancedOptionsPage_Number4
   ${NSD_AddStyle} $hCtl_AdvancedOptionsPage_Number4 ${SS_CENTER}
   ${NSD_SetTextLimit} $hCtl_AdvancedOptionsPage_Number4 "4"

   ; === GroupBox2 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 155u 20u 142u 108u "$(hCtl_AdvancedOptionsPage_GroupBox2_Text)"
   Pop $hCtl_AdvancedOptionsPage_GroupBox2

   ; === CheckBox1 (type: Checkbox) ===
   ${NSD_CreateCheckbox} 165u 38u 121u 11u "$(hCtl_AdvancedOptionsPage_CheckBox1_Text)"
   Pop $hCtl_AdvancedOptionsPage_CheckBox1

   ; === Label6 (type: Label) ===
   ${NSD_CreateLabel} 168u 56u 118u 8u "$(hCtl_AdvancedOptionsPage_Label6_Text)"
   Pop $hCtl_AdvancedOptionsPage_Label6

   ; === TextBox1 (type: Text) ===
   ${NSD_CreateText} 165u 65u 121u 11u ""
   Pop $hCtl_AdvancedOptionsPage_TextBox1

   ; === Label7 (type: Label) ===
   ${NSD_CreateLabel} 165u 77u 121u 8u "$(hCtl_AdvancedOptionsPage_Label7_Text)"
   Pop $hCtl_AdvancedOptionsPage_Label7
   ${NSD_AddStyle} $hCtl_AdvancedOptionsPage_Label7 ${SS_CENTER}

   ; === Label8 (type: Label) ===
   ${NSD_CreateLabel} 168u 90u 118u 8u "$(hCtl_AdvancedOptionsPage_Label8_Text)"
   Pop $hCtl_AdvancedOptionsPage_Label8

   ; === TextBox2 (type: Text) ===
   ${NSD_CreateText} 165u 99u 121u 11u ""
   Pop $hCtl_AdvancedOptionsPage_TextBox2

   ; === Label9 (type: Label) ===
   ${NSD_CreateLabel} 165u 111u 121u 8u "$(hCtl_AdvancedOptionsPage_Label9_Text)"
   Pop $hCtl_AdvancedOptionsPage_Label9
   ${NSD_AddStyle} $hCtl_AdvancedOptionsPage_Label9 ${SS_CENTER}
FunctionEnd


Function AdvancedOptionsPage_Leave
   Nop
FunctionEnd


Function AdvancedOptionsPage_Show
   Call AdvancedOptionsPage_Create
   nsDialogs::Show $hCtl_AdvancedOptionsPage
FunctionEnd
