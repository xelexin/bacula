# == Class: bacula::director::config
#
class bacula::director::config inherits bacula::director {
  concat { $director_conf:
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat::fragment { 'director_conf_main':
    target  => $director_conf,
    order   => '01',
    mode    => '0644',
    content => template('bacula/director/bacula-dir.conf.erb')
  }

  file { '/root/mysql_root':
    ensure  => 'present',
    owner    => 'root',
    group   => 'root',
    content => "mysqladmin -u root password $::generate_password",
    mode    => '0600',
    replace => false,
  }

  exec { 'setup db password':
    command => '/usr/bin/bash',
    timeout => 600,
    before => File['/root/mysql_root'],
  }

  Concat::Fragment <<| tag == 'clients' |>>
  Concat::Fragment <<| tag == 'storage_part' |>>


}
