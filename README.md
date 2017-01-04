## AAProject
Accelerate and automate the RELION 2.0 workflow

### Directory structure
Each of the folders represents a different ansible playbook:

* `beegfs`: Installs the BeeGFS services on the machines specified in the `beegfs_hosts` file.
* `nvidia_drivers`: Installs the NVIDIA v367 graphics drivers on the hosts specified in the `driver_hosts` file and sets up the CUDA environment on those hosts
* `relion_install`: Installs RELION on a shared drive and installs the dependencies and environments on the nodes specified in the `relion_hosts` file so they are able to run RELION.
