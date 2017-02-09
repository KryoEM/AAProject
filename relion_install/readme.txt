Ansible playbook for automated installation of Relion and associated software packages for a set of GPU-capable machines. The playbook is designed so that core packages will be installed on a shared drive, but all machines will be configured with the correct environments and dependencies to run the packages.




Before running this playbook, you must create an ansible playbook inventory file.

The inventory should list:
- [installer] host that will perform the installations
- [machines] hosts that will become Relion-enabled
- shared_dir directory where you want all applications to be installed
- scratch_dir directory where temporary files will be written to during installation and for intermediate files during a sanity check
- cuda_existing_dir directory of a previously installed Cuda 8.0 toolkit (do not list if you want Cuda to be installed)

Please see the sample inventory in this folder for guidance.




Finally, you can run the playbook with the command:
ansible-playbook --i inventory --ask-sudo-pass relion_install.yaml 



If an installation already exists of any given application, the playbook will skip installation of that specific application.

To re-do the installation of a given software package, delete the package's folder on the shared drive before running the playbook.






Note to developers:

This playbook is designed to never overwrite existing installations, so that you cannot accidentally replace an existing software package with a newer version that could be buggy. For each software package, the playbook will check for an existing executable path and if it already exists, it will skip over the download and/or installation of new software.

If you wish to upgrade to a newer version of an application, you must edit the variables in the 'group_vars/all' file. You must change the following (if they exist):
1) 'app_dl_link' - the download link to the application
2) 'app_dl_checksum' - the checksum for the application download, if it exists
3) 'app_ver' - the version number of the application (used for purposes of naming folders)