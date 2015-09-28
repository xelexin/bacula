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
