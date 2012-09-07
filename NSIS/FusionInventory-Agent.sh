#!/bin/bash

#
# ------------------------------------------------------------------------
# FusionInventory Agent Installer for Microsoft Windows
# Copyright (C) 2010-2012 by the FusionInventory Development Team.
#
# http://www.fusioninventory.org/ http://forge.fusioninventory.org/
# ------------------------------------------------------------------------
#
# LICENSE
#
# This file is part of FusionInventory project.
#
# FusionInventory Agent Installer for Microsoft Windows is free software;
# you can redistribute it and/or modify it under the terms of the GNU
# General Public License as published by the Free Software Foundation;
# either version 2 of the License, or (at your option) any later version.
#
#
# FusionInventory Agent Installer for Microsoft Windows is distributed in
# the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
# the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
# PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
# or see <http://www.gnu.org/licenses/>.
#
# ------------------------------------------------------------------------
#
# @package   FusionInventory Agent Installer for Microsoft Windows
# @file      .\FusionInventory-Agent.sh
# @author    Tomas Abad
# @copyright Copyright (c) 2010-2012 FusionInventory Team
# @license   GNU GPL version 2 or (at your option) any later version
#            http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
# @link      http://www.fusioninventory.org/
# @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
# @since     2012
#
# ------------------------------------------------------------------------
#

declare -r makensis=$(type -P makensis)

## Build x86 installer
echo Please wait. Compilling x86 installer...
${makensis} -V3 -O./FusionInventory-Agent_MakeNSIS-Output-x86.txt -DFIAI_PLATFORM_ARCHITECTURE=x86 -DOS_BUILDER_NO_WINDOWS ./FusionInventory-Agent.nsi
echo Done!

## Build x86 installer
echo Please wait. Compilling x64 installer...
${makensis} -V3 -O./FusionInventory-Agent_MakeNSIS-Output-x64.txt -DFIAI_PLATFORM_ARCHITECTURE=x64 -DOS_BUILDER_NO_WINDOWS ./FusionInventory-Agent.nsi
echo Done!
