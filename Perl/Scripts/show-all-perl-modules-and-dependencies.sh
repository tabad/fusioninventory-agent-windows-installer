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
# @file      .\Perl\Scripts\show-all-perl-modules-and-dependencies.sh
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

declare perl=''
declare cpanm=''
declare perl_path=''

declare -i iter=0
declare basename=''

declare -r rm=$(type -P rm)

# Check the OS
if [ "${MSYSTEM}" = "MSYS" ]; then
   # Windows OS with MinGW/MSYS

   basename="${0##*\\}"

   # Set terminal
   TERM=dumb

   # Avoid collisions with other perl stuff on your system
   unset PERL_JSON_BACKEND
   unset PERL_YAML_BACKEND
   unset PERL5LIB
   unset PERL5OPT
   unset PERL_MM_OPT
   unset PERL_MB_OPT
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
if [ ! -d "${strawberry_path}" ]; then
   echo
   echo "Sorry but it seems that Strawberry Perl ${strawberry_release} (${strawberry_version}-32/64bits)"
   echo "is not installed into the '${strawberry_path}' directory."
   echo "Please, install it with 'install-strawberry-perl.bat' and try again."
   echo
   exit 3
fi

# Installation loop
while (( ${iter} < ${#archs[@]} )); do
   # Set arch and arch_label
   arch=${archs[${iter}]}
   arch_label=${arch_labels[${iter}]}

   # Add perl_path to PATH
   eval perl_path="$(pwd)/${strawberry_arch_path}/perl/site/bin:"
   eval perl_path="${perl_path}$(pwd)/${strawberry_arch_path}/perl/bin:"
   eval perl_path="${perl_path}$(pwd)/${strawberry_arch_path}/c/bin:"
   PATH="${perl_path}${PATH}"

   # Set perl and cpanm
   perl=$(type -P perl)
   cpanm=$(type -P cpanm)

   # Remove temporary cpanm files
   eval ${rm} -rf "$(pwd)/${strawberry_arch_path}/data/.cpanm" > /dev/null 2>&1

   # Show all modules dependencies
   echo "All Strawberry Perl ${strawberry_release} (${strawberry_version}-${arch_label}s) modules dependencies..."

   ${perl} ${cpanm} --scandeps --local-lib-contained --auto-cleanup 1 --quiet      \
                    ${cpan_mirror}${cpan_mirror_path_prefix}${fusinv_agent}        \
                    ${cpan_mirror}${cpan_mirror_path_prefix}${fusinv_task_deploy}  \
                    ${cpan_mirror}${cpan_mirror_path_prefix}${fusinv_task_esx}     \
                    ${cpan_mirror}${cpan_mirror_path_prefix}${fusinv_task_network} \
                    ${other_needed_modules}

   # Remove perl_path from PATH
   PATH="${PATH/${perl_path}/}"

   # New architecture
   iter=$(( ${iter} + 1 ))
done

echo
