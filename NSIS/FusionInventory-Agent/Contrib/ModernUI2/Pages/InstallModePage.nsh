/*
   ------------------------------------------------------------------------
   FusionInventory
   Copyright (C) 2010-2012 by the FusionInventory Development Team.

   http://www.fusioninventory.org/   http://forge.fusioninventory.org/
   ------------------------------------------------------------------------

   LICENSE

   This file is part of FusionInventory project.

   FusionInventory is free software: you can [...]

   FusionInventory is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU Affero General Public License for more details.

   You should have received a copy of [...]

   ------------------------------------------------------------------------

   @package   FusionInventory Agent Installer for Microsoft Windows
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\InstallModePage.nsh     
   @author    Tomas Abad
   @copyright Copyright (c) 2010-2012 FusionInventory Team
   @license   [...]
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012
 
   ------------------------------------------------------------------------
*/

/*
   ------------------------------------------------------------------------
   This file was generated with the help of NSISDialogDesigner 0.9.16.0
   http://coolsoft.altervista.org/nsisdialogdesigner
   ------------------------------------------------------------------------
*/


!include LogicLib.nsh
!include "${FIAIDIR}\Include\INIFunc.nsh"
!include "${FIAIDIR}\Include\RegFunc.nsh"
!include "${FIAIDIR}\Contrib\ModernUI2\Pages\InstallModePageLangStrings.nsh"


;--------------------------------
; Handle Variables

Var hCtl_InstallModePage
Var hCtl_InstallModePage_Label1
Var hCtl_InstallModePage_RadioButton1
Var hCtl_InstallModePage_Label2
Var hCtl_InstallModePage_RadioButton2
Var hCtl_InstallModePage_Label3


;--------------------------------
; InstallMode Page Functions

Function InstallModePage_Create
   ; Push $R0 onto the stack
   Push $R0

   ; === InstallModePage (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_InstallModePage
   ${If} "$hCtl_InstallModePage" == "error"
     Pop $R0
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(hCtl_InstallModePage_Text)" "$(hCtl_InstallModePage_SubText)"
 
   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 0u 0u 294u 36u "$(hCtl_InstallModePage_Label1_Text)"
   Pop $hCtl_InstallModePage_Label1

   ; === RadioButton1 (type: RadioButton) ===
   ${NSD_CreateRadioButton} 16u 41u 252u 14u "$(hCtl_InstallModePage_RadioButton1_Text)"
   Pop $hCtl_InstallModePage_RadioButton1
   ${NSD_AddStyle} $hCtl_InstallModePage_RadioButton1 ${WS_GROUP}
 
   ; === Label2 (type: Label) ===
   ${NSD_CreateLabel} 32u 54u 236u 23u "$(hCtl_InstallModePage_Label2_Text)"
   Pop $hCtl_InstallModePage_Label2

   ; === RadioButton2 (type: RadioButton) ===
   ${NSD_CreateRadioButton} 16u 81u 252u 14u "$(hCtl_InstallModePage_RadioButton2_Text)"
   Pop $hCtl_InstallModePage_RadioButton2

   ; === Label3 (type: Label) ===
   ${NSD_CreateLabel} 32u 95u 236u 23u "$(hCtl_InstallModePage_Label3_Text)"
   Pop $hCtl_InstallModePage_Label3

   ; OnBack function
   ${NSD_OnBack} InstallModePage_Back

   ; Default values
   ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_INSTALLTYPE}"

   ${If} "$R0" == "${INSTALLTYPE_FROMSCRATCH}" 
      ; Check RadioButton1
      ${NSD_Check} $hCtl_InstallModePage_RadioButton1
      ${NSD_Uncheck} $hCtl_InstallModePage_RadioButton2
   ${ElseIf} "$R0" == "${INSTALLTYPE_FROMCURRENTCONFIG}"
      ; Check RadioButton2
      ${NSD_Uncheck} $hCtl_InstallModePage_RadioButton1
      ${NSD_Check} $hCtl_InstallModePage_RadioButton2
   ${Else}
      ; Check RadioButton2
      ${NSD_Uncheck} $hCtl_InstallModePage_RadioButton1
      ${NSD_Check} $hCtl_InstallModePage_RadioButton2
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function InstallModePage_Show
   ; Push $R0 onto the stack
   Push $R0

   ; Is FusionInventory Agent installed?
   ${IsFusionInventoryAgentInstalled} $R0
 
   ${If} $R0 = 0
      ; The agent is not installed yet
      Pop $R0
      Abort
   ${Else}
      ; The agent is already installed
      Call InstallModePage_Create
      nsDialogs::Show $hCtl_InstallModePage
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function InstallModePage_Leave
   ; Push $R0 onto the stack
   Push $R0

   ${NSD_GetState} $hCtl_InstallModePage_RadioButton1 $R0

   ${If} "$R0" == "${BST_CHECKED}"
      ; ${INSTALLTYPE_FROMSCRATCH}
      ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_INSTALLTYPE}"

      ${If} "$R0" != "${INSTALLTYPE_FROMSCRATCH}"
         ; ${INSTALLTYPE_FROMCURRENTCONFIG} -> ${INSTALLTYPE_FROMSCRATCH}
         ${CopyINIOptionSection} "${IOS_DEFAULT}" "${IOS_GUI}"
         ${UpdateINIOptionSection} "${IOS_GUI}" "${IOS_COMMANDLINE}"
         ${WriteINIOption} "${IOS_GUI}" "${IO_INSTALLTYPE}" "${INSTALLTYPE_FROMSCRATCH}"
      ${EndIf}
   ${Else}
      ; ${INSTALLTYPE_FROMCURRENTCONFIG}
      ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_INSTALLTYPE}"

      ${If} "$R0" != "${INSTALLTYPE_FROMCURRENTCONFIG}"
         ; ${INSTALLTYPE_FROMSCRATCH} -> ${INSTALLTYPE_FROMSCRATCH}
         ${InitINIOptionSectionCurrentConfig}
         ${CopyINIOptionSection} "${IOS_DEFAULT}" "${IOS_GUI}"
         ${UpdateINIOptionSection} "${IOS_GUI}" "${IOS_CURRENTCONFIG}"
         ${UpdateINIOptionSection} "${IOS_GUI}" "${IOS_COMMANDLINE}"
         ${WriteINIOption} "${IOS_GUI}" "${IO_INSTALLTYPE}" "${INSTALLTYPE_FROMCURRENTCONFIG}"
      ${EndIf}
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function InstallModePage_Back
   Call InstallModePage_Leave
FunctionEnd
