#!/bin/bash
# ------------------------------------------------------------------------
# FusionInventory
# Copyright (C) 2010-2013 by the FusionInventory Development Team.
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
# @file      .\Perl\Scripts\install-strawberry-perl.sh
# @author    Tomas Abad <tabadgp@gmail.com>
# @copyright Copyright (c) 2010-2013 FusionInventory Team
# @license   GNU GPL version 2 or (at your option) any later version
#            http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
# @link      http://www.fusioninventory.org/
# @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
# @since     2012
#
# ------------------------------------------------------------------------


# Load perl environment
source ./load-perl-environment

declare -i iter=0
declare basename=''

declare -r curl=$(type -P curl)
declare -r install=$(type -P install)
declare -r p7z=$(type -P 7z)
declare -r rm=$(type -P rm)

# Check the OS
if [ "${MSYSTEM}" = "MSYS" ]; then
   # Windows OS with MinGW/MSYS

   basename="${0##*\\}"
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

   echo
   echo "You should launch '${basename}' only from a Microsoft Windows OS."
   echo

   exit 2
fi

# Check whether Strawberry Perl ${strawberry_path} is already installed
if [ -d "${strawberry_path}" ]; then
   echo
   echo "Sorry but it seems that Strawberry Perl ${strawberry_release} (${strawberry_version}-32/64bits)"
   echo "is already installed into the '${strawberry_path}' directory."
   echo "Remove it with 'uninstall-strawberry-perl.bat' and try again."
   echo
   exit 0
elif [ ! -d "${strawberry_path%/${strawberry_version}}" ]; then
   ${install} --mode 0775 --directory "${strawberry_path%/${strawberry_version}}"
fi

# Installation loop
while (( ${iter} < ${#archs[@]} )); do
   # Set arch and arch_label
   arch=${archs[${iter}]}
   arch_label=${arch_labels[${iter}]}

   # Download ${strawberry_arch_url}
   echo -n "Installing Strawberry Perl ${strawberry_release} (${strawberry_version}-${arch_label}s)."
   eval ${curl} --silent --location --max-redirs 6 --output "/tmp/${strawberry_arch_url##*/}" \
      "${strawberry_arch_url}" > /dev/null 2>&1

   # Check download operation
   eval test -f "/tmp/${strawberry_arch_url##*/}"
   if (( $? == 0 )); then
      echo -n "."
      eval ${install} --mode 0755 --directory "${strawberry_arch_path}"
      echo -n "."
      eval ${p7z} x -bd -y -o"${strawberry_arch_path}/" "/tmp/${strawberry_arch_url##*/}" > /dev/null 2>&1
      if (( $? == 0 )); then
         echo -n "."
         eval ${rm} -f "/tmp/${strawberry_arch_url##*/}" > /dev/null 2>&1
         echo ".Done!"
      else
         echo "Failure!"
         echo
         eval echo "There has been an error decompressing \'${strawberry_arch_url##*/}\'."
         echo
         eval echo -n "Perhaps the URL \'${strawberry_arch_url}\' is incorrect.\ "
         echo -n "Please, check the variable 'strawberry_arch_url' in the 'load-perl-environment' "
         echo "file, and try again."
         eval ${rm} -f "/tmp/${strawberry_arch_url##*/}" > /dev/null 2>&1
      fi
   else
      echo "Failure!"
      echo
      eval echo "There has been an error downloading \'${strawberry_arch_url}\'."
      echo
      echo "Whether you are behind a proxy system, please, edit file"
      echo "'load-proxy-environment.bat', follow its instructions and try again."
   fi

   # New architecture
   iter=$(( ${iter} + 1 ))
done

echo
