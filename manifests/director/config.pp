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
    user    => 'root',
    group   => 'root',
    content => 'siema',
    mode    => '0600',
    replace => false,
  }

  Concat::Fragment <<| tag == 'clients' |>>
  Concat::Fragment <<| tag == 'storage_part' |>>


}
