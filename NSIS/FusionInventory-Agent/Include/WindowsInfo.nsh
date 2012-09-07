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
   @file      .\FusionInventory Agent\Include\WindowsInfo.nsh
   @author    Tomas Abad
   @copyright Copyright (c) 2010-2012 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_WINDOWSINFO_INCLUDE__
!define __FIAI_WINDOWSINFO_INCLUDE__


; GetWindowsName
!define GetWindowsName "!insertmacro GetWindowsName"

!macro GetWindowsName ResultVar
   ; Gets the name of Windows. Possible values are:
   ;   7
   ;   Vista
   ;   Server 2008
   ;   Server 2008 R2
   ;   Server 2003
   ;   Server 2003 R2
   ;   XP
   ;   XP x64
   ;   2000
   ;   CE
   ;   NT
   ;   ME
   ;   98
   ;   98 SE
   ;   95
   ;   95 OSR2
   ;   Win32s
   GetVersion::WindowsName
   Pop "${ResultVar}"
!macroend


; GetWindowsPlatformArchitecture
!define GetWindowsPlatformArchitecture "!insertmacro GetWindowsPlatformArchitecture"

!macro GetWindowsPlatformArchitecture ResultVar
   ; Gets the architecture of the installed Windows (e.g. 32, 64).
   GetVersion::WindowsPlatformArchitecture
   Pop "${ResultVar}"
!macroend


; GetWindowsPlatformId
!define GetWindowsPlatformId "!insertmacro GetWindowsPlatformId"

!macro GetWindowsPlatformId ResultVar
   ; Gets the platform Id of the installed Windows (e.g. 1, 2, 3).
   GetVersion::WindowsPlatformId
   Pop "${ResultVar}"
!macroend


; GetWindowsServerName
!define GetWindowsServerName "!insertmacro GetWindowsServerName"

!macro GetWindowsServerName ResultVar
   ; Gets the installed server name. Possible values are:
   ;   HPC Edition
   ;   Server Datacenter
   ;   Server Datacenter without Hyper-V
   ;   Server Datacenter (core installation)
   ;   Server Datacenter without Hyper-V (core installation)
   ;   Server Enterprise
   ;   Server Enterprise without Hyper-V
   ;   Server Enterprise (core installation)
   ;   Server Enterprise without Hyper-V (core installation)
   ;   Server Enterprise for Itanium-based Systems
   ;   Hyper-V Server
   ;   Essential Business Server Management Server
   ;   Essential Business Server Messaging Server
   ;   Essential Business Server Security Server
   ;   Server 2008 for Windows Essential Server Solutions
   ;   Server 2008 without Hyper-V for Windows Essential Server Solutions
   ;   Server Foundation
   ;   Small Business Server
   ;   Small Business Server Premium
   ;   MultiPoint Server
   ;   Server Standard
   ;   Server Standard without Hyper-V
   ;   Server Standard (core installation)
   ;   Server Standard without Hyper-V (core installation)
   ;   Storage Server Enterprise
   ;   Storage Server Enterprise (core installation)
   ;   Storage Server Express
   ;   Storage Server Express (core installation)
   ;   Storage Server Standard
   ;   Storage Server Standard (core installation)
   ;   Storage Server Workgroup
   ;   Storage Server Workgroup (core installation)
   ;   Web Server Edition
   ;   Web Server Edition (core installation)
   ;   (or empty string)
   GetVersion::WindowsServerName
   Pop "${ResultVar}"
!macroend


; GetWindowsServicePack
!define GetWindowsServicePack "!insertmacro GetWindowsServicePack"

!macro GetWindowsServicePack ResultVar
   ; Gets the installed service pack name (e.g. Service Pack 2).
   GetVersion::WindowsServicePack
   Pop "${ResultVar}"
!macroend


; GetWindowsServicePackBuild
!define GetWindowsServicePackBuild "!insertmacro GetWindowsServicePackBuild"

!macro GetWindowsServicePackBuild ResultVar
   ; Gets the installed service pack build number (e.g. 2600).
   GetVersion::WindowsServicePackBuild
   Pop "${ResultVar}"
!macroend


; GetWindowsServicePackMajor
!define GetWindowsServicePackMajor "!insertmacro GetWindowsServicePackMajor"

!macro GetWindowsServicePackMajor ResultVar
   ; Gets the installed service pack major version (e.g. 6).
   GetVersion::WindowsServicePackMajor
   Pop "${ResultVar}"
!macroend


; GetWindowsServicePackMinor
!define GetWindowsServicePackMinor "!insertmacro GetWindowsServicePackMinor"

!macro GetWindowsServicePackMinor ResultVar
   ; Gets the installed service pack minor version (e.g. 0).
   GetVersion::WindowsServicePackMinor
   Pop "${ResultVar}"
!macroend


; GetWindowsType
!define GetWindowsType "!insertmacro GetWindowsType"

!macro GetWindowsType ResultVar
   ; Gets the type of Windows. Possible values are:
   ;   Ultimate
   ;   Ultimate N
   ;   Professional
   ;   Professional N
   ;   Home Premium
   ;   Home Premium N
   ;   Home Basic
   ;   Home Basic N
   ;   Enterprise
   ;   Enterprise N
   ;   Business
   ;   Business N
   ;   Starter
   ;   Starter N
   ;   Home Edition
   ;   Embedded
   ;   Professional x64 Edition
   ;   Media Center Edition
   ;   Tablet PC Edition
   ;   Workstation 4.0
   ;   (or empty string)
   GetVersion::WindowsType
   Pop "${ResultVar}"
!macroend


; GetWindowsVersion
!define GetWindowsVersion "!insertmacro GetWindowsVersion"

!macro GetWindowsVersion ResultVar
   ; Gets the Windows version x.x (e.g. 5.1).
   GetVersion::WindowsVersion
   Pop "${ResultVar}"
!macroend


!endif
