## Add_user playbook

Run this playbook to create a new user across multiple machines:
ansible-playbook -i inventory --ask-sudo-pass add_user.yml


After a short setup, the playbook will prompt the user for a username and a password to create.

