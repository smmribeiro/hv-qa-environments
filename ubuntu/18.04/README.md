# Ubuntu 18.04

## Ubuntu Server 18.04 LTS (Bionic Beaver) Daily Builds

https://app.vagrantup.com/ubuntu/boxes/bionic64

http://cloud-images.ubuntu.com/bionic/

```ruby
config.vm.box = "ubuntu/bionic64"
```

## Configuration

Be sure to review the contents of the config.yaml file

| Setting | Description |
| --- | --- |
| use | Defines which configuration section will be used since multiple blocks can be defined (See below) |
| name | Defines the name of the virtual machine which has to be unique |
| public_ip | Defines the of the virtual machine to be accessed from the host machine |
| port | Used for messages only, shows the port where the web app will be available |

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
