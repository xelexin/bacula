# == Class: class_name
#
class bacula::client::install inherits bacula::client{
  package { 'bacula-fd':
    ensure => present,
    name   => $client_package,
    before => Class['bacula::client::config'],
  }
}
