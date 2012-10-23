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
# @file      .\Perl\Scripts\patch-fusioninventory-agent-and-tasks.sh
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
declare base_path=''
declare fusinv_mod=''
declare script_suffix=''

declare -r diff=$(type -P diff)
declare -r find=$(type -P find)
declare -r rsync=$(type -P rsync)
declare -r sed=$(type -P sed)

# Check the OS
if [ "${MSYSTEM}" = "MSYS" ]; then
   # Windows OS with MinGW/MSYS

   basename="${0##*\\}"
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

# Patcher loop
while (( ${iter} < ${#archs[@]} )); do
   # Set arch and arch_label
   arch=${archs[${iter}]}
   arch_label=${arch_labels[${iter}]}

   # Get base_path
   fusinv_mod="${fusinv_agent##*/}"
   fusinv_mod="${fusinv_mod%.*.*}"
   eval base_path="${strawberry_arch_path}/cpan/sources/${fusinv_mod}"

   # Check whether 'install-fusioninventory-agent-and-tasks.${script_suffix}' was launched
   if [ ! -d "${base_path}" ]; then
      echo
      echo "Sorry but it seems that you didn't install FusionInventory-Agent and its tasks"
      echo "before. Please, install them with 'install-fusioninventory-agent-and-tasks.${script_suffix}'"
      echo "and try again."
      echo

      break
   fi

   # Display task
   echo -n "Patching FusionInventory-Agent and Tasks for Strawberry Perl ${strawberry_release} (${strawberry_version}-${arch_label}s)."

   # Patches for FusionInventory-Agent
   #   File ./fusioninventory-agent
   if [ ! -f "${base_path}/fusioninventory-agent.org" ]; then
      ${rsync} -a "${base_path}/fusioninventory-agent" \
                  "${base_path}/fusioninventory-agent.org"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2,"          \
             -e "s,\(confdir => '\)./etc\('\,\),\1../../etc\2,"     \
             -e "s,\(datadir => '\)./share\('\,\),\1../../share\2," \
             -e "s,\(libdir  => '\)./lib\('\,\),\1../agent\2,"      \
             -e "s,\(vardir  => '\)./var\('\,\),\1../../var\2,"     \
             -e "s,\(PREFIX/\)etc\(/agent.cfg.\),\1../../etc\2,"    \
             "${base_path}/fusioninventory-agent"
   echo -n "."
   (cd "${base_path}";                      \
    ${diff} -u "fusioninventory-agent.org"  \
               "fusioninventory-agent"  > "fusioninventory-agent.patch")
   echo -n "."

   #   File ./fusioninventory-win32-service
   if [ ! -f "${base_path}/fusioninventory-win32-service.org" ]; then
      ${rsync} -a "${base_path}/fusioninventory-win32-service" \
                  "${base_path}/fusioninventory-win32-service.org"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2,"                                          \
             -e "s,\(confdir => \$directory . '\)/../../etc/fusioninventory\('\,\),\1/../../etc\2," \
             -e "s,\(libdir  => \$directory . '\)/../../lib\('\,\),\1/../agent\2,"                  \
             "${base_path}/fusioninventory-win32-service"
   echo -n "."
   (cd "${base_path}";                      \
    ${diff} -u "fusioninventory-win32-service.org"  \
               "fusioninventory-win32-service"  > "fusioninventory-win32-service.patch")
   echo -n "."

   # Patches for FusionInventory-Agent Task Deploy
   #fusinv_mod="${fusinv_task_deploy##*/}"
   #fusinv_mod="${fusinv_mod%.*.*}"
   #eval base_path="${strawberry_arch_path}/cpan/sources/${fusinv_mod}"
   #   There are not files to patch

   # Patches for FusionInventory-Agent Task ESX
   fusinv_mod="${fusinv_task_esx##*/}"
   fusinv_mod="${fusinv_mod%.*.*}"
   eval base_path="${strawberry_arch_path}/cpan/sources/${fusinv_mod}"
   #   File ./fusioninventory-esx
   if [ ! -f "${base_path}/fusioninventory-esx.org" ]; then
      ${rsync} -a "${base_path}/fusioninventory-esx" \
                  "${base_path}/fusioninventory-esx.org"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2," \
             "${base_path}/fusioninventory-esx"
   echo -n "."
   (cd "${base_path}";                   \
    ${diff} -u "fusioninventory-esx.org" \
               "fusioninventory-esx"  > "fusioninventory-esx.patch")
   echo -n "."

   # Patches for FusionInventory-Agent Task Network
   fusinv_mod="${fusinv_task_network##*/}"
   fusinv_mod="${fusinv_mod%.*.*}"
   eval base_path="${strawberry_arch_path}/cpan/sources/${fusinv_mod}"
   #   File ./fusioninventory-netdiscovery
   if [ ! -f "${base_path}/fusioninventory-netdiscovery.org" ]; then
      ${rsync} -a "${base_path}/fusioninventory-netdiscovery" \
                  "${base_path}/fusioninventory-netdiscovery.org"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2," \
             "${base_path}/fusioninventory-netdiscovery"
   echo -n "."
   (cd "${base_path}";                   \
    ${diff} -u "fusioninventory-netdiscovery.org" \
               "fusioninventory-netdiscovery"  > "fusioninventory-netdiscovery.patch")
   echo -n "."

   #   File ./fusioninventory-netinventory
   if [ ! -f "${base_path}/fusioninventory-netinventory.org" ]; then
      ${rsync} -a "${base_path}/fusioninventory-netinventory" \
                  "${base_path}/fusioninventory-netinventory.org"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2," \
             "${base_path}/fusioninventory-netinventory"
   echo -n "."
   (cd "${base_path}";                   \
    ${diff} -u "fusioninventory-netinventory.org" \
               "fusioninventory-netinventory"  > "fusioninventory-netinventory.patch")
   echo ".Done!"

   # Show files patched
   echo "List of patch files..."
   (eval cd "${strawberry_arch_path}/cpan/sources"; ${find} . -type f -name '*.patch')

   # New architecture
   iter=$(( ${iter} + 1 ))
done

echo
