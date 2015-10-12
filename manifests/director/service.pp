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
