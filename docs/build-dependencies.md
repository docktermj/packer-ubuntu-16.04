# packer-ubuntu-16.04 build dependencies

## Packer

- [Installation](https://www.packer.io/intro/getting-started/install.html)

```console
$ packer version
Packer v1.0.0
```

## Vagrant

- [Installation](https://www.vagrantup.com/docs/installation/)

```console
$ vagrant -v
Vagrant 1.9.1
```

## VirtualBox

- [Installation](https://www.virtualbox.org/)

```console
$ vboxmanage --version
5.1.22
```

## VirtualBox Guest Additions

### Ubuntu

```console
sudo apt-get install -y virtualbox-guest-additions-iso
sudo vagrant plugin install vagrant-vbguest
```

### CentOS

```console
vagrant plugin install vagrant-vbguest
```

