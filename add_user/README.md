## add_user playbook

Run this playbook to create a new user across multiple machines:
ansible-playbook -i inventory --ask-sudo-pass add_user.yml


After a short setup, the playbook will prompt the user for a username and a password to create.


The new user will be created on all machines, with passwordless ssh access across all accounts. The new user will also be given a personal folder on the shared drive at "/shared/process/username/" with mpirun hostfiles for both CPU and GPU jobs.


## remove_user playbook

Run this playbook to remove a user across multiple machines:
ansible-playbook -i inventory --ask-sudo-pass remove_user.yml


The playbook will prompt for a username to remove, similar to the Unix command 'userdel --remove'. Their files on the shared drive will be maintained.