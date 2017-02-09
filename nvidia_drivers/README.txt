This playbook installs graphics drivers and the CUDA 8.0 Toolkit.



Before running this playbook, you must create an ansible playbook inventory file.

The inventory should list:
- [installer] host that will perform the installations
- [machines] hosts that will become Cuda-enabled
- cuda_install_dir where you want Cuda to be installed
- downloads_dir where you want installers to be downloaded to

Please see the sample inventory in this folder for guidance.


Then run the playbook with a commmand like:
ansible-playbook -i inventory --ask-sudo-pass install_drivers.yml 