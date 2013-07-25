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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\RemoteTargetsOptionsFirstPageLangStrings.nsh
   @author    Tomas Abad <tabadgp@gmail.com>
   @copyright Copyright (c) 2010-2013 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_REMOTEOPTIONSFIRSTPAGE_LANGSTRINGS_INCLUDE__
!define __FIAI_REMOTEOPTIONSFIRSTPAGE_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

; hCtl_RemoteTargetsOptionsFirstPage_Text
LangString hCtl_RemoteTargetsOptionsFirstPage_Text ${LANG_ENGLISH} "Remote Targets Options (1/2)"
LangString hCtl_RemoteTargetsOptionsFirstPage_Text ${LANG_FRENCH} "fRemote Targets Options (1/2)"
LangString hCtl_RemoteTargetsOptionsFirstPage_Text ${LANG_SPANISH} "Opciones de destinos remotos (1/2)"

; hCtl_RemoteTargetsOptionsFirstPage_SubText
LangString hCtl_RemoteTargetsOptionsFirstPage_SubText ${LANG_ENGLISH} "Set SSL options."
LangString hCtl_RemoteTargetsOptionsFirstPage_SubText ${LANG_FRENCH} "fSet SSL options."
LangString hCtl_RemoteTargetsOptionsFirstPage_SubText ${LANG_SPANISH} "Establezca opciones de SSL."

; hCtl_RemoteTargetsOptionsFirstPage_GroupBox1_Text
LangString hCtl_RemoteTargetsOptionsFirstPage_GroupBox1_Text ${LANG_ENGLISH} "SSL Options"
LangString hCtl_RemoteTargetsOptionsFirstPage_GroupBox1_Text ${LANG_FRENCH} "fSSL Options"
LangString hCtl_RemoteTargetsOptionsFirstPage_GroupBox1_Text ${LANG_SPANISH} "Opciones SSL"

; hCtl_RemoteTargetsOptionsFirstPage_Label1_Text
LangString hCtl_RemoteTargetsOptionsFirstPage_Label1_Text ${LANG_ENGLISH} "Certificates Directory"
LangString hCtl_RemoteTargetsOptionsFirstPage_Label1_Text ${LANG_FRENCH} "fCertificates Directory"
LangString hCtl_RemoteTargetsOptionsFirstPage_Label1_Text ${LANG_SPANISH} "Directorio de Certificados"

; hCtl_RemoteTargetsOptionsFirstPage_Button1_Text
LangString hCtl_RemoteTargetsOptionsFirstPage_Button1_Text ${LANG_ENGLISH} "Browser..."
LangString hCtl_RemoteTargetsOptionsFirstPage_Button1_Text ${LANG_FRENCH} "fBrowser..."
LangString hCtl_RemoteTargetsOptionsFirstPage_Button1_Text ${LANG_SPANISH} "Examinar..."

; hCtl_RemoteTargetsOptionsFirstPage_Label2_Text
LangString hCtl_RemoteTargetsOptionsFirstPage_Label2_Text ${LANG_ENGLISH} "Certificate File"
LangString hCtl_RemoteTargetsOptionsFirstPage_Label2_Text ${LANG_FRENCH} "fCertificate File"
LangString hCtl_RemoteTargetsOptionsFirstPage_Label2_Text ${LANG_SPANISH} "Fichero del Certificado"

; hCtl_RemoteTargetsOptionsFirstPage_Button2_Text
LangString hCtl_RemoteTargetsOptionsFirstPage_Button2_Text ${LANG_ENGLISH} "Browser..."
LangString hCtl_RemoteTargetsOptionsFirstPage_Button2_Text ${LANG_FRENCH} "fBrowser..."
LangString hCtl_RemoteTargetsOptionsFirstPage_Button2_Text ${LANG_SPANISH} "Examinar..."

; hCtl_RemoteTargetsOptionsFirstPage_Label3_Text
LangString hCtl_RemoteTargetsOptionsFirstPage_Label3_Text ${LANG_ENGLISH} "Certificate URI"
LangString hCtl_RemoteTargetsOptionsFirstPage_Label3_Text ${LANG_FRENCH} "fCertificate URI"
LangString hCtl_RemoteTargetsOptionsFirstPage_Label3_Text ${LANG_SPANISH} "URI del Certificado"

; hCtl_RemoteTargetsOptionsFirstPage_CheckBox1_Text
LangString hCtl_RemoteTargetsOptionsFirstPage_CheckBox1_Text ${LANG_ENGLISH} "Disable SSL check (use only for debugging)"
LangString hCtl_RemoteTargetsOptionsFirstPage_CheckBox1_Text ${LANG_FRENCH} "fDisable SSL check (use only for debugging)"
LangString hCtl_RemoteTargetsOptionsFirstPage_CheckBox1_Text ${LANG_SPANISH} "Desactivar comprobación SSL (usar solo para depuración)"

; hCtl_RemoteTargetsOptionsFirstPage_SelectFolderDialog_Title
LangString hCtl_RemoteTargetsOptionsFirstPage_SelectFolderDialog_Title ${LANG_ENGLISH} "Select the folder where certificates are:"
LangString hCtl_RemoteTargetsOptionsFirstPage_SelectFolderDialog_Title ${LANG_FRENCH} "fSelect the folder where certificates are:"
LangString hCtl_RemoteTargetsOptionsFirstPage_SelectFolderDialog_Title ${LANG_SPANISH} "Seleccione el directorio donde están los certificados:"

; hCtl_RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter1
LangString hCtl_RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter1 ${LANG_ENGLISH} "All Files (*.*)"
LangString hCtl_RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter1 ${LANG_FRENCH} "fAll Files (*.*)"
LangString hCtl_RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter1 ${LANG_SPANISH} "Todos (*.*)"

; hCtl_RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter2
LangString hCtl_RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter2 ${LANG_ENGLISH} "PEM Certificates (*.pem)"
LangString hCtl_RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter2 ${LANG_FRENCH} "fPEM Certificates (*.pem)"
LangString hCtl_RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter2 ${LANG_SPANISH} "Certificados PEM (*.pem)"

; RemoteTargetsOptionsFirstPage_TextBox_Warning
LangString RemoteTargetsOptionsFirstPage_TextBox_Warning ${LANG_ENGLISH} "The value $\"$R2$\" is not valid for the field $\"$R1$\"."
LangString RemoteTargetsOptionsFirstPage_TextBox_Warning ${LANG_FRENCH} "fThe value $\"$R2$\" is not valid for the field $\"$R1$\"."
LangString RemoteTargetsOptionsFirstPage_TextBox_Warning ${LANG_SPANISH} "El valor $\"$R2$\" no es válido para el campo $\"$R1$\"."


!endif
