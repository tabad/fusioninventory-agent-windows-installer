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

   @package    FusionInventory Agent Installer for Microsoft Windows
   @file       .\FusionInventory Agent\Contrib\ModernUI2\Pages\RemoteTargetsOptionsFirstPageLangStrings.nsh
   @author     Tomas Abad <tabadgp@gmail.com>
   @translator Emmanuel Le Normand <manu@le-normand.org> (French Translation)
   @copyright  Copyright (c) 2010-2013 FusionInventory Team
   @license    GNU GPL version 2 or (at your option) any later version
               http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link       http://www.fusioninventory.org/
   @link       http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since      2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_REMOTEOPTIONSFIRSTPAGE_LANGSTRINGS_INCLUDE__
!define __FIAI_REMOTEOPTIONSFIRSTPAGE_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

; RemoteTargetsOptionsFirstPage_Text
LangString RemoteTargetsOptionsFirstPage_Text ${LANG_ENGLISH} "Remote Targets Options (1/2)"
LangString RemoteTargetsOptionsFirstPage_Text ${LANG_FRENCH} "Options Connexions Serveur (1/2)"
LangString RemoteTargetsOptionsFirstPage_Text ${LANG_SPANISH} "Opciones de destinos remotos (1/2)"

; RemoteTargetsOptionsFirstPage_SubText
LangString RemoteTargetsOptionsFirstPage_SubText ${LANG_ENGLISH} "Set SSL options."
LangString RemoteTargetsOptionsFirstPage_SubText ${LANG_FRENCH} "Paramétrage options SSL."
LangString RemoteTargetsOptionsFirstPage_SubText ${LANG_SPANISH} "Establezca opciones de SSL."

; RemoteTargetsOptionsFirstPage_GroupBox1_Text
LangString RemoteTargetsOptionsFirstPage_GroupBox1_Text ${LANG_ENGLISH} "SSL Options"
LangString RemoteTargetsOptionsFirstPage_GroupBox1_Text ${LANG_FRENCH} "Options SSL"
LangString RemoteTargetsOptionsFirstPage_GroupBox1_Text ${LANG_SPANISH} "Opciones SSL"

; RemoteTargetsOptionsFirstPage_Label1_Text
LangString RemoteTargetsOptionsFirstPage_Label1_Text ${LANG_ENGLISH} "Certificates Directory"
LangString RemoteTargetsOptionsFirstPage_Label1_Text ${LANG_FRENCH} "Dossier des Certificats"
LangString RemoteTargetsOptionsFirstPage_Label1_Text ${LANG_SPANISH} "Directorio de Certificados"

; RemoteTargetsOptionsFirstPage_Button1_Text
LangString RemoteTargetsOptionsFirstPage_Button1_Text ${LANG_ENGLISH} "Browser..."
LangString RemoteTargetsOptionsFirstPage_Button1_Text ${LANG_FRENCH} "Parcouris..."
LangString RemoteTargetsOptionsFirstPage_Button1_Text ${LANG_SPANISH} "Examinar..."

; RemoteTargetsOptionsFirstPage_Label2_Text
LangString RemoteTargetsOptionsFirstPage_Label2_Text ${LANG_ENGLISH} "Certificate File"
LangString RemoteTargetsOptionsFirstPage_Label2_Text ${LANG_FRENCH} "Fichier du Certificat"
LangString RemoteTargetsOptionsFirstPage_Label2_Text ${LANG_SPANISH} "Fichero del Certificado"

; RemoteTargetsOptionsFirstPage_Button2_Text
LangString RemoteTargetsOptionsFirstPage_Button2_Text ${LANG_ENGLISH} "Browser..."
LangString RemoteTargetsOptionsFirstPage_Button2_Text ${LANG_FRENCH} "Parcouris..."
LangString RemoteTargetsOptionsFirstPage_Button2_Text ${LANG_SPANISH} "Examinar..."

; RemoteTargetsOptionsFirstPage_Label3_Text
LangString RemoteTargetsOptionsFirstPage_Label3_Text ${LANG_ENGLISH} "Certificate URI"
LangString RemoteTargetsOptionsFirstPage_Label3_Text ${LANG_FRENCH} "URI du Certificat"
LangString RemoteTargetsOptionsFirstPage_Label3_Text ${LANG_SPANISH} "URI del Certificado"

; RemoteTargetsOptionsFirstPage_CheckBox1_Text
LangString RemoteTargetsOptionsFirstPage_CheckBox1_Text ${LANG_ENGLISH} "Disable SSL check (use only for debugging)"
LangString RemoteTargetsOptionsFirstPage_CheckBox1_Text ${LANG_FRENCH} "Désactiver le controle SSL (Utiliser juste pour debugger)"
LangString RemoteTargetsOptionsFirstPage_CheckBox1_Text ${LANG_SPANISH} "Desactivar comprobación SSL (usar solo para depuración)"

; RemoteTargetsOptionsFirstPage_SelectFolderDialog_Title
LangString RemoteTargetsOptionsFirstPage_SelectFolderDialog_Title ${LANG_ENGLISH} "Select the folder where certificates are:"
LangString RemoteTargetsOptionsFirstPage_SelectFolderDialog_Title ${LANG_FRENCH} "Sélectionner le dossier contenant les certificats:"
LangString RemoteTargetsOptionsFirstPage_SelectFolderDialog_Title ${LANG_SPANISH} "Seleccione el directorio donde están los certificados:"

; RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter1
LangString RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter1 ${LANG_ENGLISH} "All Files (*.*)"
LangString RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter1 ${LANG_FRENCH} "Tous les fichiers (*.*)"
LangString RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter1 ${LANG_SPANISH} "Todos (*.*)"

; RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter2
LangString RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter2 ${LANG_ENGLISH} "PEM Certificates (*.pem)"
LangString RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter2 ${LANG_FRENCH} "Certificats PEM(*.pem)"
LangString RemoteTargetsOptionsFirstPage_SelectFileDialog_Filter2 ${LANG_SPANISH} "Certificados PEM (*.pem)"

; RemoteTargetsOptionsFirstPage_TextBox_Warning
LangString RemoteTargetsOptionsFirstPage_TextBox_Warning ${LANG_ENGLISH} "The value $\"$R2$\" is not valid for the field $\"$R1$\"."
LangString RemoteTargetsOptionsFirstPage_TextBox_Warning ${LANG_FRENCH} "La valeur $\"$R2$\" n'est pas valide pour le champ $\"$R1$\"."
LangString RemoteTargetsOptionsFirstPage_TextBox_Warning ${LANG_SPANISH} "El valor $\"$R2$\" no es válido para el campo $\"$R1$\"."


!endif
