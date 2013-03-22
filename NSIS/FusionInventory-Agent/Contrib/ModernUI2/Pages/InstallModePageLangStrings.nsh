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
   @file      .\FusionInventory Agent\Contrib\Modern UI 2\Pages\InstallModePageLangStrings.nsh
   @author    Tomas Abad <tabadgp@gmail.com>
   @copyright Copyright (c) 2010-2012 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_INSTALLMODEPAGE_LANGSTRINGS_INCLUDE__
!define __FIAI_INSTALLMODEPAGE_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

; hCtl_InstallModePage_Text
LangString hCtl_InstallModePage_Text ${LANG_ENGLISH} "Choose an Installation Mode"
LangString hCtl_InstallModePage_Text ${LANG_FRENCH} "fChoose an Installation Mode"
LangString hCtl_InstallModePage_Text ${LANG_SPANISH} "Elija un Modo de Instalación"

; hCtl_InstallModePage_SubText
LangString hCtl_InstallModePage_SubText ${LANG_ENGLISH} "Choose how you want to install ${PRODUCT_NAME}."
LangString hCtl_InstallModePage_SubText ${LANG_FRENCH} "fChoose how you want to install ${PRODUCT_NAME}."
LangString hCtl_InstallModePage_SubText ${LANG_SPANISH} "Ejija cómo quiere instalar ${PRODUCT_NAME}."

; hCtl_InstallModePage_Label1_Text
LangString hCtl_InstallModePage_Label1_Text ${LANG_ENGLISH} "You have FusionInventory Agent already installed in your computer. In your case, you have the possibility of install this new version of two different modes.$\r$\n$\r$\nYou should decide whether you want to:"
LangString hCtl_InstallModePage_Label1_Text ${LANG_FRENCH} "fYou have FusionInventory Agent already installed in your computer. In your case, you have the possibility of install this new version of two different modes.$\r$\n$\r$\nYou should decide whether you want to:"
LangString hCtl_InstallModePage_Label1_Text ${LANG_SPANISH} "Usted ya tiene FusionInventory Agent instalado en su computador. En su caso, usted tiene la posibilidad de instalar esta nueva version de dos diferentes modos.$\r$\n$\r$\nUsted debería decidir si quiere:"

; hCtl_InstallModePage_RadioButton1
LangString hCtl_InstallModePage_RadioButton1_Text ${LANG_ENGLISH} "Install from scratch"
LangString hCtl_InstallModePage_RadioButton1_Text ${LANG_FRENCH} "fInstall from scratch"
LangString hCtl_InstallModePage_RadioButton1_Text ${LANG_SPANISH} "Instalar desde cero"

; hCtl_InstallModePage_Label2
LangString hCtl_installModePage_Label2_Text ${LANG_ENGLISH} "The new FusionInventory Agent will be installed using options values based on its default values."
LangString hCtl_installModePage_Label2_Text ${LANG_FRENCH} "fThe new FusionInventory Agent will be installed using options values based on its default values."
LangString hCtl_installModePage_Label2_Text ${LANG_SPANISH} "El nuevo FusionInventory Agent será instalado usando valores de opciones basados en sus valores por defecto."

; hCtl_InstallModePage_RadioButton2
LangString hCtl_InstallModePage_RadioButton2_Text ${LANG_ENGLISH} "Install from current configuration"
LangString hCtl_InstallModePage_RadioButton2_Text ${LANG_FRENCH} "fInstall from current configuration"
LangString hCtl_InstallModePage_RadioButton2_Text ${LANG_SPANISH} "Instalar desde la configuración actual"

; hCtl_InstallModePage_Label3
LangString hCtl_InstallModePage_Label3_Text ${LANG_ENGLISH} "The new FusionInventory Agent will be installed using options values based on its current values."
LangString hCtl_InstallModePage_Label3_Text ${LANG_FRENCH} "fThe new FusionInventory Agent will be installed using options values based on its current values."
LangString hCtl_InstallModePage_Label3_Text ${LANG_SPANISH} "El nuevo FusionInventory Agent será instalado usando valores de opciones basados en sus valores actuales."


!endif
