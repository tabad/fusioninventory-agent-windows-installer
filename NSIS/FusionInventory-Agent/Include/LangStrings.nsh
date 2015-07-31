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
   @file       .\FusionInventory Agent\Include\LangStrings.nsh
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


!ifndef __FIAI_LANGSTRINGS_INCLUDE__
!define __FIAI_LANGSTRINGS_INCLUDE__


; Necesario para definir las páginas con multiples idiomas. Los lenguajes se cargan
; con posterioridad a la definición de las páginas y las macros no están definidas.
!define LANG_ENGLISH 1033
!define LANG_FRENCH 1036
!define LANG_SPANISH 1034


;   LangString: InstType_Default
; For use with: InstType
;
LangString InstType_Default ${LANG_ENGLISH} "Default"
LangString InstType_Default ${LANG_FRENCH} "Défaut"
LangString InstType_Default ${LANG_SPANISH} "Por Defecto"

;   LangString: InstType_Full
; For use with: InstType
;
LangString InstType_Full ${LANG_ENGLISH} "Full"
LangString InstType_Full ${LANG_FRENCH} "Complète"
LangString InstType_Full ${LANG_SPANISH} "Completa"

;   LangString: InstType_Minimal
; For use with: InstType
;
LangString InstType_Minimal ${LANG_ENGLISH} "Minimal"
LangString InstType_Minimal ${LANG_FRENCH} "Minimale"
LangString InstType_Minimal ${LANG_SPANISH} "Mínima"

;   LangString: SectionGroup_FusionInventoryAgentTasks
; For use with: SectionGroup SecGrpFusionInventoryAgentTasks
;
LangString SectionGroup_FusionInventoryAgentTasks ${LANG_ENGLISH} "${PRODUCT_NAME}"
LangString SectionGroup_FusionInventoryAgentTasks ${LANG_FRENCH} "${PRODUCT_NAME}"
LangString SectionGroup_FusionInventoryAgentTasks ${LANG_SPANISH} "${PRODUCT_NAME}"

;   LangString: Msg_IncompatibleTargetPlatformArchitecture
; For use with: .onInit
;
LangString Msg_IncompatibleTargetPlatformArchitecture ${LANG_ENGLISH} "It is not possible to install $(^Name) \
in a Microsoft Windows operative system over a ${PLATFORM_ARCHITECTURE_32} platform architecture."
LangString Msg_IncompatibleTargetPlatformArchitecture ${LANG_FRENCH} "Ce n'est pas possible d'installer $(^Name) \
sur un système Microsoft Windows ayant une architecture ${PLATFORM_ARCHITECTURE_32}."
LangString Msg_IncompatibleTargetPlatformArchitecture ${LANG_SPANISH} "No es posible instalar $(^Name) \
en un sistema operativo Microsoft Windows sobre una plataforma de arquitectura ${PLATFORM_ARCHITECTURE_32}."

;   LangString: Msg_InstallingSection
; For use with: Sections SecDeploy, SecESX, SecInventory, SecNetwork and SecWakeOnLan. 
;
LangString Msg_InstallingSection ${LANG_ENGLISH} "Installing Section $0..."
LangString Msg_InstallingSection ${LANG_FRENCH} "Installation de la section $0..."
LangString Msg_InstallingSection ${LANG_SPANISH} "Instalando Sección $0..."

;   LangString: SecDeploy_Description
; For use with: XPUI_DESCRIPTION_TEXT ${SecDeploy}
;
LangString SecDeploy_Description ${LANG_ENGLISH} "Task Deploy ${FIA_TASK_DEPLOY_RELEASE}."
LangString SecDeploy_Description ${LANG_FRENCH} "Tâche Déploiement ${FIA_TASK_DEPLOY_RELEASE}."
LangString SecDeploy_Description ${LANG_SPANISH} "Tarea Deploy ${FIA_TASK_DEPLOY_RELEASE}."

;   LangString: SecESX_Description
; For use with: XPUI_DESCRIPTION_TEXT ${SecESX}
;
LangString SecESX_Description ${LANG_ENGLISH} "Task ESX ${FIA_TASK_ESX_RELEASE}."
LangString SecESX_Description ${LANG_FRENCH} "Tâche ESX ${FIA_TASK_ESX_RELEASE}."
LangString SecESX_Description ${LANG_SPANISH} "Tarea ESX ${FIA_TASK_ESX_RELEASE}."

;   LangString: SecInventory_Description
; For use with: XPUI_DESCRIPTION_TEXT ${SecInventory}
;
LangString SecInventory_Description ${LANG_ENGLISH} "Task Inventory ${FIA_TASK_INVENTORY_RELEASE}."
LangString SecInventory_Description ${LANG_FRENCH} "Tâche Inventaire ${FIA_TASK_INVENTORY_RELEASE}."
LangString SecInventory_Description ${LANG_SPANISH} "Tarea Inventory ${FIA_TASK_INVENTORY_RELEASE}."

;   LangString: SecNeDiscovery_Description
; For use with: XPUI_DESCRIPTION_TEXT ${SecNetDiscovery}
;
LangString SecNetDiscovery_Description ${LANG_ENGLISH} "Task NetDiscovery ${FIA_TASK_NETDISCOVERY_RELEASE}."
LangString SecNetDiscovery_Description ${LANG_FRENCH} "Tâche NetDiscovery ${FIA_TASK_NETDISCOVERY_RELEASE}."
LangString SecNetDiscovery_Description ${LANG_SPANISH} "Tarea NetDiscovery ${FIA_TASK_NETDISCOVERY_RELEASE}."

;   LangString: SecNetInventory
; For use with: XPUI_DESCRIPTION_TEXT ${SecNetInventory}
;
LangString SecNetInventory_Description ${LANG_ENGLISH} "Task NetInventory ${FIA_TASK_NETINVENTORY_RELEASE}."
LangString SecNetInventory_Description ${LANG_FRENCH} "Tâche NetInventory ${FIA_TASK_NETINVENTORY_RELEASE}."
LangString SecNetInventory_Description ${LANG_SPANISH} "Tarea NetInventory ${FIA_TASK_NETINVENTORY_RELEASE}."

;   LangString: SecWakeOnLan_Description
; For use with: XPUI_DESCRIPTION_TEXT ${SecWakeOnLan}
;
LangString SecWakeOnLan_Description ${LANG_ENGLISH} "Task WakeOnLan ${FIA_TASK_WAKEONLAN_RELEASE}."
LangString SecWakeOnLan_Description ${LANG_FRENCH} "Tâche WakeOnLan ${FIA_TASK_WAKEONLAN_RELEASE}."
LangString SecWakeOnLan_Description ${LANG_SPANISH} "Tarea WakeOnLan ${FIA_TASK_WAKEONLAN_RELEASE}."

;   LangString: SecCollect_Description
; For use with: XPUI_DESCRIPTION_TEXT ${SecCollect}
;
LangString SecCollect_Description ${LANG_ENGLISH} "Task Collect ${FIA_TASK_COLLECT_RELEASE}."
LangString SecCollect_Description ${LANG_FRENCH} "Tâche Collect ${FIA_TASK_COLLECT_RELEASE}."
LangString SecCollect_Description ${LANG_SPANISH} "Tarea Collect ${FIA_TASK_COLLECT_RELEASE}."

!endif
