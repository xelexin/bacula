# == Class: class_name
#
class bacula::client::install inherits bacula::client{
  package { 'bacula-client':
    ensure => present,
    name => $client_package,
  }
}
