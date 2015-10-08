class bacula::director::service inherits bacula::director {
  service { 'bacula-director':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    name       => 'bacula-director',
    require => Class['bacula::director::install'],
  }
}

# == Class: bacula::storage::service inherits bacula::storage
#
class bacula::storage::service inherits bacula::storage {
  service { 'bacula-sd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    name       => 'bacula-sd',
    require    => Class['bacula::storage::install'],
  }
}
