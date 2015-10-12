class bacula::client::service inherits bacula::client {
  service { 'bacula-fd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    name       => 'bacula-fd',
    require => Class['bacula::client::install'],
  }
}
