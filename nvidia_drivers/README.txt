This playbook installs graphics drivers and the CUDA 8.0 Toolkit.


Before running this playbook, please check the inventory file and make sure it lists the correct machines and paths.


Then run the playbook with the commmand:
ansible-playbook -i inventory --ask-sudo-pass install_drivers.yml 