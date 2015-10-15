# == Class: bacula::storage::install
#
class bacula::storage::install inherits bacula::storage{
  package { 'bacula-sd':
    ensure => present,
    name => $storage_package,
    before => Class['bacula::storage::config'],
  }
  package { 'bacula-sd-mysql':
    ensure => present,
    name => 'bacula-sd-mysql',
    before => Class['bacula::storage::config'],
  }
}
