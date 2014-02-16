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
   @file       .\FusionInventory Agent\Contrib\ModernUI2\Pages\TargetsPageLangStrings.nsh
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


!ifndef __FIAI_TARGETSPAGE_LANGSTRINGS_INCLUDE__
!define __FIAI_TARGETSPAGE_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

; TargetsPage_Text
LangString TargetsPage_Text ${LANG_ENGLISH} "Choose Targets"
LangString TargetsPage_Text ${LANG_FRENCH} "Choisir la destination"
LangString TargetsPage_Text ${LANG_SPANISH} "Elija destinos"

; TargetsPage_SubText
LangString TargetsPage_SubText ${LANG_ENGLISH} "Choose where the result will send."
LangString TargetsPage_SubText ${LANG_FRENCH} "Choisissez où les résultats seront envoyés."
LangString TargetsPage_SubText ${LANG_SPANISH} "Elija dónde se enviará el resultado."

; TargetsPage_GroupBox1_Text
LangString TargetsPage_GroupBox1_Text ${LANG_ENGLISH} "Remote Targets"
LangString TargetsPage_GroupBox1_Text ${LANG_FRENCH} "Mode Serveurs"
LangString TargetsPage_GroupBox1_Text ${LANG_SPANISH} "Destinos Remotos"

; TargetsPage_Label1_Text
LangString TargetsPage_Label1_Text ${LANG_ENGLISH} "You can indicate multiple URIs by separating them with commas$\r$\n'http://<server>/glpi/plugins/fusioninventory/, http://<server>/ocsinventory/, ...'"
LangString TargetsPage_Label1_Text ${LANG_FRENCH} "Vous pouvez indiquer plusieurs URIs séparés par des vigules$\r$\n'http://<serveur>/glpi/plugins/fusioninventory/, http://<serveur>/ocsinventory/,...'"
LangString TargetsPage_Label1_Text ${LANG_SPANISH} "Puede indicar múltiples URIs separándolos por comas$\r$\n'http://<server>/glpi/plugins/fusioninventory/, http://<server>/ocsinventory/, ...'"

; TargetsPage_CheckBox1_Text
LangString TargetsPage_CheckBox1_Text ${LANG_ENGLISH} "Quick installation (do not show the rest of windows of options)"
LangString TargetsPage_CheckBox1_Text ${LANG_FRENCH} "Installation rapide (N'affiche pas les autres options Windows)"
LangString TargetsPage_CheckBox1_Text ${LANG_SPANISH} "Instalación rápida (no mostrar el resto de ventanas de opciones)"

; TargetsPage_SelectFolderDialog_Title
LangString TargetsPage_SelectFolderDialog_Title ${LANG_ENGLISH} "Select the folder where the result will send:"
LangString TargetsPage_SelectFolderDialog_Title ${LANG_FRENCH} "Sélectionner le dossier destinataire des résultats :"
LangString TargetsPage_SelectFolderDialog_Title ${LANG_SPANISH} "Seleccione el directorio al que se enviará el resultado:"

; TargetsPage_NextButton_Text_Next
LangString TargetsPage_NextButton_Text_Next ${LANG_ENGLISH} "&Next >"
LangString TargetsPage_NextButton_Text_Next ${LANG_FRENCH} "&Suivant >"
LangString TargetsPage_NextButton_Text_Next ${LANG_SPANISH} "&Siguiente >"

; TargetsPage_NextButton_Text_Install
LangString TargetsPage_NextButton_Text_Install ${LANG_ENGLISH} "&Install"
LangString TargetsPage_NextButton_Text_Install ${LANG_FRENCH} "&Installer"
LangString TargetsPage_NextButton_Text_Install ${LANG_SPANISH} "&Instalar"

; TargetsPage_TextBox_Warning
LangString TargetsPage_TextBox_Warning ${LANG_ENGLISH} "The value $\"$R2$\" is not valid for the field $\"$R1$\"."
LangString TargetsPage_TextBox_Warning ${LANG_FRENCH} "La valeur $\"$R2$\" n'est pas valable pour le champ $\"$R1$\"."
LangString TargetsPage_TextBox_Warning ${LANG_SPANISH} "El valor $\"$R2$\" no es válido para el campo $\"$R1$\"."


!endif
