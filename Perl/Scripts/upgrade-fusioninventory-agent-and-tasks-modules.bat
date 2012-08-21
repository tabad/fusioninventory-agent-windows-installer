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
:: @file      .\Perl\Scripts\upgrade-fusioninventory-agent-and-tasks-modules.bat    
:: @author    Tomas Abad
:: @copyright Copyright (c) 2010-2012 FusionInventory Team
:: @license   [...]
:: @link      http://www.fusioninventory.org/
:: @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
:: @since     2012
::
:: ------------------------------------------------------------------------


@echo off
:: load configuration file
call .\configuration-file.bat

:: erase FusionInventory-Agent-* files and directories from %drivep%\cpan\sources
for /d /r %drivep%\cpan\sources %%d in (FusionInventory-Agent-*) do @if exist "%%d" rd /s/q "%%d"
del /q /f %drivep%\cpan\sources\FusionInventory-Agent-*.tar.gz 2> NUL
del /q /f %drivep%\cpan\sources\FusionInventory-Agent-*.tar 2> NUL

:: download modules 
cd /d %drivep%\cpan\sources
%drivep%\..\..\..\..\Tools\curl\x86\curl --remote-name --location --max-redirs 2 %CPAN_MIRROR%%CPAN_MIRROR_PATH_PREFIX%%FUSINV_AGENT%
%drivep%\..\..\..\..\Tools\curl\x86\curl --remote-name --location --max-redirs 2 %CPAN_MIRROR%%CPAN_MIRROR_PATH_PREFIX%%FUSINV_TASK_DEPLOY%
%drivep%\..\..\..\..\Tools\curl\x86\curl --remote-name --location --max-redirs 2 %CPAN_MIRROR%%CPAN_MIRROR_PATH_PREFIX%%FUSINV_TASK_ESX%
%drivep%\..\..\..\..\Tools\curl\x86\curl --remote-name --location --max-redirs 2 %CPAN_MIRROR%%CPAN_MIRROR_PATH_PREFIX%%FUSINV_TASK_NETWORK%
cd /d %drivep%

:: extract files %drivep%\cpan\sources\FusionInventory-Agent-*.tar.gz
%drivep%\..\..\..\..\Tools\7zip\x86\7za.exe x -bd -y -o%drivep%\cpan\sources %drivep%\cpan\sources\FusionInventory-Agent-*.tar.gz > NUL

:: extract files %drivep%\cpan\sources\FusionInventory-Agent-*.tar
%drivep%\..\..\..\..\Tools\7zip\x86\7za.exe x -bd -y -o%drivep%\cpan\sources %drivep%\cpan\sources\FusionInventory-Agent-*.tar > NUL

:: erase files %drivep%\cpan\sources\FusionInventory-Agent-*.tar.gz
del /q /f %drivep%\cpan\sources\FusionInventory-Agent-*.tar.gz 2> NUL

:: erase files %drivep%\cpan\sources\FusionInventory-Agent-*.tar
del /q /f %drivep%\cpan\sources\FusionInventory-Agent-*.tar 2> NUL
