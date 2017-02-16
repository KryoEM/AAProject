## AAProject
Accelerate and automate the RELION 2.0 workflow

### Setting up Ansible
This repository contains the Ansible playbooks we use to configure our servers. Before they are run, Ansible needs to be properly configured on a master node and all of the worker nodes. This process is explained on our wiki [here](https://github.com/KryoEM/AAProject/wiki/Configuring-Ansible)

### Directory structure
Each of the folders represents a different ansible playbook:

* `beegfs`: Installs the BeeGFS services on the machines specified in the `inventory` file.
* `nvidia_drivers`: Installs the NVIDIA v367 graphics drivers on the hosts specified in the `inventory` file and sets up the CUDA environment on those hosts
* `relion_install`: Installs RELION on a shared drive and installs the dependencies and environments on the nodes specified in the `inventory` file so they are able to run RELION.
* `add_user`: Adds a user to all the hosts specified in the `inventory` files, generates an SSH key for that user, and copies that SSH key to all nodes to allow seamless connection with to that user.
