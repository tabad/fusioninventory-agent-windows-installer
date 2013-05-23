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
# @file      .\Perl\Scripts\update-ids-repositories.sh
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

declare basename=''
declare base_path=''
declare proxy_file=''
declare script_suffix=''

declare -i arch_iter=0
declare -i repo_iter=0
declare -i repos_reached=0

declare ids_repository_url=""
declare ids_repository_file=""
declare ids_repository_label=""
declare ids_repository_new_version=""
declare ids_repository_old_version=""
declare -a -r ids_repository_files=(pci.ids usb.ids)
declare -a -r ids_repository_labels=(PCI USB)
declare -a -r ids_repository_urls=(http://pci-ids.ucw.cz/v2.2/pci.ids http://www.linux-usb.org/usb.ids)

declare -r curl=$(type -P curl)
declare -r grep=$(type -P grep)
declare -r install=$(type -P install)
declare -r rm=$(type -P rm)

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
fi

# Check whether Strawberry Perl ${strawberry_path} is already installed
if [ ! -d "${strawberry_path}" ]; then
   echo
   echo "Sorry but it seems that Strawberry Perl ${strawberry_release} (${strawberry_version}-32/64bits)"
   echo "is not installed into the '${strawberry_path}' directory."
   if [ "${MSYSTEM}" = "MSYS" ]; then
      # Windows OS with MinGW/MSYS
      echo "Please, install it with 'install-strawberry-perl.bat' or with"
      echo "'install-strawberry-perl-package-for-fusioninventory-agent.sh', and try again."
   else
      # UNIX OS
      echo "Please, install it with 'install-strawberry-perl-package-for-fusioninventory-agent.sh',"
      echo "and try it again."
   fi
   echo

   exit 3
fi

# Download loop
while (( ${repo_iter} < ${#ids_repository_urls[@]} )); do
   # Set ids_repository_url, ids_repository_file and ids_repository_label
   ids_repository_url=${ids_repository_urls[${repo_iter}]}
   ids_repository_file=${ids_repository_files[${repo_iter}]}
   ids_repository_label=${ids_repository_labels[${repo_iter}]}

   # Download IDs repositories
   echo -n "Downloading ${ids_repository_label} IDs repository."

   # Download IDs repository
   ${curl} --silent --location --max-redirs 6 --output "/tmp/${ids_repository_file}" \
      "${ids_repository_url}" > /dev/null 2>&1

   # Check download operation
   if [ -f "/tmp/${ids_repository_file}" ]; then
      repos_reached=$(( ${repos_reached} + 1 ))
      echo ".Done!"
   else
      echo "Failure!"
   fi

   # New repository
   repo_iter=$(( ${repo_iter} + 1 ))
done

# Check the download process
if (( ${repos_reached} == 0 )); then
   echo
   echo "There has been an error downloading all the IDs repositories."
   echo
   echo "Whether you are behind a proxy system, please, edit file"
   echo "'${proxy_file}', follow its instructions and try again."
   echo
   exit 3
elif (( ${repos_reached} < ${#ids_repository_urls[@]} )); then
   echo
   echo "There has been at least an error downloading the IDs repositories."
   echo
   echo "Please, check the URLs of the repositories and try again."
   echo "This process only update some of them."
   echo
fi

# Patcher loop
while (( ${arch_iter} < ${#archs[@]} )); do
   # Set arch and arch_label
   arch=${archs[${arch_iter}]}
   arch_label=${arch_labels[${arch_iter}]}

   # Get base_path
   eval base_path="${strawberry_arch_path}/cpan/sources/${fusinv_agent_mod_name}-${fusinv_agent_commit}"

   # Check whether 'install-fusioninventory-agent.${script_suffix}' was launched
   if [ ! -d "${base_path}" ]; then
      echo
      echo "Sorry but it seems that you didn't install FusionInventory-Agent before."
      echo "Please, install it with 'install-fusioninventory-agent.${script_suffix}' and try again."
      echo

      break
   fi

   # Set repo_iter
   repo_iter=0

   # Display task
   echo "Updating IDs repositories in FusionInventory-Agent for Strawberry Perl ${strawberry_release} (${strawberry_version}-${arch_label}s)..."

   # Download loop
   while (( ${repo_iter} < ${#ids_repository_urls[@]} )); do
      # Set ids_repository_file and ids_repository_label
      ids_repository_file=${ids_repository_files[${repo_iter}]}
      ids_repository_label=${ids_repository_labels[${repo_iter}]}

      # Whether the file of the IDs repository exists...
      if [ -f "/tmp/${ids_repository_file}" ]; then
         echo -n "  Updating ${ids_repository_label} IDs repository."
         ids_repository_old_version="$(${grep} '^#[	| ]Version: ' ${base_path}/share/${ids_repository_file})"
         ids_repository_old_version="${ids_repository_old_version#*: }"
         echo -n "."
         #${install} --mode 0644 "/tmp/${ids_repository_file}" "${base_path}/share/${ids_repository_file}" > /dev/null 2>&1
         ${install} --mode 0644 "/tmp/${ids_repository_file}" "${base_path}/share/${ids_repository_file}"
         echo -n "."
         ids_repository_new_version="$(${grep} '^#[	| ]Version: ' ${base_path}/share/${ids_repository_file})"
         ids_repository_new_version="${ids_repository_new_version#*: }"
         echo ".Done!"
         echo "      File '${ids_repository_file}' updated from version '${ids_repository_old_version}' to version '${ids_repository_new_version}'."
      fi

      # New repository
      repo_iter=$(( ${repo_iter} + 1 ))
   done

   # New architecture
   arch_iter=$(( ${arch_iter} + 1 ))
done

# Delete temporal files
repo_iter=0
while (( ${repo_iter} < ${#ids_repository_urls[@]} )); do
   ids_repository_file=${ids_repository_files[${repo_iter}]}
   ${rm} -f "/tmp/${ids_repository_file}" > /dev/null 2>&1
   repo_iter=$(( ${repo_iter} + 1 ))
done

echo
