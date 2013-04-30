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
FunctionEnd


Function MiscelaneousOptionsPage_Leave
   Nop
FunctionEnd


Function MiscelaneousOptionsPage_Show
   Call MiscelaneousOptionsPage_Create
   nsDialogs::Show $hCtl_MiscelaneousOptionsPage
FunctionEnd
