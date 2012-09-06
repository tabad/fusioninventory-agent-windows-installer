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
   @file      .\FusionInventory Agent\Include\WinServicesFunc.nsh
   @author    Tomas Abad
   @copyright Copyright (c) 2010-2012 FusionInventory Team
   @license   [...]
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_WINSERVICESFUNC_INCLUDE__
!define __FIAI_WINSERVICESFUNC_INCLUDE__


!include LogicLib.nsh
!include "${FIAI_DIR}\Include\INIFunc.nsh"
!include "${FIAI_DIR}\Include\WinServicesFuncLangStrings.nsh"


; Define timeout (in seconds) for Start, Stop, Pause, Continue and Restart operations
!define SERVICE_CHANGE_STATE_TIMEOUT 90


; IsFusionInoventoryServiceInstalled
!define IsFusionInventoryServiceInstalled "!insertmacro IsFusionInventoryServiceInstalled"

!macro IsFusionInventoryServiceInstalled ResultVar
   SimpleSC::ExistsService "${PRODUCT_INTERNAL_NAME}"
   Pop ${ResultVar}
   ${If} ${ResultVar} = 0
      Nop
   ${Else}
      StrCpy ${ResultVar} 1
   ${EndIf}
!macroend


; GetFusionInventoryServiceStartType
!define GetFusionInventoryServiceStartType "!insertmacro GetFusionInventoryServiceStartType"

!macro GetFusionInventoryServiceStartType ResultVar
   Push $R0
   SimpleSC::GetServiceStartType "${PRODUCT_INTERNAL_NAME}"
   Pop $R0
   Pop ${ResultVar}
   ${If} $R0 = 0
      Nop
   ${Else}
      StrCpy ${ResultVar} ""
   ${EndIf}
   Pop $R0
!macroend


; GetFusionInventoryServiceStatus
!define GetFusionInventoryServiceStatus "!insertmacro GetFusionInventoryServiceStatus"

!macro GetFusionInventoryServiceStatus ResultVar
   Push $R0
   SimpleSC::GetServiceStatus "${PRODUCT_INTERNAL_NAME}"
   Pop $R0
   Pop ${ResultVar}
   ${If} $R0 = 0
      Nop
   ${Else}
      StrCpy ${ResultVar} ""
   ${EndIf}
   Pop $R0
!macroend


; InstallFusionInventoryService
!define InstallFusionInventoryService "Call InstallFusionInventoryService"

Function InstallFusionInventoryService
   ; $R0 Section from which to read
   ; $R1 Install directory
   ; $R2 Service status / start type
   ; $R3 Return code

   ; Push $R0, $R1, $R2 & $R3 onto the stack
   Push $R0
   Push $R1
   Push $R2
   Push $R3

   ; Set the section from which to read
   StrCpy $R0 "${IOS_FINAL}"

   ; Get install directory
   ${ReadINIOption} $R1 "$R0" "${IO_INSTALLDIR}"

   ; Install the service
   SimpleSC::InstallService \
      "${PRODUCT_INTERNAL_NAME}" "${PRODUCT_NAME}" "16" "${SERVICE_STARTTYPE_DEMAND}" \
      `"$R1\perl\bin\perl.exe" -I"$R1\perl\agent" -I"$R1\perl\lib" "$R1\perl\bin\fusioninventory-win32-service"` \
      "" "" ""
   Pop $R3

   ; Set service description
   SimpleSC::SetServiceDescription "${PRODUCT_INTERNAL_NAME}" "$(InstallFusionInventoryService_Description)"
   Pop $R3

   ; Set service status
   ${ReadINIOption} $R2 "$R0" "${IO_SERVICE-STATUS}"
   ${If} $R2 = ${SERVICE_STATUS_RUNNING}
   ${OrIf} $R2 = ${SERVICE_STATUS_START_PENDING}
   ${OrIf} $R2 = ${SERVICE_STATUS_CONTINUE_PENDING}
      ; Start service
      SimpleSC::StartService "${PRODUCT_INTERNAL_NAME}" "" "${SERVICE_CHANGE_STATE_TIMEOUT}"
      Pop $R3
   ${ElseIf} $R2 = ${SERVICE_STATUS_STOPPED}
   ${OrIf} $R2 = ${SERVICE_STATUS_STOP_PENDING}
   ${OrIf} $R2 = ${SERVICE_STATUS_PAUSED}
   ${OrIf} $R2 = ${SERVICE_STATUS_PAUSE_PENDING}
      ; Stop service
      SimpleSC::StopService "${PRODUCT_INTERNAL_NAME}" "1" "${SERVICE_CHANGE_STATE_TIMEOUT}"
      Pop $R3
   ${EndIf}

   ; Set service start type
   ${ReadINIOption} $R2 "$R0" "${IO_SERVICE-START-TYPE}"
   SimpleSC::SetServiceStartType "${PRODUCT_INTERNAL_NAME}" "$R2"
   Pop $R3

   ; Pop $R3, $R2, $R1 & $R0 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


; RemoveFusionInventoryService
!define RemoveFusionInventoryService "!insertmacro RemoveFusionInventoryService"

!macro RemoveFusionInventoryService
   ; Push $R0 onto the stack
   Push $R0

   ; Check if the service exist
   SimpleSC::ExistsService "${PRODUCT_INTERNAL_NAME}"
   Pop $R0

   ${If} $R0 = 0
      ; The service exists
      ; Stop service
      SimpleSC::StopService "${PRODUCT_INTERNAL_NAME}" "1" "${SERVICE_CHANGE_STATE_TIMEOUT}"
      Pop $R0

      ; Disable service
      SimpleSC::SetServiceStartType "${PRODUCT_INTERNAL_NAME}" "${SERVICE_STARTTYPE_DISABLED}"
      Pop $R0

      ; Remove service
      SimpleSC::RemoveService "${PRODUCT_INTERNAL_NAME}"
      Pop $R0
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
!macroend


!endif
