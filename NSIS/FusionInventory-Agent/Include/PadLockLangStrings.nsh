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
   @file      .\FusionInventory Agent\Include\PadLockLangStrings.nsh
   @author    Tomas Abad
   @copyright Copyright (c) 2010-2012 FusionInventory Team
   @license   [...]
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

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
"fAnother installation or uninstallation process of ${PRODUCT_NAME} ${PRODUCT_VERSION} is already running."
LangString ClosePadLock_Text ${LANG_SPANISH} \
"Otro proceso de instalación o desinstalación de ${PRODUCT_NAME} ${PRODUCT_VERSION} está ya en ejecución."


!endif

