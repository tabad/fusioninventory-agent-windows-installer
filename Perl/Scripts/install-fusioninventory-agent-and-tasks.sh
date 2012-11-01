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

declare fusinv_agent_url=''
declare fusinv_agent_filename=''
declare fusinv_task_deploy_url=''
declare fusinv_task_deploy_filename=''
declare fusinv_task_esx_url=''
declare fusinv_task_esx_filename=''
declare fusinv_task_network_url=''
declare fusinv_task_network_filename=''

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
if [ ! -d "${strawberry_path}" ]; then
   echo
   echo "Sorry but it seems that Strawberry Perl ${strawberry_release} (${strawberry_version}-32/64bits)"
   echo "is not installed into the '${strawberry_path}' directory."
   echo "Please, install it with 'install-strawberry-perl.${script_suffix}' and try again."
   echo

   exit 2
fi

# Set file names and URLs
fusinv_agent_url="${fusinv_agent_repository%.git}/tarball/${fusinv_agent_commit}"
fusinv_agent_filename="${fusinv_agent_mod_name}-${fusinv_agent_commit}.tar.gz"
fusinv_task_deploy_url="${fusinv_task_deploy_repository%.git}/tarball/${fusinv_task_deploy_commit}"
fusinv_task_deploy_filename="${fusinv_task_deploy_mod_name}-${fusinv_task_deploy_commit}.tar.gz"
fusinv_task_esx_url="${fusinv_task_esx_repository%.git}/tarball/${fusinv_task_esx_commit}"
fusinv_task_esx_filename="${fusinv_task_esx_mod_name}-${fusinv_task_esx_commit}.tar.gz"
fusinv_task_network_url="${fusinv_task_network_repository%.git}/tarball/${fusinv_task_network_commit}"
fusinv_task_network_filename="${fusinv_task_network_mod_name}-${fusinv_task_network_commit}.tar.gz"

# Download FusionInventory-Agent and Tasks
echo -n "Downloading FusionInventory-Agent and Tasks."

# Download FusionInventory-Agent
${curl} --silent --location --max-redirs 6 --output "/tmp/${fusinv_agent_filename}" \
   "${fusinv_agent_url}" > /dev/null 2>&1

# Check download operation
if [ -f "/tmp/${fusinv_agent_filename}" ]; then
   echo -n "."
else
   echo "Failure!"
   echo
   echo "There has been an error downloading '${fusinv_agent_url}'."
   echo
   echo "Whether you are behind a proxy system, please, edit file"
   echo "'${proxy_file}', follow its instructions and try again."
   echo

   exit 3
fi

# Download FusionInventory-Agent-Task-Deploy
${curl} --silent --location --max-redirs 6 --output "/tmp/${fusinv_task_deploy_filename}" \
   "${fusinv_task_deploy_url}" > /dev/null 2>&1

# Check download operation
if [ -f "/tmp/${fusinv_task_deploy_filename}" ]; then
   echo -n "."
else
   echo "Failure!"
   echo
   echo "There has been an error downloading '${fusinv_task_deploy_url}'."
   echo
   echo "Whether you are behind a proxy system, please, edit file"
   echo "'${proxy_file}', follow its instructions and try again."
   echo

   # Delete previous downloads
   ${rm} -f "/tmp/${fusinv_agent_filename}" > /dev/null 2>&1

   exit 3
fi

# Download FusionInventory-Agent-Task-ESX
${curl} --silent --location --max-redirs 6 --output "/tmp/${fusinv_task_esx_filename}" \
   "${fusinv_task_esx_url}" > /dev/null 2>&1

# Check download operation
if [ -f "/tmp/${fusinv_task_esx_filename}" ]; then
   echo -n "."
else
   echo "Failure!"
   echo
   echo "There has been an error downloading '${fusinv_task_esx_url}'."
   echo
   echo "Whether you are behind a proxy system, please, edit file"
   echo "'${proxy_file}', follow its instructions and try again."
   echo

   # Delete previous downloads
   ${rm} -f "/tmp/${fusinv_agent_filename}" > /dev/null 2>&1
   ${rm} -f "/tmp/${fusinv_task_deploy_filename}" > /dev/null 2>&1

   exit 3
fi

# Download FusionInventory-Agent-Task-Network
${curl} --silent --location --max-redirs 6 --output "/tmp/${fusinv_task_network_filename}" \
   "${fusinv_task_network_url}" > /dev/null 2>&1

# Check download operation
if [ -f "/tmp/${fusinv_task_network_filename}" ]; then
   echo ".Done!"
else
   echo "Failure!"
   echo
   echo "There has been an error downloading '${fusinv_task_network_url}'."
   echo
   echo "Whether you are behind a proxy system, please, edit file"
   echo "'${proxy_file}', follow its instructions and try again."
   echo

   # Delete previous downloads
   ${rm} -f "/tmp/${fusinv_agent_filename}" > /dev/null 2>&1
   ${rm} -f "/tmp/${fusinv_task_deploy_filename}" > /dev/null 2>&1
   ${rm} -f "/tmp/${fusinv_task_esx_filename}" > /dev/null 2>&1

   exit 3
fi

# Installation loop
while (( ${iter} < ${#archs[@]} )); do
   # Set arch and arch_label
   arch=${archs[${iter}]}
   arch_label=${arch_labels[${iter}]}

   # Delete current modules
   eval ${rm} -rf "${strawberry_arch_path}/cpan/sources/FusionInventory-Agent-*" > /dev/null 2>&1

   # Install modules
   echo -n "Installing into Strawberry Perl ${strawberry_release} (${strawberry_version}-${arch_label}s)."
   eval ${install} --mode 0775 --directory "${strawberry_arch_path}/cpan/sources/${fusinv_agent_filename%.tar.gz}"
   eval ${tar} -C "${strawberry_arch_path}/cpan/sources/${fusinv_agent_filename%.tar.gz}" \
      --strip-components 1 -xf "/tmp/${fusinv_agent_filename}" > /dev/null 2>&1
   if (( $? == 0 )); then
      echo -n "."
      eval ${install} --mode 0775 --directory "${strawberry_arch_path}/cpan/sources/${fusinv_task_deploy_filename%.tar.gz}"
      eval ${tar} -C "${strawberry_arch_path}/cpan/sources/${fusinv_task_deploy_filename%.tar.gz}" \
         --strip-components 1 -xf "/tmp/${fusinv_task_deploy_filename}" > /dev/null 2>&1
      if (( $? == 0 )); then
         echo -n "."
         eval ${install} --mode 0775 --directory "${strawberry_arch_path}/cpan/sources/${fusinv_task_esx_filename%.tar.gz}"
         eval ${tar} -C "${strawberry_arch_path}/cpan/sources/${fusinv_task_esx_filename%.tar.gz}" \
            --strip-components 1 -xf "/tmp/${fusinv_task_esx_filename}" > /dev/null 2>&1
         if (( $? == 0 )); then
            echo -n "."
            eval ${install} --mode 0775 --directory "${strawberry_arch_path}/cpan/sources/${fusinv_task_network_filename%.tar.gz}"
            eval ${tar} -C "${strawberry_arch_path}/cpan/sources/${fusinv_task_network_filename%.tar.gz}" \
               --strip-components 1 -xf "/tmp/${fusinv_task_network_filename}" > /dev/null 2>&1
            if (( $? == 0 )); then
               echo ".Done!"
            else
               echo "Failure!"
               echo
               echo "There has been an error unpacking '${fusinv_task_network_filename}'."
               echo
               echo -n "Perhaps the URL '${fusinv_task_network_url}' is incorrect. "
               echo -n "Please, check the variables 'fusinv_task_network_repository' and 'fusinv_task_network_commit' "
               echo "in the 'load-perl-environment' file, and try again."
            fi
         else
            echo "Failure!"
            echo
            echo "There has been an error unpacking '${fusinv_task_esx_filename}'."
            echo
            echo -n "Perhaps the URL '${fusinv_task_esx_url}' is incorrect. "
            echo -n "Please, check the variables 'fusinv_task_esx_repository' and 'fusinv_task_esx_commit' "
            echo "in the 'load-perl-environment' file, and try again."
         fi
      else
         echo "Failure!"
         echo
         echo "There has been an error unpacking '${fusinv_task_deploy_filename}'."
         echo
         echo -n "Perhaps the URL '${fusinv_task_deploy_url}' is incorrect. "
         echo -n "Please, check the variables 'fusinv_task_deploy_repository' and 'fusinv_task_deploy_commit' "
         echo "in the 'load-perl-environment' file, and try again."
      fi
   else
      echo "Failure!"
      echo
      echo "There has been an error unpacking '${fusinv_agent_filename}'."
      echo
      echo -n "Perhaps the URL '${fusinv_agent_url}' is incorrect. "
      echo -n "Please, check the variables 'fusinv_agent_repository' and 'fusinv_agent_commit' "
      echo "in the 'load-perl-environment' file, and try again."
   fi

   # New architecture
   iter=$(( ${iter} + 1 ))
done

# Delete previous downloads
${rm} -f "/tmp/${fusinv_agent_filename}" > /dev/null 2>&1
${rm} -f "/tmp/${fusinv_task_deploy_filename}" > /dev/null 2>&1
${rm} -f "/tmp/${fusinv_task_esx_filename}" > /dev/null 2>&1
${rm} -f "/tmp/${fusinv_task_network_filename}" > /dev/null 2>&1

echo
