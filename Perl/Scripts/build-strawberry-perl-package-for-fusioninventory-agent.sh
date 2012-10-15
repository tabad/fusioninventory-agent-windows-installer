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
# @file      .\Perl\Scripts\build-strawberry-perl-package-for-fusioninventory-agent.sh
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
declare -r basename="${0##*\\}"

declare base_path=""

declare -r p7za=$(type -P 7za)
declare -r rm=$(type -P rm)
declare -r tar=$(type -P tar)

# Check the OS
if [ "${MSYSTEM}" = "MSYS" ]; then
   # Windows OS with MinGW/MSYS

   # No operation
   echo > /dev/null
else
   if [ -n "${WINDIR}" ]; then
      # It's a Windows OS

      echo
      echo "You can not launch '${basename}' directly. Please, launch"
      echo "'${basename%.sh}.bat' instead."
      echo

      exit 1
   fi

   # It's a UNIX OS.

   echo
   echo "You should launch '${basename}' only from a Microsoft Windows OS."
   echo

   exit 2
fi

# Check whether Strawberry Perl ${strawberry_version} is already installed
if [ ! -d "${strawberry_path}" ]; then
   echo
   echo "Sorry but it seems that Strawberry Perl ${strawberry_release} (${strawberry_version}-32/64bits)"
   echo "is not installed into the '${strawberry_path}' directory."
   echo "Please, install it with 'install-strawberry-perl.bat' and try again."
   echo

   exit 3
fi

# Delete current package
${rm} -f "${strawberry_pepfia_path}/${strawberry_pepfia_file}"

# Builder loop
while (( ${iter} < ${#archs[@]} )); do
   # Set arch and arch_label
   arch=${archs[${iter}]}
   arch_label=${arch_labels[${iter}]}

   eval base_path="${strawberry_arch_path}"
   base_path="${base_path#${strawberry_pepfia_path}/*}"

   # Packing
   echo -n "Packing Strawberry Perl ${strawberry_release} (${strawberry_version}-${arch_label}s)."
   ${tar} -r -f "${strawberry_pepfia_path}/${strawberry_pepfia_file%*.xz}" \
          -C "${strawberry_pepfia_path}"                                   \
          "${base_path}/c/bin/"                                            \
          "${base_path}/perl/bin/"                                         \
          "${base_path}/perl/lib/"                                         \
          "${base_path}/perl/site/lib/"                                    \
          "${base_path}/perl/vendor/lib/" > /dev/null 2>&1
   echo ".Done!"

   # New architecture
   iter=$(( ${iter} + 1 ))
done

echo -n "Compressing package Strawberry Perl ${strawberry_release} (${strawberry_version}-32/64bits)."
${p7za} a -bd -mx=9 -- "${strawberry_pepfia_path}/${strawberry_pepfia_file}" \
                       "${strawberry_pepfia_path}/${strawberry_pepfia_file%*.xz}" > /dev/null 2>&1
echo -n "."
${rm} -f "${strawberry_pepfia_path}/${strawberry_pepfia_file%*.xz}"
echo ".Done!"

echo "Package '${strawberry_pepfia_path}/${strawberry_pepfia_file}' built."

echo
