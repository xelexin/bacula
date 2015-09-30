# == Class: class_name
#
class bacula::director::install inherits bacula::director{
  package { 'bacula-director':
    ensure => present,
    name => $director_package,
  }
}

# == Class: bacula::storage::install
#
class bacula::storage::install inherits bacula::storage {
  package { 'bacula-storage':
    ensure => installed,
    name   => $storage_package,
  }
}
