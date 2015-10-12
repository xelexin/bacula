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

  concat { 'files/clients':
    owner => 'root',
    group => 'root',
    mode => '0644',
  }

  concat::fragment { 'clients':
    target => 'files/clients',
    mode => '0644',
    content => template('bacula/client/client.erb'),
  }

}
