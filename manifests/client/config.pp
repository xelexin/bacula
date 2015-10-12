# == Class: bacula::client::config
#
class bacula::client::config inherits bacula::client {
  concat { $client_conf:
    owner => 'root',
    group => 'root',
    mode => '0644',
  }

  concat::fragment { 'client_conf':
    target  => $client_conf,
    order   => '01',
    mode    => '0644',
    content => template('bacula/client/bacula-fd.conf.erb')
  }
}
