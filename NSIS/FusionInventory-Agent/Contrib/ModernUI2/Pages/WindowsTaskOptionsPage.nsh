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

Function WindowsTaskOptionsPage_Create
   ; === WindowsTaskOptions (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_WindowsTaskOptionsPage
   ${If} $hCtl_WindowsTaskOptionsPage == error
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(hCtl_WindowsTaskOptionsPage_Text)" "$(hCtl_WindowsTaskOptionsPage_SubText)"

   ; === GroupBox1 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 50u 30u 196u 65u "$(hCtl_WindowsTaskOptionsPage_GroupBox1_Text)"
   Pop $hCtl_WindowsTaskOptionsPage_GroupBox1

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 63u 52u 81u 8u "$(hCtl_WindowsTaskOptionsPage_Label1_Text)"
   Pop $hCtl_WindowsTaskOptionsPage_Label1

   ; === DropList1 (type: DropList) ===
   ${NSD_CreateDropList} 60u 61u 84u 12u "Hourly"
   Pop $hCtl_WindowsTaskOptionsPage_DropList1
   ${NSD_AddExStyle} $hCtl_WindowsTaskOptionsPage_DropList1 ${WS_EX_RIGHT}
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList1 "Minutes"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList1 "Hours"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList1 "Days"
   ${NSD_CB_SelectString} $hCtl_WindowsTaskOptionsPage_DropList1 "Hours"

   ; === Label2 (type: Label) ===
   ${NSD_CreateLabel} 158u 52u 76u 8u "$(hCtl_WindowsTaskOptionsPage_Label2_Text)"
   Pop $hCtl_WindowsTaskOptionsPage_Label2

   ; === DropList2 (type: DropList) ===
   ${NSD_CreateDropList} 155u 61u 79u 12u "4"
   Pop $hCtl_WindowsTaskOptionsPage_DropList2
   ${NSD_AddExStyle} $hCtl_WindowsTaskOptionsPage_DropList2 ${WS_EX_RIGHT}
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "1"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "2"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "3"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "4"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "5"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "6"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "7"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "8"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "9"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "10"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "11"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "12"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "13"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "14"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "15"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "16"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "17"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "18"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "19"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "20"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "21"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "22"
   ${NSD_CB_AddString} $hCtl_WindowsTaskOptionsPage_DropList2 "23"
   ${NSD_CB_SelectString} $hCtl_WindowsTaskOptionsPage_DropList2 "4"
FunctionEnd


Function WindowsTaskOptionsPage_Leave
   Nop
FunctionEnd


Function WindowsTaskOptionsPage_Show
   Call WindowsTaskOptionsPage_Create
   nsDialogs::Show $hCtl_WindowsTaskOptionsPage
FunctionEnd
