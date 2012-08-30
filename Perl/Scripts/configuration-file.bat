:: ------------------------------------------------------------------------
:: FusionInventory
:: Copyright (C) 2010-2012 by the FusionInventory Development Team.
::
:: http://www.fusioninventory.org/   http://forge.fusioninventory.org/
:: ------------------------------------------------------------------------
::
:: LICENSE
::
:: This file is part of FusionInventory project.
::
:: FusionInventory is free software: you can [...]
::
:: FusionInventory is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
:: GNU Affero General Public License for more details.
::
:: You should have received a copy of [...]
::
:: ------------------------------------------------------------------------
::
:: @package   FusionInventory Agent Installer for Microsoft Windows
:: @file      .\Perl\Scripts\configuration-file.bat    
:: @author    Tomas Abad
:: @copyright Copyright (c) 2010-2012 FusionInventory Team
:: @license   [...]
:: @link      http://www.fusioninventory.org/
:: @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
:: @since     2012
::
:: ------------------------------------------------------------------------


set drive=%~dp0
set drivep=%drive%
if #%drive:~-1%# == #\# set drivep=%drive:~0,-1%
set PATH=%drivep%\perl\site\bin;%drivep%\perl\bin;%drivep%\c\bin;%PATH%
rem env variables
set TERM=dumb
rem avoid collisions with other perl stuff on your system
set PERL_JSON_BACKEND=
set PERL_YAML_BACKEND=
set PERL5LIB=
set PERL5OPT=
set PERL_MM_OPT=
set PERL_MB_OPT=
:: show Perl information
perl -MConfig -e "printf("""Perl executable: %%s\nPerl version   : %%vd / $Config{archname}\n""", $^X, $^V)" 2>nul
if ERRORLEVEL==1 echo.&echo FATAL ERROR: 'perl' does not work; check if your strawberry pack is complete!

:: set proxy environment variables
::    Remove comments and defines the lines below to use the proxy server 
:: set HTTP_PROXY=http://[username:password@]your.http.server.proxy:port/
:: set HTTPS_PROXY=https://[username:password@]your.https.server.proxy:port/
:: set FTP_PROXY=ftp://[username:password@]your.ftp.server.proxy:port/
:: set NO_PROXY=localhost,...

:: set more variables
::    CPAN search engine or mirror
set CPAN_MIRROR=http://search.cpan.org
set CPAN_MIRROR_PATH_PREFIX=/CPAN/authors/id
::    Search 'FusionInventory' in 'distributions' in http://search.cpan.org/ 
set FUSINV_AGENT=/F/FU/FUSINV/FusionInventory-Agent-2.2.5.tar.gz
set FUSINV_TASK_DEPLOY=/F/FU/FUSINV/FusionInventory-Agent-Task-Deploy-2.0.2.tar.gz
set FUSINV_TASK_ESX=/F/FU/FUSINV/FusionInventory-Agent-Task-ESX-2.2.0.tar.gz
set FUSINV_TASK_NETWORK=/G/GO/GONERI/FusionInventory-Agent-Task-Network-1.0.1.tar.gz
set FUSINV_TASKS=%FUSINV_TASK_DEPLOY% %FUSINV_TASK_ESX% %FUSINV_TASK_NETWORK%
::    Other needed modules
set OTHER_NEEDED_MODULES=Win32::Daemon Net::NBName
