# == Class: bacula::client::config
#
class bacula::client::config inherits bacula::client {
  file { $client_conf:
    ensure  => file,
    path => $client_conf,
    mode    => '0644',
    require => Class['bacula::client::install'],
    content => template('bacula/client/bacula-fd.conf.erb')
  }
}
