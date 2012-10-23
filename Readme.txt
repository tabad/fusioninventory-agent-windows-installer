
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

      .- FusionInventory Agent v2.2.6
         .- FusionInventory Agent Task Deploy v2.0.3
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
the previous FusionInventory Agent packages, and download them. Please, read
the file './Perl/Scripts/readme.txt' for more information about these scripts.


How to generate the installers
------------------------------

   Download fusioninventory-agent-windows-installer from GitHub using this URL

   https://github.com/tabad/fusioninventory-agent-windows-installer/downloads

and uncompress and unpack it.

   You can also clone the repository whether do you prefer it using Git.

   $ git clone --branch master --depth 1 \
     https://github.com/tabad/fusioninventory-agent-windows-installer.git

   You should change '--branch master' for the name of branch you wish download.

   The following steps depends of your operative system.


   Microsoft Windows
   -----------------

   From your Microsoft Windows command interpreter executes

   > cd fusioninventory-agent-windows-installer
   > cd Perl\Scripts
   > .\install-gnu-utilities-collection.bat
   > .\install-strawberry-perl-package-for-fusioninventory-agent.bat
   > .\install-fusioninventory-agent-and-tasks.bat
   > .\patch-fusioninventory-agent-and-tasks.bat
   > cd ..\..\NSIS
   > .\FusionInventory-Agent.bat

   You should be able to see the new installers in that directory.


   Unix OS
   -------

   $ cd fusioninventory-agent-windows-installer
   $ chmod 0744 NSIS/*.sh Perl/Scripts/*.sh
   $ cd Perl/Scripts
   $ ./install-strawberry-perl-package-for-fusioninventory-agent.sh
   $ ./install-fusioninventory-agent-and-tasks.sh
   $ ./patch-fusioninventory-agent-and-tasks.sh
   $ cd ../../NSIS
   $ ./FusionInventory-Agent.sh

   You should be able to see the new installers in that directory.


Build the Strawberry Perl Package for FusionInventory-Agent
-----------------------------------------------------------
   This task can be done only from Microsoft Windows OS.


   Microsoft Windows
   -----------------

   From your Microsoft Windows command interpreter executes

   > cd fusioninventory-agent-windows-installer
   > cd Perl\Scripts
   > .\install-gnu-utilities-collection.bat
   > .\install-strawberry-perl.bat
   > .\install-perl-modules-and-dependencies.bat
   > .\delete-perl-modules-and-dependencies-temporary-files.bat
   > .\build-strawberry-perl-package-for-fusioninventory-agent.bat
   > .\uninstall-strawberry-perl.bat

   The script 'build-strawberry-perl-package-for-fusioninventory-agent.bat'
will show to you where is the built package.


Upgrade the Strawberry Perl distribution
----------------------------------------
   ToDo


Upgrade the agent and its tasks
-------------------------------
   You can search in CPAN for the last stable version of FusionInventory-Agent
and its tasks. For that you only have to search into CPAN for 'FusionInventory'
distributions (http://search.cpan.org/search?query=FusionInventory&mode=dist)
and observe whether there is some new stable version available.

            Note that we are only interested in 'FusionInventory-Agent',
            'FusionInventory-Task-Deploy', 'FusionInventory-Task-ESX' and
            'FusionInventory-Task-Network' distributions. The home pages
            for these Perl distributions are respectivily:

               http://search.cpan.org/dist/FusionInventory-Agent/
               http://search.cpan.org/dist/FusionInventory-Agent-Task-Deploy/
               http://search.cpan.org/dist/FusionInventory-Agent-Task-ESX/
               http://search.cpan.org/dist/FusionInventory-Agent-Task-Network/

   Suppose you can see there are new stable versions for two of them, to know,
FusionInventory-Agent-2.2.6 and FusionInventory-Task-Deploy-2.0.3 (it is true
in the time I am writing this). You have the builder ready to build the
installers with FusionInventory-Agent-2.2.5 and FusionInventory-Task-Deploy-
-2.0.2, so you want to change it to get the installers with the last versions.

   Inside home pages of the FusionInventory-Agent and FusionInventory-Task-
-Deploy distributions, you can get the URLs of their last versions. Edit
the variables 'fusinv_agent' and 'fusinv_task_deploy' of the file
'./Perl/Scripts/load-perl-environment' and set their new values; the authors
identification suffix of the URL (the URL without 'http://search.cpan.org/
/CPAN/authors/id).

   -... fusinv_agent='/F/FU/FUSINV/FusionInventory-Agent-2.2.5.tar.gz'
   -... fusinv_task_deploy='/F/FU/FUSINV/FusionInventory-Agent-Task-Deploy-2.0.2.tar.gz'
   +... fusinv_agent='/F/FU/FUSINV/FusionInventory-Agent-2.2.6.tar.gz'
   +... fusinv_task_deploy='/F/FU/FUSINV/FusionInventory-Agent-Task-Deploy-2.0.3.tar.gz'

   Probably these new distributions require new Perl modules. Whether it is
like this, you should build a new Strawberry Perl Package for FusionInventory-
-Agent. Before to do that, you should edit the 'strawberry_pepfia_build_id'
variable of the file './Perl/Scripts/load-perl-environment' increasing it
in a unit.

   -... strawberry_pepfia_build_id=$(printf "%05d" 2)
   +... strawberry_pepfia_build_id=$(printf "%05d" 3)

   You should start with a clean Strawberry Perl distribution too, so the
recommended steps are:

            Remember, this task can be done only from Microsoft Windows OS.

   > cd fusioninventory-agent-windows-installer
   > cd Perl\Scripts
   > .\install-gnu-utilities-collection.bat
   > .\uninstall-strawberry-perl.bat
   > .\install-strawberry-perl.bat
   > .\install-perl-modules-and-dependencies.bat
   > .\delete-perl-modules-and-dependencies-temporary-files.bat
   > .\build-strawberry-perl-package-for-fusioninventory-agent.bat
   > .\uninstall-strawberry-perl.bat

   Now you can load the new package and its associated files into your
repository of Strawberry Perl Packages for FusionInventory-Agent. This
can be a local repository, you only have to change the 'strawberry_pepfia_url'
variable of the file './Perl/Scripts/load-perl-environment'. For example, to
leave the default directory as the default repository, you only have to do the
following:

   -... strawberry_pepfia_url='http://forge.fusioninventory.org/attachments/download/760'
   +... strawberry_pepfia_url='file:///c/.../fusioninventory-agent-windows-installer/Perl/Strawberry'

            Remember, 'file:///' is dependent of the OS and must be written as
            a absolute path. Make sure, in any case, that the value of the
            'strawberry_pepfia_url' variable is correct.

   Finally, you should change the following constants of the file './NSIS/
/FusionInventory.nsi' to adapt them to their new values:

      FIA_RELEASE
      FIA_TASK_DEPLOY_RELEASE
      FIA_TASK_ESX_RELEASE
      FIA_TASK_NETWORK_RELEASE

      FIA_TASK_INVENTORY_RELEASE
      FIA_TASK_NETDISCOVERY_RELEASE
      FIA_TASK_NETINVENTORY_RELEASE
      FIA_TASK_WAKEONLAN_RELEASE

      PRODUCT_VERSION_MAJOR
      PRODUCT_VERSION_MINOR
      PRODUCT_VERSION_RELEASE
      PRODUCT_VERSION_BUILD

   They are at the begining of the file. Following the example,

   -!define FIA_RELEASE "2.2.5"
   -!define FIA_TASK_DEPLOY_RELEASE "2.0.2"
   +!define FIA_RELEASE "2.2.6"
   +!define FIA_TASK_DEPLOY_RELEASE "2.0.3"

   -!define PRODUCT_VERSION_RELEASE "5"
   -!define PRODUCT_VERSION_BUILD "2"
   +!define PRODUCT_VERSION_RELEASE "6"
   +!define PRODUCT_VERSION_BUILD "1"

   With the new Strawberry Perl Package for FusionInventory-Agent ready, and
these last changes, you can continue as it were a normal build process.
See 'How to generate the installers' above.


How to know whether is needed to build a new Strawberry Perl Package for
FusionInventory-Agent
------------------------------------------------------------------------
   ToDo


How to build the installers for a development version of FusionInventory-Agent
------------------------------------------------------------------------------
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
