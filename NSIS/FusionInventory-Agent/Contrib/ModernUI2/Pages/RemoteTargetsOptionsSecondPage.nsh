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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\RemoteTargetsOptionsSecondPage.nsh
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
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\RemoteTargetsOptionsSecondPageLangStrings.nsh"


;--------------------------------
; Handle variables

Var hCtl_RemoteTargetsOptionsSecondPage
Var hCtl_RemoteTargetsOptionsSecondPage_GroupBox1
Var hCtl_RemoteTargetsOptionsSecondPage_Label1
Var hCtl_RemoteTargetsOptionsSecondPage_TextBox1
Var hCtl_RemoteTargetsOptionsSecondPage_Label2
Var hCtl_RemoteTargetsOptionsSecondPage_TextBox2
Var hCtl_RemoteTargetsOptionsSecondPage_Label3
Var hCtl_RemoteTargetsOptionsSecondPage_Password1


;--------------------------------
; Remote Options Second Page Functions

Function RemoteTargetsOptionsSecondPage_Create
   ; === RemoteTargetsOptionsSecondPage (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_RemoteTargetsOptionsSecondPage
   ${If} $hCtl_RemoteTargetsOptionsSecondPage == error
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(hCtl_RemoteTargetsOptionsSecondPage_Text)" "$(hCtl_RemoteTargetsOptionsSecondPage_SubText)"

   ; === GroupBox1 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 3u 23u 289u 86u "$(hCtl_RemoteTargetsOptionsSecondPage_GroupBox1_Text)"
   Pop $hCtl_RemoteTargetsOptionsSecondPage_GroupBox1

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 16u 36u 265u 8u "$(hCtl_RemoteTargetsOptionsSecondPage_Label1_Text)"
   Pop $hCtl_RemoteTargetsOptionsSecondPage_Label1

   ; === TextBox1 (type: Text) ===
   ${NSD_CreateText} 13u 45u 268u 11u ""
   Pop $hCtl_RemoteTargetsOptionsSecondPage_TextBox1

   ; === Label2 (type: Label) ===
   ${NSD_CreateLabel} 16u 59u 265u 8u "$(hCtl_RemoteTargetsOptionsSecondPage_Label2_Text)"
   Pop $hCtl_RemoteTargetsOptionsSecondPage_Label2

   ; === TextBox2 (type: Text) ===
   ${NSD_CreateText} 13u 68u 268u 11u ""
   Pop $hCtl_RemoteTargetsOptionsSecondPage_TextBox2

   ; === Label3 (type: Label) ===
   ${NSD_CreateLabel} 16u 81u 265u 8u "$(hCtl_RemoteTargetsOptionsSecondPage_Label3_Text)"
   Pop $hCtl_RemoteTargetsOptionsSecondPage_Label3

   ; === Password1 (type: Password) ===
   ${NSD_CreatePassword} 13u 90u 268u 11u ""
   Pop $hCtl_RemoteTargetsOptionsSecondPage_Password1
FunctionEnd


Function RemoteTargetsOptionsSecondPage_Leave
   Nop
FunctionEnd


Function RemoteTargetsOptionsSecondPage_Show
   Call RemoteTargetsOptionsSecondPage_Create
   nsDialogs::Show $hCtl_RemoteTargetsOptionsSecondPage
FunctionEnd
