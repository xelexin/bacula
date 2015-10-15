class bacula::storage::service inherits bacula::storage {
  service { 'bacula-sd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    name       => 'bacula-sd',
    require => Class['bacula::storage::install'],
  }

}
