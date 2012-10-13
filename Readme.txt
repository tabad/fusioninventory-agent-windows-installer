
                            FusionInventory Agent
                         Microsoft Windows Installer
                         ---------------------------


Description
-----------
  The FusionInventory Agent Microsoft Windows Installer is an open source
project than has as goal to build the installer program of the FusionInventory
Agent and its tasks for Microsoft Windows operative systems. It makes use of
some others open source projects, like the Nullsoft Scriptable Install System
(in forward NSIS), Strawberry Perl, Curl, etcetera, to obtain its objective.

  It is born to cover a basic goal; be able to install new FusionInventory Agent
versions based on the previous configuration in the system, whether it exists.
In summary, it is  born to be able to update the existing agent, and not only to
install a new version from scratch.

  It has more purposes, of course. The following are some of them.


Features
--------
   - Installs from scratch or from the current configuration.

   - Uninstalls the previous agent, whether it exists.

   - Prevents multiple installations simultaneously.

   - Supports visual installation in multiple languages.
        (English and Spanish. French in construction.)

   - Builds two different installers for x86 and x64 architectures.
        (Each platform uses its native distribution of Strawberry Perl)

   - Supports both installation methods; silent or unattended mode and
     graphical or visual mode.

   - New visual appearance based on the NSIS Modern UI 2 plugin.

   - Migrates the depreciated options to the new options and removes completely
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


What do you need
----------------
   This is than you need to build the installer

   - Whether you use Microsoft Windows OS
      * NSIS 2.46

      You can get NSIS 2.46 from http://nsis.sourceforge.net/Download

   - Whether you use a Unix OS
      * Curl
      * NSIS 2.46

      Check your distribution for more information about these packages

   - In all of cases
      * An Internet connection


Current state
-------------
   Nowadays, the contents of the project is:

      .- FusionInventory Agent v2.2.5
         .- FusionInventory Agent Task Deploy v2.0.2
         .- FusionInventory Agent Task ESX v2.2.0
         .- FusionInventory Agent Task Inventory v1.0
         .- FusionInventory Agent Task WakeOnLan v1.0
         .- FusionInventory Agent Distribution Network v1.0.1
            .- FusionInventory Agent Task NetInventory v2.2.0
            .- FusionInventory Agent Task NetDiscovery v2.2.0


   This is the current directory tree of the project.

.
|-- NSIS
|   |-- FusionInventory-Agent
|   |   |-- Contrib
|   |   |   |-- Graphics
|   |   |   |   `-- Icons
|   |   |   |-- ModernUI2
|   |   |   |   `-- Pages
|   |   |   |       `-- Templates
|   |   |   `-- Skins
|   |   |       `-- Default
|   |   |-- Include
|   |   `-- INI
|   `-- Plugins
|-- Perl
|   `-- Scripts
`-- Tools
    |-- 7zip
    |   |-- x64
    |   `-- x86
    |-- curl
    |   `-- x86
    |-- dmidecode
    |   `-- x86
    |-- hdparm
    |   `-- x86
    |-- sed
    |   `-- x86
    `-- setacl
        |-- x64
        `-- x86


   Inside of './NSIS/Perl/Scripts' directory there is a set of scripts for
download Strawberry Perl Portable Edition v5.16.1.1 (Aug 2012) for x64 and
x86 architectures, update and install all the Perl modules dependencies for
the previous FusionInventory Agent packages, and download them.


How to generate the installer
-----------------------------

   Download fusioninventory-agent-windows-installer from GitHub using this URL

   https://github.com/tabad/fusioninventory-agent-windows-installer/downloads

and uncompress and unpack it.

   You can also clone the repository whether do you prefer it using Git.

   $ git clone --branch master --depth 1 https://github.com/tabad/fusioninventory-agent-windows-installer.git

   You should change '--branch master' for the name of branch you wish download.

   The following steps depends of your operative system.


   Microsoft Windows
   -----------------

   From your Microsoft Windows command interpreter executes

   > cd fusioninventory-agent-windows-installer
   > cd Perl\Scripts
   > .\install-gnu-utilities-collection.bat
   > .\install-strawberryperl.bat
   > .\install-perl-modules-and-dependencies.bat
   > .\install-fusioninventory-agent-and-tasks.bat
   > cd NSIS
   > .\FusionInventory-Agent.bat

   You should be able to see the new installers in that directory.


   Unix OS
   -------

   It is not possible at the moment.


Upgrade the agent and its tasks
-------------------------------
   ToDo


Upgrade the Strawberry Perl distribution
----------------------------------------
   ToDo


A complete example, step by step
--------------------------------
   ToDo


Contacts
--------
Project websites:
* main site: http://www.fusioninventory.org
* forge: http://forge.fusioninventory.org/projects/fusioninventory-agent-windows-installer

Project mailing lists:
* http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-user
* http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-devel

Project IRC channel:
* #FusionInventory on FreeNode IRC Network

Please report any issues on project forge bugtracker (see forge URL above).


Author
-------
* Tomás Abad <tabadgp@gmail.com>

Copyright 2012 FusionInventory Team


License
-------
This software is licensed under the terms of GPLv2+, see License.txt file for
details.
