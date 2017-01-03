Ansible playbook for automated installation of Relion and associated software packages for a set of GPU-capable machines. The playbook is designed so that core packages will be installed on a shared drive, but all machines will be configured with the correct environments and dependencies to run the packages.


The playbook was tested on servers with Ubuntu 16.04.



To edit the machines that will have access to Relion, add them to the list of 'machine' hosts in the file 'relion_hosts' and run the playbook. If an installation already exists of the software packages, the playbook will only configure the new machine.


This playbook is designed to never overwrite existing installations, so that you cannot accidentally replace an existing software package with a newer version that could be buggy. For each software package, the playbook will check for an existing executable path and if it already exists, it will skip over the download and/or installation of new software.


If you wish to upgrade to a newer version of a software package, you must edit the variables file in the 'group_vars/all' file. You must change:
1) the download link for that package
2) the name of the executable path, which indicates the version number (please also check the directory names in this path, which may contain the version number)
If a file exists at the executable path specified in the variables file, the playbook will not conduct an installation.


To re-do the installation of a given software package, delete the package's folder on the shared drive before running the playbook.


To change the location of the shared drive, pointers to the CUDA toolkit location, simply change the corresponding variables in the 'group_vars/all' file.