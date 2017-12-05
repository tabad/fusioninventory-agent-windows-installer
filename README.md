[![Build status](https://ci.appveyor.com/api/projects/status/kgj8wyfygavkipuh?svg=true)](https://ci.appveyor.com/project/teclib/fusioninventory-agent-windows-installer)

# FusionInventory Agent Windows Installer

## Description

The FusionInventory Agent Windows Installer is an open source project with
as goal to build the installer program of the FusionInventory Agent and its tasks
for Windows operative systems. It makes use of some others open source projects,
like the Nullsoft Scriptable Install System (in forward NSIS), Strawberry Perl,
Curl, etcetera.

It was born to cover a basic goal; be able to install new FusionInventory Agent
versions based on the previous configuration in the system, whether it exists.
In summary, it is born to be able to update the existing agent, and not only to
install a new version from scratch.

It has more purposes, of course. The following are some of them.

## Features

   - Installs from scratch or from the current configuration.

   - Uninstalls the previous agent, whether it exists.

   - Prevents multiple installations simultaneously.

   - Supports visual installation in multiple languages.
        (English and Spanish. French in construction.)

   - Builds two different installers for x86 and x64 architectures.
        (Each platform uses its native distribution of Strawberry Perl)

   - Builds installers for stable or development versions.

   - Supports both installation methods; silent or unattended mode and
     graphical or visual mode.

   - Allows to select the agent tasks to install.

   - New visual appearance based on the NSIS Modern UI 2 plugin.

   - Migrates the deprecated options to the new options and removes completely
     the obsolete ones from the Microsoft Windows registry.

   - Now the Microsoft Windows registry used for agent configuration integrates
     all the options supported by the agent, and not only those that them
     values are different to the default.

   - Allows a complete customization of all the options supported for the
     agent, either from the the command line, or from the visual installation.

   - Each generated installer is identified uniquely by a BuildID.
        (Each architecture has its own BuildID sequence)

   - Allows to execute the agent as a Windows Service, to plan its execution
     through a Windows Task or, simply, not to execute the agent.

   - Allows to pull a SSL certificate from a URL at installation time. (ToDo)

## Changes

See [Changes.txt file](Changes.txt)

## Automatic build integration

This project uses [Appveyor CI platform](https://ci.appveyor.com/project/teclib/fusioninventory-agent-windows-installer) to build the installer

Softwares used for building:

 * [NSIS](http://nsis.sourceforge.net/Download) 3.02
 * Pandoc 1.17.0.2

## Release process

 * For a release candidate:
    1. Set a tag matching `2.4(.1)-rc1` scheme on [TECLIB/fusioninventory-agent](https://github.com/TECLIB/fusioninventory-agent) repository
    1. Set the same tag on this repository
    1. Release candidates are then available in [this Teclib repository releases](https://github.com/TECLIB/fusioninventory-agent-windows-installer/releases)

 * For any development release:
    1. Update agent code if necessary on [TECLIB/fusioninventory-agent](https://github.com/TECLIB/fusioninventory-agent) repository default branch
    1. Update [Changes.txt](Changes.txt) as needed, keeping agent commit ref in comment
    1. Development builds are then available at [built artifacts page](https://ci.appveyor.com/project/teclib/fusioninventory-agent-windows-installer/build/artifacts)

## Manual build

See [Legacy build section in Readme.txt file](Readme.txt)

## Contacts

FusionInventory project websites:

* main site: <http://www.fusioninventory.org>
* make feature requests:
  <http://fusioninventory.userecho.com>
* forum: <http://forum.fusioninventory.org>

FusionInventory community Telegram group:

* link: <https://t.me/fusioninventory>

FusionInventory project mailing lists:

* <http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-user>
* <http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-devel>

FusionInventory project IRC channel:

* `#FusionInventory` on FreeNode IRC Network

## Bug reporting

Please, follow [our bug reporting documetation](http://fusioninventory.org/documentation/bugreport/) to report any issues.

## License

This software is licensed under the terms of GPLv2, see [License.txt file](License.txt) file for
details.
