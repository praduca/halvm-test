## HaLVM Test Cookbook

Let's experiment with [HaLVM](https://github.com/GaloisInc/HaLVM).

This cookbook tries to build a viable HaLVM environment using
[KitchenCI](http://kitchen.ci/).

## Requirements

* [ChefDK](http://downloads.getchef.com/chef-dk/)
* [Vagrant VMware plugin](https://www.vagrantup.com/vmware)
* VMware (for nested hypervisor support)

## Usage

```
kitchen converge
```

Expect to wait between twenty minutes and a couple hours for the VM to
converge. Once the VM has converged we want to load the Xen kernel so
we'll reboot the VM manually:

`kitchen login` and at the
`[vagrant@default-fedora-20 ~]$` prompt `sudo reboot`.

In a few moments we should be able to verify a Haskell program
will run directly on the Xen hypervisor: `kitchen verify`

To play... login and try some examples:

```
kitchen login
cd HaLVM/examples/Core/Xenstore
make run
```
