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
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\TargetsPageLangStrings.nsh
   @author    Tomas Abad <tabadgp@gmail.com>
   @copyright Copyright (c) 2010-2013 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_TARGETSPAGE_LANGSTRINGS_INCLUDE__
!define __FIAI_TARGETSPAGE_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

; hCtl_TargetsPage_Text
LangString hCtl_TargetsPage_Text ${LANG_ENGLISH} "Choose Targets"
LangString hCtl_TargetsPage_Text ${LANG_FRENCH} "fChoose Targets"
LangString hCtl_TargetsPage_Text ${LANG_SPANISH} "Elija destinos"

; hCtl_TargetsPage_SubText
LangString hCtl_TargetsPage_SubText ${LANG_ENGLISH} "Choose where the result will send."
LangString hCtl_TargetsPage_SubText ${LANG_FRENCH} "fChoose where the result will send."
LangString hCtl_TargetsPage_SubText ${LANG_SPANISH} "Elija dónde se enviará el resultado."

; hCtl_TargetsPage_GroupBox1_Text
LangString hCtl_TargetsPage_GroupBox1_Text ${LANG_ENGLISH} "Local Target"
LangString hCtl_TargetsPage_GroupBox1_Text ${LANG_FRENCH} "fLocal Target"
LangString hCtl_TargetsPage_GroupBox1_Text ${LANG_SPANISH} "Destino Local"

; hCtl_TargetsPage_Button1_Text
LangString hCtl_TargetsPage_Button1_Text ${LANG_ENGLISH} "Browser..."
LangString hCtl_TargetsPage_Button1_Text ${LANG_FRENCH} "fBrowser..."
LangString hCtl_TargetsPage_Button1_Text ${LANG_SPANISH} "Examinar..."

; hCtl_TargetsPage_Label1_Text
LangString hCtl_TargetsPage_Label1_Text ${LANG_ENGLISH} "Local path or UNC path"
LangString hCtl_TargetsPage_Label1_Text ${LANG_FRENCH} "fLocal path or UNC path"
LangString hCtl_TargetsPage_Label1_Text ${LANG_SPANISH} "Directorio local o ruta UNC"

; hCtl_TargetsPage_GroupBox2_Text
LangString hCtl_TargetsPage_GroupBox2_Text ${LANG_ENGLISH} "Remote Targets"
LangString hCtl_TargetsPage_GroupBox2_Text ${LANG_FRENCH} "fRemote Targets"
LangString hCtl_TargetsPage_GroupBox2_Text ${LANG_SPANISH} "Destinos Remotos"

; hCtl_TargetsPage_Label2_Text
LangString hCtl_TargetsPage_Label2_Text ${LANG_ENGLISH} "You can indicate multiple URIs by separating them with commas$\r$\n'http://<server>/glpi/plugins/fusioninventory, http://<server>/ocsinventory, ...'"
LangString hCtl_TargetsPage_Label2_Text ${LANG_FRENCH} "fYou can indicate multiple URIs by separating them with commas$\r$\n'http://<server>/glpi/plugins/fusioninventory, ...'"
LangString hCtl_TargetsPage_Label2_Text ${LANG_SPANISH} "Puede indicar múltiples URIs separándolos por comas$\r$\n'http://<server>/glpi/plugins/fusioninventory, http://<server>/ocsinventory, ...'"

; hCtl_TargetsPage_CheckBox1_Text
LangString hCtl_TargetsPage_CheckBox1_Text ${LANG_ENGLISH} "Quick installation (do not show the rest of windows of options)"
LangString hCtl_TargetsPage_CheckBox1_Text ${LANG_FRENCH} "fQuick installation (do not show the rest of windows of options)"
LangString hCtl_TargetsPage_CheckBox1_Text ${LANG_SPANISH} "Instalación rápida (no mostrar el resto de ventanas de opciones)"

; hCtl_TargetsPage_SelectFolderDialog_Title
LangString hCtl_TargetsPage_SelectFolderDialog_Title ${LANG_ENGLISH} "Select the folder where the result will send:"
LangString hCtl_TargetsPage_SelectFolderDialog_Title ${LANG_FRENCH} "fSelect the folder where the result will send:"
LangString hCtl_TargetsPage_SelectFolderDialog_Title ${LANG_SPANISH} "Seleccione el directorio al que se enviará el resultado:"

; hCtl_TargetsPage_NextButton_Text_Next
LangString hCtl_TargetsPage_NextButton_Text_Next ${LANG_ENGLISH} "&Next >"
LangString hCtl_TargetsPage_NextButton_Text_Next ${LANG_FRENCH} "&Suivant >"
LangString hCtl_TargetsPage_NextButton_Text_Next ${LANG_SPANISH} "&Siguiente >"

; hCtl_TargetsPage_NextButton_Text_Install
LangString hCtl_TargetsPage_NextButton_Text_Install ${LANG_ENGLISH} "&Install"
LangString hCtl_TargetsPage_NextButton_Text_Install ${LANG_FRENCH} "&Installer"
LangString hCtl_TargetsPage_NextButton_Text_Install ${LANG_SPANISH} "&Instalar"


!endif
