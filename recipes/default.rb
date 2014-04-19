include_recipe 'halvm::xen'

include_recipe 'cabal'
include_recipe 'build-essential'
include_recipe 'git'

package 'libtool'
package 'automake'
package 'haskell-platform'

cabal_update 'root'

%w(
  alex
  happy
  terminfo
).each do |c|
  cabal_install c do
    global_install true
  end
end

link '/bin/alex' do
  to '/usr/local/bin/alex'
end

link '/bin/happy' do
  to '/usr/local/bin/happy'
end

git '/home/vagrant/HaLVM' do
  repository 'https://github.com/GaloisInc/HaLVM.git'
  enable_submodules true
end

execute 'autoconf' do
  cwd '/home/vagrant/HaLVM'
  creates '/home/vagrant/HaLVM/configure'
end

execute './configure --enable-gmp' do
  cwd '/home/vagrant/HaLVM'
  creates '/home/vagrant/HaLVM/config.log'
end

execute 'make' do
  cwd '/home/vagrant/HaLVM'
  creates '/home/vagrant/HaLVM/halvm-ghc/libffi/build/x86_64-unknown-HaLVM/.libs/libffi.a'
end

execute 'make install' do
  cwd '/home/vagrant/HaLVM'
  creates '/usr/local/bin/halvm-ghc'
end

execute 'make' do
  cwd '/home/vagrant/HaLVM/examples'
  creates '/home/vagrant/HaLVM/examples/Core/DomainInfo/DomainInfo'
end
