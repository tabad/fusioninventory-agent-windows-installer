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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\RemoteTargetsOptionsFirstPage.nsh
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
!include "${FIAI_DIR}\Include\StrFunc.nsh"
!include "${FIAI_DIR}\Include\OptionChecks.nsh"
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\RemoteTargetsOptionsFirstPageLangStrings.nsh"


;--------------------------------
; Handle variables

Var hCtl_RemoteTargetsOptionsFirstPage
Var hCtl_RemoteTargetsOptionsFirstPage_GroupBox1
Var hCtl_RemoteTargetsOptionsFirstPage_Label1
Var hCtl_RemoteTargetsOptionsFirstPage_TextBox1
Var hCtl_RemoteTargetsOptionsFirstPage_Button1
Var hCtl_RemoteTargetsOptionsFirstPage_Label2
Var hCtl_RemoteTargetsOptionsFirstPage_TextBox2
Var hCtl_RemoteTargetsOptionsFirstPage_Button2
Var hCtl_RemoteTargetsOptionsFirstPage_Label3
Var hCtl_RemoteTargetsOptionsFirstPage_TextBox3
Var hCtl_RemoteTargetsOptionsFirstPage_CheckBox1


;--------------------------------
; Remote Options First Page Functions

Function RemoteTargetsOptionsFirstPage_Back
   Call RemoteTargetsOptionsFirstPage_Leave
FunctionEnd


Function RemoteTargetsOptionsFirstPage_Button1_OnClick
   ; Push $R0 onto the stack
   Push $R0

   ${NSD_GetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox1 $R0
   nsDialogs::SelectFolderDialog "$(RemoteTargetsOptionsFirstPage_SelectFolderDialog_Title)" "$R0"
   Pop $R0

   ; Check the user action
   ${If} "$R0" == "error"
      ; No changes have been done
      Nop
   ${Else}
      ; Have been changes
      ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox1 "$R0"
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function RemoteTargetsOptionsFirstPage_Button2_OnClick
   ; Push $R0 onto the stack
   Push $R0

   ${NSD_GetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox2 $R0
   nsDialogs::SelectFileDialog "open" "$R0" "$(RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter2)|*.pem|$(RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter1)|*.*"
   Pop $R0

   ; Check the user action
   ${If} "$R0" == ""
      ; No changes have been done
      Nop
   ${Else}
      ; Have been changes
      ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox2 "$R0"
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function RemoteTargetsOptionsFirstPage_Create
   ; === RemoteTargetsOptionsFirstPage (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_RemoteTargetsOptionsFirstPage
   ${If} $hCtl_RemoteTargetsOptionsFirstPage == error
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(RemoteTargetsOptionsFirstPage_Text)" "$(RemoteTargetsOptionsFirstPage_SubText)"

   ; === GroupBox1 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 0u 11u 294u 86u "$(RemoteTargetsOptionsFirstPage_GroupBox1_Text)"
   Pop $hCtl_RemoteTargetsOptionsFirstPage_GroupBox1

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 13u 25u 192u 8u "$(RemoteTargetsOptionsFirstPage_Label1_Text)"
   Pop $hCtl_RemoteTargetsOptionsFirstPage_Label1

   ; === TextBox1 (type: Text) ===
   ${NSD_CreateText} 11u 34u 194u 11u ""
   Pop $hCtl_RemoteTargetsOptionsFirstPage_TextBox1

   ; === Button1 (type: Button) ===
   ${NSD_CreateButton} 215u 32u 68u 14u "$(RemoteTargetsOptionsFirstPage_Button1_Text)"
   Pop $hCtl_RemoteTargetsOptionsFirstPage_Button1
   ${NSD_OnClick} $hCtl_RemoteTargetsOptionsFirstPage_Button1 RemoteTargetsOptionsFirstPage_Button1_OnClick

   ; === Label2 (type: Label) ===
   ${NSD_CreateLabel} 13u 47u 192u 8u "$(RemoteTargetsOptionsFirstPage_Label2_Text)"
   Pop $hCtl_RemoteTargetsOptionsFirstPage_Label2

   ; === TextBox2 (type: Text) ===
   ${NSD_CreateText} 11u 56u 194u 11u ""
   Pop $hCtl_RemoteTargetsOptionsFirstPage_TextBox2

   ; === Button2 (type: Button) ===
   ${NSD_CreateButton} 215u 54u 68u 14u "$(RemoteTargetsOptionsFirstPage_Button2_Text)"
   Pop $hCtl_RemoteTargetsOptionsFirstPage_Button2
   ${NSD_OnClick} $hCtl_RemoteTargetsOptionsFirstPage_Button2 RemoteTargetsOptionsFirstPage_Button2_OnClick

   ; === Label3 (type: Label) ===
   ${NSD_CreateLabel} 13u 70u 192u 8u "$(RemoteTargetsOptionsFirstPage_Label3_Text)"
   Pop $hCtl_RemoteTargetsOptionsFirstPage_Label3

   ; === TextBox3 (type: Text) ===
   ${NSD_CreateText} 11u 79u 271u 11u ""
   Pop $hCtl_RemoteTargetsOptionsFirstPage_TextBox3

   ; === CheckBox1 (type: Checkbox) ===
   ${NSD_CreateCheckbox} 13u 106u 265u 11u "$(RemoteTargetsOptionsFirstPage_CheckBox1_Text)"
   Pop $hCtl_RemoteTargetsOptionsFirstPage_CheckBox1
   ${NSD_AddStyle} $hCtl_RemoteTargetsOptionsFirstPage_CheckBox1 ${BS_RIGHT}|${BS_RIGHTBUTTON}

   ; OnBack Function
   ${NSD_OnBack} RemoteTargetsOptionsFirstPage_Back

   ; Push $R0 & $R1 onto the stack
   Push $R0
   Push $R1

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Set TextBox1 Text
   ${ReadINIOption} $R1 "$R0" "${IO_CA-CERT-DIR}"
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox1 "$R1"

   ; Set TextBox2 Text
   ${ReadINIOption} $R1 "$R0" "${IO_CA-CERT-FILE}"
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox2 "$R1"

   ; Set TextBox3 Text
   ${ReadINIOption} $R1 "$R0" "${IO_CA-CERT-URI}"
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox3 "$R1"

   ; Set CheckBox1 Check
   ${ReadINIOption} $R1 "$R0" "${IO_NO-SSL-CHECK}"
   ${If} "$R1" != "0"
      ${NSD_Check} $hCtl_RemoteTargetsOptionsFirstPage_CheckBox1
   ${Else}
      ${NSD_Uncheck} $hCtl_RemoteTargetsOptionsFirstPage_CheckBox1
   ${EndIf}

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


Function RemoteTargetsOptionsFirstPage_Leave
   ; Push $R0, $R1 & $R2 onto the stack
   Push $R0
   Push $R1
   Push $R2

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Initialize $R1
   StrCpy $R1 1

   ; Save TextBox1 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox1 $R2
   ${Trim} "$R2" $R2
   ${If} ${IsValidOptionCaCertDirValue} "$R2"
      ${WriteINIOption} "$R0" "${IO_CA-CERT-DIR}" "$R2"
   ${Else}
      ; Invalid value
      ; Show warning message
      Push "$R0"
      Call RemoteTargetsOptionsFirstPage_TextBox1_ShowWarning
      ; Mark for abort
      StrCpy $R1 0
   ${EndIf}

   ; Save TextBox2 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox2 $R2
   ${Trim} "$R2" $R2
   ${If} ${IsValidOptionCaCertFileValue} "$R2"
      ${WriteINIOption} "$R0" "${IO_CA-CERT-FILE}" "$R2"
   ${Else}
      ; Invalid value
      ; Show warning message
      Push "$R0"
      Call RemoteTargetsOptionsFirstPage_TextBox2_ShowWarning
      ; Mark for abort
      StrCpy $R1 0
   ${EndIf}

   ; Save TextBox3 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox3 $R2
   ${Trim} "$R2" $R2
   ${If} ${IsValidOptionCaCertUriValue} "$R2"
      ${WriteINIOption} "$R0" "${IO_CA-CERT-URI}" "$R2"
   ${Else}
      ; Invalid value
      ; Show warning message
      Push "$R0"
      Call RemoteTargetsOptionsFirstPage_TextBox3_ShowWarning
      ; Mark for abort
      StrCpy $R1 0
   ${EndIf}

   ; Save CheckBox1 Check
   ${NSD_GetState} $hCtl_RemoteTargetsOptionsFirstPage_CheckBox1 $R2
   ${If} $R2 = ${BST_CHECKED}
      ${WriteINIOption} "$R0" "${IO_NO-SSL-CHECK}" "1"
   ${Else}
      ${WriteINIOption} "$R0" "${IO_NO-SSL-CHECK}" "0"
   ${EndIf}

   ; Is it necessary to abort?
   ${If} $R1 = 0
      ; Pop $R2, $R1 & $R0 off of the stack
      Pop $R2
      Pop $R1
      Pop $R0
      ; Abort
      Abort
   ${Else}
      ; Pop $R2, $R1 & $R0 off of the stack
      Pop $R2
      Pop $R1
      Pop $R0
   ${EndIf}
FunctionEnd


Function RemoteTargetsOptionsFirstPage_Show
   ; Push $R0 onto the stack
   Push $R0

   ; Don't show the screen unless quick installation is disabled
   ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_QUICK-INSTALL}"
   ${If} "$R0" == "0"
      ; Don't show the screen unless SERVER was entered
      ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_SERVER}"
      ${If} "$R0" != ""
        Call RemoteTargetsOptionsFirstPage_Create
        nsDialogs::Show $hCtl_RemoteTargetsOptionsFirstPage
      ${EndIf}
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function RemoteTargetsOptionsFirstPage_TextBox1_ShowWarning
   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Get Label1 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsFirstPage_Label1 $R1

   ; Get TextBox1 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox1 $R2

   ; Mark invalid value
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox1 ""
   SetCtlColors $hCtl_RemoteTargetsOptionsFirstPage_TextBox1 0x000000 0xffcc33
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox1 "$R2"

   ; Show warning message
   MessageBox MB_OK|MB_ICONEXCLAMATION "$(RemoteTargetsOptionsFirstPage_TextBox_Warning)"

   ; Reset TextBox1 Text
   ${ReadINIOption} $R2 "$R0" "${IO_CA-CERT-DIR}"
   SetCtlColors $hCtl_RemoteTargetsOptionsFirstPage_TextBox1 0x000000 0xffffff
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox1 "$R2"

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function RemoteTargetsOptionsFirstPage_TextBox2_ShowWarning
   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Get Label2 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsFirstPage_Label2 $R1

   ; Get TextBox2 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox2 $R2

   ; Mark invalid value
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox2 ""
   SetCtlColors $hCtl_RemoteTargetsOptionsFirstPage_TextBox2 0x000000 0xffcc33
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox2 "$R2"

   ; Show warning message
   MessageBox MB_OK|MB_ICONEXCLAMATION "$(RemoteTargetsOptionsFirstPage_TextBox_Warning)"

   ; Reset TextBox2 Text
   ${ReadINIOption} $R2 "$R0" "${IO_CA-CERT-FILE}"
   SetCtlColors $hCtl_RemoteTargetsOptionsFirstPage_TextBox2 0x000000 0xffffff
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox2 "$R2"

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function RemoteTargetsOptionsFirstPage_TextBox3_ShowWarning
   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Get Label3 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsFirstPage_Label3 $R1

   ; Get TextBox3 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox3 $R2

   ; Mark invalid value
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox3 ""
   SetCtlColors $hCtl_RemoteTargetsOptionsFirstPage_TextBox3 0x000000 0xffcc33
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox3 "$R2"

   ; Show warning message
   MessageBox MB_OK|MB_ICONEXCLAMATION "$(RemoteTargetsOptionsFirstPage_TextBox_Warning)"

   ; Reset TextBox3 Text
   ${ReadINIOption} $R2 "$R0" "${IO_CA-CERT-URI}"
   SetCtlColors $hCtl_RemoteTargetsOptionsFirstPage_TextBox3 0x000000 0xffffff
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsFirstPage_TextBox3 "$R2"

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd
