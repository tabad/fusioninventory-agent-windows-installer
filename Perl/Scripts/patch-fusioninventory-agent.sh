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
# @file      .\Perl\Scripts\patch-fusioninventory-agent.sh
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
declare base_path=''
declare script_suffix=''

declare -r cp=$(type -P cp)
declare -r diff=$(type -P diff)
declare -r find=$(type -P find)
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
   eval base_path="${strawberry_arch_path}/cpan/sources/${fusinv_agent_mod_name}-${fusinv_agent_commit}"

   # Check whether 'install-fusioninventory-agent.${script_suffix}' was launched
   if [ ! -d "${base_path}" ]; then
      echo
      echo "Sorry but it seems that you didn't install FusionInventory-Agent ${fusinv_agent_commit} before."
      echo "Please, install it with 'install-fusioninventory-agent.${script_suffix}' and try again."
      echo

      break
   fi

   # Display task
   echo -n "Patching FusionInventory-Agent ${fusinv_agent_commit} for Strawberry Perl ${strawberry_release} (${strawberry_version}-${arch_label}s)."

   # Patches for file ${base_path}/bin/fusioninventory-agent
   if [ ! -f "${base_path}/bin/fusioninventory-agent.orig" ]; then
      ${cp} -p "${base_path}/bin/fusioninventory-agent" \
               "${base_path}/bin/fusioninventory-agent.orig"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2,"          \
             -e "s,\(confdir => '\)./etc\('\,\),\1../../etc\2,"     \
             -e "s,\(datadir => '\)./share\('\,\),\1../../share\2," \
             -e "s,\(libdir  => '\)./lib\('\,\),\1../agent\2,"      \
             -e "s,\(vardir  => '\)./var\('\,\),\1../../var\2,"     \
             "${base_path}/bin/fusioninventory-agent"
   echo -n "."
   (cd "${base_path}/bin";                  \
    ${diff} -u "fusioninventory-agent.orig"  \
               "fusioninventory-agent" > "fusioninventory-agent.patch")
   echo -n "."

   # Patches for file ${base_path}/bin/fusioninventory-esx
   if [ ! -f "${base_path}/bin/fusioninventory-esx.orig" ]; then
      ${cp} -p "${base_path}/bin/fusioninventory-esx" \
               "${base_path}/bin/fusioninventory-esx.orig"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2," \
             "${base_path}/bin/fusioninventory-esx"
   echo -n "."
   (cd "${base_path}/bin";               \
    ${diff} -u "fusioninventory-esx.orig" \
               "fusioninventory-esx" > "fusioninventory-esx.patch")
   echo -n "."

   # Patches for file ${base_path}/bin/fusioninventory-inventory
   if [ ! -f "${base_path}/bin/fusioninventory-inventory.orig" ]; then
      ${cp} -p "${base_path}/bin/fusioninventory-inventory" \
               "${base_path}/bin/fusioninventory-inventory.orig"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2,"          \
             -e "s,\(confdir => '\)./etc\('\,\),\1../../etc\2,"     \
             -e "s,\(datadir => '\)./share\('\,\),\1../../share\2," \
             -e "s,\(libdir  => '\)./lib\('\,\),\1../agent\2,"      \
             -e "s,\(vardir  => '\)./var\('\,\),\1../../var\2,"     \
             "${base_path}/bin/fusioninventory-inventory"
   echo -n "."
   (cd "${base_path}/bin";                      \
    ${diff} -u "fusioninventory-inventory.org"  \
               "fusioninventory-inventory" > "fusioninventory-inventory.patch")
   echo -n "."

   # Patches for file ${base_path}/bin/fusioninventory-netdiscovery
   if [ ! -f "${base_path}/bin/fusioninventory-netdiscovery.org" ]; then
      ${cp} -p "${base_path}/bin/fusioninventory-netdiscovery" \
               "${base_path}/bin/fusioninventory-netdiscovery.org"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2,"          \
             -e "s,\(confdir => '\)./etc\('\,\),\1../../etc\2,"     \
             -e "s,\(datadir => '\)./share\('\,\),\1../../share\2," \
             -e "s,\(libdir  => '\)./lib\('\,\),\1../agent\2,"      \
             -e "s,\(vardir  => '\)./var\('\,\),\1../../var\2,"     \
             "${base_path}/bin/fusioninventory-netdiscovery"
   echo -n "."
   (cd "${base_path}/bin";                        \
    ${diff} -u "fusioninventory-netdiscovery.org" \
               "fusioninventory-netdiscovery" > "fusioninventory-netdiscovery.patch")
   echo -n "."

   # Patches for file ${base_path}/bin/fusioninventory-netinventory
   if [ ! -f "${base_path}/bin/fusioninventory-netinventory.org" ]; then
      ${cp} -p "${base_path}/bin/fusioninventory-netinventory" \
               "${base_path}/bin/fusioninventory-netinventory.org"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2,"          \
             -e "s,\(confdir => '\)./etc\('\,\),\1../../etc\2,"     \
             -e "s,\(datadir => '\)./share\('\,\),\1../../share\2," \
             -e "s,\(libdir  => '\)./lib\('\,\),\1../agent\2,"      \
             -e "s,\(vardir  => '\)./var\('\,\),\1../../var\2,"     \
             "${base_path}/bin/fusioninventory-netinventory"
   echo -n "."
   (cd "${base_path}/bin";                        \
    ${diff} -u "fusioninventory-netinventory.org" \
               "fusioninventory-netinventory" > "fusioninventory-netinventory.patch")
   echo -n "."

   # Patches for file ${base_path}/bin/fusioninventory-wakeonlan
   if [ ! -f "${base_path}/bin/fusioninventory-wakeonlan.org" ]; then
      ${cp} -p "${base_path}/bin/fusioninventory-wakeonlan" \
               "${base_path}/bin/fusioninventory-wakeonlan.org"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2," \
             "${base_path}/bin/fusioninventory-wakeonlan"
   echo -n "."
   (cd "${base_path}/bin";                     \
    ${diff} -u "fusioninventory-wakeonlan.org" \
               "fusioninventory-wakeonlan" > "fusioninventory-wakeonlan.patch")
   echo -n "."

   # Patches for file ${base_path}/lib/FusionInventory/Agent.pm with version tag
   if [ -n "${fusinv_agent_tag}" ]; then
       if [ ! -f "${base_path}/lib/FusionInventory/Agent.pm.org" ]; then
          ${cp} -p "${base_path}/lib/FusionInventory/Agent.pm" \
                      "${base_path}/lib/FusionInventory/Agent.pm.org"
          echo -n "."
       fi
       ${sed} -i -e "s,\(our \$VERSION = '.*\)\(';\),\1-${fusinv_agent_tag}\2," \
                 "${base_path}/lib/FusionInventory/Agent.pm"
       echo -n "."
       (cd "${base_path}/lib/FusionInventory";         \
        ${diff} -u "Agent.pm.org" "Agent.pm"  > "Agent.pm.patch")
       echo -n "."
    fi

   # Patches for file ${base_path}/bin/fusioninventory-win32-service
   if [ ! -f "${base_path}/bin/fusioninventory-win32-service.org" ]; then
      ${cp} -p "${base_path}/bin/fusioninventory-win32-service" \
               "${base_path}/bin/fusioninventory-win32-service.org"
      echo -n "."
   fi
   ${sed} -i -e "s,\(use lib '\)./lib\(';\),\1../agent\2,"                           \
             -e "s,\(confdir => \$directory . '\)/../etc\('\,\),\1/../../etc\2,"     \
             -e "s,\(datadir => \$directory . '\)/../share\('\,\),\1/../../share\2," \
             -e "s,\(vardir  => \$directory . '\)/../var\('\,\),\1/../../var\2,"     \
             -e "s,\(libdir  => \$directory . '\)/../lib\('\,\),\1/../agent\2,"      \
             "${base_path}/bin/fusioninventory-win32-service"
   echo -n "."
   (cd "${base_path}/bin";                          \
    ${diff} -u "fusioninventory-win32-service.org"  \
               "fusioninventory-win32-service" > "fusioninventory-win32-service.patch")
   echo ".Done!"

   # Show files patched
   echo "List of patch files..."
   (cd "${base_path}"; ${find} . -type f -name '*.patch')

   # New architecture
   iter=$(( ${iter} + 1 ))
done

echo
