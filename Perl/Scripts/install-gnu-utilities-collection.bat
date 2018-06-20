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
:: @file      .\Perl\Scripts\install-gnu-utilities-collection.bat
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

for %%p in (".") do pushd "%%~fsp"
cd /d "%~dp0"

set MINGW_PATH=%SYSTEMDRIVE%\MinGW
set MINGW_GET_BIN_URL=http://sourceforge.net/projects/mingw/files/Installer/mingw-get/mingw-get-0.6.2-beta-20131004-1/mingw-get-0.6.2-mingw32-beta-20131004-1-bin.zip

if exist "%MINGW_PATH%" goto already_installed
:: MinGW/MSYS is not installed

:: load proxy environment
call .\load-proxy-environment.bat

:: download mingw-get
..\..\Tools\curl\x86\curl --silent --location --max-redirs 6 --output "%TEMP%\mingw-get-bin.zip" "%MINGW_GET_BIN_URL%"

if not exist "%TEMP%\mingw-get-bin.zip" (
   echo.
   echo There has been an error downloading '%MINGW_GET_BIN_URL%'.
   echo.
   echo Whether you are behind a proxy system, please, edit file
   echo 'load-proxy-environment.bat', follow its instructions and try again.
   echo.
   goto end_of_file
)

:: unpackage mingw-get-bin.zip
mkdir "%MINGW_PATH%"
..\..\Tools\7zip\x86\7z x -bd -y -o"%MINGW_PATH%" "%TEMP%\mingw-get-bin.zip" > NUL
del /q /f %TEMP%\mingw-get-bin.zip

:: install mingw-get
copy "%MINGW_PATH%\var\lib\mingw-get\data\defaults.xml" "%MINGW_PATH%\var\lib\mingw-get\data\profile.xml" > NUL
"%MINGW_PATH%\bin\mingw-get" update
"%MINGW_PATH%\bin\mingw-get" install mingw-get

:: install msys-base-bin
"%MINGW_PATH%\bin\mingw-get" install msys-base-bin

:: install msys-mktemp-bin
"%MINGW_PATH%\bin\mingw-get" install msys-mktemp-bin

:: install msys-openssl-bin
"%MINGW_PATH%\bin\mingw-get" install msys-openssl-bin

:: install msys-rsync-bin
"%MINGW_PATH%\bin\mingw-get" install msys-rsync-bin

:: install msys-wget-bin
"%MINGW_PATH%\bin\mingw-get" install msys-wget-bin

:: unload proxy environment
call .\unload-proxy-environment.bat

goto end_of_file

:already_installed
:: MinGW/MSYS is already installed

echo.
echo It seems that MinGW/MSYS is already installed into "%MINGW_PATH%".
echo Whether it is not the case, please, remove the "%MINGW_PATH%" directory
echo and try again. You can make use of 'uninstall-gnu-utilities-collection.bat'
echo for that.
echo.
echo You can, on the other hand, update MinGW/MSYS whether you wish it.
echo To do it, please, launch 'update-gnu-utilities-collection.bat'.
echo.

:end_of_file
:: unset environment variables

set MINGW_PATH=
set MINGW_GET_BIN_URL=

popd
exit /b 0
