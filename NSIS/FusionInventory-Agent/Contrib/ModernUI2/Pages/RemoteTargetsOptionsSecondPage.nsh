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
!include "${FIAI_DIR}\Include\INIFunc.nsh"
!include "${FIAI_DIR}\Include\StrFunc.nsh"
!include "${FIAI_DIR}\Include\OptionChecks.nsh"
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

Function RemoteTargetsOptionsSecondPage_Back
   Call RemoteTargetsOptionsSecondPage_Leave
FunctionEnd

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

   ; OnBack Function
   ${NSD_OnBack} RemoteTargetsOptionsSecondPage_Back

   ; Push $R0 & $R1 onto the stack
   Push $R0
   Push $R1

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Set TextBox1 Text
   ${ReadINIOption} $R1 "$R0" "${IO_PROXY}"
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox1 "$R1"

   ; Set TextBox2 Text
   ${ReadINIOption} $R1 "$R0" "${IO_USER}"
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox2 "$R1"

   ; Set Password1 Text
   ${ReadINIOption} $R1 "$R0" "${IO_PASSWORD}"
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_Password1 "$R1"

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


Function RemoteTargetsOptionsSecondPage_Leave
   ; Push $R0, $R1 & $R2 onto the stack
   Push $R0
   Push $R1
   Push $R2

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Initialize $R1
   StrCpy $R1 1

   ; Save TextBox1 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox1 $R2
   ${Trim} "$R2" $R2
   ${If} ${IsValidOptionProxyValue} "$R2"
      ${WriteINIOption} "$R0" "${IO_PROXY}" "$R2"
   ${Else}
      ; Invalid value
      ; Show warning message
      Push "$R0"
      Call RemoteTargetsOptionsSecondPage_TextBox1_ShowWarning
      ; Mark for abort
      StrCpy $R1 0
   ${EndIf}

   ; Save TextBox2 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox2 $R2
   ${Trim} "$R2" $R2
   ${If} ${IsValidOptionUserValue} "$R2"
      ${WriteINIOption} "$R0" "${IO_USER}" "$R2"
   ${Else}
      ; Invalid value
      ; Show warning message
      Push "$R0"
      Call RemoteTargetsOptionsSecondPage_TextBox2_ShowWarning
      ; Mark for abort
      StrCpy $R1 0
   ${EndIf}

   ; Save Password1 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsSecondPage_Password1 $R2
   ${Trim} "$R2" $R2
   ${If} ${IsValidOptionPasswordValue} "$R2"
      ${WriteINIOption} "$R0" "${IO_PASSWORD}" "$R2"
   ${Else}
      ; Invalid value
      ; Show warning message
      Push "$R0"
      Call RemoteTargetsOptionsSecondPage_Password1_ShowWarning
      ; Mark for abort
      StrCpy $R1 0
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


Function RemoteTargetsOptionsSecondPage_Password1_ShowWarning
   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Get Label3 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsSecondPage_Label3 $R1

   ; Get Password1 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsSecondPage_Password1 $R2

   ; Mark invalid value
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_Password1 ""
   SetCtlColors $hCtl_RemoteTargetsOptionsSecondPage_Password1 0x000000 0xffcc33
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_Password1 "$R2"

   ; Show warning message
   MessageBox MB_OK|MB_ICONEXCLAMATION "$(RemoteTargetsOptionsSecondPage_TextBox_Warning)"

   ; Reset Password1 Text
   ${ReadINIOption} $R2 "$R0" "${IO_PASSWORD}"
   SetCtlColors $hCtl_RemoteTargetsOptionsSecondPage_Password1 0x000000 0xffffff
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_Password1 "$R2"

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function RemoteTargetsOptionsSecondPage_Show
   ; Push $R0 onto the stack
   Push $R0

   ; Don't show the screen unless quick installation is disabled
   ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_QUICK-INSTALL}"
   ${If} "$R0" == "0"
      ; Don't show the screen unless SERVER was entered
      ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_SERVER}"
      ${If} "$R0" != ""
         Call RemoteTargetsOptionsSecondPage_Create
         nsDialogs::Show $hCtl_RemoteTargetsOptionsSecondPage
      ${EndIf}
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function RemoteTargetsOptionsSecondPage_TextBox1_ShowWarning
   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Get Label1 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsSecondPage_Label1 $R1

   ; Get TextBox1 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox1 $R2

   ; Mark invalid value
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox1 ""
   SetCtlColors $hCtl_RemoteTargetsOptionsSecondPage_TextBox1 0x000000 0xffcc33
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox1 "$R2"

   ; Show warning message
   MessageBox MB_OK|MB_ICONEXCLAMATION "$(RemoteTargetsOptionsSecondPage_TextBox_Warning)"

   ; Reset TextBox1 Text
   ${ReadINIOption} $R2 "$R0" "${IO_PROXY}"
   SetCtlColors $hCtl_RemoteTargetsOptionsSecondPage_TextBox1 0x000000 0xffffff
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox1 "$R2"

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function RemoteTargetsOptionsSecondPage_TextBox2_ShowWarning
   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Get Label2 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsSecondPage_Label2 $R1

   ; Get TextBox2 Text
   ${NSD_GetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox2 $R2

   ; Mark invalid value
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox2 ""
   SetCtlColors $hCtl_RemoteTargetsOptionsSecondPage_TextBox2 0x000000 0xffcc33
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox2 "$R2"

   ; Show warning message
   MessageBox MB_OK|MB_ICONEXCLAMATION "$(RemoteTargetsOptionsSecondPage_TextBox_Warning)"

   ; Reset TextBox2 Text
   ${ReadINIOption} $R2 "$R0" "${IO_USER}"
   SetCtlColors $hCtl_RemoteTargetsOptionsSecondPage_TextBox2 0x000000 0xffffff
   ${NSD_SetText} $hCtl_RemoteTargetsOptionsSecondPage_TextBox2 "$R2"

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd
