/*
   ------------------------------------------------------------------------
   FusionInventory Agent Installer for Microsoft Windows
   Copyright (C) 2010-2012 by the FusionInventory Development Team.

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
   @copyright Copyright (c) 2010-2012 FusionInventory Team
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

   ${If} $CommandLineSyntaxError = 0
      !insertmacro MUI_HEADER_TEXT "$(hCtl_HelpPage_Text_Help)" "$(hCtl_HelpPage_SubText)"
   ${Else}
      !insertmacro MUI_HEADER_TEXT "$(hCtl_HelpPage_Text_SyntaxError)" "$(hCtl_HelpPage_SubText)"
   ${EndIf}

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 0u 0u 294u 9u "$(hCtl_HelpPage_Label1_Text)"
   Pop $hCtl_HelpPage_Label1

   ; === RichEdit1 (type: RichEdit20A) ===
   nsDialogs::CreateControl RichEdit20A \
      ${WS_VISIBLE}|${WS_CHILD}|${WS_TABSTOP}|${WS_VSCROLL}|${ES_MULTILINE}|${ES_READONLY} \
      ${__NSD_Text_EXSTYLE} \
      0 24 448 170 ""
   Pop $hCtl_HelpPage_RichEdit1

   Call BuildHelpFile
   nsRichEdit::Load $hCtl_HelpPage_RichEdit1 "$PLUGINSDIR\${FIAI_HELP_FILE}"

   ; === Button1 (type: Button) ===
   ${NSD_CreateButton} 249u 126u 49u 14u "$(hCtl_HelpPage_Button1_Text)"
   Pop $hCtl_HelpPage_Button1

   ${NSD_OnClick} $hCtl_HelpPage_Button1 HelpPage_Button1_Click

   ; Hide 'Next' button.
   Push $R0
   GetDlgItem $R0 $HWNDPARENT 1
   ShowWindow $R0 ${SW_HIDE}
   Pop $R0
FunctionEnd


Function HelpPage_Show
   ; Pushes $R0 onto the stack
   Push $R0

   ${ReadINIOption} $R0 "${IOS_COMMANDLINE}" "${IO_HELP}"
   ${If} $CommandLineSyntaxError = 0
   ${AndIf} $R0 = 0
      ; Pop $R0 off of the stack
      Pop $R0

      ; Abort
      Abort
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
   Delete "$PLUGINSDIR\${FIAI_HELP_FILE}"
   FileOpen $R0 "$PLUGINSDIR\${FIAI_HELP_FILE}" w

   ; Header
   ${FileWriteLine} $R0 `{\rtf1\ansi\ansicpg1252\deff0\deflang3082{\fonttbl{\f0\fswiss\fcharset0 Courier New;}}`
   ${FileWriteLine} $R0 `{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\f0\fs16`

   ; Name
   ${FileWriteLine} $R0 `\pard\b $(hCtl_HelpPage_Help_Name)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 ${PRODUCT_INSTALLER} - $(^Name) ${PRODUCT_VERSION} Setup\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; Synopsys
   ${FileWriteLine} $R0 `\pard\b $(hCtl_HelpPage_Help_Synopsis)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 ${PRODUCT_INSTALLER} [$(hCtl_HelpPage_Help_Option)]...\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; Description
   ${FileWriteLine} $R0 `\pard\b $(hCtl_HelpPage_Help_Description)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(hCtl_HelpPage_Help_Description_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /acceptlicense
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_ACCEPTLICENSE}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} $R9 = 0
      StrCpy $R9 $(hCtl_HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(hCtl_HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /acceptlicense\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_acceptlicense_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_acceptlicense_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /add-firewall-exception
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_ADD-FIREWALL-EXCEPTION}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} $R9 = 0
      StrCpy $R9 $(hCtl_HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(hCtl_HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /add-firewall-exception\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_add-firewall-exception_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /backend-collect-timeout
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_BACKEND-COLLECT-TIMEOUT}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /backend-collect-timeout=<\i timeout\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_backend-collect-timeout_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /ca-cert-dir
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_CA-CERT-DIR}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /ca-cert-dir=<\i absolute_pathname\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_ca-cert-dir_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /ca-cert-file
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_CA-CERT-FILE}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /ca-cert-file=<\i filename\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_ca-cert-file_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_ca-cert-file_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /ca-cert-uri
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_CA-CERT-URI}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /ca-cert-uri=<\i URI\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_ca-cert-uri_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_ca-cert-uri_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /debug
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_DEBUG}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /debug\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_debug_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_debug_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /delaytime
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_DELAYTIME}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /delaytime=<\i limit\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_delaytime_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_delaytime_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_delaytime_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /execmode
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_EXECMODE}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /execmode=\{service|task|manual|currentconf\}\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_execmode_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_execmode_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /help
   ${FileWriteLine} $R0 `\pard\li400 /help\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_help_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /html
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_HTML}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} $R9 = 0
      StrCpy $R9 $(hCtl_HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(hCtl_HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /html\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_html_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_html_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /httpd
   ${FileWriteLine} $R0 `\pard\li400 /httpd\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_httpd_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /httpd-ip
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_HTTPD-IP}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /httpd-ip=<\i ip\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_httpd-ip_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_httpd-ip_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /httpd-port
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_HTTPD-PORT}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /httpd-port=<\i port\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_httpd-port_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_httpd-port_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /httpd-trust
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_HTTPD-TRUST}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /httpd-trust=<\i cidr\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_httpd-trust_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_httpd-trust_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /installdir
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_INSTALLDIR}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /installdir=<\i absolute_pathname\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_installdir_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_installdir_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /installtasks
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_INSTALLTASKS}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /installtasks=\{[<\i task\i0 >][,<\i task\i0 >][...]|<\i macro\i0 >\}\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_installtasks_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_installtasks_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_installtasks_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /installtype
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_INSTALLTYPE}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /installtype=\{from-scratch|from-current-config\}\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_installtype_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_installtype_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /local
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_LOCAL}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /local=<\i absolute_pathname\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_local_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_local_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_local_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /logfile
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_LOGFILE}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /logfile=<\i filename\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_logfile_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_logfile_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /logfile-maxsize
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_LOGFILE-MAXSIZE}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /logfile-maxsize=<\i size\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_logfile-maxsize_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_logfile-maxsize_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /logger
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_LOGGER}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /logger=\{[<\i backend\i0 >][,<\i backend\i0 >]\}\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_logger_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_logger_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /no-category
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_NO-CATEGORY}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /no-category=\{[<\i category\i0 >][,<\i category\i0 >][...]\}\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_no-category_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_no-category_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /no-html
   ${FileWriteLine} $R0 `\pard\li400 /no-html\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_no-html_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /no-httpd
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_NO-HTTPD}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} $R9 = 0
      StrCpy $R9 $(hCtl_HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(hCtl_HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /no-httpd\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_no-httpd_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /no-p2p
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_NO-P2P}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} $R9 = 0
      StrCpy $R9 $(hCtl_HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(hCtl_HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /no-p2p\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_no-p2p_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /no-scan-homedirs
   ${FileWriteLine} $R0 `\pard\li400 /no-scan-homedirs\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_no-scan-homedirs_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /no-ssl-check
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_NO-SSL-CHECK}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} $R9 = 0
      StrCpy $R9 $(hCtl_HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(hCtl_HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /no-ssl-check\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_no-ssl-check_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_no-ssl-check_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /no-task
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_NO-TASK}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /no-task=\{[<\i task\i0 >][,<\i task\i0 >][...]\}\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_no-task_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_no-task_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /p2p
   ${FileWriteLine} $R0 `\pard\li400 /p2p\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_p2p_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /password
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_PASSWORD}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /password=<\i password\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_password_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_password_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /proxy
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_PROXY}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /proxy=<\i URI\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_proxy_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_proxy_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /runnow
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_RUNNOW}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} $R9 = 0
      StrCpy $R9 $(hCtl_HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(hCtl_HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /runnow\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_runnow_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /S
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_SILENTMODE}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} $R9 = 0
      StrCpy $R9 $(hCtl_HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(hCtl_HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /S\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_S_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_S_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /scan-homedirs
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_SCAN-HOMEDIRS}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} $R9 = 0
      StrCpy $R9 $(hCtl_HelpPage_Help_No)
   ${Else}
      StrCpy $R9 $(hCtl_HelpPage_Help_Yes)
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /scan-homedirs\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_scan-homedirs_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /server
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_SERVER}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /server=[<\i URI\i0 >][,<\i URI\i0 >[...]] \par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_server_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_server_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_server_Paragraph_3)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /ssl-check
   ${FileWriteLine} $R0 `\pard\li400 /ssl-check\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_ssl-check_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /tag
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TAG}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /tag=<\i tag\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_tag_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_tag_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /task-dayly-modifier
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TASK-DAYLY-MODIFIER}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /task-dayly-modifier=<\i modifier\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_task-dayly-modifier_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_task-dayly-modifier_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /task-frequency
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TASK-FREQUENCY}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /task-frequency=\{minute|hourly|dayly\}\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_task-frequency_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_task-frequency_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /task-hourly-modifier
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TASK-HOURLY-MODIFIER}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /task-hourly-modifier=<\i modifier\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_task-hourly-modifier_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_task-hourly-modifier_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /task-minute-modifier
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TASK-MINUTE-MODIFIER}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /task-minute-modifier=<\i modifier\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_task-minute-modifier_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_task-minute-modifier_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /timeout
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_TIMEOUT}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /timeout=<\i timeout\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_timeout_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_timeout_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /user
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_USER}"
   ${EscapeSpecialRTFCharacters} $R9 $R9
   ${If} "$R9" == ""
      StrCpy $R9 "$\"$\""
   ${EndIf}

   ${FileWriteLine} $R0 `\pard\li400 /user=<\i user\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_user_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_user_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; /wait
   ${ReadINIOption} $R9 "${IOS_DEFAULT}" "${IO_WAIT}"
   ${EscapeSpecialRTFCharacters} $R9 $R9

   ${FileWriteLine} $R0 `\pard\li400 /wait=<\i limit\i0 >\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_wait_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 `\pard\li800 $(hCtl_HelpPage_Help_Option_wait_Paragraph_2)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; Author
   ${FileWriteLine} $R0 `\pard\b $(hCtl_HelpPage_Help_Author)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(hCtl_HelpPage_Help_Author_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; Bugs
   ${FileWriteLine} $R0 `\pard\b $(hCtl_HelpPage_Help_Bugs)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(hCtl_HelpPage_Help_Bugs_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; Copyright
   ${FileWriteLine} $R0 `\pard\b $(hCtl_HelpPage_Help_Copyright)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(hCtl_HelpPage_Help_Copyright_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; SeeAlso
   ${FileWriteLine} $R0 `\pard\b $(hCtl_HelpPage_Help_SeeAlso)\b0\par`
   ${FileWriteLine} $R0 `\pard\li400 $(hCtl_HelpPage_Help_SeeAlso_Paragraph_1)\par`
   ${FileWriteLine} $R0 `\par`
   ${FileWriteLine} $R0 ``

   ; End of file
   ${FileWriteLine} $R0 `}`

   FileClose $R0

   ; Pop $Rx off of the stack
   Pop $R9
   Pop $R0
FunctionEnd

