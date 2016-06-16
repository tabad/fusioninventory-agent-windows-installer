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
   @file      .\FusionInventory Agent\Include\OptionChecks.nsh
   @author    Tomas Abad <tabadgp@gmail.com>
   @copyright Copyright (c) 2010-2013 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_OPTIONCHECKS_INCLUDE__
!define __FIAI_OPTIONCHECKS_INCLUDE__


!include LogicLib.nsh
!include "${FIAI_DIR}\Include\INIFunc.nsh"
!include "${FIAI_DIR}\Include\CommaUStrFunc.nsh"
!include "${FIAI_DIR}\Include\WinTasksFunc.nsh"


; IsAnIntegerNumber
!define IsAnIntegerNumber `"" IsAnIntegerNumber`

!macro _IsAnIntegerNumber _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   IntFmt $_LOGICLIB_TEMP "%d" `${_b}`
   !insertmacro _== `$_LOGICLIB_TEMP` `${_b}` `${_t}` `${_f}`
!macroend


; IsValidOptionBackendCollectTimeoutValue
!define IsValidOptionBackendCollectTimeoutValue `"" IsValidOptionBackendCollectTimeoutValue`

!macro _IsValidOptionBackendCollectTimeoutValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionBackendCollectTimeoutValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionBackendCollectTimeoutValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 600
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionCaCertDirValue
!define IsValidOptionCaCertDirValue `"" IsValidOptionCaCertDirValue`

!macro _IsValidOptionCaCertDirValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionCaCertDirValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionCaCertDirValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${IfNot} "$R0" == ""
      ${If} "$R0" != "$R0"
         ; $R0 is an invalid value
         StrCpy $R1 1
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionCaCertFileValue
!define IsValidOptionCaCertFileValue `"" IsValidOptionCaCertFileValue`

!macro _IsValidOptionCaCertFileValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionCaCertFileValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionCaCertFileValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${IfNot} "$R0" == ""
      ${If} "$R0" != "$R0"
         ; $R0 is an invalid value
         StrCpy $R1 1
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionCaCertUriValue
!define IsValidOptionCaCertUriValue `"" IsValidOptionCaCertUriValue`

!macro _IsValidOptionCaCertUriValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionCaCertUriValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionCaCertUriValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Value length
   ; $R3 Auxiliary

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1, $R2 & $R3 onto the stack
   Push $R1
   Push $R2
   Push $R3

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${IfNot} "$R0" == ""
      ; Get the length of $R0
      StrLen $R2 "$R0"

      ; Check whether $R0 starts with 'http://'
      ;    and its length is more than 7
      StrCpy $R3 "$R0" 7
      ${If} "$R3" == "http://"
      ${AndIf} $R2 > 7
         ; Valid value
         Nop
      ${Else}
         ; Check whether $R0 starts with 'https://'
         ;    and its length is more than 8
         StrCpy $R3 "$R0" 8
         ${If} "$R3" == "https://"
         ${AndIf} $R2 > 8
            ; Valid value
            Nop
         ${Else}
            ; $R0 is an invalid value
            StrCpy $R1 1
         ${EndIf}
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R3, $R2 & $R1 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionConfReloadIntervalValue
!define IsValidOptionConfReloadIntervalValue `"" IsValidOptionConfReloadIntervalValue`

!macro _IsValidOptionConfReloadIntervalValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionConfReloadIntervalValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionConfReloadIntervalValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${IfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${ElseIf} $R0 < 0
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${ElseIf} $R0 > 0
   ${AndIf} $R0 < 60
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionDebugValue
!define IsValidOptionDebugValue `"" IsValidOptionDebugValue`

!macro _IsValidOptionDebugValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionDebugValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionDebugValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 2
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionDelaytimeValue
!define IsValidOptionDelaytimeValue `"" IsValidOptionDelaytimeValue`

!macro _IsValidOptionDelaytimeValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionDelaytimeValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionDelaytimeValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 86400
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionExecmodeValue
!define IsValidOptionExecmodeValue `"" IsValidOptionExecmodeValue`

!macro _IsValidOptionExecmodeValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionExecmodeValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionExecmodeValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Valid values

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Initialize $R1
   StrCpy $R1 0

   ; Get valid execution modes
   ${GetValidExecmodeCommaUStr} $R2

   ; Check
   ${IfNot} "$R0" IsInCommaUStr "$R2"
      StrCpy $R1 1
   ${ElseIf} "$R0" == "${EXECMODE_TASK}"
   ${AndIfNot} ${IsTargetOsValidForWindowsTask}
      ; $R0 is an invalid value
      StrCpy $R1 2
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionHtmlValue
!define IsValidOptionHtmlValue `"" IsValidOptionHtmlValue`

!macro _IsValidOptionHtmlValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionHtmlValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionHtmlValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionHttpdIpValue
!define IsValidOptionHttpdIpValue `"" IsValidOptionHttpdIpValue`

!macro _IsValidOptionHttpdIpValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionHttpdIpValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionHttpdIpValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${If} "$R0" != "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionHttpdPortValue
!define IsValidOptionHttpdPortValue `"" IsValidOptionHttpdPortValue`

!macro _IsValidOptionHttpdPortValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionHttpdPortValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionHttpdPortValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 65535
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionHttpdTrustValue
!define IsValidOptionHttpdTrustValue `"" IsValidOptionHttpdTrustValue`

!macro _IsValidOptionHttpdTrustValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionHttpdTrustValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionHttpdTrustValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${If} "$R0" != "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionInstalldirValue
!define IsValidOptionInstalldirValue `"" IsValidOptionInstalldirValue`

!macro _IsValidOptionInstalldirValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionInstalldirValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionInstalldirValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${If} "$R0" != "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionInstalltasksValue
!define IsValidOptionInstalltasksValue `"" IsValidOptionInstalltasksValue`

!macro _IsValidOptionInstalltasksValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionInstalltasksValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionInstalltasksValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Valid values

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 & R2 onto the stack
   Push $R1
   Push $R2

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${Select} "$R0"
      ${Case} ""
         ; $R0 is an invalid value
         StrCpy $R1 1
      ${Case} "${INSTALLTASK_DEFAULT}"
         ; Install default tasks
         Nop
      ${Case} "${INSTALLTASK_MINIMAL}"
         ; Install the minimal tasks
         Nop
      ${Case} "${INSTALLTASK_FULL}"
         ; Install all tasks
         Nop
      ${CaseElse}
         ; Get valid tasks
         ${GetValidTasksCommaUStr} $R2
         ; Check set of agent tasks
         ${IfNot} "$R0" IsASubCommaUStr "$R2"
            ; $R0 is an invalid value
            StrCpy $R1 1
         ${EndIf}
   ${EndSelect}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionInstalltypeValue
!define IsValidOptionInstalltypeValue `"" IsValidOptionInstalltypeValue`

!macro _IsValidOptionInstalltypeValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionInstalltypeValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionInstalltypeValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Valid values

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Initialize $R1
   StrCpy $R1 0

   ; Get valid installation types
   ${GetValidInstalltypeCommaUStr} $R2

   ; Check
   ${IfNot} "$R0" IsInCommaUStr "$R2"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionLocalValue
!define IsValidOptionLocalValue `"" IsValidOptionLocalValue`

!macro _IsValidOptionLocalValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionLocalValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionLocalValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${IfNot} "$R0" == ""
      ${If} "$R0" != "$R0"
         ; $R0 is an invalid value
         StrCpy $R1 1
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionLogfileValue
!define IsValidOptionLogfileValue `"" IsValidOptionLogfileValue`

!macro _IsValidOptionLogfileValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionLogfileValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionLogfileValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${IfNot} "$R0" == ""
      ${If} "$R0" != "$R0"
         ; $R0 is an invalid value
         StrCpy $R1 1
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionLogfileMaxsizeValue
!define IsValidOptionLogfileMaxsizeValue `"" IsValidOptionLogfileMaxsizeValue`

!macro _IsValidOptionLogfileMaxsizeValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionLogfileMaxsizeValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionLogfileMaxsizeValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionLoggerValue
!define IsValidOptionLoggerValue `"" IsValidOptionLoggerValue`

!macro _IsValidOptionLoggerValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionLoggerValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionLoggerValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Valid values

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${Select} "$R0"
      ${Case} ""
         ; Invalid value
         StrCpy $R1 1
      ${CaseElse}
         ; Get valid loggers
         ${GetValidLoggerCommaUStr} $R2
         ; Check set of loggers
         ${IfNot} "$R0" IsASubCommaUStr "$R2"
            ; $R0 is an invalid value
            StrCpy $R1 1
         ${EndIf}
   ${EndSelect}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoCategoryValue
!define IsValidOptionNoCategoryValue `"" IsValidOptionNoCategoryValue`

!macro _IsValidOptionNoCategoryValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoCategoryValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoCategoryValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Valid values

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 & R2 onto the stack
   Push $R1
   Push $R2

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${Select} "$R0"
      ${Case} ""
         ; Valid value
         Nop
      ${CaseElse}
         ; Get valid categories
         ${GetValidCategoryCommaUStr} $R2
         ; Check set of categories
         ${IfNot} "$R0" IsASubCommaUStr "$R2"
            ; $R0 is an invalid value
            StrCpy $R1 1
         ${EndIf}
   ${EndSelect}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoHttpdValue
!define IsValidOptionNoHttpdValue `"" IsValidOptionNoHttpdValue`

!macro _IsValidOptionNoHttpdValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoHttpdValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoHttpdValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoInventoryValue
!define IsValidOptionNoInventoryValue `"" IsValidOptionNoInventoryValue`

!macro _IsValidOptionNoInventoryValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoInventoryValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoInventoryValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoNetdiscoveryValue
!define IsValidOptionNoNetdiscoveryValue `"" IsValidOptionNoNetdiscoveryValue`

!macro _IsValidOptionNoNetdiscoveryValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoNetdiscoveryValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoNetdiscoveryValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoOcsdeployValue
!define IsValidOptionNoOcsdeployValue `"" IsValidOptionNoOcsdeployValue`

!macro _IsValidOptionNoOcsdeployValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoOcsdeployValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoOcsdeployValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoP2pValue
!define IsValidOptionNoP2pValue `"" IsValidOptionNoP2pValue`

!macro _IsValidOptionNoP2pValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoP2pValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoP2pValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoPrinterValue
!define IsValidOptionNoPrinterValue `"" IsValidOptionNoPrinterValue`

!macro _IsValidOptionNoPrinterValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoPrinterValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoPrinterValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoSocketValue
!define IsValidOptionNoSocketValue `"" IsValidOptionNoSocketValue`

!macro _IsValidOptionNoSocketValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoSocketValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoSocketValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoSnmpqueryValue
!define IsValidOptionNoSnmpqueryValue `"" IsValidOptionNoSnmpqueryValue`

!macro _IsValidOptionNoSnmpqueryValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoSnmpqueryValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoSnmpqueryValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoSoftwareValue
!define IsValidOptionNoSoftwareValue `"" IsValidOptionNoSoftwareValue`

!macro _IsValidOptionNoSoftwareValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoSoftwareValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoSoftwareValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoSslCheckValue
!define IsValidOptionNoSslCheckValue `"" IsValidOptionNoSslCheckValue`

!macro _IsValidOptionNoSslCheckValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoSslCheckValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoSslCheckValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoTaskValue
!define IsValidOptionNoTaskValue `"" IsValidOptionNoTaskValue`

!macro _IsValidOptionNoTaskValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoTaskValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoTaskValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Valid values

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 & R2 onto the stack
   Push $R1
   Push $R2

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${Select} "$R0"
      ${Case} ""
         ; Valid value
         Nop
      ${CaseElse}
         ; Get valid tasks
         ${GetValidTasksCommaUStr} $R2
         ; Check set of agent tasks
         ${IfNot} "$R0" IsASubCommaUStr "$R2"
            ; $R0 is an invalid value
            StrCpy $R1 1
         ${EndIf}
   ${EndSelect}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionNoWakeonlanValue
!define IsValidOptionNoWakeonlanValue `"" IsValidOptionNoWakeonlanValue`

!macro _IsValidOptionNoWakeonlanValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionNoWakeonlanValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionNoWakeonlanValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionPasswordValue
!define IsValidOptionPasswordValue `"" IsValidOptionPasswordValue`

!macro _IsValidOptionPasswordValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionPasswordValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionPasswordValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${IfNot} "$R0" == ""
      ${If} "$R0" != "$R0"
         ; $R0 is an invalid value
         StrCpy $R1 1
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionProxyValue
!define IsValidOptionProxyValue `"" IsValidOptionProxyValue`

!macro _IsValidOptionProxyValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionProxyValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionProxyValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Value length
   ; $R3 Auxiliary

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1, $R2 & $R3 onto the stack
   Push $R1
   Push $R2
   Push $R3

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${IfNot} "$R0" == ""
      ; Get the length of $R0
      StrLen $R2 "$R0"

      ; Check whether $R0 starts with 'http://'
      ;    and its length is more than 7
      StrCpy $R3 "$R0" 7
      ${If} "$R3" == "http://"
      ${AndIf} $R2 > 7
         ; Valid value
         Nop
      ${Else}
         ; Check whether $R0 starts with 'https://'
         ;    and its length is more than 8
         StrCpy $R3 "$R0" 8
         ${If} "$R3" == "https://"
         ${AndIf} $R2 > 8
            ; Valid value
            Nop
         ${Else}
            ; $R0 is an invalid value
            StrCpy $R1 1
         ${EndIf}
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R3, $R2 & $R1 off of the stack
   Pop $R3
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionRpcIpValue
!define IsValidOptionRpcIpValue `"" IsValidOptionRpcIpValue`

!macro _IsValidOptionRpcIpValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionRpcIpValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionRpcIpValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${If} "$R0" != "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionRpcPortValue
!define IsValidOptionRpcPortValue `"" IsValidOptionRpcPortValue`

!macro _IsValidOptionRpcPortValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionRpcPortValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionRpcPortValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 65535
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionRpcTrustLocalhostValue
!define IsValidOptionRpcTrustLocalhostValue `"" IsValidOptionRpcTrustLocalhostValue`

!macro _IsValidOptionRpcTrustLocalhostValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionRpcTrustLocalhostValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionRpcTrustLocalhostValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${If} "$R0" != "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionScanHomedirsValue
!define IsValidOptionScanHomedirsValue `"" IsValidOptionScanHomedirsValue`

!macro _IsValidOptionScanHomedirsValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionScanHomedirsValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionScanHomedirsValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionScanProfilesValue
!define IsValidOptionScanProfilesValue `"" IsValidOptionScanProfilesValue`

!macro _IsValidOptionScanProfilesValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionScanProfilesValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionScanProfilesValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 1
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionServerValue
!define IsValidOptionServerValue `"" IsValidOptionServerValue`

!macro _IsValidOptionServerValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionServerValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionServerValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Auxiliary
   ; $R3 Auxiliary
   ; $R4 Auxiliary

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1, $R2, $R3 & $R4 onto the stack
   Push $R1
   Push $R2
   Push $R3
   Push $R4

   ; Initialize $R1
   StrCpy $R1 0

   ; Get values in $R0
   ${GetStrsCommaUStr} "$R0" $R2

   ; Check the number of values
   ${If} $R2 = 0
      ; There aren't values
      Nop
   ${Else}
      ; Check loop
      ${Do}
         ; Get the first value
         ${FirstStrCommaUStr} "$R0" $R2

         ; Check the $R2 value
         ${If} "$R2" == ""
            ; There aren't more values
            ${ExitDo}
         ${Else}
            ; Check whether $R2 is a valid value
            ; Get the length of $R2
            StrLen $R3 "$R2"
            ; Check whether $R2 starts with 'http://'
            ;    and its length is more than 7
            StrCpy $R4 "$R2" 7
            ${If} "$R4" == "http://"
            ${AndIf} $R3 > 7
               ; Valid value
               Nop
            ${Else}
               ; Check whether $R2 starts with 'https://'
               ;    and its length is more than 8
               StrCpy $R4 "$R2" 8
               ${If} "$R4" == "https://"
               ${AndIf} $R3 > 8
                  ; Valid value
                  Nop
               ${Else}
                  ; $R2 is an invalid value
                  StrCpy $R1 1
                  ${ExitDo}
               ${EndIf}
            ${EndIf}
         ${EndIf}

         ; Check the next value
         ${DelStrCommaUStr} "$R0" "$R2" $R0
      ${Loop}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R4, $R3, $R2 & $R1 off of the stack
   Pop $R4
   Pop $R3
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionTagValue
!define IsValidOptionTagValue `"" IsValidOptionTagValue`

!macro _IsValidOptionTagValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionTagValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionTagValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${IfNot} "$R0" == ""
      ${If} "$R0" != "$R0"
         ; $R0 is an invalid value
         StrCpy $R1 1
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionTasksValue
!define IsValidOptionTasksValue `"" IsValidOptionTasksValue`

!macro _IsValidOptionTasksValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionTasksValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionTasksValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Valid values

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 & R2 onto the stack
   Push $R1
   Push $R2

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${IfNot} "$R0" == ""
      ${If} "$R0" != "$R0"
         ; $R0 is an invalid value
         StrCpy $R1 1
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionTaskDailyModifierValue
!define IsValidOptionTaskDailyModifierValue `"" IsValidOptionTaskDailyModifierValue`

!macro _IsValidOptionTaskDailyModifierValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionTaskDailyModifierValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionTaskDailyModifierValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 1
   ${OrIf} $R0 > 30
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionTaskFrequencyValue
!define IsValidOptionTaskFrequencyValue `"" IsValidOptionTaskFrequencyValue`

!macro _IsValidOptionTaskFrequencyValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionTaskFrequencyValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionTaskFrequencyValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Valid values

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Initialize $R1
   StrCpy $R1 0

   ; Get valid Windows Task frequencies
   ${GetValidWindowsTaskFrequencyCommaUStr} $R2

   ; Check
   ${IfNot} "$R0" IsInCommaUStr "$R2"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionTaskHourlyModifierValue
!define IsValidOptionTaskHourlyModifierValue `"" IsValidOptionTaskHourlyModifierValue`

!macro _IsValidOptionTaskHourlyModifierValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionTaskHourlyModifierValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionTaskHourlyModifierValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 1
   ${OrIf} $R0 > 23
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionTaskMinuteModifierValue
!define IsValidOptionTaskMinuteModifierValue `"" IsValidOptionTaskMinuteModifierValue`

!macro _IsValidOptionTaskMinuteModifierValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionTaskMinuteModifierValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionTaskMinuteModifierValue
   ; $R0 Option value
   ; $R1 Error code
   ; $R2 Valid values

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Initialize $R1
   StrCpy $R1 0

   ; Get valid Windows Task minute modifier
   ${GetValidWindowsTaskMinuteModifierCommaUStr} $R2

   ; Check
   ${IfNot} "$R0" IsInCommaUStr "$R2"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R2 & $R1 off of the stack
   Pop $R2
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionTimeoutValue
!define IsValidOptionTimeoutValue `"" IsValidOptionTimeoutValue`

!macro _IsValidOptionTimeoutValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionTimeoutValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionTimeoutValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check
   ${If} $R0 < 0
   ${OrIf} $R0 > 600
   ${OrIfNot} ${IsAnIntegerNumber} "$R0"
      ; $R0 is an invalid value
      StrCpy $R1 1
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


; IsValidOptionUserValue
!define IsValidOptionUserValue `"" IsValidOptionUserValue`

!macro _IsValidOptionUserValue _a _b _t _f
   !insertmacro _LOGICLIB_TEMP
   Push `${_b}`
   Call IsValidOptionUserValue
   Pop $_LOGICLIB_TEMP
   !insertmacro _= $_LOGICLIB_TEMP 0 `${_t}` `${_f}`
!macroend

Function IsValidOptionUserValue
   ; $R0 Option value
   ; $R1 Error code

   ; Note: $R0 is used also as output variable

   ; Get parameter
   Exch $R0

   ; Push $R1 onto the stack
   Push $R1

   ; Initialize $R1
   StrCpy $R1 0

   ; Check (ToDo)
   ${IfNot} "$R0" == ""
      ${If} "$R0" != "$R0"
         ; $R0 is an invalid value
         StrCpy $R1 1
      ${EndIf}
   ${EndIf}

   ; Copy return value in $R0
   StrCpy $R0 "$R1"

   ; Pop $R1 off of the stack
   Pop $R1

   ; Exchange the top element of the stack with $R0
   Exch $R0
FunctionEnd


!endif
