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


; GetCurrentSelectedFlagsOfSections
!define GetCurrentSelectedFlagsOfSections "!insertmacro GetCurrentSelectedFlagsOfSections"

!macro GetCurrentSelectedFlagsOfSections ResultVar
   Call GetCurrentSelectedFlagsOfSections
   Pop ${ResultVar}
!macroend

Function GetCurrentSelectedFlagsOfSections
   ; $R0 Result
   ; $R1 Iterator
   ; $R2 Section text

   ; Push $R0, $R1 & $R2 onto the stack
   Push $R0
   Push $R1
   Push $R2

   ; Initialize $R0
   StrCpy $R0 0

   ; Check sections...
   ${ForEach} $R1 $SectionsNumber 0 - 1
      IntOp $R0 $R0 << 1
      ; Only whether the section is selected and
      ; is not hidden, is not a section group and
      ; is not a section group end.
      SectionGetText $R1 $R2
      ${If} "$R2" == ""
      ${OrIf} "$R2" == "-"
         ; Hidden section
         Nop
      ${Else}
         ${If} ${SectionIsSelected} $R1
         ${AndIfNot} ${SectionIsSectionGroup} $R1
         ${AndIfNot} ${SectionIsSectionGroupEnd} $R1
            ; Mark as selected
            IntOp $R0 $R0 | 0x1
         ${EndIf}
      ${EndIf}
   ${Next}

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
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


; SelectSection
!define SelectSection "!insertmacro _SelectSection"

!macro _SelectSection SectionId
   Push ${SectionId}
   Call _SelectSection
!macroend

Function _SelectSection
   ; $R0 SectionId
   ; $R1 Auxiliary

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Only whether the section is not hidden,
   ; not readonly, not a section group and
   ; not a section group end.
   SectionGetText $R0 $R1
   ${If} "$R1" == ""
   ${OrIf} "$R1" == "-"
      ; Hidden section
      Nop
   ${Else}
      ${IfNot} ${SectionIsReadOnly} $R0
      ${AndIfNot} ${SectionIsSectionGroup} $R0
      ${AndIfNot} ${SectionIsSectionGroupEnd} $R0
         ; Select section
         SectionGetFlags $R0 $R1
         IntOp $R1 $R1 | ${SF_SELECTED}
         SectionSetFlags $R0 $R1
      ${EndIf}
   ${EndIf}

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


; SetSectionsNumber
!define SetSectionsNumber "!insertmacro SetSectionsNumber"

!macro SetSectionsNumber Sections
   Push ${Sections}
   Call SetSectionsNumber
!macroend

Function SetSectionsNumber
   ; $R0 Sections

   ; Get parameter
   Exch $R0

   ; The index starts at zero
   IntOp $SectionsNumber $R0 - 1

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


; UnselectAllSections
!define UnselectAllSections "Call UnselectAllSections"

Function UnselectAllSections
   ; $R0 SectionId iterator

   ; Push $R0 onto the stack
   Push $R0

   ${For} $R0 0 $SectionsNumber
      Push $R0
      Call _UnselectSection
   ${Next}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


; UnselectSection
!define UnselectSection "!insertmacro _UnselectSection"

!macro _UnselectSection SectionId
   Push ${SectionId}
   Call _UnselectSection
!macroend

Function _UnselectSection
   ; $R0 SectionId
   ; $R1 Auxiliary

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Only whether the section is not hidden,
   ; not readonly, not a section group and
   ; not a section group end.
   SectionGetText $R0 $R1
   ${If} "$R1" == ""
   ${OrIf} "$R1" == "-"
      ; Hidden section
      Nop
   ${Else}
      ${IfNot} ${SectionIsReadOnly} $R0
      ${AndIfNot} ${SectionIsSectionGroup} $R0
      ${AndIfNot} ${SectionIsSectionGroupEnd} $R0
         ; Unselect section
         SectionGetFlags $R0 $R1
         IntOp $R1 $R1 & ${SECTION_OFF}
         SectionSetFlags $R0 $R1
      ${EndIf}
   ${EndIf}

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


!endif
