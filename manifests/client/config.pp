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

#pdefine bacula::client_register(){


  concat::fragment{ "client_fragment_$client_name":
    target => $director_conf,
    order => '10',
    content => template('bacula/client/client.erb'),
  }
#}


  # concat { 'puppet://modules/bacula/files/clients':
  #   owner => 'root',
  #   group => 'root',
  #   mode => '0644',
  #   ensure => 'present',
  #   ensure_newline => true,
  # }
  #
  # concat::fragment { 'clients':
  #   target => 'puppet://modules/bacula/files/clients',
  #   mode => '0644',
  #   content => template('bacula/client/client.erb'),
  #   ensure => 'present',0
  # }

}
