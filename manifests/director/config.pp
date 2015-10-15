# == Class: bacula::director::config
#
class bacula::director::config inherits bacula::director {
  concat { $director_conf:
    owner => 'root',
    group => 'root',
    mode => '0644',
  }

  concat::fragment { 'director_conf_main':
    target  => $director_conf,
    order   => '01',
    mode    => '0644',
    content => template('bacula/director/bacula-dir.conf.erb')
  }

  Concat::Fragment <<| tag == 'clients' |>>

}

define bacula::director::config::client_register($name){
  concat::fragment{ "dir_conf_fragment_$name" :
    target => $director_conf,
    order => '10',
    content => template('bacula/client/client.erb'),
  }
}
