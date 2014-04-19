package 'yajl'
package 'libuuid-devel'
package 'bridge-utils'
package 'python-lxml'
package 'libaio'
package 'SDL'
package 'qemu-img'
package 'ocaml-runtime'
package 'grub2-tools'

execute 'grub2-mkconfig -o /boot/grub2/grub.cfg'
execute 'grub2-set-default "Fedora, with Xen hypervisor"'

# xen-4.3.1-6.fc20.src.rpm

packages = %w(
    xen-licenses
    xen-doc
    xen-libs
    xen-debuginfo
    xen-devel
    xen-hypervisor
    xen-runtime
    xen
    xen-ocaml
    xen-ocaml-devel
)

directory '/home/vagrant/rpms'

packages.each do |p|
  rpm = "#{p}-4.3.1-6.fc20.x86_64.rpm"
  remote_file "/home/vagrant/rpms/#{rpm}" do
    source "http://uhsure.com/halvm-xen-rpms/20/#{rpm}"
    action 'create_if_missing'
  end

  package p do
    source "/home/vagrant/rpms/#{rpm}"
  end
end
