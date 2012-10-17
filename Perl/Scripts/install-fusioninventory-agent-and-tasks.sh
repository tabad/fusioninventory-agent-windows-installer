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
# @file      .\Perl\Scripts\install-fusioninventory-agent-and-tasks.sh
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
declare basename=''
declare proxy_file=''
declare script_suffix=''

declare -r curl=$(type -P curl)
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
      echo "You can not launch '${basename}' directly. Please, launch"
      echo "'${basename%.sh}.bat' instead."
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

# Check whether Strawberry Perl ${strawberry_version} is already installed
if [ ! -d "${strawberry_path}" ]; then
   echo
   echo "Sorry but it seems that Strawberry Perl ${strawberry_release} (${strawberry_version}-32/64bits)"
   echo "is not installed into the '${strawberry_path}' directory."
   echo "Please, install it with 'install-strawberry-perl.${script_suffix}' and try again."
   echo

   exit 2
fi

# Download FusionInventory-Agent and Tasks
echo -n "Downloading FusionInventory-Agent and Tasks."

# Download ${fusinv_agent}
${curl} --silent --location --max-redirs 6 --output "/tmp/${fusinv_agent##*/}" "${cpan_mirror}${cpan_mirror_path_prefix}${fusinv_agent}" > /dev/null 2>&1

# Check download operation
if [ -f "/tmp/${fusinv_agent##*/}" ]; then
   echo -n "."
else
   echo "Failure!"
   echo
   echo "There has been an error downloading '${fusinv_agent##*/}'."
   echo
   echo "Whether you are behind a proxy system, please, edit file"
   echo "'${proxy_file}', follow its instructions and try again."
   echo

   exit 3
fi

# Download ${fusinv_task_deploy}
${curl} --silent --location --max-redirs 6 --output "/tmp/${fusinv_task_deploy##*/}" "${cpan_mirror}${cpan_mirror_path_prefix}${fusinv_task_deploy}"

# Check download operation
if [ -f "/tmp/${fusinv_task_deploy##*/}" ]; then
   echo -n "."
else
   echo "Failure!"
   echo
   echo "There has been an error downloading '${fusinv_task_deploy##*/}'."
   echo
   echo "Whether you are behind a proxy system, please, edit file"
   echo "'${proxy_file}', follow its instructions and try again."
   echo

   # Delete previous downloads
   ${rm} -f "/tmp/${fusinv_agent##*/}"

   exit 3
fi

# Download ${fusinv_task_esx}
${curl} --silent --location --max-redirs 6 --output "/tmp/${fusinv_task_esx##*/}" "${cpan_mirror}${cpan_mirror_path_prefix}${fusinv_task_esx}"

# Check download operation
if [ -f "/tmp/${fusinv_task_esx##*/}" ]; then
   echo -n "."
else
   echo "Failure!"
   echo
   echo "There has been an error downloading '${fusinv_task_esx##*/}'."
   echo
   echo "Whether you are behind a proxy system, please, edit file"
   echo "'${proxy_file}', follow its instructions and try again."
   echo

   # Delete previous downloads
   ${rm} -f "/tmp/${fusinv_agent##*/}"
   ${rm} -f "/tmp/${fusinv_task_deploy##*/}"

   exit 3
fi

# Download ${fusinv_task_network}
${curl} --silent --location --max-redirs 6 --output "/tmp/${fusinv_task_network##*/}" "${cpan_mirror}${cpan_mirror_path_prefix}${fusinv_task_network}"

# Check download operation
if [ -f "/tmp/${fusinv_task_network##*/}" ]; then
   echo ".Done!"
else
   echo "Failure!"
   echo
   echo "There has been an error downloading '${fusinv_task_network##*/}'."
   echo
   echo "Whether you are behind a proxy system, please, edit file"
   echo "'${proxy_file}', follow its instructions and try again."
   echo

   # Delete previous downloads
   ${rm} -f "/tmp/${fusinv_agent##*/}"
   ${rm} -f "/tmp/${fusinv_task_deploy##*/}"
   ${rm} -f "/tmp/${fusinv_task_esx##*/}"

   exit 3
fi

# Installation loop
while (( ${iter} < ${#archs[@]} )); do
   # Set arch and arch_label
   arch=${archs[${iter}]}
   arch_label=${arch_labels[${iter}]}

   # Delete current modules
   eval ${rm} -rf "${strawberry_arch_path}/cpan/sources/FusionInventory-Agent-*"

   # Install modules
   echo -n "Installing into Strawberry Perl ${strawberry_release} (${strawberry_version}-${arch_label}s)."
   eval ${tar} -C "${strawberry_arch_path}/cpan/sources/" -xzf "/tmp/${fusinv_agent##*/}"
   if (( $? == 0 )); then
      echo -n "."
      eval ${tar} -C "${strawberry_arch_path}/cpan/sources/" -xzf "/tmp/${fusinv_task_deploy##*/}"
      if (( $? == 0 )); then
         echo -n "."
         eval ${tar} -C "${strawberry_arch_path}/cpan/sources/" -xzf "/tmp/${fusinv_task_esx##*/}"
         if (( $? == 0 )); then
            echo -n "."
            eval ${tar} -C "${strawberry_arch_path}/cpan/sources/" -xzf "/tmp/${fusinv_task_network##*/}"
            if (( $? == 0 )); then
               echo ".Done!"
            else
               echo "Failure!"
            fi
         else
            echo "Failure!"
         fi
      else
         echo "Failure!"
      fi
   else
      echo "Failure!"
   fi

   # New architecture
   iter=$(( ${iter} + 1 ))
done

# Delete previous downloads
${rm} -f "/tmp/${fusinv_agent##*/}"
${rm} -f "/tmp/${fusinv_task_deploy##*/}"
${rm} -f "/tmp/${fusinv_task_esx##*/}"
${rm} -f "/tmp/${fusinv_task_network##*/}"

echo
