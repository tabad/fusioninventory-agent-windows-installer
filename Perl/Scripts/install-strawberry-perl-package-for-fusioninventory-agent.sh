#!/bin/bash
# ------------------------------------------------------------------------
# FusionInventory
# Copyright (C) 2010-2012 by the FusionInventory Development Team.
#
# http://www.fusioninventory.org/   http://forge.fusioninventory.org/
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
# @file      .\Perl\Scripts\install-strawberry-perl-package-for-fusioninventory-agent.sh
# @author    Tomas Abad
# @copyright Copyright (c) 2010-2012 FusionInventory Team
# @license   GNU GPL version 2 or (at your option) any later version
#            http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
# @link      http://www.fusioninventory.org/
# @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
# @since     2012
#
# ------------------------------------------------------------------------


# Load perl environment
source ./load-perl-environment

declare basename=''
declare proxy_file=''
declare script_suffix=''

declare -r curl=$(type -P curl)
declare -r install=$(type -P install)
declare -r rm=$(type -P rm)
declare -r tar=$(type -P tar)

# Check the OS
if [ "${MSYSTEM}" = "MSYS" ]; then
   # Windows OS with MinGW/MSYS

   basename="${0##*\\}"
   proxy_file='load-proxy-environment.bat'
   script_suffix='bat'
else
   if [ -n "${WINDIR}" ]; then
      # It's a Windows OS

      basename="${0##*\\}"

      echo
      echo -n "You can not launch '${basename}' directly. "
      echo "Please, launch '${basename%.sh}.bat' instead."
      echo

      exit 1
   fi

   # It's a UNIX OS.

   basename="${0##*/}"
   proxy_file='load-proxy-environment'
   script_suffix='sh'

   # Load proxy environment
   source ./load-proxy-environment
fi

# Check whether Strawberry Perl ${strawberry_path} is already installed
if [ -d "${strawberry_path}" ]; then
   echo
   echo "Sorry but it seems that Strawberry Perl ${strawberry_release} (${strawberry_version}-32/64bits)"
   echo "is already installed into the '${strawberry_path}' directory."
   echo "Please, uninstall it with 'uninstall-strawberry-perl.${script_suffix}' and try again."
   echo

   exit 2
elif [ ! -d "${strawberry_path%/${strawberry_version}}" ]; then
   ${install} --mode 0775 --directory "${strawberry_path%/${strawberry_version}}"
fi

# Download ${strawberry_pepfia_url}/${strawberry_pepfia_file}
echo "Installing Strawberry Perl ${strawberry_release} (${strawberry_version}-32/64bits)"
echo -n " Portable Edition Package for FusionInventory-Agent (BuildId ${strawberry_pepfia_build_id})."
${curl} --silent --output "/tmp/${strawberry_pepfia_file}" "${strawberry_pepfia_url}/${strawberry_pepfia_file}" > /dev/null 2>&1

# Check download operation
if [ -f "/tmp/${strawberry_pepfia_file}" ]; then
   echo -n "."
   ${tar} -C "${strawberry_pepfia_path}" -xf "/tmp/${strawberry_pepfia_file}"
   echo -n "."
   ${rm} -f "/tmp/${strawberry_pepfia_file}"
   echo ".Done!"
else
   echo "Failure!"
   echo
   echo "There has been an error downloading '${strawberry_pepfia_url}/${strawberry_pepfia_file}'."
   echo
   echo "Whether you are behind a proxy system, please, edit file"
   echo "'${proxy_file}', follow its instructions and try again."
fi

echo
