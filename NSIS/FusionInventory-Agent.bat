:: ------------------------------------------------------------------------
:: FusionInventory Agent Installer for Microsoft Windows
:: Copyright (C) 2010-2013 by the FusionInventory Development Team.
::
:: http://www.fusioninventory.org/ http://forge.fusioninventory.org/
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
:: @file      .\NSIS\FusionInventory-Agent.bat
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

set MINGW_PATH=%SYSTEMDRIVE%\MinGW

if not exist "%MINGW_PATH%" goto mingw_not_installed
:: MinGW/MSYS is already installed

:: Load gnu utilities environment
call ..\Perl\Scripts\load-gnu-utilities-environment.bat

if exist "%ProgramFiles%\NSIS" goto native_architecture

if not exist "%ProgramFiles(x86)%" goto nsis_not_installed

if exist "%ProgramFiles(x86)%\NSIS" goto x64_architecture

goto nsis_not_installed

:native_architecture
:: NSIS is already installed into %ProgramFiles%\NSIS
for %%p in ("%ProgramFiles%\NSIS") do set NSIS_PATH=%%~sp

goto load_aditional_environment

:x64_architecture
:: NSIS is already installed into %ProgramFiles(x86)%\NSIS
for %%p in ("%ProgramFiles(x86)%\NSIS") do set NSIS_PATH=%%~sp

:load_aditional_environment
:: Load aditional environment
setlocal enabledelayedexpansion
set LOCAL_PATH=%PATH%
set LOCAL_PATH=!LOCAL_PATH:;%NSIS_PATH%=!
if not "x%LOCAL_PATH%" == "x%PATH%" (
   set LOCAL_PATH=
) else (
   set LOCAL_PATH=;%NSIS_PATH%
)
endlocal & set PATH=%PATH%%LOCAL_PATH%
set LOCAL_PATH=

:: Launch the bash shell script
%MSYS_PATH%\bin\bash.exe "%~dpn0.sh" %*

:: Unload aditional environment
setlocal enabledelayedexpansion
set LOCAL_PATH=%PATH%
set LOCAL_PATH=!LOCAL_PATH:;%NSIS_PATH%=!
endlocal & set PATH=%LOCAL_PATH%
set LOCAL_PATH=

:: Unload gnu utilities environment
call ..\Perl\Scripts\unload-gnu-utilities-environment.bat

goto end_of_file

:nsis_not_installed
:: NSIS is not installed

echo.
echo It seems that NSIS is not installed into this system. Please, download
echo NSIS 2.46 ^(http://nsis.sourceforge.net/Download^), install it, and
echo try again.
echo.

goto end_of_file

:mingw_not_installed
:: MinGW/MSYS is not installed

echo.
echo It seems that MinGW/MSYS is not installed into "%MINGW_PATH%".
echo Please, launch '..\Perl\Scripts\install-gnu-utilities-collection.bat'
echo to install MinGW/MSYS ^(www.mingw.org^) and try again.
echo.

:end_of_file
:: Unset environment variables

set NSIS_PATH=
set MINGW_PATH=
