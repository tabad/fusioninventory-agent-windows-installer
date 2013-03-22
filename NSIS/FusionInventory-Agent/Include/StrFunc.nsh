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
   @file      .\FusionInventory Agent\Include\StrFunc.nsh
   @author    Tomas Abad <tabadgp@gmail.com>
   @copyright Copyright (c) 2010-2012 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_STRFUNC_INCLUDE__
!define __FIAI_STRFUNC_INCLUDE__


!include LogicLib.nsh


; EscapeSpecialRTFCharacters
!define EscapeSpecialRTFCharacters "!insertmacro EscapeSpecialRTFCharacters"

!macro EscapeSpecialRTFCharacters ResultVar String
   Push "${String}"
   Call EscapeSpecialRTFCharacters
   Pop "${ResultVar}"
!macroend

Function EscapeSpecialRTFCharacters
   Exch $R1
   Push $R2
   Push $R3
   Push $R4

   StrCpy $R2 ""
   StrCpy $R3 ""
   StrLen $R4 "$R1"

   ${DoWhile} $R4 > 0
      IntOp $R4 $R4 - 1
      StrCpy $R2 "$R1" 1 $R4
      ${Switch} $R2
         ${Case} "\"
         ${Case} "{"
         ${Case} "}"
            StrCpy $R3 "\$R2$R3"
            ${Break}
         ${CaseElse}
            StrCpy $R3 "$R2$R3"
            ${Break}
      ${EndSwitch}
   ${Loop}

   StrCpy $R1 "$R3"

   Pop $R4
   Pop $R3
   Pop $R2
   Exch $R1
FunctionEnd


; TrimLeft
!define TrimLeft "!insertmacro TrimLeft"

!macro TrimLeft ResultVar String
   Push "${String}"
   Call TrimLeft
   Pop "${ResultVar}"
!macroend

Function TrimLeft
   Exch $R1
   Push $R2

   ${Do}
      StrCpy $R2 "$R1" 1
      ${If} "$R2" == " "
      ${OrIf} "$R2" == "$\t"
         StrCpy $R1 "$R1" "" 1
      ${Else}
         ${Break}
      ${EndIf}
   ${Loop}

   Pop $R2
   Exch $R1
FunctionEnd


; TrimRight
!define TrimRight "!insertmacro TrimRight"

!macro TrimRight ResultVar String
   Push "${String}"
   Call TrimRight
   Pop "${ResultVar}"
!macroend

Function TrimRight
   Exch $R1
   Push $R2

   ${Do}
      StrCpy $R2 "$R1" 1 -1
      ${If} "$R2" == " "
      ${OrIf} "$R2" == "$\t"
         StrCpy $R1 "$R1" -1
      ${Else}
         ${Break}
      ${EndIf}
   ${Loop}

   Pop $R2
   Exch $R1
FunctionEnd


; Trim
!define Trim "!insertmacro Trim"

!macro Trim ResultVar String
   Push "${String}"
   Call TrimLeft
   Pop "${ResultVar}"

   Push "${ResultVar}"
   Call TrimRight
   Pop "${ResultVar}"
!macroend


!endif
