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
:: @file      .\Perl\Scripts\show-all-modules-dependence.bat    
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

:: show all modules dependence 
perl %drivep%\perl\bin\cpanm --auto-cleanup 1 --quiet --scandeps --local-lib-contained %FUSINV_AGENT% %FUSINV_TASKS% %OTHER_NEEDED_MODULES%
