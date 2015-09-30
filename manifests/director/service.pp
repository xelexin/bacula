class bacula::director::service inherits bacula::director {
  service { 'bacula-dir':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    name       => 'bacula-dir',
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
