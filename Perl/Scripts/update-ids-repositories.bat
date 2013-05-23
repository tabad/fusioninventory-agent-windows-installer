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
:: @file      .\Perl\Scripts\update-ids-repositories.bat
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

if not exist "%MINGW_PATH%" goto not_installed
:: MinGW/MSYS is already installed

:: Load proxy environment
call .\load-proxy-environment.bat

:: Load gnu utilities environment
call .\load-gnu-utilities-environment.bat

:: Launch the bash shell script
"%MSYS_PATH%\bin\bash.exe" "%~dpn0.sh" %*

:: Unload gnu utilities environment
call .\unload-gnu-utilities-environment.bat

:: Unload proxy environment
call .\unload-proxy-environment.bat

goto end_of_file

:not_installed
:: MinGW/MSYS is not installed

echo.
echo It seems that MinGW/MSYS is not installed into "%MINGW_PATH%".
echo Please, launch 'install-gnu-utilities-collection.bat' to install
echo MinGW/MSYS ^(www.mingw.org^) and try again.
echo.

:end_of_file
:: Unset environment variables

set MINGW_PATH=
