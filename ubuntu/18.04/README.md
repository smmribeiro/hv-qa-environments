# Ubuntu 18.04

## Ubuntu Server 18.04 LTS (Bionic Beaver) Daily Builds

https://app.vagrantup.com/ubuntu/boxes/bionic64

http://cloud-images.ubuntu.com/bionic/

More about other Ubuntu images:

http://cloud-images.ubuntu.com/

```ruby
config.vm.box = "ubuntu/bionic64"
```

## Instructions

After you have installed VirtualBox and Vagrant, and setup the config.yaml file, then from your console of preference run:

```shell
vagrant up
```

## Configuration

Be sure to review the contents of the config.yaml file

| Setting | Optional | Description |
| --- | --- | --- |
| use | | Defines which configuration section will be used since multiple blocks can be defined (See below) |
| name | | Defines the name of the virtual machine which has to be unique |
| box | | This is reserved for the box (https://pentaho.account.box.com/login) credentials in order to download the service packs as needed |
| username | :heavy_check_mark: | box username |
| password | :heavy_check_mark: | box password |
| test | | This is reserved to define the machine major and minor versions of the suite to be installed |
| major | | Major version to be installed automatically during the machine provisioning |
| minor | :heavy_check_mark: | Minor version to be installed automatically during the machine provisioning |
| base_os | | Defines the image of the OS to be used in the machine. The current one will be **ubuntu/bionic64** for Ubuntu Server 18.04 LTS. Read more about it here: https://app.vagrantup.com/boxes/search |
| box_version | :heavy_check_mark: | By default will be equal to 20190621.0.0. This is the version of the box to be used. Check more at https://app.vagrantup.com/ubuntu/boxes/bionic64 |
| disk_size | | Defines the size of the virtual machine disk |
| os_version | | Defines the version of the virtual machine OS distro |
| public_ip | | Defines the of the virtual machine to be accessed from the host machine |
| port | | Used for messages only, shows the port where the web app will be available |
| java_version | | Defines the version of Java to be installed |
| cpus | | Defines the number of CPUS the virtual machine will have. Default will be **2** |
| memory | | Defines the number of memory the virtual machine will have. Default will be **8192** |
| vram | | Defines the number of memory the virtual machine graphic card will have. Default will be **256** |
| clipboard | | Defines the clipboard setting between the host and the guest VM. Default will be **bidirectional** |
| natdnshostresolver1 | | Defines the value for the NAT DNS Host Resolver setting. Default will be **on** |
| natdnsproxy1 | | Defines the value for the NAT DNS Proxy setting. Default will be on |

If needed, the config.yaml file can have multiple configuration blocks, and the "use" option could point at them as needed:

```yaml
configs:
  use: 'alternative_setup'
  name: 'hitachi-vantara-qa-environment-ubuntu-18.04'
  default:
    public_ip: '1.8.0.4'
    port: 8080
  alternative_setup:
    public_ip: '192.168.20.20'
    port: 8080
```
