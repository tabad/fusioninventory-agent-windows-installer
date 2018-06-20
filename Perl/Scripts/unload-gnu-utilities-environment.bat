:: ------------------------------------------------------------------------
:: FusionInventory
:: Copyright (C) 2010-2013 by the FusionInventory Development Team.
::
:: http://www.fusioninventory.org/   http://forge.fusioninventory.org/
:: ------------------------------------------------------------------------
::
:: LICENSE
::
:: This file is part of FusionInventory project.
::
:: FusionInventory Agent Installer for Microsoft Windows is free software;
:: you can redistribute it and/or modify it under the terms of the GNU
:: General Public License as published by the Free Software Foundation;
:: either version 2 of the License, or (at your option) any later version.
::
::
:: FusionInventory Agent Installer for Microsoft Windows is distributed in
:: the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
:: the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
:: PURPOSE. See the GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program; if not, write to the Free Software Foundation,
:: Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
:: or see <http://www.gnu.org/licenses/>.
::
:: ------------------------------------------------------------------------
::
:: @package   FusionInventory Agent Installer for Microsoft Windows
:: @file      .\Perl\Scripts\unload-gnu-utilities-environment.bat
:: @author    Tomas Abad <tabadgp@gmail.com>
:: @copyright Copyright (c) 2010-2013 FusionInventory Team
:: @license   GNU GPL version 2 or (at your option) any later version
::            http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
:: @link      http://www.fusioninventory.org/
:: @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
:: @since     2012
::
:: ------------------------------------------------------------------------


@echo off

del /q /f "%TEMP%\curl-ca-bundle.crt" 2> NUL
del /q /f "%TEMP%\curl.exe" 2> NUL
del /q /f "%TEMP%\7z.dll" 2> NUL
del /q /f "%TEMP%\7z.exe" 2> NUL

setlocal enabledelayedexpansion
set LOCAL_PATH=%PATH%
set LOCAL_PATH=!LOCAL_PATH:%MINGW_PATH%\bin;=!
set LOCAL_PATH=!LOCAL_PATH:%MSYS_PATH%\bin;=!
set LOCAL_PATH=!LOCAL_PATH:%TEMP%;=!
endlocal & set PATH=%LOCAL_PATH%
set LOCAL_PATH=

set HISTFILE=
set USER=
set HOME=

set MSYSTEM=
set MSYS_PATH=
set MINGW_PATH=
