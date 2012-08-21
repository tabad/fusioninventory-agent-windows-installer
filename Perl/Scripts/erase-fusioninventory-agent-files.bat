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
:: @file      .\Perl\Scripts\erase-fusioninventory-agent-files.bat    
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
