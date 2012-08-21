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
:: @file      .\Perl\Scripts\upgrade-perl-modules-and-dependencies.bat    
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

:: erase temporary cpanm files
rmdir /q /s %drivep%\data\.cpanm 2> NUL

:: upgrade the environment
perl %drivep%\perl\bin\cpanm --auto-cleanup 1 --self-upgrade --installdeps --skip-installed --notest %FUSINV_AGENT% %FUSINV_TASKS% 

:: install other required modules
perl %drivep%\perl\bin\cpanm --auto-cleanup 1 --install --skip-installed --notest %OTHER_NEEDED_MODULES% 

:: show information
echo Take a look at the file %drivep%\data\.cpanm\build.log for more information.
