# password.rb

Facter.add(':fd_password') do
  confine :kernel => 'Linux'
  setcode 'uname'#tr -dc A-Za-z0-9_ < /dev/urandom | head -c32't
end
