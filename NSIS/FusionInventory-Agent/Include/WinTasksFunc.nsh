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
   @file      .\FusionInventory Agent\Include\WinTasksFunc.nsh
   @author    Manuel J. Garrido <manuel.garrido@gmail.com>
   @copyright Copyright (c) 2010-2013 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_WINTASKSFUNC_INCLUDE__
!define __FIAI_WINTASKSFUNC_INCLUDE__

!include LogicLib.nsh
!include "${FIAI_DIR}\Include\INIFunc.nsh"


; FusionInventoryAgentTaskIsInstalled
!macro _FusionInventoryAgentTaskIsInstalled _a _b _t _f
   ; $R0 Comspec full path
   ; $R1 String to look for
   ; $R2 ExecToStack's return value

   ; Push $R0, $R1 & $R2 onto the stack
   Push $R0
   Push $R1
   Push $R2

   ; Look for task
   !insertmacro _LOGICLIB_TEMP
   ExpandEnvStrings $R0 %COMSPEC%
   StrCpy $R1 '${PRODUCT_INTERNAL_NAME}'
   nsExec::ExecToStack '"$R0" /c schtasks /query /fo csv | find /c "$R1"'

   ; Get ExecToStack's return values
   Pop $R2
   Pop $_LOGICLIB_TEMP

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0

   !insertmacro _= $_LOGICLIB_TEMP 1 `${_t}` `${_f}`
!macroend

!define FusionInventoryAgentTaskIsInstalled `"" FusionInventoryAgentTaskIsInstalled ""`


; RemoveFusionInventoryTask
!define RemoveFusionInventoryTask "!insertmacro RemoveFusionInventoryTask"

!macro RemoveFusionInventoryTask
   ; $R0, $R1 ExecToStack's return values

   ; Push $R0 & $R1 onto the stack
   Push $R0
   Push $R1

   ${If} ${FusionInventoryAgentTaskIsInstalled}
      nsExec::ExecTostack 'schtasks /end /tn "${PRODUCT_INTERNAL_NAME}"'
      Pop $R0
      Pop $R1

      nsExec::ExecTostack 'schtasks /delete /tn "${PRODUCT_INTERNAL_NAME}" /f'
      Pop $R0
      Pop $R1
   ${EndIf}

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
!macroend


; AddFusionInventoryTask
!define AddFusionInventoryTask "Call AddFusionInventoryTask"

Function AddFusionInventoryTask
   ; $R0 Section from which to read
   ; $R1 Install directory
   ; $R2 Time unit for the scheduler (minute, hourly, daily)
   ; $R3 Time interval
   ; $R4, $R5 ExecToStack's return values

   ; Push $R0, $R1, $R2, $R3, $R4  & $R5 onto the stack
   Push $R0
   Push $R1
   Push $R2
   Push $R3
   Push $R4
   Push $R5

   ; Set the section from which to read
   StrCpy $R0 "${IOS_FINAL}"

   ; Get install directory
   ${ReadINIOption} $R1 "$R0" "${IO_INSTALLDIR}"

   ; Get time unit for the scheduler (minute, hourly, daily)
   ${ReadINIOption} $R2 "$R0" "${IO_TASK-FREQUENCY}"

   ; Get the time interval
   ${Select} "$R2"
      ${Case} "${FREQUENCY_MINUTE}"
         ${ReadINIOption} $R3 "$R0" "${IO_TASK-MINUTE-MODIFIER}"
      ${Case} "${FREQUENCY_HOURLY}"
         ${ReadINIOption} $R3 "$R0" "${IO_TASK-HOURLY-MODIFIER}"
      ${Case} "${FREQUENCY_DAILY}"
         ${ReadINIOption} $R3 "$R0" "${IO_TASK-DAILY-MODIFIER}"
   ${EndSelect}

   ; Create scheduled task
   nsExec::ExecTostack 'schtasks /tn "${PRODUCT_INTERNAL_NAME}" /create /ru system \
       /tr "\"$R1\fusioninventory-agent.bat\"" /sc $R2 /mo $R3'
   Pop $R4
   Pop $R5

   ; Pop $R5, $R4, $R3, $R2, $R1 & $R0 off of the stack
   Pop $R5
   Pop $R4
   Pop $R3
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


; RunAgentNow
!define RunAgentNow "Call RunAgentNow"

Function RunAgentNow
   ; $R0 Day
   ; $R1 Month
   ; $R2 Year
   ; $R3 Day of week
   ; $R4 Hour
   ; $R5 Minute
   ; $R6 Second
   ; $R7 Time to schedule job
   ; $R8 Auxiliary
   ; $R9 Auxiliary

   ; Push $R0, $R1, $R2, $R3, $R4, $R5, $R6, $R7, $R8 & $R9 onto the stack
   Push $R0
   Push $R1
   Push $R2
   Push $R3
   Push $R4
   Push $R5
   Push $R6
   Push $R7
   Push $R8
   Push $R9

   ; Get current local time
   ${GetTime} "" "L" $R0 $R1 $R2 $R3 $R4 $R5 $R6

   ; If second < 55, the job will be scheduled for the next change of minutes,
   ; else it will be scheduled for the second change of minutes
   ${If} $R6 < 55
      IntOp $R5 $R5 + 1
   ${Else}
      IntOp $R5 $R5 + 2
   ${EndIf}

   ${If} $R5 > 59
      IntOp $R5 $R5 % 60
      IntOp $R4 $R4 + 1
      IntOp $R4 $R4 % 24
   ${EndIf}

   ; Format time to schedule job
   StrCpy $R7 "$R4:$R5:00"

   ; Set the section from which to read
   StrCpy $R8 "${IOS_FINAL}"

   ; Get install directory
   ${ReadINIOption} $R9 "$R8" "${IO_INSTALLDIR}"

   ; Schedule job
   nsExec::ExecTostack 'at "$R7" "$R9\fusioninventory-agent.bat" --force'
   Pop $R8
   Pop $R9

   ; Pop $R9, $R8, $R7, $R6, $R5, $R4, $R3, $R2, $R1 & $R0 off the stack
   Pop $R9
   Pop $R8
   Pop $R7
   Pop $R6
   Pop $R5
   Pop $R4
   Pop $R3
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


!endif
