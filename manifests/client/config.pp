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

  # Concat::Fragment <<| |>>



@@concat::fragment { "dir_conf_fragment_klient-fd":
	target => $director_conf,
	order => '10',
	content => template('bacula/client/client.erb'),
  tag => 'siema',
}


}
