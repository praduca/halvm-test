## HaLVM Test Cookbook

Let's experiment with [HaLVM](https://github.com/GaloisInc/HaLVM).

This cookbook tries to build a viable HaLVM environment using
[KitchenCI](http://kitchen.ci/).

## Requirements

* Ruby
* VMware (for nested hypervisor support)

## Usage

```
bundle install
bundle exec kitchen converge
```

Expect to wait between twenty minutes and a couple hours for the VM to
converge. Once the VM has converged we want to load the Xen kernel so
we'll reboot the VM manually:

`bundle exec kitchen login` and at the
`[vagrant@default-fedora-20 ~]$` prompt `sudo reboot`.

In a few moments we should be able to verify a Haskell program
will run directly on the Xen hypervisor: `bundle exec kitchen verify`

To play... login and try some examples:

```
bundle exec kitchen login
cd HaLVM/examples/Core/Xenstore
make run
```
