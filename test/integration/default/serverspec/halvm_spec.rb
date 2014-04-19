require 'spec_helper'

describe command('make run') do
  Dir.chdir('/home/vagrant/HaLVM/examples/Core/GetIdTest')
  it { should return_stdout /Got ID/ }
end
