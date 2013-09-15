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
   @file       .\FusionInventory Agent\Include\PadLockLangStrings.nsh
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


!ifndef __FIAI_PADLOCK_LANGSTRINGS_INCLUDE__
!define __FIAI_PADLOCK_LANGSTRINGS_INCLUDE__


;--------------------------------
; LangString Variables

;   LangString: ClosePadLock_Text
; For use with: MessageBox in function ClosePadLock
;
LangString ClosePadLock_Text ${LANG_ENGLISH} \
"Another installation or uninstallation process of ${PRODUCT_NAME} ${PRODUCT_VERSION} is already running."
LangString ClosePadLock_Text ${LANG_FRENCH} \
"Un autre processus d'installation ou désinstallation de ${PRODUCT_NAME} ${PRODUCT_VERSION} est encours."
LangString ClosePadLock_Text ${LANG_SPANISH} \
"Otro proceso de instalación o desinstalación de ${PRODUCT_NAME} ${PRODUCT_VERSION} está ya en ejecución."


!endif
