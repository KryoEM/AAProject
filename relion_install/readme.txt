This is an Ansible playbook for automated installation of Relion and associated software packages for a set of GPU-capable machines. The playbook is designed so that core packages will be installed on a shared drive, but all machines will be configured with the correct environments and dependencies to run the packages.




1.	Setting up an inventory file


	Before running this playbook, you must create an ansible playbook inventory file.

	The inventory lists:
	- [installer] host that will perform the installations
	- [machines] hosts that will become Relion-enabled
	- shared_dir directory where you want all applications to be installed
	- scratch_dir directory where temporary files will be written to during installation and for intermediate files during a sanity check


	Please see the sample inventory in this folder for guidance and then create your own.




2.	Running the playbook:
	
	ansible-playbook --i inventory --ask-sudo-pass relion_install.yaml 



	The playbook will print out a lot of text documenting each step it is going through, including menial ones like creating directories. 

	Some steps, such as building the Relion application itself, can have quite long output and error messages. For your convenience, these will be written out in text files for you to look at inside the installation directories (e.g. /shared_dir/relion/build.out). Don't worry -- the exact location will be given to you by the playbook at the relevant step.




3.	Troubleshooting issues

	If a step fails, take a look at the output and error messages, either from the playbook itself or the ones that have been written out to file. You can also increase the verbosity of the playbook to give you more information:
	ansible-playbook -v -i inventory --ask-sudo-pass relion_install.yaml

	There are four levels of verbosity: -v -vv -vvv -vvvv


	Once you fix the issue, run the playbook again.



	If an installation already exists of any given application, the playbook will skip installation of that specific application.

	To re-do the installation of a given software package (especially if you think it might have been partially installed before the playbook encountered an error and quit), delete the package's folder on the shared drive before running the playbook.


4.	Run Relion!

	After installation, restart your terminal session in order for all environment changes to take place.

	To enable GUI, you need an X11 connection to your terminal. You can do this by adding the -Y option to your ssh command, e.g.:
	ssh -Y user@machine.com


	Now you can run Relion from any project directory with the command:
	relion

	(if you are running Relion in a given project directory for the first time, do not use & to run it in the background; it requires user input the first time you start it)








Note to developers:

This playbook is designed to never overwrite existing installations, so that you cannot accidentally replace an existing software package with a newer version that could be buggy. For each software package, the playbook will check for an existing executable path and if it already exists, it will skip over the download and/or installation of new software.

If you wish to upgrade to a newer version of an application, you must edit the variables in the 'group_vars/all' file. You must change the following (if they exist):
1) 'app_dl_link' - the download link to the application
2) 'app_dl_checksum' - the checksum for the application download, if it exists
3) 'app_ver' - the version number of the application (used for purposes of naming folders)