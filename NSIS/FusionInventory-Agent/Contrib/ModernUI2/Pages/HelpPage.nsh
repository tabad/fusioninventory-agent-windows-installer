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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\HelpPage.nsh
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
   This file was generated with the help of NSISDialogDesigner 0.9.16.0
   http://coolsoft.altervista.org/nsisdialogdesigner
   ------------------------------------------------------------------------
*/


!include LogicLib.nsh
!include "${FIAI_DIR}\Include\INIFunc.nsh"
!include "${FIAI_DIR}\Include\FileFunc.nsh"
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\HelpPageLangStrings.nsh"


;--------------------------------
; Handle Variables

Var hCtl_HelpPage
Var hCtl_HelpPage_Label1
Var hCtl_HelpPage_RichEdit1
Var hCtl_HelpPage_Button1


;--------------------------------
; Help Page Functions

Function HelpPage_Create
   ; === HelpPage (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_HelpPage
   ${If} $hCtl_HelpPage == error
     Abort
   ${EndIf}

   ${IfNot} ${CommandLineSyntaxError}
      !insertmacro MUI_HEADER_TEXT "$(HelpPage_Text_Help)" "$(HelpPage_SubText)"
   ${Else}
      !insertmacro MUI_HEADER_TEXT "$(HelpPage_Text_SyntaxError)" "$(HelpPage_SubText)"
   ${EndIf}

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 0u 0u 294u 9u "$(HelpPage_Label1_Text)"
   Pop $hCtl_HelpPage_Label1

   ; === RichEdit1 (type: RichEdit20A) ===
   nsDialogs::CreateControl RichEdit20A \
      ${WS_VISIBLE}|${WS_CHILD}|${WS_TABSTOP}|${WS_VSCROLL}|${ES_MULTILINE}|${ES_READONLY} \
      ${__NSD_Text_EXSTYLE} \
      0 24 448 170 ""
   Pop $hCtl_HelpPage_RichEdit1

   Call BuildHelpFile
   nsRichEdit::Load $hCtl_HelpPage_RichEdit1 "$PLUGINSDIR\${PRODUCT_HELP_FILE}"

   ; === Button1 (type: Button) ===
   ${NSD_CreateButton} 249u 126u 49u 14u "$(HelpPage_Button1_Text)"
   Pop $hCtl_HelpPage_Button1

   ${NSD_OnClick} $hCtl_HelpPage_Button1 HelpPage_Button1_Click

   ; Push $R0 onto the stack
   Push $R0

   ; Hide and disable the button 'Next'
   GetDlgItem $R0 $HWNDPARENT 1
   ShowWindow $R0 ${SW_HIDE}
   EnableWindow $R0 0

   ; Change the text of button 'Cancel'
   GetDlgItem $R0 $HWNDPARENT 2
   ${NSD_SetText} $R0 "$(HelpPage_CancelButton_Text)"

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function HelpPage_Show
   ; Pushes $R0 onto the stack
   Push $R0

   ${IfNot} ${CommandLineSyntaxError}
      ; Check whether is needed dump the help and exit
      ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_DUMPHELP}"
      ${If} $R0 = 1
         ; Dump help file
         Call BuildHelpFile
         CopyFiles /SILENT /FILESONLY "$PLUGINSDIR\${PRODUCT_HELP_FILE}" "$EXEDIR\${PRODUCT_HELP_FILE}"
         ${PrepareToExit}
         Quit
      ${EndIf}

      ; Check whether is needed show the help
      ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_HELP}"
      ${If} $R0 = 0
         ; Abort
         Pop $R0
         Abort
      ${EndIf}
   ${EndIf}

   Call HelpPage_Create
   nsDialogs::Show $hCtl_HelpPage

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function HelpPage_Leave
   Nop
FunctionEnd


Function HelpPage_Button1_Click
   nsRichEdit::Print $hCtl_HelpPage_RichEdit1 "$(^Name)"
FunctionEnd


Function BuildHelpFile
   ; Pushes $Rx onto the stack
   Push $R0
   Push $R9

   ; Create an empty help file
   Delete "$PLUGINSDIR\${PRODUCT_HELP_FILE}"
   FileOpen $R0 "$PLUGINSDIR\${PRODUCT_HELP_FILE}" w

   ; Header
   ${FileWriteLine} $R0 `{\rtf1\ansi\ansicpg1252\deff0\deflang3082{\fonttbl{\f0\fswiss\fcharset0 Courier New;}}`
   ${FileWriteLine} $R0 `{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\f0\fs16`

   ; Name
   ${FileWriteLine} $R0 `\pard\b $(HelpPage_Help_Name)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400\b ${PRODUCT_INSTALLER}\b0  -- $(^Name) Setup\par`
   ${FileWriteLine} $R0 `\par`

   ; Synopsys
   ${FileWriteLine} $R0 `\pard\b $(HelpPage_Help_Synopsis)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400\b ${PRODUCT_INSTALLER}\b0  [\i /$(HelpPage_Help_Option)\i0 [ \i /$(HelpPage_Help_Option)\i0 [ ...]]]\par`
   ${FileWriteLine} $R0 `\par`

   ; Description
   ${FileWriteLine} $R0 `\pard\b $(HelpPage_Help_Description)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(HelpPage_Help_Description_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Description_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Description_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Description_Paragraph_4)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Description_Paragraph_5)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Description_Paragraph_6)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Description_Paragraph_7)\par`
   ${FileWriteLine} $R0 `\par`

   ; /acceptlicense
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_ACCEPTLICENSE}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} $R9 = 0
      StrCpy $R9 $(HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /acceptlicense\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_acceptlicense_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_acceptlicense_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_acceptlicense_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /add-firewall-exception
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_ADD-FIREWALL-EXCEPTION}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} $R9 = 0
      StrCpy $R9 $(HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /add-firewall-exception\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_add-firewall-exception_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_add-firewall-exception_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /collect-timeout
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_COLLECT-TIMEOUT}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /collect-timeout\b0 =\i timeout\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_collect-timeout_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /ca-cert-dir
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_CA-CERT-DIR}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /ca-cert-dir\b0 =\i pathname\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_ca-cert-dir_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_ca-cert-dir_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_ca-cert-dir_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_ca-cert-dir_Paragraph_4)\par`
   ${FileWriteLine} $R0 `\par`

   ; /ca-cert-file
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_CA-CERT-FILE}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /ca-cert-file\b0 =\i filename\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_ca-cert-file_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_ca-cert-file_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_ca-cert-file_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /ca-cert-uri
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_CA-CERT-URI}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /ca-cert-uri\b0 =\i URI\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_ca-cert-uri_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_ca-cert-uri_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_ca-cert-uri_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /debug
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_DEBUG}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /debug\b0 =\i level\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_debug_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_debug_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /delaytime
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_DELAYTIME}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /delaytime\b0 =\i limit\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_delaytime_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_delaytime_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_delaytime_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /dumphelp
   ${FileWriteLine} $R0 `\pard\li400\b /dumphelp\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_dumphelp_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /execmode
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_EXECMODE}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /execmode\b0 =\i mode\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_execmode_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_execmode_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_execmode_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /help
   ${FileWriteLine} $R0 `\pard\li400\b /help\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_help_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_help_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /httpd
   ${FileWriteLine} $R0 `\pard\li400\b /httpd\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_httpd_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /httpd-ip
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_HTTPD-IP}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /httpd-ip\b0 =\i ip\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_httpd-ip_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /httpd-port
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_HTTPD-PORT}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /httpd-port\b0 =\i port\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_httpd-port_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /httpd-trust
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_HTTPD-TRUST}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /httpd-trust\b0 =\{\i ip\i0 |\i range\i0 |\i hostname\i0 \}[,\{\i ip\i0 |\i range\i0 |\i hostname\i0 \}[...]]\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_httpd-trust_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_httpd-trust_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_httpd-trust_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /installdir
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_INSTALLDIR}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /installdir\b0 =\i pathname\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_installdir_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_installdir_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_installdir_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /installtasks
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_INSTALLTASKS}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /installtasks\b0 =\{\i task\i0 [,\i task\i0 [...]]|\i macro\i0 \}\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_installtasks_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_installtasks_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_installtasks_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /installtype
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_INSTALLTYPE}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /installtype\b0 =\{\b from-scratch\b0 |\b from-current-config\b0\}\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_installtype_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_installtype_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /logfile
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_LOGFILE}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /logfile\b0 =\i filename\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_logfile_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_logfile_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /logfile-maxsize
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_LOGFILE-MAXSIZE}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /logfile-maxsize\b0 =\i size\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_logfile-maxsize_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /logger
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_LOGGER}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /logger\b0 =\i backend\i0 [,\i backend\i0 ]\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_logger_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_logger_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /no-category
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_NO-CATEGORY}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /no-category\b0 =\i category\i0 [,\i category\i0 [...]]\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_no-category_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_no-category_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /no-httpd
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_NO-HTTPD}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} $R9 = 0
      StrCpy $R9 $(HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /no-httpd\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_no-httpd_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /no-p2p
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_NO-P2P}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} $R9 = 0
      StrCpy $R9 $(HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /no-p2p\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_no-p2p_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /no-scan-homedirs
   ${FileWriteLine} $R0 `\pard\li400\b /no-scan-homedirs\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_no-scan-homedirs_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /no-scan-profiles
   ${FileWriteLine} $R0 `\pard\li400\b /no-scan-profiles\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_no-scan-profiles_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /no-ssl-check
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_NO-SSL-CHECK}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} $R9 = 0
      StrCpy $R9 $(HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /no-ssl-check\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_no-ssl-check_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /no-start-menu
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_NO-START-MENU}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} $R9 = 0
      StrCpy $R9 $(HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /no-start-menu\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_no-start-menu_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_no-start-menu_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /no-task
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_NO-TASK}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /no-task\b0 =\i task\i0 [,\i task\i0 [...]]\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_no-task_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_no-task_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /p2p
   ${FileWriteLine} $R0 `\pard\li400\b /p2p\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_p2p_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /password
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_PASSWORD}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /password\b0 =\i password\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_password_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_password_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /proxy
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_PROXY}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /proxy\b0 =\i URI\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_proxy_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /runnow
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_RUNNOW}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} $R9 = 0
      StrCpy $R9 $(HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /runnow\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_runnow_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /S
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_SILENTMODE}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} $R9 = 0
      StrCpy $R9 $(HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /S\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_S_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_S_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /scan-homedirs
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_SCAN-HOMEDIRS}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} $R9 = 0
      StrCpy $R9 $(HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /scan-homedirs\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_scan-homedirs_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /scan-profiles
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_SCAN-PROFILES}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} $R9 = 0
      StrCpy $R9 $(HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /scan-profiles\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_scan-profiles_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /server
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_SERVER}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /server\b0 =\i URI\i0 [,\i URI\i0 [...]]\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_server_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_server_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_server_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /ssl-check
   ${FileWriteLine} $R0 `\pard\li400\b /ssl-check\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_ssl-check_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /start-menu
   ${FileWriteLine} $R0 `\pard\li400\b /start-menu\b0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_start-menu_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /tag
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TAG}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /tag\b0 =\i tag\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_tag_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; /task-daily-modifier
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TASK-DAILY-MODIFIER}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /task-daily-modifier\b0 =\i modifier\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_task-daily-modifier_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_task-daily-modifier_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_task-daily-modifier_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /task-frequency
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TASK-FREQUENCY}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /task-frequency\b0 =\i frequency\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_task-frequency_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_task-frequency_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /task-hourly-modifier
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TASK-HOURLY-MODIFIER}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /task-hourly-modifier\b0 =\i modifier\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_task-hourly-modifier_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_task-hourly-modifier_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_task-hourly-modifier_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /task-minute-modifier
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TASK-MINUTE-MODIFIER}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /task-minute-modifier\b0 =\i modifier\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_task-minute-modifier_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_task-minute-modifier_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_task-minute-modifier_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`

   ; /timeout
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TIMEOUT}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9

   ${FileWriteLine} $R0 `\pard\li400\b /timeout\b0 =\i timeout\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_timeout_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_timeout_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; /user
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_USER}"
   ${EscapeSpecialRTFCharacters} "$R9" $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400\b /user\b0 =\i user\i0\par`
   ${FileWriteLine} $R0 `\pard\li800 $(HelpPage_Help_Option_user_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par $(HelpPage_Help_Option_user_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`

   ; Examples
   ${FileWriteLine} $R0 `\pard\b $(HelpPage_Help_Examples)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(HelpPage_Help_Examples_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; Version
   ${FileWriteLine} $R0 `\pard\b $(HelpPage_Help_Version)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(HelpPage_Help_Version_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; Bugs
   ${FileWriteLine} $R0 `\pard\b $(HelpPage_Help_Bugs)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(HelpPage_Help_Bugs_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; Copyright
   ${FileWriteLine} $R0 `\pard\b $(HelpPage_Help_Copyright)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(HelpPage_Help_Copyright_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; SeeAlso
   ${FileWriteLine} $R0 `\pard\b $(HelpPage_Help_SeeAlso)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(HelpPage_Help_SeeAlso_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; Author
   ${FileWriteLine} $R0 `\pard\b $(HelpPage_Help_Author)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(HelpPage_Help_Author_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`

   ; End of file
   ${FileWriteLine} $R0 `}`

   FileClose $R0

   ; Pop $Rx off of the stack
   Pop $R9
   Pop $R0
FunctionEnd

