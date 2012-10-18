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
# @file      .\Perl\Scripts\uninstall-strawberry-perl.sh
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

declare -i iter=0
declare user_answer=''
declare basename=''

declare -r ls=$(type -P ls)
declare -r rm=$(type -P rm)

# Check the OS
if [ "${MSYSTEM}" = "MSYS" ]; then
   # Windows OS with MinGW/MSYS

   basename="${0##*\\}"

   # No operation
   echo > /dev/null
else
   if [ -n "${WINDIR}" ]; then
      # It's a Windows OS

      basename="${0##*\\}"

      echo
      echo "You can not launch '${basename}' directly. Please, launch"
      echo "'${basename%.sh}.bat' instead."
      echo

      exit 1
   fi

   # It's a UNIX OS.

   basename="${0##*/}"
fi

# Check whether Strawberry Perl ${strawberry_path} is already installed
if [ ! -d "${strawberry_path}" ]; then
   echo
   echo "Sorry but it seems that Strawberry Perl ${strawberry_release} (${strawberry_version}-32/64bits)"
   echo "is not installed into the '${strawberry_path}' directory."
   echo
   exit 0
fi

# Get confirmation
echo "You are going to delete completely the '${strawberry_path}' directory."
read -p "Are you completely sure [y/N]? " -n 1 -t 10 user_answer
echo

if [ "${user_answer}" = "" ]  ||
   [ "${user_answer}" = "n" ] ||
   [ "${user_answer}" = "N" ]; then
   echo "Operation aborted by the user or timeout reached."
   exit 2
elif [ "${user_answer}" != "y" ] &&
     [ "${user_answer}" != "Y" ]; then
     echo "Please, you should answer with a simple yes [yY] or no [nN]."
   echo "Operation aborted by the system."
   exit 3
fi

# Uninstallation loop
while (( ${iter} < ${#archs[@]} )); do
   # Set 'arch' and 'arch_label'
   arch=${archs[${iter}]}
   arch_label=${arch_labels[${iter}]}

   # Uninstall (delete) ${strawberry_arch_path}
   echo -n "Uninstalling Strawberry Perl ${strawberry_release} (${strawberry_version}-${arch_label}s)."
   eval ${rm} -rf "${strawberry_arch_path}"
   echo ".Done!"

   # New architecture
   iter=$(( ${iter} + 1 ))
done

# Uninstall (delete) ${strawberry_path}
echo -n "Deleting Strawberry Perl ${strawberry_release} (${strawberry_version}) base directory."
${rm} -rf "${strawberry_path}"
echo -n "."

# Delete ${strawberry_path%/${strawberry_version}} whether it is empty
if [ "$(${ls} -A ${strawberry_path%/${strawberry_version}} 2> /dev/null)" = "" ]; then
   ${rm} -rf "${strawberry_path%/${strawberry_version}}"
   echo ".Done!"
else
   echo "Done!"
fi

echo
