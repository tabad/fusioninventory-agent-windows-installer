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
   @file      .\FusionInventory Agent\Include\CommaUStrFunc.nsh
   @author    Tomas Abad <tabadgp@gmail.com>
   @copyright Copyright (c) 2010-2013 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_COMMAUSTRFUNC_INCLUDE__
!define __FIAI_COMMAUSTRFUNC_INCLUDE__


!include "LogicLib.nsh"
!include "WordFunc.nsh"
!include "${FIAI_DIR}\Include\StrFunc.nsh"


; Notes: Comma separated Strings (CommaStr)
;        Comma separated Unique Strings (CommaUStr)
;
;        CommaStr and CommaUStr are case insensitive
;
;        The functions:
;
;           * DelStrCommaUStr
;           * FirstStrCommaUStr
;           * GetStrsCommaUStr
;           * IsInCommaUStrTester
;
;        can be used with CommaStr and CommaUStr strings.


; IsASubCommaUStr
!macro _IsASubCommaUStr _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Push `${_a}`
   Call IsASubCommaUStrTester
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend


; IsInCommaUStr
!macro _IsInCommaUStr _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Push `${_a}`
   Call IsInCommaUStrTester
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend


; AddCommaStrCommaUStr
!define AddCommaStrCommaUStr "!insertmacro AddCommaStrCommaUStr"

!macro AddCommaStrCommaUStr CommaUStr CommaStr ResultVar
   Push "${CommaUStr}"
   Push "${CommaStr}"
   Call AddCommaStrCommaUStr
   Pop "${ResultVar}"
!macroend

Function AddCommaStrCommaUStr
   ; $R0 CommaUStr
   ; $R1 CommaStr
   ; $R2 Auxiliary

   ; Note: $R0 is used also output variable

   ; Get parameters
   Exch $R1
   Exch
   Exch $R0
   Exch

   ; Push $R2 onto the stack
   Push $R2

   ${Do}
      ; Get the first string of $R1
      Push $R1
      Call FirstStrCommaUStr
      Pop $R2

      ; Check whether there are more strings
      ${If} "$R2" == ""
         ; No more strings in $R1
         ${Break}
      ${Else}
         ; Delete $R2 of $R1
         Push $R1
         Push $R2
         Call DelStrCommaUStr
         Pop $R1
      ${EndIf}

      ; Trim $R2
      ${Trim} $R2 "$R2"

      ; Add $R2 to $R0
      Push $R0
      Push $R2
      Call AddStrCommaUStr
      Pop $R0
   ${Loop}

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; AddStrCommaUStr
!define AddStrCommaUStr "!insertmacro AddStrCommaUStr"

!macro AddStrCommaUStr CommaUStr String ResultVar
   Push "${CommaUStr}"
   Push "${String}"
   Call AddStrCommaUStr
   Pop "${ResultVar}"
!macroend

Function AddStrCommaUStr
   ; $R0 CommaUStr
   ; $R1 String
   ; $R2 Auxiliary
   ; $R3 Auxiliary

   ; Note: $R0 is used also output variable

   ; Get parameters
   Exch $R1
   Exch
   Exch $R0
   Exch

   ; Push $R2 onto the stack
   Push $R2

   ; Trim $R1
   ${Trim} $R1 "$R1"

   ; Add $R1 to $R0
   ${WordAdd} "$R0" "," "+$R1" $R2

   ; Copy return value in $R0
   StrCpy $R0 "$R2"

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; DelStrCommaUStr
!define DelStrCommaUStr "!insertmacro DelStrCommaUStr"

!macro DelStrCommaUStr CommaUStr String ResultVar
   Push "${CommaUStr}"
   Push "${String}"
   Call DelStrCommaUStr
   Pop "${ResultVar}"
!macroend

Function DelStrCommaUStr
   ; $R0 CommaUStr
   ; $R1 String
   ; $R2 Auxiliary
   ; $R3 Auxiliary

   ; Note: $R0 is used also output variable

   ; Get parameters
   Exch $R1
   Exch
   Exch $R0
   Exch

   ; Push $R2 & $R3 onto the stack
   Push $R2
   Push $R3

   ; Check whether $R1 is in $R0
   ${If} "$R1" IsInCommaUStr "$R0"
      ; Delete $R1 of $R0
      ${WordAdd} "$R0" "," "E-$R1" $R2

      ${If} ${Errors}
      ${AndIf} $R2 == 1
         ; Error and delimiter not found (there is only one string in $R0)
         StrCpy $R3 ""
      ${Else}
         StrCpy $R3 "$R2"
      ${EndIf}
   ${Else}
      ; Nothing to delete
      StrCpy $R3 "$R0"
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R3"

   ; Pop $R3, $R2 & $R1 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; FirstStrCommaUStr
!define FirstStrCommaUStr "!insertmacro FirstStrCommaUStr"

!macro FirstStrCommaUStr CommaUStr ResultVar
   Push "${CommaUStr}"
   Call FirstStrCommaUStr
   Pop "${ResultVar}"
!macroend

Function FirstStrCommaUStr
   ; $R0 CommaUStr
   ; $R1 Auxiliary

   ; Note: $R0 is used also output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Get number of strings in $R0
   Push "$R0"
   Call GetStrsCommaUStr
   Pop $R1

   ; Check number of strings
   ${If} $R1 = 0
      ; There is not any string in $R0
      StrCpy $R2 ""
   ${Else}
      ; Get first string of $R0
      ${WordFind} "$R0" "," "E+1" $R1

      ${If} ${Errors}
      ${AndIf} $R1 == 1
         ; Error and delimiter not found (there is only one string in $R0)
         StrCpy $R2 "$R0"
      ${Else}
         StrCpy $R2 "$R1"
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R2"

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; GetStrsCommaUStr
!define GetStrsCommaUStr "!insertmacro GetStrsCommaUStr"

!macro GetStrsCommaUStr CommaUStr ResultVar
   Push "${CommaUStr}"
   Call GetStrsCommaUStr
   Pop "${ResultVar}"
!macroend

Function GetStrsCommaUStr
   ; $R0 CommaUStr
   ; $R1 Auxiliary

   ; Note: $R0 is used also output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Check parameter
   ${If} "$R0" == ""
      ; $R0 is empty
      StrCpy $R1 0
   ${Else}
      ${WordFind} "$R0" "," "E#" $R1

      ${If} ${Errors}
      ${AndIf} $R1 = 1
         ; Error and delimiter not found (there is only one string in $R0)
         StrCpy $R1 1
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


Function IsASubCommaUStrTester
   ; $R0 CommaUStr (superset)
   ; $R1 CommaUStr (subset)
   ; $R2 Auxiliary
   ; $R3 Auxiliary

   ; Note: $R0 is used also output variable

   ; Get parameters
   Exch $R1
   Exch
   Exch $R0
   Exch

   ; Push $R2 & $R3 onto the stack
   Push $R2
   Push $R3

   ; Init $R3
   StrCpy $R3 0

   ; Check loop
   ${Do}
      ; Get the first string of $R1
      ${FirstStrCommaUStr} "$R1" $R2

      ${If} "$R2" == ""
         ; There aren't more string in $R1
         ${ExitDo}
      ${Else}
         ; Check whether $R2 is in $R0
         ${If} "$R2" IsInCommaUStr "$R0"
            ; $R2 is in $R0
            ; Check the next string in $R1
            ${DelStrCommaUStr} "$R1" "$R2" $R1
         ${Else}
            ; $R2 is not in $R0
            StrCpy $R3 1
            ${ExitDo}
         ${EndIf}
      ${EndIf}
   ${Loop}

   ; Copy return value in $R0
   ${If} $R3 = 0
      ; $R1 is a sub string of $R0
      StrCpy $R0 0
   ${Else}
      ; $R1 is not a sub string of $R0
      StrCpy $R0 1
   ${EndIf}

   ; Pop $R3, $R2 & $R1 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsInCommaUStrTester
Function IsInCommaUStrTester
   ; $R0 CommaUStr
   ; $R1 String
   ; $R2 Auxiliary
   ; $R3 Auxiliary

   ; Note: $R0 is used also output variable

   ; Get parameters
   Exch $R1
   Exch
   Exch $R0
   Exch

   ; Push $R2 & $R3 onto the stack
   Push $R2
   Push $R3

   ; Get strings in $R0
   Push "$R0"
   Call GetStrsCommaUStr
   Pop $R2

   ; Check parameters
   ${If} $R2 = 0
   ${OrIf} "$R1" == ""
      ; $R0 or $R1 are empty
      StrCpy $R3 1
   ${Else}
      ; Find $R1 in $R0
      ${WordFind} "$R0" "," "E/$R1" $R2

      ${If} ${Errors}
         ${If} $R2 == 1
            ; Error and delimiter not found (there is only one string in $R0)
            ${If} "$R0" != "$R1"
               StrCpy $R3 1
            ${Else}
               StrCpy $R3 0
            ${EndIf}
         ${ElseIf} $R2 == 2
            ; Error and $R1 not found in $R0
            StrCpy $R3 1
         ${EndIf}
      ${Else}
         ; Found $R1 in $R0 in position $R2
         StrCpy $R3 0
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R3"

   ; Pop $R3, $R2 & $R1 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1

   ; Exchanges the top element of the stack with $R0
   Exch $R0
FunctionEnd


!endif
