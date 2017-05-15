# packer-ubuntu-16.04

This repository builds machine images using
[Packer](https://www.packer.io/)
with a Ubuntu 16.04.2 ISO image.

The virtual machine that can be produced are: VMware, Vagrant, and VirtualBox.

## Build dependencies

See [build dependencies](docs/build-dependencies.md).

## Build

Build all versions

```console
packer build template.json
```

### Build specific version

VMware

```console
packer build -only=vmware-iso template.json
```

VirtualBox

```console
packer build -only=virtualbox-iso template.json
```

## Run on VMware Workstation

1. Choose VMX file
   1. VMware Workstation > File > Open...
      1. Navigate to `.../packer-ubuntu-16.04/output-vmware-iso-nnnnnnnnnn/`
      1. Choose `packer-ubuntu-16.04-nnnnnnnnnn.vmx`
1. Optional: Change networking
   1. Navigate to VMware Workstation > My Computer > packer-ubuntu-16.04-nnnnnnnnnn
   1. Right click and choose "Settings"
   1. Network Adapter: :radio_button: Bridged: Connected directly to the physical network
   1. Click "Save"
1. Run image
   1. Choose VMware Workstation > My Computer > packer-ubuntu-16.04-nnnnnnnnnn
   1. Click "Start up this guest operating system"
1. Username: vagrant  Password: vagrant

## Run on Vagrant / VirtualBox

### Add to library

```console
vagrant box add --name="packer-ubuntu-16.04-virtualbox" ./packer-ubuntu-16.04-virtualbox-nnnnnnnnnn.box
```

### Run

An example of how to run in a new directory.

#### Specify directory

In this example the `/tmp/packer-ubuntu-16.04` directory is used.

```console
export PACKER_UBUNTU_1604=/tmp/packer-ubuntu-16.04
```

#### Initialize directory

Back up an old directory and initialize new directory with Vagrant image.

```console
mv ${PACKER_UBUNTU_1604} ${PACKER_UBUNTU_1604}.$(date +%s)
mkdir ${PACKER_UBUNTU_1604}
cd ${PACKER_UBUNTU_1604}
vagrant init packer-ubuntu-16.04-virtualbox
```

#### Enable remote login

Modify Vagrantfile to allow remote login by
uncommenting `config.vm.network` in `${PACKER_UBUNTU_1604}/Vagrantfile`. 
Example:

```console
sed -i.$(date +'%s') \
  -e 's/# config.vm.network \"public_network\"/config.vm.network \"public_network\"/g' \
  ${PACKER_UBUNTU_1604}/Vagrantfile
```

#### Start guest machine

```console
cd ${PACKER_UBUNTU_1604}
vagrant up
```

### Login to guest machine

```console
cd ${PACKER_UBUNTU_1604}
vagrant ssh
```

### Find guest machine IP address

In the vagrant machine, find the IP address.

```console
ip addr show
```

### Remote login to guest machine

SSH login from a remote machine.

```console
ssh vagrant@nn.nn.nn.nn
```

Password: vagrant


### Remove image from Vagrant library

To remove Vagrant image, on host machine:

```console
vagrant box remove packer-ubuntu-16.04-virtualbox
```


## Testing

>>> TODO:

VMware Fusion

```console
vagrant up vmware --provider=vmware_fusion
```

VirtualBox

```console
vagrant up virtualbox --provider=virtualbox
```

## References

1. [Bibliography](docs/bibliography.md)
