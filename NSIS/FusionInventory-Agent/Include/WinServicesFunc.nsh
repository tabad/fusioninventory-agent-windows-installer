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
!include "${FIAIDIR}\Include\INIFunc.nsh"


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


; InstallFusionInventoryService
!define InstallFussionInventoryService "Call InstallFusionInventoryService"

Function InstallFusionInventoryService

   ${ReadINIOption} $R0 "${IOS_FINAL}" "${IO_INSTALLDIR}"
   
   SimpleSC::InstallService \
      "${PRODUCT_INTERNAL_NAME}" "${PRODUCT_NAME}" "16" "3" \
      `"$R0\perl\bin\perl.exe" -I"$R0\perl\agent" -I"$R0\perl\lib" "$R0\perl\bin\fusioninventory-win32-service"` \
      "" "" ""
FunctionEnd


; RemoveFusionInventoryService
Function un.RemoveFusionInventoryService
  Nop
FunctionEnd

!endif

