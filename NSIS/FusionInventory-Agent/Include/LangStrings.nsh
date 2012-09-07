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
   @file      .\FusionInventory Agent\Include\LangStrings.nsh
   @author    Tomas Abad
   @copyright Copyright (c) 2010-2012 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_LANGSTRINGS_INCLUDE__
!define __FIAI_LANGSTRINGS_INCLUDE__


; Necesario para definir las páginas con multiples idiomas. Los lenguajes se cargan
; con posterioridad a la definición de las páginas y las macros no están definidas.
!define LANG_ENGLISH 1033
!define LANG_FRENCH 1036
!define LANG_SPANISH 1034


;   LangString: InitIniFile_GlobalOptions_Field_1
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_1 ${LANG_ENGLISH} "Inventory Destination"
LangString InitIniFile_GlobalOptions_Field_1 ${LANG_FRENCH} "fInventory Destination"
LangString InitIniFile_GlobalOptions_Field_1 ${LANG_SPANISH} "Destino del Inventario"

;   LangString: InitIniFile_GlobalOptions_Field_2
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_2 ${LANG_ENGLISH} "Local directory"
LangString InitIniFile_GlobalOptions_Field_2 ${LANG_FRENCH} "fLocal directory"
LangString InitIniFile_GlobalOptions_Field_2 ${LANG_SPANISH} "Directorio local"

;   LangString: InitIniFile_GlobalOptions_Field_4
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_4 ${LANG_ENGLISH} "Remote server"
LangString InitIniFile_GlobalOptions_Field_4 ${LANG_FRENCH} "fRemote server"
LangString InitIniFile_GlobalOptions_Field_4 ${LANG_SPANISH} "Servidor remoto"

;   LangString: InitIniFile_GlobalOptions_Field_6
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_6 ${LANG_ENGLISH} "Multiple values can be specified, using comma as a separator"
LangString InitIniFile_GlobalOptions_Field_6 ${LANG_FRENCH} "fMultiple values can be specified, using comma as a separator"
LangString InitIniFile_GlobalOptions_Field_6 ${LANG_SPANISH} "Múltiples valores pueden ser especificados, usando la coma como separador"

;   LangString: InitIniFile_GlobalOptions_Field_7
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_7 ${LANG_ENGLISH} "Log Options"
LangString InitIniFile_GlobalOptions_Field_7 ${LANG_FRENCH} "fLog Options"
LangString InitIniFile_GlobalOptions_Field_7 ${LANG_SPANISH} "Opciones de Registro"

;   LangString: InitIniFile_GlobalOptions_Field_8
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_8 ${LANG_ENGLISH} "Debug mode"
LangString InitIniFile_GlobalOptions_Field_8 ${LANG_FRENCH} "fDebug mode"
LangString InitIniFile_GlobalOptions_Field_8 ${LANG_SPANISH} "Modo de depuración"

;   LangString: InitIniFile_GlobalOptions_Field_9
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_9 ${LANG_ENGLISH} "Max logfile size:"
LangString InitIniFile_GlobalOptions_Field_9 ${LANG_FRENCH} "fMax logfile size:"
LangString InitIniFile_GlobalOptions_Field_9 ${LANG_SPANISH} "Max. fich. reg.:"

;   LangString: InitIniFile_GlobalOptions_Field_12
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_12 ${LANG_ENGLISH} "Logfile:"
LangString InitIniFile_GlobalOptions_Field_12 ${LANG_FRENCH} "fLogfile:"
LangString InitIniFile_GlobalOptions_Field_12 ${LANG_SPANISH} "Fichero de registro:"

;   LangString: InitIniFile_GlobalOptions_Field_14
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_14 ${LANG_ENGLISH} "Logger Backend"
LangString InitIniFile_GlobalOptions_Field_14 ${LANG_FRENCH} "fLogger Backend"
LangString InitIniFile_GlobalOptions_Field_14 ${LANG_SPANISH} "Registros"

;   LangString: InitIniFile_GlobalOptions_Field_15
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_15 ${LANG_ENGLISH} "File"
LangString InitIniFile_GlobalOptions_Field_15 ${LANG_FRENCH} "fFile"
LangString InitIniFile_GlobalOptions_Field_15 ${LANG_SPANISH} "Fichero"

;   LangString: InitIniFile_GlobalOptions_Field_16
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_16 ${LANG_ENGLISH} "Console"
LangString InitIniFile_GlobalOptions_Field_16 ${LANG_FRENCH} "fConsole"
LangString InitIniFile_GlobalOptions_Field_16 ${LANG_SPANISH} "Pantalla"

;   LangString: InitIniFile_GlobalOptions_Field_17
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_17 ${LANG_ENGLISH} "Both"
LangString InitIniFile_GlobalOptions_Field_17 ${LANG_FRENCH} "fBoth"
LangString InitIniFile_GlobalOptions_Field_17 ${LANG_SPANISH} "Ambos"

;   LangString: InitIniFile_GlobalOptions_Field_18
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_18 ${LANG_ENGLISH} "Advanced Options"
LangString InitIniFile_GlobalOptions_Field_18 ${LANG_FRENCH} "fAdvanced Options"
LangString InitIniFile_GlobalOptions_Field_18 ${LANG_SPANISH} "Opciones Avanzadas"

;   LangString: InitIniFile_GlobalOptions_Field_19
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_19 ${LANG_ENGLISH} "Tag:"
LangString InitIniFile_GlobalOptions_Field_19 ${LANG_FRENCH} "fTag:"
LangString InitIniFile_GlobalOptions_Field_19 ${LANG_SPANISH} "Etiqueta:"

;   LangString: InitIniFile_GlobalOptions_Field_21
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_21 ${LANG_ENGLISH} "Show more specific options later"
LangString InitIniFile_GlobalOptions_Field_21 ${LANG_FRENCH} "fShow more specific options later"
LangString InitIniFile_GlobalOptions_Field_21 ${LANG_SPANISH} "Mostrar opciones más específicas adelante"

;   LangString: InitIniFile_GlobalOptions_Field_22
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_22 ${LANG_ENGLISH} "Scan home directories for virtual machines"
LangString InitIniFile_GlobalOptions_Field_22 ${LANG_FRENCH} "fScan home directories for virtual machines"
LangString InitIniFile_GlobalOptions_Field_22 ${LANG_SPANISH} "Buscar máquinas virtuales en dir. de usuario"

;   LangString: InitIniFile_GlobalOptions_Field_23
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_23 ${LANG_ENGLISH} "Categories to Inventory"
LangString InitIniFile_GlobalOptions_Field_23 ${LANG_FRENCH} "fCategories to Inventory"
LangString InitIniFile_GlobalOptions_Field_23 ${LANG_SPANISH} "Categorías a Inventariar"

;   LangString: InitIniFile_GlobalOptions_Field_24
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_GlobalOptions
;
LangString InitIniFile_GlobalOptions_Field_24 ${LANG_ENGLISH} "Printer"
LangString InitIniFile_GlobalOptions_Field_24 ${LANG_FRENCH} "fPrinter"
LangString InitIniFile_GlobalOptions_Field_24 ${LANG_SPANISH} "Impresora"

;   LangString: GlobalOptionsPage_Title
; For use with: XPUI_HEADER_TEXT in function GlobalOptions
;
LangString GlobalOptionsPage_Title ${LANG_ENGLISH} "Global Options"
LangString GlobalOptionsPage_Title ${LANG_FRENCH} "fGlobal Options"
LangString GlobalOptionsPage_Title ${LANG_SPANISH} "Opciones Generales"

;   LangString: GlobalOptionsPage_SubTitle
; For use with: XPUI_HEADER_TEXT in function GlobalOptions
;
LangString GlobalOptionsPage_SubTitle ${LANG_ENGLISH} "Define global options"
LangString GlobalOptionsPage_SubTitle ${LANG_FRENCH} "fDefine global options"
LangString GlobalOptionsPage_SubTitle ${LANG_SPANISH} "Defina opciones generales"

;   LangString: InitIniFile_SpecificOptions_Field_1
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_SpecificOptions
;
LangString InitIniFile_SpecificOptions_Field_1 ${LANG_ENGLISH} "Target Scheduling"
LangString InitIniFile_SpecificOptions_Field_1 ${LANG_FRENCH} "fTarget Scheduling"
LangString InitIniFile_SpecificOptions_Field_1 ${LANG_SPANISH} "Planificacion de Objetivos"

;   LangString: InitIniFile_SpecificOptions_Field_2
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_SpecificOptions
;
LangString InitIniFile_SpecificOptions_Field_2 ${LANG_ENGLISH} "Maximum initial delay before first target:"
LangString InitIniFile_SpecificOptions_Field_2 ${LANG_FRENCH} "fMaximum initial delay before first target:"
LangString InitIniFile_SpecificOptions_Field_2 ${LANG_SPANISH} "Máximo retardo inicial antes del primer objetivo:"

;   LangString: InitIniFile_SpecificOptions_Field_4
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_SpecificOptions
;
LangString InitIniFile_SpecificOptions_Field_4 ${LANG_ENGLISH} "seconds"
LangString InitIniFile_SpecificOptions_Field_4 ${LANG_FRENCH} "fseconds"
LangString InitIniFile_SpecificOptions_Field_4 ${LANG_SPANISH} "segundos"

;   LangString: InitIniFile_SpecificOptions_Field_5
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_SpecificOptions
;
LangString InitIniFile_SpecificOptions_Field_5 ${LANG_ENGLISH} "Time to wait between targets:"
LangString InitIniFile_SpecificOptions_Field_5 ${LANG_FRENCH} "fTime to wait between targets:"
LangString InitIniFile_SpecificOptions_Field_5 ${LANG_SPANISH} "Tiempo de espera entre objetivos"

;   LangString: InitIniFile_SpecificOptions_Field_7
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_SpecificOptions
;
LangString InitIniFile_SpecificOptions_Field_7 ${LANG_ENGLISH} "seconds"
LangString InitIniFile_SpecificOptions_Field_7 ${LANG_FRENCH} "fseconds"
LangString InitIniFile_SpecificOptions_Field_7 ${LANG_SPANISH} "segundos"

;   LangString: InitIniFile_SpecificOptions_Field_8
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_SpecificOptions
;
LangString InitIniFile_SpecificOptions_Field_8 ${LANG_ENGLISH} "Inventory Task"
LangString InitIniFile_SpecificOptions_Field_8 ${LANG_FRENCH} "fInventory Task"
LangString InitIniFile_SpecificOptions_Field_8 ${LANG_SPANISH} "Tarea de Inventario"

;   LangString: InitIniFile_SpecificOptions_Field_9
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_SpecificOptions
;
LangString InitIniFile_SpecificOptions_Field_9 ${LANG_ENGLISH} "Timeout for inventory modules execution:"
LangString InitIniFile_SpecificOptions_Field_9 ${LANG_FRENCH} "fTimeout for inventory modules execution:"
LangString InitIniFile_SpecificOptions_Field_9 ${LANG_SPANISH} "Límite para la ejecución de módulos de inventario:"

;   LangString: InitIniFile_SpecificOptions_Field_11
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_SpecificOptions
;
LangString InitIniFile_SpecificOptions_Field_11 ${LANG_ENGLISH} "seconds"
LangString InitIniFile_SpecificOptions_Field_11 ${LANG_FRENCH} "fseconds"
LangString InitIniFile_SpecificOptions_Field_11 ${LANG_SPANISH} "segundos"

;   LangString: InitIniFile_SpecificOptions_Field_12
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_SpecificOptions
;
LangString InitIniFile_SpecificOptions_Field_12 ${LANG_ENGLISH} "Deploy Task"
LangString InitIniFile_SpecificOptions_Field_12 ${LANG_FRENCH} "fDeploy Task"
LangString InitIniFile_SpecificOptions_Field_12 ${LANG_SPANISH} "Tarea de Despliegue"

;   LangString: InitIniFile_SpecificOptions_Field_13
; For use with: XPUI_INSTALLOPTIONS_WRITE in function InitIniFile_SpecificOptions
;
LangString InitIniFile_SpecificOptions_Field_13 ${LANG_ENGLISH} "Do not use peer to peer protocol to download files"
LangString InitIniFile_SpecificOptions_Field_13 ${LANG_FRENCH} "fDo not use peer to peer protocol to download files"
LangString InitIniFile_SpecificOptions_Field_13 ${LANG_SPANISH} "No user protocolo igual a igual para descargar ficheros"

;   LangString: SpecificOptionsPage_Title
; For use with: XPUI_HEADER_TEXT in function SpecificOptions
;
LangString SpecificOptionsPage_Title ${LANG_ENGLISH} "Specific Options"
LangString SpecificOptionsPage_Title ${LANG_FRENCH} "fSpecific Options"
LangString SpecificOptionsPage_Title ${LANG_SPANISH} "Opciones Específicas"

;   LangString: SpecificOptionsPage_SubTitle
; For use with: XPUI_HEADER_TEXT in function SpecificOptions
;
LangString SpecificOptionsPage_SubTitle ${LANG_ENGLISH} "Define specific options"
LangString SpecificOptionsPage_SubTitle ${LANG_FRENCH} "fDefine specific options"
LangString SpecificOptionsPage_SubTitle ${LANG_SPANISH} "Defina opciones específicas"

;   LangString: NetworkOptionsPage_Title
; For use with: XPUI_HEADER_TEXT in function NetworkOptions
;
LangString NetworkOptionsPage_Title ${LANG_ENGLISH} "Network Options"
LangString NetworkOptionsPage_Title ${LANG_FRENCH} "fNetwork Options"
LangString NetworkOptionsPage_Title ${LANG_SPANISH} "Opciones de Red"

;   LangString: NetworkOptionsPage_SubTitle
; For use with: XPUI_HEADER_TEXT in function NetworkOptions
;
LangString NetworkOptionsPage_SubTitle ${LANG_ENGLISH} "Define network options"
LangString NetworkOptionsPage_SubTitle ${LANG_FRENCH} "fDefine network options"
LangString NetworkOptionsPage_SubTitle ${LANG_SPANISH} "Defina opciones de red"

;   LangString: ExecModeOptionsPage_Title
; For use with: XPUI_HEADER_TEXT in function ExecModeOptions
;
LangString ExecModeOptionsPage_Title ${LANG_ENGLISH} "Exec Mode Options"
LangString ExecModeOptionsPage_Title ${LANG_FRENCH} "fExec Mode Options"
LangString ExecModeOptionsPage_Title ${LANG_SPANISH} "Opciones de Ejecución"

;   LangString: ExecModeOptionsPage_SubTitle
; For use with: XPUI_HEADER_TEXT in function ExecModeOptions
;
LangString ExecModeOptionsPage_SubTitle ${LANG_ENGLISH} "Define execution mode"
LangString ExecModeOptionsPage_SubTitle ${LANG_FRENCH} "fDefine execution mode"
LangString ExecModeOptionsPage_SubTitle ${LANG_SPANISH} "Defina el modo de ejecución"

;   LangString: InstType_Default
; For use with: InstType
;
LangString InstType_Default ${LANG_ENGLISH} "Default"
LangString InstType_Default ${LANG_FRENCH} "fDefault"
LangString InstType_Default ${LANG_SPANISH} "Por Defecto"

;   LangString: InstType_Full
; For use with: InstType
;
LangString InstType_Full ${LANG_ENGLISH} "Full"
LangString InstType_Full ${LANG_FRENCH} "fFull"
LangString InstType_Full ${LANG_SPANISH} "Completa"

;   LangString: InstType_Minimal
; For use with: InstType
;
LangString InstType_Minimal ${LANG_ENGLISH} "Minimal"
LangString InstType_Minimal ${LANG_FRENCH} "fMinimal"
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
in a Microsoft Windows operative system over a ${LABEL_PLATFORM_ARCHITECTURE_32} platform architecture."
LangString Msg_IncompatibleTargetPlatformArchitecture ${LANG_FRENCH} "fIt is not possible to install $(^Name) \
in a Microsoft Windows operative system over a ${LABEL_PLATFORM_ARCHITECTURE_32} platform architecture."
LangString Msg_IncompatibleTargetPlatformArchitecture ${LANG_SPANISH} "No es posible instalar $(^Name) \
en un sistema operativo Microsoft Windows sobre una plataforma de arquitectura ${LABEL_PLATFORM_ARCHITECTURE_32}."

;   LangString: Msg_InstallingSection
; For use with: Sections SecInventory&WakeOnLan, SecDeploy, SecESX,
;               and SecNetwork
;
LangString Msg_InstallingSection ${LANG_ENGLISH} "Installing Section $0..."
LangString Msg_InstallingSection ${LANG_FRENCH} "fInstalling Section $0..."
LangString Msg_InstallingSection ${LANG_SPANISH} "Instalando Sección $0..."

;   LangString: SecInventory&WakeOnLan_Description
; For use with: XPUI_DESCRIPTION_TEXT ${SecInventory&WakeOnLan}
;
LangString SecInventory&WakeOnLan_Description ${LANG_ENGLISH} "Tasks Inventory ${FIA_TASK_INVENTORY_RELEASE} \
and WakeOnLan ${FIA_TASK_WAKEONLAN_RELEASE}."
LangString SecInventory&WakeOnLan_Description ${LANG_FRENCH} "fTasks Inventory ${FIA_TASK_INVENTORY_RELEASE} \
and WakeOnLan ${FIA_TASK_WAKEONLAN_RELEASE}."
LangString SecInventory&WakeOnLan_Description ${LANG_SPANISH} "Tareas Inventory ${FIA_TASK_INVENTORY_RELEASE} \
y WakeOnLan ${FIA_TASK_WAKEONLAN_RELEASE}."

;   LangString: SecDeploy_Description
; For use with: XPUI_DESCRIPTION_TEXT ${SecDeploy}
;
LangString SecDeploy_Description ${LANG_ENGLISH} "Task Deploy ${FIA_TASK_DEPLOY_RELEASE}."
LangString SecDeploy_Description ${LANG_FRENCH} "fTask Deploy ${FIA_TASK_DEPLOY_RELEASE}."
LangString SecDeploy_Description ${LANG_SPANISH} "Tarea Deploy ${FIA_TASK_DEPLOY_RELEASE}."

;   LangString: SecESX_Description
; For use with: XPUI_DESCRIPTION_TEXT ${SecESX}
;
LangString SecESX_Description ${LANG_ENGLISH} "Task ESX ${FIA_TASK_ESX_RELEASE}."
LangString SecESX_Description ${LANG_FRENCH} "fTask ESX ${FIA_TASK_ESX_RELEASE}."
LangString SecESX_Description ${LANG_SPANISH} "Tarea ESX ${FIA_TASK_ESX_RELEASE}."

;   LangString: SecNetwork_Description
; For use with: XPUI_DESCRIPTION_TEXT ${SecNetwork}
;
LangString SecNetwork_Description ${LANG_ENGLISH} "Distribution Network ${FIA_TASK_NETWORK_RELEASE}. \
Includes tasks NetDiscovery ${FIA_TASK_NETDISCOVERY_RELEASE} and NetInventory ${FIA_TASK_NETINVENTORY_RELEASE}."
LangString SecNetwork_Description ${LANG_FRENCH} "fDistribution Network ${FIA_TASK_NETWORK_RELEASE}. \
Includes tasks NetDiscovery ${FIA_TASK_NETDISCOVERY_RELEASE} and NetInventory ${FIA_TASK_NETINVENTORY_RELEASE}."
LangString SecNetwork_Description ${LANG_SPANISH} "Distribución Network ${FIA_TASK_NETWORK_RELEASE}. \
Incluye tareas NetDiscovery ${FIA_TASK_NETDISCOVERY_RELEASE} y NetInventory ${FIA_TASK_NETINVENTORY_RELEASE}."


!endif
