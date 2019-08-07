# Ubuntu 16.04

## Ubuntu Server 16.04 LTS (Xenial Xerus) Daily Builds

https://app.vagrantup.com/ubuntu/boxes/xenial64

http://cloud-images.ubuntu.com/xenial/

```ruby
config.vm.box = "ubuntu/xenial64"
```

## Configuration

Be sure to review the contents of the config.yaml file

| Setting | Description |
| --- | --- |
| use | Defines which configuration section will be used since multiple blocks can be defined (See below) |
| name | Defines the name of the virtual machine which has to be unique |
| base_os | Defines the image of the OS to be used in the machine. The current one will be **ubuntu/xenial64** for Ubuntu Server 16.04 LTS. Read more about it here: https://app.vagrantup.com/boxes/search |
| public_ip | Defines the of the virtual machine to be accessed from the host machine |
| port | Used for messages only, shows the port where the web app will be available |
| cpus | Defines the number of CPUS the virtual machine will have. Default will be **2** |
| memory | Defines the number of memory the virtual machine will have. Default will be **8192** |
| vram | Defines the number of memory the virtual machine graphic card will have. Default will be **256** |
| clipboard | Defines the clipboard setting between the host and the guest VM. Default will be **bidirectional** |
| natdnshostresolver1 | Defines the value for the NAT DNS Host Resolver setting. Default will be **on** |
| natdnsproxy1 | Defines the value for the NAT DNS Proxy setting. Default will be on |

If needed, the config.yaml file can have multiple configuration blocks, and the "use" option could point at them as needed:

```yaml
configs:
  use: 'alternative_setup'
  name: 'hitachi-vantara-qa-environment-ubuntu-16.04'
  default:
    public_ip: '1.6.0.4'
    port: 8080
  alternative_setup:
    public_ip: '192.168.20.20'
    port: 8080
```
