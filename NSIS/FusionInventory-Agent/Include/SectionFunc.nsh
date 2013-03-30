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
   @file      .\FusionInventory Agent\Include\SectionFunc.nsh
   @author    Tomas Abad <tabadgp@gmail.com>
   @copyright Copyright (c) 2010-2013 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_SECTIONFUNC_INCLUDE__
!define __FIAI_SECTIONFUNC_INCLUDE__


!include LogicLib.nsh
!include Sections.nsh


Var SavedSelectedFlagStateOfSections
Var SectionsNumber


; SelectSection
!define SelectSection "!insertmacro _SelectSection"

!macro _SelectSection SectionId
   ; $R0 Section flags

   ; Push $R0 onto the stack
   Push $R0

   ; Only whether the section is not readonly
   ${IfNot} ${SectionIsReadOnly} ${SectionId}
      SectionGetFlags ${SectionId} $R0
      IntOp $R0 $R0 | ${SF_SELECTED}
      SectionSetFlags ${SectionId} $R0
   ${EndIf}

   ; Pop $R0  off of the stack
   Pop $R0
!macroend


; GetCurrentSelectedFlagsOfSections
!define GetCurrentSelectedFlagsOfSections "!insertmacro GetCurrentSelectedFlagsOfSections"

!macro GetCurrentSelectedFlagsOfSections ResultVar
   Call GetCurrentSelectedFlagsOfSections
   Pop ${ResultVar}
!macroend

Function GetCurrentSelectedFlagsOfSections
   ; $R0 Result
   ; $R1 Iterator

   ; Push $R0 onto the stack
   Push $R0
   Push $R1

   ; Initialize $R0
   StrCpy $R0 0

   ; Check sections...
   ${ForEach} $R1 $SectionsNumber 0 - 1
      IntOp $R0 $R0 << 1
      ${If} ${SectionIsSelected} $R1
      ${AndIfNot} ${SectionIsSectionGroup} $R1
         IntOp $R0 $R0 | 0x1
      ${EndIf}
   ${Next}

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; GetSavedSelectedFlagsOfSections
!define GetSavedSelectedFlagsOfSections "!insertmacro GetSavedSelectedFlagsOfSections"

!macro GetSavedSelectedFlagsOfSections ResultVar
   StrCpy ${ResultVar} $SavedSelectedFlagStateOfSections
!macroend


; GetSectionsNumber
!define GetSectionsNumber "!insertmacro GetSectionsNumber"

!macro GetSectionsNumber ResultVar
   StrCpy ${ResultVar} $SectionsNumber
!macroend


; SaveCurrentSelectedFlagsOfSections
!define SaveCurrentSelectedFlagsOfSections "!insertmacro SaveCurrentSelectedFlagsOfSections"

!macro SaveCurrentSelectedFlagsOfSections
   Call GetCurrentSelectedFlagsOfSections
   Pop $SavedSelectedFlagStateOfSections
!macroend


; SetSectionsNumber
!define SetSectionsNumber "!insertmacro SetSectionsNumber"

!macro SetSectionsNumber TotalSections
   ; $R0 Auxiliary (TotalSections is readonly)

   ; Push $R0 onto the stack
   Push $R0

   ; The index starts at zero
   IntOp $R0 ${TotalSections} - 1
   StrCpy $SectionsNumber $R0

   ; Pop $R0  off of the stack
   Pop $R0
!macroend


; UnselectSection
!define UnselectSection "!insertmacro _UnselectSection"

!macro _UnselectSection SectionId
   ; $R0 Section flags

   ; Push $R0 onto the stack
   Push $R0

   ; Only whether the section is not readonly
   ${IfNot} ${SectionIsReadOnly} ${SectionId}
      SectionGetFlags ${SectionId} $R0
      IntOp $R0 $R0 & ${SECTION_OFF}
      SectionSetFlags ${SectionId} $R0
   ${EndIf}

   ; Pop $R0  off of the stack
   Pop $R0
!macroend


!endif
