# == Class: bacula::client::config
#
class bacula::client::config inherits bacula::client {

  file {"$client_work_dir":
    ensure => "directory",
      owner => 'bacula',
      group => 'bacula',
  }

  concat { $client_conf:
    owner => 'bacula',
    group => 'bacula',
    mode => '0644',
    ensure_newline => 'true',
  }

  concat::fragment { 'client_conf':
    target  => $client_conf,
    order   => '01',
    mode    => '0644',
    content => template('bacula/client/bacula-fd.conf.erb'),
  }


@@concat::fragment { "dir_conf_fragment_$client_name":
	target => $director_conf,
	order => '10',
	content => template('bacula/client/client.erb'),
  tag => 'clients',
}


}
