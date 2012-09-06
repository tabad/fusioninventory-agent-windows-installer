#!/bin/bash

declare -r makensis=$(type -P makensis)

## Build x86 installer
echo Please wait. Compilling x86 installer...
${makensis} -V3 -O./FusionInventory-Agent_MakeNSIS-Output-x86.txt -DFIAI_PLATFORM_ARCHITECTURE=x86 -DOS_BUILDER_NO_WINDOWS ./FusionInventory-Agent.nsi
echo Done!

## Build x86 installer
echo Please wait. Compilling x64 installer...
${makensis} -V3 -O./FusionInventory-Agent_MakeNSIS-Output-x64.txt -DFIAI_PLATFORM_ARCHITECTURE=x64 -DOS_BUILDER_NO_WINDOWS ./FusionInventory-Agent.nsi
echo Done!
