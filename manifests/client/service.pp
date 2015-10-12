class bacula::client::service inherits bacula::client {
  service { 'bacula-client':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    name       => 'bacula-client',
    require => Class['bacula::client::install'],
  }
}
