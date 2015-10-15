# password.rb

Facter.add(':fd_password') do
  confin :kernel => 'Linux'
  setcode do
    Facter::Core::Execution.exec('tr -dc A-Za-z0-9_ < /dev/urandom | head -c32')
  end
end
