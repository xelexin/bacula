# password.rb

Facter.add(':fd_password') do
  confine :kernel => 'Linux'
  setcode 'tr -dc A-Za-z0-9_ < /dev/urandom | head -c32'
  end
end
