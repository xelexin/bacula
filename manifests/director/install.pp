# == Class: bacula::director::install
#
class bacula::director::install inherits bacula::director{
  package { 'bacula-director':
    ensure => present,
    name => $director_package,
    before => Class['bacula::director::config'],
  }
  

}
